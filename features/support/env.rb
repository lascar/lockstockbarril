require 'cucumber/rails'
require 'capybara/poltergeist'
require 'factory_girl_rails'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, debug: false, window_size: [1680,1050], js_errors: false)
end

Capybara.javascript_driver = :poltergeist
Capybara.current_driver = :poltergeist

Capybara.default_wait_time = 1

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :transaction

def reload_the_page
  visit page.driver.browser.current_url
end

module Authentication
  include Warden::Test::Helpers

  def sign_out
    logout
  end

  def sign_in(user)
    sign_out
    visit(new_user_session_path)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find("[type=submit]").click
  end
end

World(Authentication)
World(FactoryGirl::Syntax::Methods)
