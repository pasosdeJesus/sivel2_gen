# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular("actividad", "actividades")
  inflect.irregular("actocolectivo", "actoscolectivos")
  inflect.irregular("categoria", "categorias")
  inflect.irregular("caso_fuenteprensa", "caso_fuentesprensa") # Tocó porque no permite otro plural
  inflect.irregular("caso_fotra", "caso_fotras") # Tocó porque no permite otro plural
  inflect.irregular("caso_presponsable", "caso_presponsables") # Tocó porque no permite otro plural
  inflect.irregular("caso_anexo", "caso_anexos") # Tocó porque no permite otro plural
  inflect.irregular("centropoblado", "centrospoblados")
  inflect.irregular("contextovictima", "contextosvictima")
  inflect.irregular("estadocivil", "estadosciviles")
  inflect.irregular("etiqueta", "etiquetas")
  inflect.irregular("error", "errores")
  inflect.irregular("etnia", "etnias")
  inflect.irregular("filiacion", "filiaciones")
  inflect.irregular("fuenteprensa", "fuentesprensa")
  inflect.irregular("organizacion", "organizaciones")
  inflect.irregular("presponsable", "presponsables")
  inflect.irregular("profesion", "profesiones")
  inflect.irregular("rangoedad", "rangosedad")
  inflect.irregular("rangoedadac", "rangosedadac")
  inflect.irregular("regimensalud", "regimenessalud")
  inflect.irregular("region", "regiones")
  inflect.irregular("resagresion", "resagresiones")
  inflect.irregular("rolfamilia", "rolesfamilia")
  inflect.irregular("perfilorgsocial", "perfilesorgsocial")
  inflect.irregular("sectorsocial", "sectoressociales")
  inflect.irregular("ubicacion", "ubicaciones")
  inflect.irregular("vinculoestado", "vinculosestado")
  inflect.irregular("victimacolectiva", "victimascolectivas")
end
