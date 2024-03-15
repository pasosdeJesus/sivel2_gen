require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class PruebaXml < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      if ::Usuario.where(nusuario: PRUEBA_USUARIO[:nusuario]).count == 0
        ::Usuario.create!(PRUEBA_USUARIO)
      end
      @current_usuario = Usuario.where(nusuario: 'admin').take
      sign_in @current_usuario
    end

    test 'importa un xml con un relato de sivel12' do
      file = File.open('test/dummy/public/un_relato_sivel12.xrlat') 
      #Le asignamos el dtd que debe seguir (097)
      doc = file.read
      old_noko = Nokogiri::XML(doc)
      docnoko = Nokogiri::XML('<relatos/>')
      docnoko.create_internal_subset('relatos', nil, 
                                     'test/dummy/public/relatos-097.dtd')
      docnoko.at('relatos').children = old_noko.at('relatos').children
      
      verifica_dtd(docnoko.to_xml) #Pasa si es validado el dtd
      menserror = ''
      mensexito = ''
      errsint = ""
      ids = ''
      @current_usuario = Usuario.where(nusuario: 'admin').take
      Sivel2Gen::CasosController::importar_relato(
        docnoko.to_xml, menserror, errsint, mensexito, 
        ids, @current_usuario.id, 'sexomfs'
      )
      assert_equal 1, ids.split(' ').map(&:to_i).select {|x| x>0}.count
    end

    test 'importa un xml con varios relatos de sivel12' do
      file = File.open('test/dummy/public/relatos_sivel12.xrlat') 
      #Le asignamos el dtd que debe seguir (097)
      doc = file.read
      old_noko = Nokogiri::XML(doc)
      docnoko = Nokogiri::XML('<relatos/>')
      docnoko.create_internal_subset('relatos', nil, 
                                     'test/dummy/public/relatos-097.dtd')
      docnoko.at('relatos').children = old_noko.at('relatos').children
      
      verifica_dtd(docnoko.to_xml) #Pasa si es validado el dtd
      menserror = ''
      mensexito = ''
      errsint = ""
      ids = ''
      @current_usuario = Usuario.where(nusuario: 'admin').take
      Sivel2Gen::CasosController::importar_relato(
        docnoko.to_xml, menserror, errsint, mensexito, 
        ids, @current_usuario.id, 'sexomfs'
      )
      assert_equal 9, ids.split(' ').map(&:to_i).select {|x| x>0}.count

    end


  end
end
