source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.9'
gem 'mongoid', '~> 3.0.0'
gem 'rake', '~> 10.0.2'
gem 'em-synchrony'
gem 'thin'
gem 'haml-rails'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'stringex', github: 'jamesotron/stringex'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'ember-rails', github: 'emberjs/ember-rails'
  gem 'jquery-rails'
  gem 'hamlbars', '~> 2.0.0'
  gem 'therubyracer', '~> 0.11.0beta8', platforms: :ruby
  gem 'libv8', '~> 3.11.8'
  gem 'uglifier', '>= 1.0.3'
  gem 'inflection-js-rails'
  gem 'momentjs-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test,:development do
  gem 'cucumber'
  gem 'capybara'
  gem 'terminus', path: 'vendor/gems/terminus'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-jasmine'
  gem 'guard-jshint-on-rails'
  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
  gem 'fabrication'
  gem 'faker'
  gem 'jasminerice'
  gem 'sinon-rails'
end

group :test do
  gem 'cucumber-rails'
end
