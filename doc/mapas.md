# Reporte de Casos en Mapas

La visualización de los casos a través de un sistema GIS está disponible en la plataforma con el fin de interactuar con la información de los casos geográficamente. Con los mapas se han aprovechado recursos y servicios como controles, capasy además de implementarse un filtro de búsqueda de Casos. Han sido seleccionadas dos tecnologías para el despliegue de mapas: Google Maps y Open Street Maps.

El siguiente enlace, contiene un diagrama que explica partes implicadas en OpenStreetMap (o MapBox o Google Maps)

https://ircama.github.io/osm-carto-tutorials/osm-rendering-process/

A continuación se presenta el desarrollo de cada mapa más detallado.

## Google Maps

Google tiene disponible una API de google maps para que los desarrolladores puedan desplegar mapas en sus proyectos. Para esto, basta con registrarse y GoogleMaps provee una llave (key) la cual es fundamental para poder visualizar el mapa. El mapa de Gogle Maps para SIVeL 2 está compuesto por:
1. Una valdoza satelital propia de Google.
2. Un filtro de casos en el cual se puede seleccionar tópicos como Fechas, Departamentos, Presuntos Responsables y Tipo de Violencia.
3. Este mapa usa la librería de MarkerClusterer para poder visualizar mediante clusters la acomulación de gran numero de casos que esan cercanos enre sí.
4. Al hacer clic en uno de los marcadores (casos) el mapa despliega una ventana de información de casos (infoWindw) en la que se puede visualizar información correspondiente al  caso seleccionado. 

En la imagen a continuación se presenta el despliegue final obtenido con Google Maps.

![Google maps](https://github.com/alejocruzrcc/sivel2_gen/blob/docmapa/doc/imagengm.png)

## Open Street Maps 

Osm (Open Street Maps) es otro servicio GIS para desplegar mapas. Este servicio más que por su función de desplegar mapa es más apreciado por los datos generados por el proyecto, ya que es un proyecto colaborativo. el API seleccionado para SIVeL 2 es Leaflet una librería que permite desplegar un mapa con los servicios escenciales buscados y además con la capacidad de interactuar con capas del mapas. El mapa OSM para SIVeL 2 esta compuesto por:
1. Una valdoza OSM inicial.
2. Un filtro de casos en el cual se puede seleccionar tópicos como Fechas, Departamentos, Presuntos Responsables y Tipo de Violencia. Además de un panel que muestra el número casos encontrados.
3. En este mapa también se usa la Librería de MarkerClusterer para poder visualizar mediante clusters la acomulación de gran numero de casos que están cercanos enre sí.
4. Al hacer clic en uno de los marcadores (casos) el mapa despliega una ventana de información de casos (infoWindw) en la que se puede visualizar información correspondiente al  caso seleccionado.
5. Un control de capas, capáz de gestionar capas bases y superpuestas. Para las capas bases están definidos 3 estilos (OSM, Satelital y un tema Oscuro). 
6. Un control para agregar capas superpuestas, el cual recibe archivos de tipo GeoJSON y despliega inmediatament la capa en el mapa.  

La imagen a continuación muestra el resultado final de este desarrollo: 

![Open Street Maps](https://github.com/alejocruzrcc/sivel2_gen/blob/docmapa/doc/imagenosm.png)
