#! /usr/bin/env bash

cd $1

echo $(git status --porcelain)
