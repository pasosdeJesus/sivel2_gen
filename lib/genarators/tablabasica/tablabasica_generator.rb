# encoding: UTF-8

class TablabasicaGenerator < Rails::Generators::NamedBase
  desc "Genera tabla básica"

  source_root File.expand_path('../templates', __FILE__)

  argument :name, :type => :string
  class_option :modelo, :type => :boolean, :default => false, 
    :description => "Genera modelo"  
  class_option :controlador, :type => :boolean, :default => false, 
    :description => "Genera controlador"  
  class_option :mspec, :type => :boolean, :default => true, 
    :description => "Genera prueba rspec para el modelo"  

  def genera_tablabasica
    genera_modelo if options.modelo
    genera_controlador if options.controlador
    genera_mspec if options.mspec
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

  def nom_arch
    name.underscore
  end

  def nom_arch_plural
    name.pluralize.underscore
  end

  def nom_clase
    name.capitalize
  end

  def nom_clase_plural
    name.pluralize.capitalize
  end
end
