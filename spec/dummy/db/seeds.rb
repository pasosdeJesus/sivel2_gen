# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


connection = ActiveRecord::Base.connection();

# Básicas de motor sip
l = File.readlines(
  Gem.loaded_specs['sip'].full_gem_path + "/db/datos-basicas.sql"
)
connection.execute(l.join("\n"))

# Cambios a básicas existentes
if File.exists?("../../db/cambios-basicas.sql") then
	l = File.readlines("../../db/cambios-basicas.sql")
	connection.execute(l.join("\n"))
end

# Nuevas basicas de este motor 
if File.exists?("../../db/datos-basicas.sql") then
	l = File.readlines("../../db/datos-basicas.sql")
	connection.execute(l.join("\n"));
end

# usuario sivel2 con clave sivel2
connection.execute("INSERT INTO usuario 
	(nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES ('sivel2', 'sivel2@localhost', 
	'$2a$10$V2zgaN1ED44UyLy0ubey/.1erdjHYJusmPZnXLyIaHUpJKIATC1nG', 
	'', '2014-08-26', '2014-08-26', '2014-08-26', 1);")

