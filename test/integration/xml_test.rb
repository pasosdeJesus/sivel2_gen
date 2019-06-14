# encoding: UTF-8

require_relative '../test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class CasosControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    PRUEBA_CASO_BASICOS = {
    
      fecha: "2014-11-19", 
      memo: "", 
      created_at: "2014-11-11", 
      titulo: "Caso de prueba con datos basicos",
      hora: "6 pm",
      duracion: "1 hora"
    }
    
    PRUEBA_CASOV = {
      fecha: "2014-11-19", 
      memo: "", 
      created_at: "2014-11-11" 
    }


    test "genera xml de un caso con datos basicos" do
       caso = Caso.create! PRUEBA_CASO_BASICOS
       puts caso.to_json
       get caso_path(caso)
       puts caso_path(caso)
       assert :success
       
       url_xml= caso_url(caso)+'.xml'
       get url_xml
       puts url_xml
       DTD_PATH = 'http://www.w3.org/TR/html4/loose.dtd'
       XML_PATH = url_xml
       #doc = Nokogiri::XML(open('http://sincodh.pasosdejesus.org/relatos/nyn144900.xrlat').read)

       doc = Nokogiri::XML(open(XML_PATH).read)
       #doc = File.open(XML_PATH) { |f| Nokogiri::XML(f) }
       # xml = File.read(XML_PATH)
      # options = Nokogiri::XML::ParseOptions::DTDVALID
      # doc = Nokogiri::XML::Document.parse(xml, nil, nil, options)
      # puts doc.external_subset.validate(doc)
      end
    end 
  end






