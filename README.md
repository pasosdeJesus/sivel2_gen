# SIVeL 2 Genérico [![Build Status](https://api.travis-ci.org/pasosdeJesus/SIVeL.svg?branch=dis2)](https://travis-ci.org/pasosdeJesus/SIVeL)

## Tabla de Contenido
* [Diseño](#diseño)
* [Uso](#uso)
* [Pruebas](#pruebas)
* [Desarrollo](#pruebas)

Este es un motor de SIVeL 2 que podrá incluir en su desarrollo personalizado.

## Diseño

Puede ver el diseño y prototipo en la rama dis2 de SIVeL 1.2:
https://github.com/pasosdeJesus/SIVeL/tree/dis2

## Uso

### Requerimientos
* Ruby version >= 1.9
* PostgreSQL >= 9.3
* Se puede emplear en paralelo con una instancia de SIVeL 1.3 
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
  RAILS_ENV=test rake db:setup
  RAILS_ENV=test rake sivel:indices
```
* Ejecute las pruebas desde el directorio del motor con:
```sh
  rake
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

