# encoding: UTF-8

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class PersonasXml < ActionDispatch::IntegrationTest
	  
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
     sign_in @current_usuario
     @routes= Engine.routes
    end

    PRUEBA_CASO_BASICOS = {
      fecha: "2014-11-19", 
      memo: "En la vereda El Papayo, zona rural de Buenaventura, se registró una explosión que dejó un menor muerto y otros tres heridos. Los cuatro menores se desplazaban en una pequeña canoa hacia uno de los extremos del río Yurumanguí y resultaron gravemente heridos, luego de que encontraron en la orilla, un artefacto que les explotó al manipularlo. Según el padre de uno de los menores, Serapio Mosquera, &quot;son niños de una sola familia, yo estaba en la casa cuando ellos se fueron, luego escuchamos la explosión&quot;. Mosquera afirmó que &quot;uno de los niños, de siete años, murió, lo íbamos a traer para Buenaventura pero no alcanzamos, lo dejamos allá porque ya para qué lo traíamos&quot;. Uno de los menores que resultó con heridas leves fue dejado en la zona, mientras que en una embarcación, trasladaron a dos de los niños heridos, ambos de 12 años de edad. &quot;Uno de los menores fue dado de alta, pero él otro está bajo pronóstico reservado, tiene heridas muy graves en el abdomen&quot; explicó Marta Isabel Valencia, directora médica de la Clínica Santa Sofía de Buenaventura. Los médicos adelantan las gestiones para trasladar al menor a una clínica de mayor complejidad en Cali. El comandante de la Policía de Buenaventura, coronel Jorge Cabra, dijo que &quot;conformamos un equipo de trabajo con la Infantería de Marina, la Sijin, pero no se encontró ningún elemento que nos confirmara la versión de la persona que trajo a los menores a la clínica, la comunidad tampoco entrega mayor información sobre el hecho&quot;.", 
      created_at: "2014-11-11", 
      titulo: "NIÑOS AFECTADOS POR EXPLOSIÓN DE GRANADA",
     
    }
   
    PRUEBA_PERSONA1= {
        id: 249236,
        nombres: "Nombres",
        apellidos: "Apellidos",
        anionac: 1974,
        mesnac: 1,
        dianac: 1,
        sexo: "F",
     }
    PRUEBA_PERSONA2= {
        id: 249237,
        nombres: "Nombres",
        apellidos: "Apellidos",
        anionac: 1974,
        mesnac: 1,
        dianac: 1,
        sexo: "F",
     }
    PRUEBA_PERSONA3= {
        id: 249238,
        nombres: "Nombres",
        apellidos: "Apellidos",
        anionac: 1974,
        mesnac: 1,
        dianac: 1,
        sexo: "F",
     }
   
   PRUEBA_PROFESION= {
        id: 1000,
	nombre: "Profesion",
        fechacreacion: "2014-09-09",
        created_at: "2014-09-09"
    }

    PRUEBA_RANGOEDAD= {
    	id: 1000,
    	nombre: "De 0 a 15 Años",
    	rango: '1-2',
    	limiteinferior: 1,
    	limitesuperior: 2,
    	fechacreacion: "2014-09-09",
    	created_at: "2014-09-09"
    }

    PRUEBA_SECTORSOCIAL={
        id: 1000,
        nombre: "Pruebaumpleado",
        fechacreacion: "2014-09-09"
    }
    
    
    test "Valida caso con 1 victima" do
       caso= Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS      
       persona1=  Sip::Persona.create! PRUEBA_PERSONA1
       persona2=  Sip::Persona.create! PRUEBA_PERSONA2
       persona3=  Sip::Persona.create! PRUEBA_PERSONA3
       rangoedad= Sivel2Gen::Rangoedad.create! PRUEBA_RANGOEDAD
      # profesion= Sivel2Gen::Profesion.create! PRUEBA_PROFESION
       sectorsocial= Sivel2Gen::Sectorsocial.create! PRUEBA_SECTORSOCIAL
       victima1= Sivel2Gen::Victima.create(id_caso: caso.id, id_persona: persona1.id, id_etnia: 105, id_iglesia: nil)    
       victima2= Sivel2Gen::Victima.create(id_caso: caso.id, id_persona: persona2.id, id_rangoedad: rangoedad.id, id_etnia: 105, id_iglesia:nil, orientacionsexual: "S")    
       victima3= Sivel2Gen::Victima.create(id_caso: caso.id, id_persona: persona3.id, id_rangoedad: rangoedad.id, id_etnia: 105, id_iglesia:nil, orientacionsexual: "S")    
       presponsable= Sivel2Gen::Presponsable.create(id:37, nombre:"COMBATIENTES", fechacreacion: "2014-09-09", created_at: "2014-09-09") 
       casopresponsable= Sivel2Gen::CasoPresponsable.create(id_caso: caso.id, id_presponsable: presponsable.id)
       acto1= Sivel2Gen::Acto.create(id_presponsable:presponsable.id, id_persona: persona1.id, id_caso: caso.id, created_at: "2019-01-01")
       pconsolidado= Sivel2Gen::Pconsolidado.create(clasificacion: "VIDA", created_at: "2019-01-01")
       categoria= Sivel2Gen::Categoria.create(id_pconsolidado: pconsolidado.id, created_at: "2019-01-01")

       get caso_path(caso)+".xml"
       puts @response.body
       file= guarda_xml(@response.body)	
       docu = File.read(file)
       verifica_dtd(docu)	


       caso.destroy
       persona1.destroy
       persona2.destroy
       persona3.destroy
       rangoedad.destroy
       victima1.destroy
       victima2.destroy
       victima3.destroy 
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





