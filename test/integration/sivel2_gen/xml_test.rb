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
      id_pais: 862,
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
	get caso_path(caso)+".xml"
	assert :success
	puts caso_path(caso)+".xml"
        puts @response.body
        file= guarda_xml(@response.body)	
       	docu = File.read(file)
        verifica_dtd(docu)		
        caso.destroy 
    end 

    test "Genera xml con 2 ubicaciones" do
      
       caso= Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
       ubicacion = Sip::Ubicacion.new PRUEBA_UBICACION
       pais = Sip::Pais.find(862) 
       departamento = Sip::Departamento.find(15)
       municipio = Sip::Municipio.find(610)
       ubicacion.pais = pais
       ubicacion.departamento= departamento
       ubicacion.municipio = municipio
       #caso.ubicacion = ubicacion  
       get caso_path(caso)+".xml"
       assert :success
       puts @response.body
       caso.destroy
      end

      def guarda_xml(docu) 
	  
       file = File.new("relatos.xml", "wb")
       file.write(docu)
       file.close
       return file  
      end

      def verifica_dtd(docu)
	options = Nokogiri::XML::ParseOptions::DTDVALID
        doc = Nokogiri::XML::Document.parse(docu, nil, nil, options)
        puts doc.external_subset.validate(doc)
      end	      

    end 
end





