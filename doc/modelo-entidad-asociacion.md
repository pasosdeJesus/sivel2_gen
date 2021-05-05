Puede verlo en el archivo
![doc/erd.pdf](https://github.com/pasosdeJesus/sivel2_gen/blob/master/doc/erd.pdf)

Este archivo se generó con graphviz y `rails-erd`. En adJ, usted puede instalar `graphviz` con:
```sh
doas pkg_add graphviz
```
Y desde las fuentes de sivel2_gen puede generar/actualizar con:
```sh
bundle
make erd
```

Podremos distinguir el modelo por grandes bloques según sus prefijos `Heb412Gen`, `Sip` y `Sivel2Gen` los cuales hacen referencia a los motores utilizados que la información de sus tablas trata de resumirse a continuación de manera general:

- `Heb412Gen`: Nube de documentos y plantillas por llenar (hojas de cálculo .ods y documentos .odt).
- `Sip` : Ubicación geográfica, persona y grupos de personas, control de acceso y otros.
- `Sivel2Gen`: Información directa sobre casos (víctimas, responsables, actos, entro otros).
