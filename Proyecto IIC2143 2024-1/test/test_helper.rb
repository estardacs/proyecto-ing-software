require "simplecov"
SimpleCov.start do
  add_filter '/test/'
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_filter 'app/channels'
  add_filter 'app/mailers'
  add_filter 'app/jobs'
  add_filter 'app/helpers'
end

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'rails-controller-testing'



class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
