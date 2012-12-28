require 'cucumber/rails'
require 'terminus'
Capybara.current_driver = :terminus

Capybara.default_selector = :css
Capybara.app = Heap::Application
Capybara.default_wait_time = 5
ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.orm = 'mongoid'
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation
