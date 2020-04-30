# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class PruebaXml < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test 'importa xml de sivel12 de prueba ' do
      file = File.open("test/dummy/public/relato_sivel12.xrlat") 
      doc = file.read
      docnoko = Nokogiri::XML(doc)
      verifica_dtd(doc)
      docnoko.search('observaciones').each do |obs|
        obs.content = obs['tipo'] + '_' + obs.text
      end
      relimportado = Hash.from_xml(docnoko.to_s)
      datossal = {}
      menserror= ''
      @caso = Caso.new
      if docnoko.search('relato').count == 1
        relimportado['relatos'].each do |ca|
          if @caso.importa(ca[1], datossal, menserror, {}).nil?
            error
          else
            @caso.save!
          end
        end
      else
        relimportado['relatos']['relato'].each do |ca|
          if @caso.importa(ca, datossal, menserror, {}).nil?
            error
          else
            @caso.save!
          end
        end
      end
      #file = guarda_xml(@response.body)
      @caso.destroy
    end

  end
end
