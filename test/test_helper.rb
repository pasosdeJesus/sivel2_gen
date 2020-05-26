# encoding: utf-8

ENV['RAILS_ENV'] ||= 'test'

require 'nokogiri'
require 'simplecov'
SimpleCov.start 'rails'
require_relative 'dummy/config/environment'
require 'rails/test_help'
require 'rake'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
Dummy::Application.load_tasks # providing your application name is 'sample'

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

    def importa_relato(docu)
      docnoko = Nokogiri::XML(docu)
      docnoko.search('observaciones').each do |obs|
        obs.content = obs['tipo'] + '_' + obs.text
      end
      menserror= ''
      docnoko.xpath('relatos/relato').each do |relato|
        datossal = {}
        relimportado = Hash.from_xml(relato.to_s)
        @caso = Sivel2Gen::Caso.new
        importado = @caso.importa(relimportado['relato'], datossal, 
                                  menserror, {})
        assert_not importado.nil?
        unless importado.nil?
          assert importado[1].empty?, "Falla: #{importado[1]}"
        end
        assert @caso.save
      end
    end   # importa_relato

end

class ActiveSupport::TestCase
  #fixtures :all

  if Sip::Tclase.all.count == 0
    load "#{Rails.root}/db/seeds.rb"
    #Rake::Task[].reenable # in case you're going to invoke the same task second time.
    Rake::Task['sip:indices'].invoke
  end

  protected
  def load_seeds
    load "#{Rails.root}/db/seeds.rb"
  end
end
