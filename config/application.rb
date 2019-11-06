require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fakebook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies # Required for all session management
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address => "smtp.gmail.com",
        :port => 587,
        :domain => "gmail.com",
        :user_name => "agendator2019@gmail.com",
        :password => "2019agendator",
        :authentication => "plain",
        :enable_starttls_auto => true
    }
  end
end
