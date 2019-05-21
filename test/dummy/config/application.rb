require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require 'sivel2_gen'

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'America/Bogota'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    config.active_record.schema_format = :sql

    config.active_job.queue_adapter = 
      ActiveJob::QueueAdapters::AsyncAdapter.new \
      min_threads: 1,
      max_threads: 2 * Concurrent.processor_count,
      idletime: 600.seconds

    config.x.heb412_ruta = Rails.root.join('public', 'heb412')

    config.relative_url_root = '/sivel2'
    config.assets.prefix = '/sivel2/assets/'
    config.hosts << ENV['CONFIG_HOSTS']

  end
end
