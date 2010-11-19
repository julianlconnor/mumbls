# Load the rails application
require File.expand_path('../application', __FILE__)

Rails.logger = Logger.new(STDOUT)
# Initialize the rails application
AuthlogicRails3Example::Application.initialize!
