# frozen_string_literal: true

require_relative "boot"
require "rails"
# Elige los marcos de trabajo que necesitas:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "rails/test_unit/railtie"

# Requiere gemas listas en el Gemfile, incluyendo las
# limitadas a :test, :development, o :production.
Bundler.require(*Rails.groups)

require "sivel2_gen"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(Rails::VERSION::STRING.to_f)

    config.autoload_lib(ignore: ["assets", "tasks"])

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "America/Bogota"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    config.active_record.schema_format = :sql

    config.active_job.queue_adapter =
      ActiveJob::QueueAdapters::AsyncAdapter.new(
        min_threads: 1,
        max_threads: 2 * Concurrent.processor_count,
        idletime: 600.seconds,
      )

    puts "CONFIG_HOSTS=" + ENV.fetch("CONFIG_HOSTS", "defensor.info").to_s
    config.hosts.concat(
      ENV.fetch("CONFIG_HOSTS", "defensor.info").downcase.split(";"),
    )

    # msip
    # Evita deshabilitar butones en formularios anidados dinámicos
    config.action_view.automatically_disable_submit_tag = false
    config.x.formato_fecha = ENV.fetch("MSIP_FORMATO_FECHA", "dd/M/yyyy")

    config.x.msip_docid_obligatorio =
      (ENV.fetch("MSIP_DOCID_OBLIGATORIO", "0") != "0")

    # heb412
    config.x.heb412_ruta = Pathname(
      ENV.fetch("HEB412_RUTA", Rails.public_path.join("heb412").to_s),
    )

    config.relative_url_root = ENV.fetch("RUTA_RELATIVA", "/sivel2_2")

    # sivel2
    config.x.sivel2_consulta_web_publica =
      (ENV["SIVEL2_CONSWEB_PUBLICA"] && ENV["SIVEL2_CONSWEB_PUBLICA"] != "")
    # si es true no puede usarse observador de parte de los casos

    config.x.sivel2_consweb_max = ENV.fetch("SIVEL2_CONSWEB_MAX", 2000)

    config.x.sivel2_consweb_epilogo = ENV.fetch(
      "SIVEL2_CONSWEB_EPILOGO",
      "<br>Si requiere más puede suscribirse a SIVeL Pro",
    ).html_safe

    config.x.sivel2_mapaosm_diasatras = ENV.fetch(
      "SIVEL2_MAPAOSM_DIASATRAS", 182
    )

    config.x.sivel2_desaparicion =
      ENV.fetch("SIVEL2_DESAPARICION", "") != ""
  end
end
