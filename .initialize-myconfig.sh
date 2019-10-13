#!/usr/bin/env bash

#--- Functions -------------
#
exit_print() {
  [ "$1" != "" ] && echo -e "$*"
  exit 1
}

usage="
USAGE:
  .initialize-myconfig.sh [branch_name]

  This script is used to checkout the configuration files for a specific branch

  You can checkout the branches and handle any conflicts manually if you want,
  just remember to run the setup-<branchname>.sh script once you have everything
  checked out.

  For manual configuration remember you'll need to set the 'config' alias:

    alias config='git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'

  P.S. please remember to set the status.showUntrackedFiles variable to 'no'

    config config status.showUntrackedFiles no"

config() {
  # Use function because aliases don't work properly in scripts
  git --git-dir=$HOME/.myconfig/ --work-tree=$HOME $*
}

print_alias() {
  echo 'alias config="git --git-dir=$HOME/.myconfig/ --work-tree=$HOME"'
}

print_line() {
  echo "------------------------------"
}

# --- Start -----------------
#
if ! [ -d $HOME/.myconfig ]; then
  exit_print "The $HOME/.myconfig directory doesn't exist.\n"\
        "Please clone the repo into $HOME/.myconfig" "$usage"
fi

branch=$1
if [ "$branch" == "" ]; then
  exit_print "No arguments detected. Please pass the branch name you wish to setup." "$usage"
fi

git_test=$(git --help 2>/dev/null)
if [ "$git_test" == "" ]; then
  exit_print "Git is not installed or cannot be found on the PATH... please fix!"
fi

current_branch=$(config branch --list | egrep '^\*' | sed 's/* //')
if [ "$current_branch" == "$branch" ]; then
  exit_print "You already have this branch checked out bro..."
fi

# check if the passed argument matches an actual branch name
if [ "$(config branch --list $branch)" == "" ]; then
  exit_print "The given argument \"$branch\" does not match an existing branch name.\n"\
        "Please choose one of the following:\n$(config branch --list)"
fi

print_line
echo "Checking out branch $branch ..."

export conflict_dir="$HOME/.myconfig-conflicts"
# Attempt to checkout the branch
checkout_text=$(config checkout $branch 2>&1)
if [ "$?" != "0" ] ; then
  # Get lines w/ leading spaces, Strip the spaces, remove lines starting w/ '('
  conflicting_files=$(echo "$checkout_text" | egrep '^\s+' \
                        | sed 's/^[\t ]\+//' | egrep -v '^\(' )
  if [ "$conflicting_files" != "" ]; then
    echo " !! Existing files conflict with the desired branch. "
    echo ""
    echo "$conflicting_files" | xargs -I{} echo "    {}"
    echo ""

    print_line
    echo "Moving those files into $conflict_dir"
    echo "$conflicting_files" \
      | xargs -I{} bash -c 'mkdir -p $conflict_dir/`dirname {}`; mv ~/{} $conflict_dir/{}'

    if [ $? -eq 0 ]; then
      echo "    Successfully moved all the conflicting files."

      print_line
      echo "Attempting to checkout $branch again."
      config checkout $branch \
        || exit_print " !! Failed to checkout $branch branch ... I give up!"
    else
      exit_print " !! Failed to move some of the conflicting files. I give up!"
    fi
  else
    echo " !! Something went wrong. Here's the checkout text"
    echo "$checkout_text" | xargs -I{} echo " : {}"
    exit_print "    Please fix the error and try again. Exiting..."
  fi
fi

# Set the untracked files variable (just in case)
config "config" status.showUntrackedFiles no


print_line
# Run the .setup-<branch>.sh script from the branch that was just checked out
echo "Searching for a branch-specific setup script"
if [ -e "$HOME/.setup-$branch.sh" ]; then
  echo "    Found a script! $HOME/.setup-$branch.sh"
  print_line
  echo "Starting branch setup..."
  echo ""
  chmod u+x $HOME/.setup-$branch.sh
  "$HOME/.setup-$branch.sh"
fi
