source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "apexcharts"#, git: "https://github.com/styd/apexcharts.rb.git", branch: :master

gem "babel-transpiler"

gem "bcrypt"

gem 'bootsnap', require: false

gem "cancancan" # Roles

gem "cocoon", git: "https://github.com/vtamara/cocoon.git", 
  branch: "new_id_with_ajax"# Formularios anidados (algunos con ajax)

gem "coffee-rails" # CoffeeScript mientras reemplazamos por Javascript

gem "color"

gem "devise" # Autenticación 

gem "devise-i18n"

gem "hotwire-rails"

gem "jbuilder" # API JSON facil. Ver: https://github.com/rails/jbuilder

gem "jsbundling-rails"

gem "kt-paperclip",                 # Anexos
  git: "https://github.com/kreeti/kt-paperclip.git"

gem "libxml-ruby"

gem 'nokogiri'

gem "odf-report" # Genera ODT

gem "pg" # Postgresql

gem "prawn" # Generación de PDF

gem "prawnto_2",  require: "prawnto"

gem "prawn-table"

gem "rack", "~> 2"

gem "rails", ">= 7.1", "<7.2"
  #git: 'https://github.com/rails/rails.git', branch: '6-1-stable'

gem "rails-i18n"

gem "redcarpet" # Markdown

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
  git: "https://gitlab.com/pasosdeJesus/msip.git", branch: "tomselect"
  #path: "../msip-2.2"

gem "mr519_gen", # Motor de gestion de formularios y encuestas
  git: "https://gitlab.com/pasosdeJesus/mr519_gen.git", branch: "tomselect"
  #path: "../mr519_gen-2.2"

gem "heb412_gen",  # Motor de nube y llenado de plantillas
  git: "https://gitlab.com/pasosdeJesus/heb412_gen.git", branch: "tomselect"
  #path: "../heb412_gen-2.2"

group  :development, :test do
  gem "brakeman"

  gem "bundler-audit"

  gem "code-scanning-rubocop"

  gem "colorize"

  gem "debug" # Depurar

  gem "dotenv-rails"

  gem "rails-erd"

  gem "rubocop-minitest"

  gem "rubocop-rails"

  gem "rubocop-shopify"
end

group :development do
  gem "erd"

  gem "puma"

  gem "thor" # Requerido por rake

  gem "web-console"
end

group :test do
  gem "capybara"

  gem "compare-xml"

  gem "cuprite"

  gem "minitest"

  gem "minitest-reporters"

  gem "rails-controller-testing"

  gem "simplecov"
end
