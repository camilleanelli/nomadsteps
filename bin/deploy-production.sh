git checkout master
git pull
bundle exec rspec
git push production master:master
heroku run rake db:migrate --app nomadsteps-production
