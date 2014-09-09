# Motor SIVeL 2 Genérico [![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sivel2_gen.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sivel2_gen) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen)

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
* Ruby version >= 1.9
* PostgreSQL >= 9.3
* Recomendado sobre adJ 5.5 (que incluye todos los componentes mencionados).  
  Las siguientes instrucciones suponen que opera en este ambiente.

## Pruebas
Se han implementado algunas pruebas con RSpec a modelos y pruebas de regresión.

* Instale gemas requeridas (como Rails 4.1) con:
``` sh
  cd spec/dummy
  sudo bundle install
  bundle install
```
* Prepare base de prueba con:
``` sh
  cd spec/dummy
  RAILS_ENV=test rake db:drop
  RAILS_ENV=test rake db:setup
  RAILS_ENV=test rake sivel2gen:indices
```
* Ejecute las pruebas desde el directorio del motor con:
```sh
  rspec
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

