require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BreweryApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # this to skip views
    config.api_only = true
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource(
            '*',
            headers: :any,
            methods: [:get, :post, :options]
        )
      end
    end

    # TODO: for test framework
    # config.generators do |g|
    #   g.test_framework :rspec
    # end

    config.autoload_paths += %W(#{config.root}/lib)
    config.exceptions_app = routes


  end
end
