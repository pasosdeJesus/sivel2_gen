# encoding: utf-8

ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'
require_relative 'dummy/config/environment'
require 'rails/test_help'

# Usuario para ingresar y hacer pruebas
PRUEBA_USUARIO = {
  nusuario: "admin",
  password: "sjrven123",
  nombre: "admin",
  descripcion: "admin",
  rol: 1,
  idioma: "es_CO",
  email: "usuario1@localhost",
  encrypted_password: '$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G',
  sign_in_count: 0,
  fechacreacion: "2014-08-05",
  fechadeshabilitacion: nil,
  oficina_id: nil
}

class PruebaIntegracion < ActionDispatch::IntegrationTest

    def guarda_xml(docu)
      file = File.new('test/dummy/tmp/relatos.xrlat', 'wb')
      file.write(docu)
      file.close
      file
    end

    def guarda_json(docu)
      file = File.new('test/dummy/tmp/relatos.json', 'wb')
      file.write(docu)
      file.close
      file
    end

    def verifica_dtd(docu)
      options = Nokogiri::XML::ParseOptions::DTDVALID
      doc = Nokogiri::XML::Document.parse(docu, nil, nil, options)
      puts doc.external_subset.validate(doc)
      assert_empty doc.external_subset.validate(doc)
    end

end

class ActiveSupport::TestCase
  fixtures :all

  
  protected
  def load_seeds
    load "#{Rails.root}/db/seeds.rb"
  end
end
