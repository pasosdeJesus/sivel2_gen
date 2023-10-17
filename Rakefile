# encoding: utf-8
# frozen_string_literal: true

begin
  require "bundler/setup"
rescue LoadError
  puts "Debe instalar `gem install bundler` y `bundle install` para correr tareas rake"
end

require "rdoc/task"

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title    = "Msip"
  rdoc.options << "--line-numbers"
  rdoc.rdoc_files.include("README.md")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
load "rails/tasks/engine.rake"

Bundler::GemHelper.install_tasks
if ENV["CONFIG_HOSTS"]
  ENV["CONFIG_HOSTS"] = "www.example.com"
end
task default: "app:test"
