
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


gem 'bcrypt'

gem 'bootsnap', '>=1.1.0', require: false

gem 'cancancan'# Roles

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax'# Formularios anidados (algunos con ajax)

gem 'coffee-rails' # CoffeeScript para recuersos .js.coffee y vistas

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'devise' # Autenticación 

gem 'devise-i18n'

gem 'libxml-ruby' # Genera ODS

gem 'odf-report' # Genera ODT

gem 'paperclip'# Maneja adjuntos

gem 'pg' # Postgresql

gem 'prawn' # Generación de PDF

gem 'prawnto_2',  :require => 'prawnto'

gem 'prawn-table'

gem 'puma' # Servidor de aplicaciones

gem 'rails', '~> 6.0.0.rc1' # Rails con internacionalización

gem 'rails-i18n'

gem 'redcarpet' # Opera Markdown

gem 'rspreadsheet'

gem 'rubyzip', '>= 2.0'

gem 'sassc-rails' # Hojas de estilo con SCSS

gem 'simple_form' # Formularios simples 

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'webpacker' # módulos en Javascript https://github.com/rails/webpacker

gem 'will_paginate' # Listados en páginas


#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores) 

gem 'sip', # Motor generico
  git: 'https://github.com/pasosdeJesus/sip.git'
  #path: '../sip'

gem 'mr519_gen', # Motor de gestion de formularios y encuestas
  git: 'https://github.com/pasosdeJesus/mr519_gen.git'
#gem 'mr519_gen', path: '../mr519_gen'

gem 'heb412_gen',  # Motor de nube y llenado de plantillas
  git: 'https://github.com/pasosdeJesus/heb412_gen.git'
#gem 'heb412_gen', path: '../heb412_gen'

gem 'react-rails'

group :development do
  
  gem 'compare-xml', '~> 0.5.2' # para validar xml

  gem 'nokogiri', '~> 1.6', '>= 1.6.8'
  
  gem 'rails-erd' # Para generar modelo entidad asociación 

  gem "thor" # Requerido por rake

end


group  :development, :test do

  #gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  gem 'colorize' # Colores en terminal

  gem 'rails-controller-testing'

  gem 'simplecov'

end
