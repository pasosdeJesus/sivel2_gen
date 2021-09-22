
require 'devise'

module Sivel2Gen
  class Engine < ::Rails::Engine

    isolate_namespace Sivel2Gen

    config.generators do |g|
      g.test_framework      :minitest,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'test/factories'
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

  self.mattr_accessor :titulo
  self.titulo = "Motor de SIVeL genérico " 

  def self.setup(&block)
    yield self
  end

end
