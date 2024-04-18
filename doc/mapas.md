# Visualización de casos sobre mapas web

SIVeL 2 provee visualización de los casos y parte de su información sobre mapas web de OpenStreetMap, Google Maps y Mapbox.  Estas visualizaciones cuentan con controles típicos de esos mapas (e.g acercar, alejar), acumulados (clusters) de casos que se desagrupan a media que se acerca, un filtro de búsqueda sobre los casos y sobre Open Street Map posibilidad de importar pequeñas capas GeoJSON, así como de exportar la capa de casos en GeoJSON.

Como se explica en https://ircama.github.io/osm-carto-tutorials/osm-rendering-process/ tanto editar información geográfica como visualizarla son procesos complejos que se realizan en varios niveles.  

En el caso de visualización de una mapa web con baldosas (tile map), los siguientes niveles son prácticamente estándar https://en.wikipedia.org/wiki/Tiled_web_map:
* A nivel de servidor: 
  * La información geográfica con nombres y coordenadas se mantiene en una base de datos (PostgreSQL con PostGIS en el caso de OpenStreetMap)
  * Mediante un programa (mapnik en el caso de OpenStreetMap), esta información se transforma en una capa base conformada por baldosas (tiles) que son imagenes de 256x256 de acuerdo a: (1) nivel de acercamiento o zoom, (2) coordenadadas X y Y en sistema Web Mercator (i.e latitudes entre -180 y 180 y longitudes entre -85.05 y 85.05), (3) estilo de colores, texturas, símbolos, tipografía y ubicación de textos.
  * Pueden generarse otras capas de baldosas con transparencias por superponer a la capa base de manera análoga (sólo que emplean color transparente donde se debe presentar capa base).
* A nivel de cliente en el navegador
  * Se emplea un API o librería Javascript para descargar y superponer las baldosas de la capa base y de las capas superpuestas de acuerdo al nivel de acercamiento y ubicación elegidas por el usuario.
  * De acuerdo a las posibilidades de la librería se superponen otras capas a nivel de cliente o se agregan marcadores o acumulados 
  * El navegador presenta el mapa al usuario y le permite interactuar.
  
Por su filosofia de fuentes abiertas, su caracter colaborativo y por no requerir llaves de autenticación, SIVeL 2 emplea por omisión visualización sobre OpenStreetMap. 

A continuación describimos más detalle de los mapas web con los que se ha implementado visualización de casos.


## Open Street Map

Open Street Map (OSM) es un proyecto que provee: (1) datos geográficos abiertos, (2) posibilidad de editar los mapas mediante diversas herramientas, con un proceso editorial semajante a wikipedia y (3) una red de distribución de contenidos para las baldosas que no requiere registro, llaves, ni pagos para niveles de consulta bajos.
Las dos librerías más populares para desplegar las baldosas de OpenStreetMap son Leaflet y OpenLayers.

El mapa de SIVeL 2 se ha implementado con Leaflet, cuya documentación está en https://leafletjs.com/reference-1.5.0.html y consta de: 

1. La capa de baldosas base estándar de OSM.
2. Un filtro de casos para restringir por Rango de Fechas, Departamento, Presuntos Responsable y Tipo de Violencia, así como un panel que muestra el número casos encontrados.
3. En este mapa también se usa la extensión MarkerClusterer para leaflet que permite visualizar acumulados (clusters) de gran numero de casos que están cercanos entre sí y que se desagrupan o agrupan a medida que el usuario se acerque o se aleje.  Los casos individuales se presentan con marcadores.
4. Al hacer clic en uno de los marcadores (casos) el mapa despliega una ventana de información (infoWindow) al lado derecho, en la que se pueden leer detalles del caso en 3 pestañas.
5. Un control de capas, que permite elegir una capa base y otra superpuestas con transparencias a nivel de baldosas (o servidor).  Por el momento como capa base permite elegir entre: (1) La estándar de OSM, (2) Satelital de ArgGIS y (3) un tema oscura de CartoDB.  Como capa superpuesta permite poner una de transporte público de Openptmap.
6. Un control para agregar peqeñas capas GeoJSON superpuestas a nivel de cliente. Sólo opera con pequeñas capas, del orden de los 100Kb, debido a que el procesamiento de lo que se ve (render) lo realiza parcialmente en el navegador del usuario y con capas grandes lo bloqueará. 
7. Un control para exportar la capa de casos como una capa GeoJSON.

La siguiente imagen ilustra esta implementación: 

![Open Street Maps](https://gitlab.com/pasosdeJesus/sivel2_gen/-/raw/main/doc/img/imagenosm.png)


## Mapbox

Se trata de un servicio comercial que emplea la información geográfica de OpenStreetMap y a nivel de cliente la librería Leaflet (cuyo desarrollo financia).  La implementación en SIVeL 2 fue similar a la de OpenStreetMap, con estas diferencias:
1. Mapbox provee baldosas con diversos estilos, algunos se ven más agradables que OpenStreetMap
2. Provee un buscador de sitios geográficos 
3. Requiere que el usuario se registre y genere una llave, con lo cual Mapbox podrá tarificar y cobrar cuando el nivel de consultas sea alto --para pocas consultas el servicio es gratuito.

La siguiente imagen ilustra esta implementación:

![Mapbox](https://gitlab.com/pasosdeJesus/sivel2_gen/-/raw/main/doc/img/mapa_mapbox.png)

## Google Maps

Es un servicio comercial que emplea información privativa satelital y de mapas.  Para alimentar información geográfica emplea vehículos alrededor del mundo que registran en detalle carreteras, calles en ciudades y fotografías, también recibe contribuciones de voluntarios (pero se convierte en información privada de Google).

La API de Google Maps se documenta en https://developers.google.com/maps/documentation/javascript/tutorial?hl=es . Requiere que quien visualiza los mapas se registre y genere una llave (key), que se empleará para autenticar las peticiones de baldosas y así poder tarificar y realizar cobros de acuerdo al nivel de consulta  --para pocas consultas el servicio es gratuito.  
La implementación en SIVeL 2 (heredada de la implementación en SIVeL 1) se compone de:
1. Presentación de la capa base con las posibles baldosas (tile) de Google (satelital o mapa).
2. Un filtro de casos para restringirlos por Rango de Fechas, Departamento, Presunto Responsable y Tipo de Violencia.
3. Se usa la librería MarkerClusterer para visualizar acumulados (clusters) de gran numero de casos que esan cercanos entre sí, aunque los casos individuales se presentan con marcadores (ícono de bandera).
4. Al pulsar sobre un marcador (casos) se despliega como ayuda emergente una ventana con 3 pestañas con la información del caso. 

La siguiente imagen ilustra esta implementación:

![Google maps](https://gitlab.com/pasosdeJesus/sivel2_gen/-/raw/main/doc/img/imagengm.png)
