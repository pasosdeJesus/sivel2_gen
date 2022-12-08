
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'apexcharts',
  git: 'https://github.com/styd/apexcharts.rb.git', branch: :master

gem 'babel-transpiler'

gem 'bcrypt'

gem 'bootsnap', '>=1.1.0', require: false

gem 'cancancan'# Roles

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax'# Formularios anidados (algunos con ajax)

gem 'coffee-rails' # CoffeeScript para recuersos .js.coffee y vistas

gem 'color' # Maneja colores RGB

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'jsbundling-rails'

gem 'devise' # Autenticación 

gem 'devise-i18n'

gem 'kt-paperclip',                 # Anexos
  git: 'https://github.com/kreeti/kt-paperclip.git'

gem 'libxml-ruby' # Genera ODS

gem 'odf-report' # Genera ODT

gem 'nokogiri', '>=1.11.1'

gem 'pg' # Postgresql

gem 'prawn' # Generación de PDF

gem 'prawnto_2',  :require => 'prawnto'

gem 'prawn-table'

gem 'rails', '~> 7.0'
  #git: 'https://github.com/rails/rails.git', branch: '6-1-stable'

gem 'rails-i18n'

gem 'redcarpet' # Opera Markdown

gem 'rspreadsheet'

gem 'rubyzip', '>= 2.0'

gem 'sassc-rails' # Hojas de estilo con SCSS

gem 'simple_form' # Formularios simples 

gem 'sprockets-rails'

gem 'stimulus-rails'

gem 'turbo-rails', '~> 1.0'

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'will_paginate' # Listados en páginas


#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores) 

gem 'msip', # Motor generico,
  #git: 'https://github.com/pasosdeJesus/msip.git', branch: :main
    path: '../msip'

gem 'mr519_gen', # Motor de gestion de formularios y encuestas
  git: 'https://github.com/pasosdeJesus/mr519_gen.git', branch: :msip
  #path: '../mr519_gen'

gem 'heb412_gen',  # Motor de nube y llenado de plantillas
  git: 'https://github.com/pasosdeJesus/heb412_gen.git', branch: :msip
  #path: '../heb412_gen'


group :development do
  gem 'puma'

  gem 'rails-erd' # Para generar modelo entidad asociación 

  gem "thor" # Requerido por rake

  gem 'web-console'
end


group  :development, :test do
  gem 'debug'

  gem 'compare-xml', '~> 0.5.2' # para validar xml

  gem 'colorize' # Colores en terminal

  gem 'dotenv-rails'

  gem 'rails-controller-testing'

  gem 'simplecov', '<0.18' # Debido a https://github.com/codeclimate/test-reporter/issues/418
end

group :test do
  gem 'cuprite'
end
