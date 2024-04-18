# Motor SIVeL 2 Genérico

[![Revisado por Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com) Pruebas y seguridad:[![Estado Construcción](https://gitlab.com/pasosdeJesus/sivel2_gen/badges/main/pipeline.svg)](https://gitlab.com/pasosdeJesus/sivel2_gen/-/pipelines?page=1&scope=all&ref=main) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sivel2_gen/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sivel2_gen)

![Logo de sivel2_gen](https://gitlab.com/pasosdeJesus/sivel2_gen/-/raw/main/test/dummy/app/assets/images/logo.jpg)

Este es el motor central de SIVeL 2 para manejar casos de violencia socio política.

Es para desarrolladores. Si estás interesado en desplegar la aplicación SIVeL mejor revisa:
<https://gitlab.com/pasosdeJesus/sivel2>

## Diseño

Mira más sobre la arquitectura actual en:
<https://gitlab.com/pasosdeJesus/sivel2_gen/-/wiki/home>

[Tablas incluidas y modelo entidad-asociación](https://gitlab.com/pasosdeJesus/sivel2_gen/-/blob/master/doc/modelo-entidad-asociacion.md)

Respecto a la funcionalidad un diseño histórico y prototipo inicial de la
versión 2 está disponible la rama dis2 de SIVeL 1.2:
<https://github.com/pasosdeJesus/SIVeL/tree/dis2>

Control de Acceso: 2 roles administrador y usuario.  El administrador puede
editar tablas básicas y gestionar usuarios. El analista puede crear
y editar casos.

## Pruebas

### Requisitos tecnológicos

Ver <https://gitlab.com/pasosdeJesus/msip/-/blob/master/doc/requisitos.md>

### Aplicación de prueba

Este motor incluye una aplicación mínima de prueba cuya configuración
es como la descrita en:
<https://gitlab.com/pasosdeJesus/msip/-/blob/master/doc/aplicacion-de-prueba.md>

Si ya habías lanzado la aplicación de prueba del motor **msip**, podrás utilizar
el mismo usuario y basta que configures la clave
en ```test/dummy/config/database.yml```

### Pruebas con minitest

Se han implementado algunas pruebas con `minitest` a modelos y  controladores.
Si pudiste ver la aplicación de prueba en un navegador, las siguientes
instrucciones aplican:
<https://gitlab.com/pasosdeJesus/msip/-/blob/master/doc/pruebas-con-minitest.md>

## Desarrollo

### Convenciones de Desarrollo

Consúltalas en
<https://gitlab.com/pasosdeJesus/msip/-/blob/master/doc/convenciones.md>

### Generación de datos de tablas básicas

Una vez estén bien los datos de tablas básicas en la base de datos, copia el archivo `datos-basicas.sql` a la carpeta db del directorio principal desde la aplicación de prueba modo desarrollo de ```test/dummy```:
```sh
cd test/dummy
bin/rails sivel2:vuelcabasicas
cp db/datos-basicas.sql ../../db/datos-basicas.sql
```

## Inclusión de este motor en una aplicacíon

Para habilitar/deshabilitar de manera independiente el botón
"Validar y Guardar" del formulario de caso de los botones
"Agregar" de las pestañas del mismo formulario, en 
`config/application.rb` agrega:

```
config.action_view.automatically_disable_submit_tag = false
```
