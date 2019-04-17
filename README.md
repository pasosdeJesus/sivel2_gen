# Motor SIVeL 2 Genérico
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sivel2_gen.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sivel2_gen) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![security](https://hakiri.io/github/pasosdeJesus/sivel2_gen/master.svg)](https://hakiri.io/github/pasosdeJesus/sivel2_gen/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sivel2_gen.svg)](https://gemnasium.com/pasosdeJesus/sivel2_gen) 

![Logo de sivel2_gen](https://raw.githubusercontent.com/pasosdeJesus/sivel2_gen/master/test/dummy/app/assets/images/logo.jpg)

## Tabla de Contenido
* [Diseño](#diseño)
* [Uso](#uso)
* [Pruebas](#pruebas)
* [Desarrollo](#desarrollo)

Este es un motor de SIVeL 2 con la funcionalidad central de este: manejo de casos de violencia socio política.

Es para desarrolladores. Si estás interesado en desplegar la aplicación SIVeL mejor revisa:
<https://github.com/pasosdeJesus/sivel2>

## Diseño

Mira más sobre la arquitectura actual en:
<https://github.com/pasosdeJesus/sivel2/wiki>

Respecto a la funcionalidad un diseño histórico y prototipo inicial de la 
versión 2 está disponible la rama dis2 de SIVeL 1.2:
<https://github.com/pasosdeJesus/SIVeL/tree/dis2>

Control de Acceso: 2 roles administrador y usuario.  El administrador puede 
editar tablas básicas y gestionar usuarios.   El analista puede crear 
y editar casos.

## Pruebas

### Requisitos tecnológicos

Ver <https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md>

### Aplicación de prueba

Este motor incluye una aplicación mínima de prueba cuya configuración
es como la descrita en:
<https://github.com/pasosdeJesus/sip/blob/master/doc/aplicacion-de-prueba.md>

Si ya habías lanzado la aplicación de prueba del motor **sip**, podrás utilizar
el mismo usuario y basta que configures la clave 
en ```test/dummy/config/database.yml```

### Pruebas con minitest

Se han implementado algunas pruebas con `minitest` a modelos y  controladores.
Si pudiste ver la aplicación de prueba en un navegador, las siguientes 
instrucciones aplican:
<https://github.com/pasosdeJesus/sip/blob/master/doc/pruebas-con-minitest.md>

## Desarrollo

### Convenciones de Desarrollo

Consultalas en
<https://github.com/pasosdeJesus/sip/blob/master/doc/convenciones.md>

### Generación de datos de tablas básicas

Una vez estén bien los datos de tablas básicas en base de datos de la
la aplicación de  prueba, modo desarrollo de ```test/dummy```:
```sh
cd test/dummy
bin/rails sivel2:vuelcabasicas
cp db/datos-basicas.sql ../../db/datos-basicas.sql
```

