# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# No usamos gemspec porque la aplicacón de prueba de un motor rails
# no lo soporta.

ruby ">= 3.1.2"

gem "apexcharts"

gem "babel-transpiler"

gem "benchmark"

gem "bootsnap", ">= 1.4.4", require: false

gem "cancancan", "~> 3.4" # Control de acceso

gem "cocoon",
  git: "https://github.com/vtamara/cocoon.git",
  branch: "new_id_with_ajax" # Formularios anidados (algunos con ajax)

gem "coffee-rails", "~> 5.0"    # CoffeeScript para recursos .js.coffee

gem "csv"

gem "devise", "~> 4.8"          # Autenticación

gem "devise-i18n"               # Localización e Internacionalización

gem "hotwire-rails"

gem "jbuilder", ">= 2.7"        # Json

gem "jsbundling-rails"

gem "kt-paperclip",             # Anexos
  git: "https://github.com/kreeti/kt-paperclip.git"
# git: 'https://github.com/vtamara/paperclip.git', branch: 'fix-ruby3'
# path: '../tmp/paperclip'

gem "libxml-ruby"

gem "nokogiri", ">=1.11.1"

gem "odf-report"

gem "pg" # PostgreSQL

gem "prawn"

gem "puma" # Lanza en modo desarrollo

gem "rails", ">= 7.2.2.2", "< 7.3"
# git: 'https://github.com/rails/rails.git', branch: '6-1-stable'

gem "rails-i18n", "~> 7.0"      # Localización e Internacionalización

gem "redcarpet"

gem "rexml", ">= 3.4.2"

gem "rspreadsheet"

gem "rubyzip"

gem "sassc-rails", "~> 2.1"     # Conversión a CSS

gem "simple_form", "~> 5.1"     # Formularios

gem "sprockets-rails"

gem "stimulus-rails"            # Controladores en javascript

gem "turbo-rails", "~> 1.0"

gem "twitter_cldr", "~> 6.11"   # Localiación e internacionalización

gem "tzinfo"                    # Zonas horarias

gem "will_paginate"             # Pagina listados

#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento
# lógico y no alfabetico como las gemas anteriores)
gem "msip", # Motor generico
  git: "https://gitlab.com/pasosdeJesus/msip.git",
  branch: "v2.2"
# path: "../msip-2.2"

gem "mr519_gen", # Motor generico
  git: "https://gitlab.com/pasosdeJesus/mr519_gen.git",
  branch: "v2.2"
# path: "../mr519_gen-2.2"

gem "heb412_gen", # Motor generico
  git: "https://gitlab.com/pasosdeJesus/heb412_gen.git",
  branch: "v2.2"
# path: "../heb412_gen-2.2"



group :development, :test do
  gem "brakeman"

  gem "bundler-audit"

  gem "code-scanning-rubocop"

  gem "colorize"

  gem "debug"

  gem "dotenv-rails"

  gem "rails-erd"

  gem "rubocop-minitest"

  gem "rubocop-rails"

  gem "rubocop-shopify"

  gem "thor", ">= 1.4.0"

  gem "yard"
end

group :development do
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "compare-xml"

  gem "connection_pool"

  gem "minitest", "~> 5.16"

  gem "minitest-reporters"

  gem "rails-controller-testing"

  gem "simplecov"

  gem "spork" # Un proceso para cada prueba -- acelera
end
