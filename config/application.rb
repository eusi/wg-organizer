require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module WGOrganizer
  class Application < Rails::Application

    config.i18n.enforce_available_locales = false

    # Heroku requires this to be false
    config.assets.initialize_on_precompile=false
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    #config.to_prepare do
    #    Devise::SessionsController.layout "home"
    #    Devise::RegistrationsController.layout "home"
    #    Devise::ConfirmationsController.layout "home"
    #    Devise::UnlocksController.layout "home"
    #    Devise::PasswordsController.layout "home"
    #end
  end
end
