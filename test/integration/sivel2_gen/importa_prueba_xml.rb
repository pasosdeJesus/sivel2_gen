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
      #file = File.open("test/dummy/public/relato_sivel12.xrlat") 
      file = File.open("test/dummy/public/malo.xrlat") 
      #file = File.open("test/dummy/public/varioscasos/nyn20929.xrlat")
      doc = file.read
      old_noko = Nokogiri::XML(doc)
      docnoko = Nokogiri::XML('<relatos/>')
      docnoko.create_internal_subset("relatos", nil, "test/dummy/public/relatos-098.dtd")
      docnoko.at('relatos').children = old_noko.at('relatos').children
      
      verifica_dtd(docnoko.to_xml) #Falla si no sigue el DTDT
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
            assert_not @caso.save, 'error en el documento'
          else
            assert @caso.save!
          end
        end
      else
        relimportado['relatos']['relato'].each do |ca|
          if @caso.importa(ca, datossal, menserror, {}).nil?
            assert_not @caso.save, 'error en el documento'
          else
            assert @caso.save!
          end
        end
      end
      @caso.destroy
    end

  end
end
