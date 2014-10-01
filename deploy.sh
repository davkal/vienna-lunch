#!/bin/bash
set -e 

# Delete old public dist
rm -rf public/*
# Delete current deploy branch
git branch -D deploy
# Create new deploy branch based on master
git checkout -b deploy
# Gulp comands to build our site
pushd client
gulp build
popd
# the public/ directory is in my .gitignore, so forcibly add it
git add -f public/
git commit -m "Deploying to Heroku"
# Push it up to heroku, the -f ensures that heroku won't complain
git push heroku -f deploy:master
# Switch it back to master
git checkout master
