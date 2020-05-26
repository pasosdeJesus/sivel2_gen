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

    test 'importa un xml de sivel12 de prueba ' do
      file = File.open("test/dummy/public/relato_sivel12.xrlat") 
      #file = File.open("test/dummy/public/varioscasos/nyn20929.xrlat")
      #Le asignamos el dtd que debe seguir (098)
      doc = file.read
      old_noko = Nokogiri::XML(doc)
      docnoko = Nokogiri::XML('<relatos/>')
      docnoko.create_internal_subset("relatos", nil, "test/dummy/public/relatos-098.dtd")
      docnoko.at('relatos').children = old_noko.at('relatos').children
      
      verifica_dtd(docnoko.to_xml) #Pasa si es validado el dtd
      #Pasa si es importado con exito y pasa de nuevo si es importado pero con errores presentes
      importa_relato(docnoko.to_xml)    
    end

  end
end
