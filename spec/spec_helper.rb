ENV["RACK_ENV"] = "test"

require 'bundler'
Bundler.require(:default, :test)

require File.expand_path("../../config/environment.rb", __FILE__)
require 'rspec'
require 'capybara/dsl'

Capybara.app = LittleShopApp

RSpec.configure do |c|
  c.include Capybara::DSL
end
