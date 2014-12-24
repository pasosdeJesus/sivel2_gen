# Motor SIVeL 2 Genérico
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sivel2_gen.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sivel2_gen) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![security](https://hakiri.io/github/pasosdeJesus/sivel2_gen/master.svg)](https://hakiri.io/github/pasosdeJesus/sivel2_gen/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sivel2_gen.svg)](https://gemnasium.com/pasosdeJesus/sivel2_gen) 

## Tabla de Contenido
* [Diseño](#diseño)
* [Uso](#uso)
* [Pruebas](#pruebas)
* [Desarrollo](#pruebas)

Este es un motor de SIVeL 2 que podrá incluir en su desarrollo personalizado.

## Diseño

Puede ver el diseño y prototipo en la rama dis2 de SIVeL 1.2:
https://github.com/pasosdeJesus/SIVeL/tree/dis2

Roles: administrador y usuario

## Uso

### Requerimientos
* Ruby version >= 2.1
* PostgreSQL >= 9.3 con extensión unaccent disponible
* Recomendado sobre adJ 5.5 (que incluye todos los componentes mencionados).  
  Las siguientes instrucciones suponen que opera en este ambiente.

## Pruebas
Se han implementado algunas pruebas con RSpec a modelos y pruebas de regresión.

* Instale gemas requeridas (como Rails 4.2) con:
``` sh
  cd spec/dummy
  bundle install
```
Aunque para minimizar descargas vale la pena instalar como gemas del
sistema la mayoría de estas, en adJ con:
```sh
  grep "^ *gem" Gemfile | sed -e "s/gem [\"']//g;s/[\"'].*//g" | xargs sudo NOKOGIRI_USE_SYSTEM_LIBRARIES=1 make=gmake gem install
```
* Cree usuario para PostgreSQL (recomendado sivel2 o el que especifique en config/database.yml) 
  y pongale una clave, por ejemplo en adJ
```sh
sudo su - _postgresql
$ createuser -Upostgres -h/var/www/tmp -s sivel2
$ psql -h/var/www/tmp -Upostgres
psql (9.3.5)
Type "help" for help.

postgres=# ALTER USER sivel2 WITH password 'miclave';
ALTER ROLE
postgres=# \q
$ exit
```
* Prepare spec/dummy/config/database.yml con los datos de la base que creo:
```sh
  cp spec/dummy/config/database.yml.plantilla spec/dummy/config/database.yml
  $EDITOR spec/dummy/config/database.yml
```
* Prepare base de prueba con:
``` sh
  cd spec/dummy
  CLAVE_SIVEL2=miclave RAILS_ENV=test rake db:drop
  CLAVE_SIVEL2=miclave RAILS_ENV=test rake db:setup
  CLAVE_SIVEL2=miclave RAILS_ENV=test rake sivel2:indices
```
* Ejecute las pruebas desde el directorio del motor con:
```sh
  CLAVE_SIVEL2=miclave rspec
```

## Desarrollo

### Convenciones

2 espacios de indentación.

Para configurarlo en vim, agregue al final de ==~/.vim/ftplugin/ruby.vim==:
``` vim
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
```

http://betterspecs.org/
http://www.caliban.org/ruby/rubyguide.shtml
https://hakiri.io/blog/ruby-security-tools-and-resources

### Generación de datos de tablas básicas

Una vez estén bien los datos de tablas básicas en base de datos de la
la aplicación de  prueba spec/dummy:
```sh
cd spec/dummy
RAILS_ENV=test rake sivel2:vuelcabasicas
cp db/datos-basicas.sql ../../db/datos-basicas.sql
```

