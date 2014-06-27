# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
WGOrganizer::Application.initialize!

RAILS_ENV=production bundle exec rake assets:precompile