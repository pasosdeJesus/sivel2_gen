#encoding: UTF-8
ENV['RAILS_ENV'] = 'test'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

	# De https://gist.github.com/Bregor/1053489
	config.use_transactional_examples= true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

	config.include FactoryGirl::Syntax::Methods

	config.include Capybara::DSL

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end

	config.include Rails.application.routes.url_helpers

	config.include Devise::TestHelpers, :type => :controller
	#config.include ControllerHelpers, :type => :controller

  Capybara.javascript_driver = :webkit
end
