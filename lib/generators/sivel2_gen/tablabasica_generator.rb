# encoding: UTF-8
require 'rails/generators/base'

module Sivel2Gen
    class TablabasicaGenerator < Rails::Generators::Base
      desc "Genera tabla básica"

      source_root File.expand_path('../templates', __FILE__)

      argument :tablabasica, :type => :string
      class_option :modelo, :type => :boolean, :default => false, 
        :desc => "Genera modelo"  
      class_option :controlador, :type => :boolean, :default => false, 
        :desc => "Genera controlador"  
      class_option :mspec, :type => :boolean, :default => true, 
        :desc => "Genera prueba rspec para el modelo"  
      class_option :factory, :type => :boolean, :default => true, 
        :desc => "Genera ejemplo de datos para factory_girl"  

      def genera_tablabasica
        genera_modelo if options.modelo
        genera_controlador if options.controlador
        genera_mspec if options.mspec
        genera_factory if options.factory
      end

      private
      def genera_modelo
        template "tablabasica.rb.erb", 
          "app/model/#{nom_arch}.rb"
        gsub_file("app/models/ability.rb", /(@@tablasbasicas = \[.*)/, 
                  "\1\n    '#{nom_arch}',")
        # Infleccion no regular en config/initializers/inflections.rb
        # Nombre en español en config/locales/es.yml
      end

      def genera_controlador
        template "tablasbasicas_controller.rb.erb", 
          "app/controllers/admin/#{nom_arch_plural}_controller.rb"
      end

      def genera_mspec
        template "tablabasica_spec.rb.erb", 
          "spec/models/#{nom_arch}_spec.rb"
      end

      def genera_factory
        template "factory_tablabasica.rb.erb", 
          "spec/factories/#{nom_arch}.rb"
      end

      def nom_arch
        tablabasica.underscore
      end

      def nom_arch_plural
        tablabasica.pluralize.underscore
      end

      def nom_clase
        tablabasica.capitalize
      end

      def nom_clase_plural
        tablabasica.pluralize.capitalize
      end
    end
end

