source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


gem 'bcrypt'

gem 'bootsnap', '>=1.1.0', require: false

gem 'bootstrap-datepicker-rails'

gem 'cancancan'# Roles

gem 'chosen-rails', git: 'https://github.com/vtamara/chosen-rails.git', branch: 'several-fixes'

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax'# Formularios anidados (algunos con ajax)

gem 'coffee-rails' # CoffeeScript para recuersos .js.coffee y vistas

gem 'colorize' # Colores en terminal

gem 'font-awesome-rails'

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'jquery-rails'# jquery como librería JavaScript

gem 'jquery-ui-rails'

gem 'devise' # Autenticación 

gem 'devise-i18n'


gem 'heb412_gen', git: 'https://github.com/pasosdeJesus/heb412_gen.git'
   #path: '../heb412_gen' # Motor de nube y plantillas

gem 'libxml-ruby' # Genera ODS

# Motor de formularios
gem 'mr519_gen', git: 'https://github.com/pasosdeJesus/mr519_gen.git'
#gem 'mr519_gen', path: '../mr519_gen'

gem 'odf-report', git: 'https://github.com/vtamara/odf-report.git', 
  branch: 'rubyzip-1.3' # Genera ODT

gem 'paperclip'# Maneja adjuntos

gem 'pg' # Postgresql

gem 'pick-a-color-rails' # Facilita elegir colores en tema

gem 'prawn' # Generación de PDF

gem 'prawnto_2',  :require => 'prawnto'

gem 'prawn-table'

gem 'puma' # Servidor de aplicaciones

gem 'rails', '~> 6.0.0.rc1' # Rails con internacionalización

gem 'rails-i18n'

gem 'redcarpet' # Opera Markdown

gem 'rspreadsheet'

gem 'rubyzip', '>= 2.0'

gem 'sass-rails' # Hojas de estilo con SCSS

gem 'simple_form' # Formularios simples 

# Motor estilo Pasos de Jesús
#gem 'sip', git: 'https://github.com/pasosdeJesus/sip.git'
gem 'sip', path: '../sip'

gem 'tiny-color-rails'

gem 'turbolinks' # Enlaces y redirecciones rápido.

gem 'twitter-bootstrap-rails' 

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'uglifier' # Uglifier comprime recursos Javascript

gem 'webpacker' # módulos en Javascript https://github.com/rails/webpacker

gem 'will_paginate' # Listados en páginas


group :development do
  
  gem 'compare-xml', '~> 0.5.2' # para validar xml

  gem 'nokogiri', '~> 1.6', '>= 1.6.8'
  
  gem 'rails-erd' # Para generar modelo entidad asociación 

  gem "thor" # Requerido por rake

end


group  :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  gem 'rails-controller-testing'

  gem 'simplecov'

end
