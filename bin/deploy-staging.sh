#!/bin/bash
git checkout master
git pull
bundle exec rspec
git push staging master:master
heroku run rake db:migrate --app nomadsteps-staging
