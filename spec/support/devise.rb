require_relative '/spec/support/controller_macros.rb'
Rspec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
end
