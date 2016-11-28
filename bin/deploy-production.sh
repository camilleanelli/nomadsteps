#!/bin/bash
git push production master:master
heroku run rake db:migrate --app nomadsteps-production
