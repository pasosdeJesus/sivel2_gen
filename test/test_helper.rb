# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "nokogiri"
require "simplecov"
require_relative "dummy/config/environment"
require "rails/test_help"
require "rake"

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
Dummy::Application.load_tasks # providing your application name is 'sample'

class PruebaIntegracion < ActionDispatch::IntegrationTest
  def guarda_xml(docu)
    file = File.new("test/dummy/tmp/relatos.xrlat", "wb")
    file.write(docu)
    file.close
    file
  end

  def guarda_json(docu)
    file = File.new("test/dummy/tmp/relatos.json", "wb")
    file.write(docu)
    file.close
    file
  end

  def verifica_dtd(docu)
    options = Nokogiri::XML::ParseOptions::DTDVALID
    doc = Nokogiri::XML::Document.parse(docu, nil, nil, options)
    puts doc.external_subset.validate(doc)

    assert_empty(doc.external_subset.validate(doc))
  end
end

class ActiveSupport::TestCase
  # fixtures :all

  if Msip::Tcentropoblado.all.count == 0
    load "#{Rails.root.join("db/seeds.rb")}"
    # Rake::Task[].reenable # in case you're going to invoke the same task second time.
    Rake::Task["msip:indices"].invoke
  end

  protected

  def load_seeds
    load("#{Rails.root.join("db/seeds.rb")}")
  end
end

PRUEBA_ACTIVIDADOFICIO = {
  nombre: "n",
  fechacreacion: "2014-08-05",
  fechadeshabilitacion: nil,
}

PRUEBA_ACTO = {
  presponsable_id: 1,
  categoria_id: 10,
}

PRUEBA_ACTOCOLECTIVO = {
  presponsable_id: 1,
  categoria_id: 19,
}

PRUEBA_ANEXO = {
  descripcion: "x",
  created_at: "2014-11-11",
}

PRUEBA_ANTECEDENTE = {
  nombre: "n",
  observaciones: "x",
  fechacreacion: "2023-01-10",
  fechadeshabilitacion: nil,
}

PRUEBA_CASO = {
  fecha: "2014-11-05",
  memo: "x",
  created_at: "2014-11-05",
}

PRUEBA_CATEGORIA = {
  id: 1000,
  nombre: "Categoria",
  supracategoria_id: 1,
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_COMBATIENTE = {
  nombre: "x",
  alias: "a",
  edad: 80,
  sexo: Msip::Persona.convencion_sexo[:sexo_femenino],
  resagresion_id: 1,
  created_at: "2023-01-10",
}

PRUEBA_CONTEXTO = {
  nombre: "n",
  observaciones: "o",
  fechacreacion: "2023-01-11",
}

PRUEBA_CONTEXTOVICTIMA = {
  nombre: "n",
  observaciones: "o",
  fechacreacion: "2023-01-11",
}

PRUEBA_DEPARTAMENTO = {
  id: 1000,
  nombre: "DEPARTAMENTO1",
  latitud: 1.5,
  longitud: 1.5,
  fechacreacion: "2014-08-04",
  fechadeshabilitacion: nil,
  pais_id: 862,
}

PRUEBA_ESCOLARIDAD = {
  nombre: "Esc",
  observaciones: "O",
  fechacreacion: "2023-01-12",
}

PRUEBA_ETNIA = {
  id: 1000,
  nombre: "Etnia",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_ETIQUETA = {
  id: 1000,
  nombre: "Eti",
  observaciones: "O",
  fechacreacion: "2014-09-04",
  created_at: "2014-09-04",
}

PRUEBA_FILIACION = {
  id: 1000,
  nombre: "Filiacion",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_FOTRA = {
  id: 1000,
  nombre: "Fotra",
  created_at: "2014-09-09",
  updated_at: "2014-09-09",
}

PRUEBA_FRONTERA = {
  id: 1000,
  nombre: "Frontera",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_FORMULARIO = {
  nombre: "n",
  nombreinterno: "n",
}

PRUEBA_FRONTERA = {
  nombre: "Frontera",
  fechacreacion: "2023-01-11",
}

PRUEBA_FUENTEPRENSA = {
  id: 1000,
  nombre: "Fuenteprensa",
  fechacreacion: "2015-05-11",
  created_at: "2015-05-11",
}

PRUEBA_GRUPOPER = {
  id: 1,
  nombre: "grupoper1",
  anotaciones: "anotaciones",
}

PRUEBA_IGLESIA = {
  id: 1000,
  nombre: "Iglesia",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_INTERVALO = {
  id: 1000,
  nombre: "Intervalo",
  rango: "r",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_MUNICIPIO = {
  id: 100000,
  nombre: "MUNICIPIO1",
  latitud: 1.5,
  longitud: 1.5,
  fechacreacion: "2014-08-04",
  fechadeshabilitacion: "2014-08-04",
  departamento_id: 1,
}

PRUEBA_ORGANIZACION = {
  nombre: "Org",
  fechacreacion: "2023-01-12",
  created_at: "2023-01-12",
}

PRUEBA_ORGSOCIAL = {
  id: 1,
  grupoper_id: 1,
  created_at: "2021-08-27",
  updated_at: "2021-08-27",
}

PRUEBA_PERSONA = {
  nombres: "Nombres",
  apellidos: "Apellidos",

  anionac: 1980,
  mesnac: 2,
  dianac: 2,
  sexo: "M",
  numerodocumento: "1061000000",
}

PRUEBA_PRESPONSABLE = {
  id: 1000,
  nombre: "Presponsable",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_PROFESION = {
  nombre: "Profesion",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_RANGOEDAD = {
  id: 1000,
  nombre: "DE 0 a 15 AÑOS",
  limiteinferior: 1,
  limitesuperior: 2,
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_REGION = {
  nombre: "Region",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_RESAGRESION = {
  nombre: "Resagresion",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_RESPUESTAFOR = {
  fechaini: "2018-12-19",
  fechacambio: "2018-12-19",
}

PRUEBA_SECTORSOCIAL = {
  nombre: "Sec",
  fechacreacion: "2023-01-18",
  created_at: "2023-01-18",
}

PRUEBA_SOLICITUD = {
  id: 1,
  usuario_id: 1,
  fecha: "2022-06-24",
  solicitud: "Especial",
  estadosol_id: 1,
  created_at: "2022-06-24",
  updated_at: "2022-06-24",
}

PRUEBA_TVIOLENCIA = {
  id: "S",
  nombre: "VIOLENCIA POLÍTICO SOCIAL",
  nomcorto: "nombrec",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

# Usuario administrador para ingresar y hacer pruebas
PRUEBA_USUARIO = {
  nusuario: "admin",
  password: "sjrven123",
  nombre: "admin",
  descripcion: "admin",
  rol: 1,
  idioma: "es_CO",
  email: "usuario1@localhost",
  encrypted_password: "$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G",
  sign_in_count: 0,
  fechacreacion: "2014-08-05",
  fechadeshabilitacion: nil,
}

PRUEBA_VICTIMA = {
  hijos: 0,
  profesion_id: 1,
  rangoedad_id: 1,
  filiacion_id: 1,
  sectorsocial_id: 1,
  organizacion_id: 1,
  vinculoestado_id: 1,
  organizacionarmada: 1,
  anotaciones: "a",
  iglesia_id: 1,
  orientacionsexual: "H",
}

PRUEBA_VICTIMACOLECTIVA = {
  personasaprox: 100,
  organizacionarmada: 1,
}

PRUEBA_VINCULOESTADO = {
  id: 1000,
  nombre: "v",
  fechacreacion: "2023-01-10",
  created_at: "2023-01-10",
}
