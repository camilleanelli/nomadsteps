source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
gem 'rack-mini-profiler'
gem 'rails-footnotes', '~> 4.0'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bootstrap', '~> 4.0.0.alpha3.1'

gem 'devise'
gem 'devise_invitable'

gem "select2-rails"
gem 'mailgun_rails'

gem 'simple_form'
# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'jquery-turbolinks'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'filepicker-rails'

gem 'jbuilder', '~> 2.5'

gem 'font-awesome-sass', '~> 4.7.0'

gem 'kaminari', :git => "git://github.com/amatsuda/kaminari.git", :branch => 'master'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'geocoder'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'nokogiri'

gem 'nomadlist'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'rspec-rails', '~> 3.5'
  gem 'capybara'
  gem 'launchy'
  gem "factory_girl_rails"
  gem 'guard-rspec', '4.6.4'

end

group :development do
  gem "bullet"

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.2.3'
