# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sivel2_gen/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sivel2_gen"
  s.version     = Sivel2Gen::VERSION
  s.authors     = ["Vladimir Támara Patiño"]
  s.email       = ["vtamara@pasosdeJesus.org"]
  s.homepage    = "http://sivel.sf.net"
  s.summary     = "SIVeL 2 Genérico"
  s.description = "Motor para personalizar su propia versión de SIVeL."
  s.license     = "Dominio Público de acuerdo a legislación colombiana"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENCIA.md", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "color"
  s.add_runtime_dependency "devise"
  s.add_runtime_dependency "rails"

end
