source 'https://rubygems.org'

#ruby "2.1.5"

# Rails (internacionalización)
gem "rails", '~> 4.2.3.rc1'
gem "rails-i18n"

# Problemas con arel 6.0.0 al ejecutar rspec
#gem "arel", '6.0.0.beta2'

# Colores en terminal
gem "colorize"

# Postgresql
gem "pg"

# API JSON facil. Ver: https://github.com/rails/jbuilder
gem "jbuilder"

gem "sass"

# Uglifier comprime recursos Javascript
gem "uglifier", '>= 1.3.0'

# CoffeeScript para recuersos .js.coffee y vistas
gem "coffee-rails"

# jquery como librería JavaScript
gem "jquery-rails", '~> 4.0.0'
gem "jquery-ui-rails"
gem "jquery-ui-bootstrap-rails", git: "https://github.com/kristianmandrup/jquery-ui-bootstrap-rails"

# Seguir enlaces más rápido. Ver: https://github.com/rails/turbolinks
gem "turbolinks"

# Ambiente de CSS
gem "twitter-bootstrap-rails", '~> 3.2.0'
gem "bootstrap-datepicker-rails"

# Formularios simples 
gem "simple_form"

# Formularios anidados (algunos con ajax)
gem "cocoon", github: "vtamara/cocoon"

# Autenticación y roles
gem "devise"
gem "devise-i18n"
gem "cancancan"
gem "bcrypt"

# Pagina listados
gem "will_paginate"

# ICU con CLDR
gem 'twitter_cldr'
 
# Maneja adjuntos
gem "paperclip", "~> 4.1"

# Zonas horarias
gem "tzinfo"
gem "tzinfo-data"

# Motor estilo Pasos de Jesús
gem 'sip', github: 'pasosdeJesus/sip'
#gem 'sip', path: '../sip'

group :doc do
  # Genera documentación en doc/api con bundle exec rake doc:rails
  gem "sdoc", require: false
end

# Los siguientes son para desarrollo o para pruebas con generadores
group :development do
  # Requerido por rake
  gem "thor"
  
  # Pruebas con rspec
  gem 'spring-commands-rspec'
  gem 'rspec-rails'


  # Depurar
  #gem 'byebug'
  
  # Consola irb en páginas con excepciones o usando <%= console %> en vistasA
  gem 'web-console'

end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do
  # Acelera ejecutando en fondo. https://github.com/jonleighton/spring
  gem "spring"

  # Un proceso para cada prueba -- acelera
  gem 'spork', '~> 1.0rc'

  # Envia resultados de pruebas desde travis a codeclimate
  gem "codeclimate-test-reporter", require: nil

  # Maneja datos de prueba
  gem "factory_girl_rails", "~> 4.0", group: [:development, :test]

  # https://www.relishapp.com/womply/rails-style-guide/docs/developing-rails-applications/bundler
  # Lanza programas para examinar resultados
  gem "launchy"


  # Para examinar errores, usar "rescue rspec" en lugar de "rspec"
  gem 'pry-rescue'
  gem 'pry-stack_explorer'

end

