# Reporte de Casos en Mapas

La visualización de los casos a través de un sistema GIS está disponible en la plataforma con el fin de interactuar con la información de los casos geográficamente. Con los mapas se han aprovechado recursos y servicios como controles, capasy además de implementarse un filtro de búsqueda de Casos. Han sido seleccionadas dos tecnologías para el despliegue de mapas: Google Maps y Open Street Maps.

El siguiente enlace, contiene un diagrama que explica partes implicadas en OpenStreetMap (o MapBox o Google Maps)

https://ircama.github.io/osm-carto-tutorials/osm-rendering-process/

A continuación se presenta el desarrollo de cada mapa más detallado.

## Google Maps

Google tiene disponible una API de google maps para que los desarrolladores puedan desplegar mapas en sus proyectos (https://developers.google.com/maps/documentation/javascript/tutorial?hl=es) . Para esto, basta con registrarse y GoogleMaps provee una llave (key) la cual es fundamental para poder visualizar el mapa. El mapa de Gogle Maps para SIVeL 2 está compuesto por:
1. Una baldosa (tile) satelital propia de Google.
2. Un filtro de casos en el cual se puede restringir por tópicos como Fechas, Departamentos, Presuntos Responsables y Tipo de Violencia.
3. Este mapa usa la librería de MarkerClusterer para poder visualizar acumulados (clusters) de gran numero de casos que esan cercanos entre sí.
4. Al hacer clic en uno de los marcadores (casos) el mapa despliega una ventana de información de casos (infoWindow) en la que se puede visualizar información correspondiente al  caso seleccionado. 

En la imagen a continuación se presenta el despliegue final obtenido con Google Maps.

![Google maps](https://github.com/pasosdeJesus/sivel2_gen/blob/docmapa/doc/imagengm.png)

## Open Street Maps 

Osm (Open Street Maps) es otro servicio GIS para desplegar mapas (https://leafletjs.com/reference-1.5.0.html). Este servicio más que por su función de desplegar mapa es apreciado por los datos generados por el proyecto, ya que es un proyecto colaborativo. El API seleccionado para SIVeL 2 es Leaflet una librería que permite desplegar un mapa con los servicios escenciales buscados y además con la capacidad de interactuar con capas del mapas. El mapa OSM para SIVeL 2 esta compuesto por:
1. Una baldosa (tile) OSM inicial.
2. Un filtro de casos en el cual se puede restringir por tópicos como Fechas, Departamentos, Presuntos Responsables y Tipo de Violencia. Además de un panel que muestra el número casos encontrados.
3. En este mapa también se usa una la Librería de MarkerClusterer propia de Leaflet para poder visualizar acumulados (clusters) de gran numero de casos que están cercanos entre sí.
4. Al hacer clic en uno de los marcadores (casos) el mapa despliega una ventana de información de casos (infoWindow) en la que se puede visualizar información correspondiente al  caso seleccionado.
5. Un control de capas, capáz de gestionar capas bases y superpuestas. Para las capas bases están definidos 3 estilos (OSM, Satelital y un tema Oscuro). 
6. Un control para agregar capas superpuestas, el cual recibe archivos de tipo GeoJSON y despliega inmediatamente la capa en el mapa. Esta función está solo diseñada para capas pequeñas, del orden de los 100Kb o menos. Esto es debido al cálculculo que se presenta (render) que se realiza parcialmente en el navegador del usuario.  

La imagen a continuación muestra el resultado final de este desarrollo: 

![Open Street Maps](https://github.com/pasosdeJesus/sivel2_gen/blob/docmapa/doc/imagenosm.png)
