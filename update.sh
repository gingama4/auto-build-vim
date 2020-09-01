#!/bin/bash
git submodule foreach 'git fetch origin && git pull origin master' && git add vim && git commit -m "update vim repo" && git push
