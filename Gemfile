source 'https://rubygems.org'
ruby "2.2.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0.beta3'
gem 'jwt'
gem 'active_model_serializers', '~> 0.8.3' # NOTE: not the 0
gem 'pg'
gem 'rails_12factor', group: :production
gem 'jquery-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'handlebars_assets'
gem 'bootstrap-sass'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0', group: :doc, require: false
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'listen', require: false
  gem 'spring', require: false
  gem 'spring-commands-rspec', require: false
  gem "spring-commands-cucumber", require: false
  gem 'reek', require: false
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
        gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master'
  end
  gem 'cucumber-rails', require: false
  gem 'capybara', :require => false
  gem 'factory_girl_rails', require: false
  gem 'launchy'
  gem 'byebug'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1', :require => false
  gem 'database_cleaner', :require => false
  gem 'poltergeist', :require => false
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
end
