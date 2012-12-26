require 'cucumber/rails'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: 'open', js_errors: false)
end

Capybara.javascript_driver = :poltergeist
Capybara.default_selector = :css
Capybara.server_port = 4697
Capybara.default_wait_time = 5
ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.orm = 'mongoid'
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation
