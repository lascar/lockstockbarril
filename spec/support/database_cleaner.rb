RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation, {:pre_count => true, :except => %w[application_parameters]}
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation, {:pre_count => true, :except => %w[application_parameters]}
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
