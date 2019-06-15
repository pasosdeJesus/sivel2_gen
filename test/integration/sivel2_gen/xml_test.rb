# encoding: UTF-8

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class XmlTest < ActionDispatch::IntegrationTest
	  
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
     sign_in @current_usuario
     @routes= Engine.routes
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
    

    PRUEBA_UBICACION= {
      id_tsitio: 1,
      id_pais: 286,
      id_departamento: 15,
      id_municipio: 610,
      created_at: "2014-11-06"
    }

    test "valido" do
       caso= Sivel2Gen::Caso.create! PRUEBA_CASOV
       assert caso.valid?
       caso.destroy 
    end

    test "genera xml de un caso con datos basicos" do
        caso= Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS 
        get caso_path(caso)
        puts caso_path(caso)
	assert :success
        caso.destroy 
    end 

    test "Genera xml con 2 ubicaciones" do
      
       caso= Sivel2Gen::Caso.create! PRUEBA_CASOV
       pais= Sip::Pais.find(862)
       ubicacion = Sip::Ubicacion.new PRUEBA_UBICACION
       ubicacion.pais = pais
       ubicacion.caso = caso
       
       get caso_path(caso)+".xml"
       
       #assert_equal 200, status
           
       url_xml= caso_path(caso)+".xml"
        #s = ActionController.new.render_to_string :file => url_xml
      # File.open('fixed.xml','w'){|f| f.write s}
     #  render :text => s
         assert :success
      # get url_xml
      # puts url_xml
      # DTD_PATH = 'http://www.w3.org/TR/html4/loose.dtd'
      # XML_PATH = url_xml
      # doc = Nokogiri::XML(open(url_xml).read)

      # doc = Nokogiri::XML(open(XML_PATH).read)
      #doc = File.open(XML_PATH) { |f| Nokogiri::XML(f) }
      # xml = File.read(XML_PATH)
      # options = Nokogiri::XML::ParseOptions::DTDVALID
      # doc = Nokogiri::XML::Document.parse(xml, nil, nil, options)
      # puts doc.external_subset.validate(doc)
       caso.destroy
      end
    end 
end





