# Load the rails application
require File.expand_path('../application', __FILE__)

require 'authlogic'

Rails.logger = Logger.new(STDOUT)
# Initialize the rails application
AuthlogicRails3Example::Application.initialize!
