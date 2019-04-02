# Motor SIVeL 2 Genérico
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sivel2_gen.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sivel2_gen) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![security](https://hakiri.io/github/pasosdeJesus/sivel2_gen/master.svg)](https://hakiri.io/github/pasosdeJesus/sivel2_gen/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sivel2_gen.svg)](https://gemnasium.com/pasosdeJesus/sivel2_gen) 

![Logo de sivel2_gen](https://raw.githubusercontent.com/pasosdeJesus/sivel2_gen/master/test/dummy/app/assets/images/logo.jp)

## Tabla de Contenido
* [Diseño](#diseño)
* [Uso](#uso)
* [Pruebas](#pruebas)
* [Desarrollo](#desarrollo)

Este es un motor de SIVeL 2 que podrás incluir en tu desarrollo personalizado.

## Diseño

Puede ver el diseño y prototipo en la rama dis2 de SIVeL 1.2:
<https://github.com/pasosdeJesus/SIVeL/tree/dis2>

Control de Acceso: 2 roles administrador y usuario.  El administrador puede 
editar tablas básicas y gestionar usuarios.   El analista puede crear 
y editar casos.

## Uso

### Requerimientos tecnológicos

Ver <https://github.com/pasosdeJesus/sip/wiki/Requerimientos>

## Pruebas

### Aplicación de prueba

Este motor incluye una aplicación mínima de prueba cuya configuración
es como la descrita en:
<https://github.com/pasosdeJesus/sip/wiki/Aplicaci%C3%B3n-de-prueba>

Si ya habías lanzado la aplicación de prueba del motor **sip**, podrás utilizar
el mismo usuario y basta que configures la clave 
en ```spec/dummy/config/database.yml```

### Pruebas de regresión

Se han implementado algunas pruebas con RSpec a modelos y pruebas de regresión.
Si pudiste ver la aplicación de prueba en un navegador, las siguientes 
instrucciones aplican:
https://github.com/pasosdeJesus/sip/wiki/Pruebas-de-Regresi%C3%B3n

## Desarrollo

### Convenciones de Desarrollo

Consultalas en
https://github.com/pasosdeJesus/sip/wiki/Convenciones

### Generación de datos de tablas básicas

Una vez estén bien los datos de tablas básicas en base de datos de la
la aplicación de  prueba ```spec/dummy```:
```sh
cd spec/dummy
RAILS_ENV=test rake sivel2:vuelcabasicas
cp db/datos-basicas.sql ../../db/datos-basicas.sql
```

