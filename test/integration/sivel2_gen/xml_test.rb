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
      id_pais: 170,
      id_departamento: 17,
      id_municipio: 1152,
      created_at: "2014-11-06"
    }

   PRUEBA_PERSONA= {
        nombres: "Nombres",
        apellidos: "Apellidos",
        anionac: 1974,
        mesnac: 1,
        dianac: 1,
        sexo: "F",
        id_pais: 170,
        id_departamento: 15,
        id_municipio: 610,
        tdocumento_id: 1,
        numerodocumento: "10000000",
        nacionalde: 170
   }
   
   PRUEBA_PROFESION= {
	nombre: "Profesion",
        fechacreacion: "2014-09-09",
        created_at: "2014-09-09"
    }

    PRUEBA_RANGOEDAD= {
    	id: 1000,
    	nombre: "Rangoedad",
    	rango: '1-2',
    	limiteinferior: 1,
    	limitesuperior: 2,
    	fechacreacion: "2014-09-09",
    	created_at: "2014-09-09"
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
       ubicacion1= Sip::Ubicacion.create(id_pais:170, id_caso:caso.id, id_tsitio: 1, id_departamento: 17, id_municipio: 1152, created_at: "2014-11-06")
      # ubicacion2= Sip::Ubicacion.create(id_pais:170, id_caso:caso.id, id_tsitio: 1, id_departamento: 47, id_municipio: 881, created_at: "2014-11-06")
       ubicacion1.id_caso= caso.id
       #ubicacion2.id_caso = caso.id
       caso.ubicacion_id= [ubicacion1.id]
              
       get caso_path(caso)+".xml"
       puts @response.body
       file= guarda_xml(@response.body)	
       docu = File.read(file)
       verifica_dtd(docu)		
       ubicacion1.destroy
#       ubicacion2.destroy
       caso.destroy
    end

    test "Valida caso con 2 victimas" do
       caso= Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS      
       persona=  Sip::Persona.create! PRUEBA_PERSONA
       rangoedad= Sivel2Gen::Rangoedad.create! PRUEBA_RANGOEDAD
       victima= Sivel2Gen::Victima.create(id_caso: caso.id, id_persona: persona.id, id_rangoedad: rangoedad.id)    
       get caso_path(caso)+".xml"
       puts @response.body
       file= guarda_xml(@response.body)	
       docu = File.read(file)
       verifica_dtd(docu)		
       caso.destroy
       persona.destroy
       rangoedad.destroy
       victima.destroy 
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
	assert_empty doc.external_subset.validate(doc)
      end	      

    end 
end





