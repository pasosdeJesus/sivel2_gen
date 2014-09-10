require 'devise'
require "sivel2_gen/version"
module Sivel2Gen
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    # Basado en 
    # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
    initializer :append_migrations do |app|
      unless app.root.to_s == root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

  end

  class << self
    mattr_accessor :ruta_anexos
    mattr_accessor :ruta_volcados
    mattr_accessor :titulo
    self.ruta_anexos = "/var/www/resbase/anexos"
    self.ruta_volcados = "/var/www/resbase/sivel2"
    self.titulo = "Motor de SIveL generico " + Sivel2Gen::VERSION
  end

  def self.setup(&block)
    yield self
  end

end
