Bundler.require(:test)

if ENV['CODECLIMATE_REPO_TOKEN']
  CodeClimate::TestReporter.start
else
  SimpleCov.start
end

# codeclimate test reporter MUST go before the require of the project code

require 'flower_bundler'

FactoryGirl.find_definitions

# I use an ~/.rspec file that holds config
# color: true
# tty: true
# formatter: documentation
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # prettier test output
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # strict mocking
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # no monkey-patching
  config.disable_monkey_patching!

  # But allow use of `describe` etc regardless.
  config.expose_dsl_globally = true

  # randomise test order
  config.order = :random
  Kernel.srand config.seed
end

