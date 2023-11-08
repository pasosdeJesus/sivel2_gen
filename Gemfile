
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "apexcharts"#, git: "https://github.com/styd/apexcharts.rb.git", branch: :master

gem "babel-transpiler"

gem "bcrypt"

gem 'bootsnap', require: false

gem "cancancan"# Roles

gem "cocoon", git: "https://github.com/vtamara/cocoon.git", 
  branch: "new_id_with_ajax"# Formularios anidados (algunos con ajax)

gem "coffee-rails" # CoffeeScript para recuersos .js.coffee y vistas

gem "color" # Maneja colores RGB

gem "devise" # Autenticación 

gem "devise-i18n"

gem "jbuilder" # API JSON facil. Ver: https://github.com/rails/jbuilder

gem "jsbundling-rails"

gem "kt-paperclip",                 # Anexos
  git: "https://github.com/kreeti/kt-paperclip.git"

gem "libxml-ruby" # Genera ODS

gem 'nokogiri'

gem "odf-report" # Genera ODT

gem "pg" # Postgresql

gem "prawn" # Generación de PDF

gem "prawnto_2",  require: "prawnto"

gem "prawn-table"

gem 'rails', ">= 7.0", "< 7.1"
  #git: 'https://github.com/rails/rails.git', branch: '6-1-stable'

gem "rails-i18n"

gem "redcarpet" # Opera Markdown

gem "rspreadsheet"

gem 'rubyzip'

gem "sassc-rails" # Hojas de estilo con SCSS

gem "simple_form" # Formularios simples 

gem "sprockets-rails"

gem "stimulus-rails"

gem 'turbo-rails'

gem "twitter_cldr" # ICU con CLDR

gem "tzinfo" # Zonas horarias

gem "will_paginate" # Listados en páginas


#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores) 

gem "msip", # Motor generico,
  git: "https://gitlab.com/pasosdeJesus/msip.git", branch: "main"
  #path: "../msip"

gem "mr519_gen", # Motor de gestion de formularios y encuestas
  git: "https://gitlab.com/pasosdeJesus/mr519_gen.git", branch: "main"
  #path: "../mr519_gen"

gem "heb412_gen",  # Motor de nube y llenado de plantillas
  git: "https://gitlab.com/pasosdeJesus/heb412_gen.git", branch: "main"
  #path: "../heb412_gen"


group :development do
  gem "puma"

  gem "thor" # Requerido por rake

  gem "web-console"
end


group  :development, :test do
  gem "brakeman"

  gem "bundler-audit"

  gem "code-scanning-rubocop"

  gem "colorize"

  gem "debug", platforms: [:mri, :mingw, :x64_mingw]

  gem "dotenv-rails"

  gem "rails-erd"

  gem "rubocop-minitest"

  gem "rubocop-rails"

  gem "rubocop-shopify"
end

group :test do
  gem "compare-xml"

  gem "cuprite"

  gem "minitest"

  gem "minitest-reporters"

  gem "rails-controller-testing"

  gem "simplecov"
end
