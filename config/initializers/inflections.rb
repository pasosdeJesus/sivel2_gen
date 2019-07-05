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
        inflect.plural(/^(.*s)$/i, '\1es')
        inflect.singular(/^(.*s)es$/i, '\1')
        inflect.plural(/^(.*a)$/i, '\1s')
        inflect.plural(/^(.*d)$/i, '\1es')
        inflect.singular(/^(.*d)es$/i, '\1')
        inflect.plural(/^(.*l)$/i, '\1es')
        inflect.singular(/^(.*l)es$/i, '\1')
        inflect.plural(/^(.*n)$/i, '\1es')
        inflect.singular(/^(.*n)es$/i, '\1')
        inflect.irregular 'actividad', 'actividades'
        inflect.irregular 'categoria', 'categorias'
        inflect.irregular 'clase', 'clases'
        inflect.irregular 'estadocivil', 'estadosciviles'
        inflect.irregular 'etiqueta', 'etiquetas'
        inflect.irregular 'error', 'errores'
        inflect.irregular 'etnia', 'etnias'
        inflect.irregular 'filiacion', 'filiaciones'
        inflect.irregular 'fuenteprensa', 'fuentesprensa'
        inflect.irregular 'organizacion', 'organizaciones'
        inflect.irregular 'presponsable', 'presponsables'
        inflect.irregular 'profesion', 'profesiones'
        inflect.irregular 'rangoedad', 'rangosedad'
        inflect.irregular 'rangoedadac', 'rangosedadac'
        inflect.irregular 'regimensalud', 'regimenessalud'
        inflect.irregular 'region', 'regiones'
        inflect.irregular 'resagresion', 'resagresiones'
        inflect.irregular 'rolfamilia', 'rolesfamilia'
        inflect.irregular 'perfilactorsocial', 'perfilesactorsocial'
        inflect.irregular 'sectorsocial', 'sectoressociales'
        inflect.irregular 'ubicacion', 'ubicaciones'
        inflect.irregular 'victimacolectiva', 'victimascolectivas'
        inflect.irregular 'vinculoestado', 'vinculosestado'
        inflect.irregular 'visual', 'visuales'
end
