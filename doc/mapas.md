# Visualización de casos sobre mapas web

SIVeL 2 provee visualización de los casos y parte de su información sobre mapas web de Google Maps, OpenStreetMap y Mapbox.  Estas visualizaciones cuentan con controles típicos de esos tipos de mapas (e.g acercar, alejar), acumulados (clusters) de casos que se desagrupan a media que se acerca, un filtro de búsqueda sobre los casos y sobre Open Street Map posibilidad de importar pequeñas capas GeoJSON.

Como se explica en https://ircama.github.io/osm-carto-tutorials/osm-rendering-process/ tanto editar información geográfica como visualizarla son procesos complejos que se realizan en varios niveles.  

En el caso de visualización de una mapa web con baldosas (tile map) pueden resumirse a los siguientes (que se han vuelto practicamente estándar en el web https://en.wikipedia.org/wiki/Tiled_web_map):
* A nivel de servidor: 
  * La información geográfica con nombres y coordenadas se mantiene en una base de datos (PostgreSQL con PostGIS en el caso de OpenStreetMap)
  * Mediante un programa (mapnik en el caso de OpenStreetMap), esta información se transforma en una capa base conformada por baldosas (tiles) que son imagenes de 256x256 de acuerdo a: (1) nivel de acercamiento o zoom, (2) coordenadadas X y Y en sistema Web Mercator (i.e latitudes entre -180 y 180 y longitudes entre -85.05 y 85.05), (3) estilo de colores, texturas, símbolos, tipografía y ubicación de textos.
  * Pueden generarse otras capas de baldosas por sobreponer a la capa base de manera análoga (sólo que emplean color transparente donde se debe presentar capa base).
* A nivel de cliente en el navegador
  * Se emplea un API o librería Javascript para descargar y sobreponer las baldosas de capa base y superpuestas de acuerdo al nivel de acercamiento y ubicación elegidas por el usuario.
  * De acuerdo a posibilidades de la libría se sobreponen otras capas a nivel de cliente o se agregan marcadores o acumulados 
  * El navegador presenta el mapa al usuario y le permite interactuar.
  
Por su filosofia de fuentes abiertas y por no requerir llaves de autenticación, SIVeL 2 emplea por omisión visualización sobre OpenStreetMap. 

A continuación describimos más detalle de los mapas web con los que se ha implementado visualización de casos.


## Google Maps

Google tiene disponible una API de google maps para que los desarrolladores puedan desplegar mapas en sus proyectos (https://developers.google.com/maps/documentation/javascript/tutorial?hl=es) . Para esto, basta con registrarse y GoogleMaps provee una llave (key) la cual es fundamental para poder visualizar el mapa. El mapa de Gogle Maps para SIVeL 2 está compuesto por:
1. Una baldosa (tile) satelital propia de Google.
2. Un filtro de casos en el cual se puede restringir por tópicos como Fechas, Departamentos, Presuntos Responsables y Tipo de Violencia.
3. Este mapa usa la librería de MarkerClusterer para poder visualizar acumulados (clusters) de gran numero de casos que esan cercanos entre sí.
4. Al hacer clic en uno de los marcadores (casos) el mapa despliega una ventana de información de casos (infoWindow) en la que se puede visualizar información correspondiente al  caso seleccionado. 

En la imagen a continuación se presenta el despliegue final obtenido con Google Maps.

![Google maps](https://github.com/pasosdeJesus/sivel2_gen/raw/master/doc/imagengm.png)

## Open Street Maps 

Osm (Open Street Maps) es otro servicio GIS para desplegar mapas (https://leafletjs.com/reference-1.5.0.html). Este servicio más que por su función de desplegar mapa es apreciado por los datos generados por el proyecto, ya que es un proyecto colaborativo. El API seleccionado para SIVeL 2 es Leaflet una librería que permite desplegar un mapa con los servicios escenciales buscados y además con la capacidad de interactuar con capas del mapas. El mapa OSM para SIVeL 2 esta compuesto por:
1. Una baldosa (tile) OSM inicial.
2. Un filtro de casos en el cual se puede restringir por tópicos como Fechas, Departamentos, Presuntos Responsables y Tipo de Violencia. Además de un panel que muestra el número casos encontrados.
3. En este mapa también se usa una la Librería de MarkerClusterer propia de Leaflet para poder visualizar acumulados (clusters) de gran numero de casos que están cercanos entre sí.
4. Al hacer clic en uno de los marcadores (casos) el mapa despliega una ventana de información de casos (infoWindow) en la que se puede visualizar información correspondiente al  caso seleccionado.
5. Un control de capas, capáz de gestionar capas bases y superpuestas. Para las capas bases están definidos 3 estilos (OSM, Satelital y un tema Oscuro). 
6. Un control para agregar capas superpuestas, el cual recibe archivos de tipo GeoJSON y despliega inmediatamente la capa en el mapa. Esta función está solo diseñada para capas pequeñas, del orden de los 100Kb o menos. Esto es debido al cálculculo que se presenta (render) que se realiza parcialmente en el navegador del usuario.  

La imagen a continuación muestra el resultado final de este desarrollo: 

![Open Street Maps](https://github.com/pasosdeJesus/sivel2_gen/raw/master/doc/imagenosm.png)
