require 'devise'

module Sivel2Gen
  class Engine < ::Rails::Engine

    isolate_namespace Sivel2Gen

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

    # De http://guides.rubyonrails.org/engines.html
    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end
  end

  class << self
    mattr_accessor :ruta_anexos
    mattr_accessor :ruta_volcados
    mattr_accessor :titulo
    mattr_accessor :actividadg1
    mattr_accessor :actividadg2
    mattr_accessor :actividadg3
    mattr_accessor :actividadg4
    self.ruta_anexos = "/var/www/resbase/anexos"
    self.ruta_volcados = "/var/www/resbase/sivel2"
    self.titulo = "Motor de SIveL generico " 
    self.actividadg1 = "Mujeres organización"
    self.actividadg2 = "Mujeres externas"
    self.actividadg3 = "Hombres organización"
    self.actividadg4 = "Hombres externos"
  end

  def self.setup(&block)
    yield self
  end

end
