// Mapa de casos sobre OpenStreetMap
// Desarrollo inicial de Luis Alejandro Cruz luisalejo@unicauca.edu.co
// Financiado por CINEP/PPP con recursos de la Universidad de Sheffield
// Cedido al dominio publico de acuerdo a la legislacion colombiana

var marcadores;
var mapa;
var baldosasOsm;
var controlCapas;
var usuario_aut_global;

function filtrar_adicionales(){
  return [];
}
function agregarFuncionesExternasMapaosm(){
  return null
}

function leerCapasSuperpuestas(){
  var capasSuperpuestas= {
    "Transporte (OpenPtmap)" : L.tileLayer('http://www.openptmap.org/tiles/{z}/{x}/{y}.png'),
  };
  return capasSuperpuestas
}

function presentarMapaOsm(usuario_autenticado) {
  usuario_aut_global = usuario_autenticado
  // Borrar clase container y ocultar pie de página
  $('.navbar').addClass('navbarosm');
  $('.card-body').addClass('cardbodyosm');
  $('.card').addClass('cardosm');
  $('.page-header').remove();
  $('.container').addClass('divcontenido');
  $('#div_contenido').css({'position': 'relative'});
  $('#div_contenido').removeClass("container");
  $('.divcontenido').removeClass("container");
  $('.divcontenido').removeClass("master-container");
  $('#div_contenido').addClass("container-fluid");
  $('#pie_pagina').css({'display': 'none'});

  // Creación de mapa y sus capas
  baldosasOsm = L.tileLayer(
    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; Contribuyentes de ' +
      '<a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  });

  var filtro = L.control({position: 'topleft'});
  filtro.onAdd = function (mapa) {
    this._div = L.DomUtil.get('filtro-osm');
    return this._div;
  };

  var capasBase= {
    //  "Mapbox" : mapboxTiles,
    "OpenStreetMap" : baldosasOsm,
    "Satelite (ArcGIS)": L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'),
    "Oscuro (CartoDB)" : L.tileLayer('https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png')

  };
  
  controlCapas = L.control.layers(capasBase, leerCapasSuperpuestas(), 
    {position: 'topleft'});

  if (typeof window.formato_fecha == 'undefined') {
    msip_prepara_eventos_comunes(window)
  }

  //carga  funciones externas implementadas en otras aplicacion que usan este
  //mapa
  agregarFuncionesExternasMapaosm()
  if (L.DomUtil.get('agrega-capa') != null && 
    L.DomUtil.get('descarga-capa') != null) {
    // Con Mapbox sería: mapa = L.mapbox.map('mapa-osm', null, {zoomControl: false, minZoom: 2})
    var descargamapaBtn = L.control({position:'bottomleft'});
    descargamapaBtn.onAdd = function (mapa){
      this._div = L.DomUtil.get('descarga-mapa');
      return this._div;
    };

    var agregaCapaBtn = L.control({position: 'bottomleft'});
    agregaCapaBtn.onAdd = function (mapa) {
      this._div = L.DomUtil.get('agregaCapa');
      return this._div;
    };

    mapa = L.map('mapa-osm', {zoomControl: false, minZoom: 2})
      //  .addLayer(mapboxTiles) seria con Mapbox
      .addLayer(baldosasOsm)
      .addControl(filtro)
      .addControl(L.control.zoom({position:'topleft'}))
      .setView([Sivel2GenMotorEs6.MapaOSMLatInicial, 
        Sivel2GenMotorEs6.MapaOSMLongInicial], 6)
      .addControl(controlCapas)
      .addControl(agregaCapaBtn)
      .addControl(descargamapaBtn);
  } else {
    mapa = L.map('mapa-osm', {zoomControl: false, minZoom: 2})
      .addLayer(baldosasOsm)
      .addControl(filtro)
      .addControl(L.control.zoom({position:'topleft'}))
      .setView([Sivel2GenMotorEs6.MapaOSMLatInicial, 
        Sivel2GenMotorEs6.MapaOSMLongInicial], 6)
      .addControl(controlCapas);
  }

  L.control.scale({imperial: false}).addTo(mapa);
  
  //Crea los cúmulos de casos y agrega casos
  marcadores = L.markerClusterGroup(); 
  window.setTimeout(agregarCasosOsm(usuario_autenticado), 0);

  // Cierra el info al acercar/alejar
  mapa.on('zoom', function() {
    if (info != undefined) {
      info.remove(mapa);
    }
  });
}

function mostrarCargador() {
  $('#cargador').show();
}

function ocultarCargador() {
  $('#cargador').hide();
}

function descargarUrl(url, retrollamada) {
  var request = window.ActiveXobject ?
    new ActiveXObject('Microsoft.XMLHTTP') : new XMLHttpRequest;
  request.onreadystatechange = function() {
    if (request.readyState == 4) {
      retrollamada(request);
    }
  };
  request.open('GET', url, true);
  request.send(null);
}

// Construye URL para consulta agregando el punto de montaje antes de
// ruta_sin_puntomontaje y los filtros acordes a lo elegido a continuación
function armarRutaConsulta(rutaSinPuntomontaje, usuarioAutenticado) {
  var ruta = window.puntomontaje + rutaSinPuntomontaje
  var desde = $('#campo-desde').val()
  var desdep = msip_partes_fecha_localizada(desde, window.formato_fecha)
  var hasta = $('#campo-hasta').val();
  var hastap = msip_partes_fecha_localizada(hasta, window.formato_fecha)
  var departamento = $('#departamento').val()
  var prresp = $('#presponsable').val()
  var tvio = $('#tvio').val();
  fechainicial = Date.parse(desdep[0]+'-'+desdep[1]+'-'+desdep[2]);
  fechafinal = Date.parse(hastap[0]+'-'+hastap[1]+'-'+hastap[2]);
  if ( +fechainicial > +fechafinal) {
    alert("La fecha Final debe ser mas antigua que la inicial");
    window.location.reload();
    return
  } 
  var urlSolicitud = ruta + '?filtro[q]='+
    '&filtro[fechaini]='+ desde +
    '&filtro[fechafin]='+ hasta
  if (departamento != undefined && departamento != 0){
    urlSolicitud += '&filtro[departamento_id]=' + departamento;
  }
  if (prresp != undefined && prresp != 0){
    urlSolicitud += '&filtro[presponsable_id]=' + prresp;
  }
  if (tvio != undefined && tvio != 0){
    urlSolicitud += '&filtro[categoria_id]=' + tvio;
  }
  filtros_adicionales = filtrar_adicionales(usuarioAutenticado);
  for(var fi in filtros_adicionales){
    urlSolicitud += filtros_adicionales[fi];
  }
  urlSolicitud += '&filtro[inc_fecha]=1&filtro[inc_ubicaciones]=2'+
    '&filtro[disgenera]=reprevista.json' +
    '&idplantilla=reprevista' +
    '&commit=Enviar';
  return urlSolicitud;
}


function agregarCasosOsm(usuario_autenticado) {
  if (typeof window.formato_fecha == 'undefined') {
    msip_prepara_eventos_comunes(window)
  }
  urlSolicitud = armarRutaConsulta('casos.json', usuario_autenticado) 
  mostrarCargador();
  descargarUrl(urlSolicitud, function(req) {
    var data = req.responseText;
    if (data == null || data.substr(0, 1) != '{'){
      ocultarCargador();
      $('#nrcasos').html("0");
      window.alert("El URL" + urlSolicitud + "no retorno informacion JSON.\n\n" + data);
      return;
    }
    var listaMarcadores = []
    var o = jQuery.parseJSON(data);
    var numResultados = 0;
    for(var codigo in o) {
      var lat = o[codigo].latitud;
      var lng = o[codigo].longitud;
      if (lat == null || lat == '' || lat == 'NaN') {
        continue;
      }
      if (lng == null || lng == '' || lng == 'NaN') {
        continue;
      }
      latf = parseFloat(lat);
      lngf = parseFloat(lng);
      numResultados++;
      var punto = new L.LatLng(latf, lngf);
      listaMarcadores.push (creaMarcador(punto, codigo));
    }
    marcadores.addLayers(listaMarcadores);
    mapa.addLayer(marcadores);
    $('#nrcasos').html(numResultados + ' Casos mostrados');
    ocultarCargador();
  });
}


function creaMarcador(punto, codigo, titulo) {
  // Exportar los casos a formato GeoJson
  var marcadorCaso = new L.Marker(punto)

  //Acción al hacer clic en caso en el mapa
  marcadorCaso.on('click', clicMarcadorCaso);
  function clicMarcadorCaso() {
    mostrarCargador();
    msip_arregla_puntomontaje(window);
    var ruta = window.puntomontaje + 'casos/';
    var urlSolicitud = ruta + codigo + ".json";  
    descargarUrl(urlSolicitud, function(req) {
      data = req.responseText;
      if (data == null || data.substr(0, 1) != '{') {
        ocultarCargador();
        window.alert("El URL " + urlSolicitud +
          " no retorno detalles del caso\n " + data);
        return;
      }
      var o = jQuery.parseJSON(data);
      var id = (typeof o['caso'].id != 'undefined') ? o['caso'].id : -1;
      var titulo = (typeof o['caso'].titulo != 'undefined') ? 
        o['caso'].titulo : '';
      var hechos = (typeof o['caso'].hechos != 'undefined') ? 
        o['caso'].hechos : '--';
      var fecha = o['caso'].fecha; 
      var hora = o['caso'].hora; 
      var departamento = o['caso'].departamento; 
      var municipio = o['caso'].municipio; 
      var centro_poblado = o['caso'].centro_poblado;
      var lugar = o['caso'].lugar;
      var victimas = o['caso'].victimas;
      var prresp = o['caso'].presponsables;
      var descripcionCont = '<div>' +
        '<h3>' + titulo + '</h3>' + '</div>' + '<div>' + hechos + '</div>';
      var hechosCont = '<div><table>';
      hechosCont += ((typeof fecha != 'undefined') && fecha != "") ? 
        '<tr><td>Fecha:</td><td>' + fecha + '</td></tr>' : '';
      hechosCont += ((typeof hora != 'undefined') && hora != "") ? 
        '<tr><td>Hora:</td><td>' + hora + '</td></tr>' : '';
      hechosCont += ((typeof departamento != 'undefined') && 
        departamento != "") ?  '<tr><td>Departamento:</td><td>' +
        departamento + '</td></tr>' : '';
      hechosCont += ((typeof municipio != 'undefined') && 
        municipio != "") ?  '<tr><td>Municipio:</td><td>' +
        municipio + '</td></tr>' : '';
      hechosCont += ((typeof centro_poblado != 'undefined') && 
        centro_poblado != "") ?  '<tr><td>Centro Poblado:</td><td>' +
        centro_poblado + '</td></tr>' : '';
      hechosCont += ((typeof lugar != 'undefined') && 
        lugar != "") ?  '<tr><td>Vereda:</td><td>' +
        lugar + '</td></tr>' : '';
      hechosCont += ((typeof codigo != 'undefined') && codigo != "") ? 
        '<tr><td>Codigo:</td><td>' + codigo + '</td></tr>' : '';
      hechosCont += '</table></div>';
      var victimasCont = obtener_info_victimas(victimas, prresp, o['caso']);
      capaInfo(descripcionCont, hechosCont, victimasCont);
      ocultarCargador();
    });
  }

  return marcadorCaso;
}

function obtener_info_victimas(victimas, prresp, caso){
  var victimasCont = '<div><table>' +
  '<tr><td>Victimas:</td><td>';
  for(var cv in victimas) {
    var victima = victimas[cv];
    victimasCont += ((typeof victima != 'undefined') && 
      victima != "") ? victima + '<br />' : 'SIN INFORMACIÓN';
  }
  victimasCont += '</td></tr><tr>' +
    '<td>Presuntos Responsables:</td><td>';
  for(var cp in prresp) {
    var prrespel = prresp[cp];
    victimasCont += ((typeof prrespel != 'undefined') && prrespel != "") ? 
      prrespel + '<br />' : 'SIN INFORMACIÓN';
  }
  victimasCont += '</td></tr></table></div>';
  return victimasCont
}


// Variable global donde se carga la capa flotante
var info;
// Capa flotante donde se muestra información al pulsar un marcador
function capaInfo(des, hec, vic){
  if (info != undefined) { // si ya tenia información se quita primero
    info.remove(mapa); 
  }
  info = L.control();
  info.onAdd = function (mapa) {
    this._div = L.DomUtil.create('div', 'info card');
    this.update(des, hec, vic);
    return this._div;
  };
  info.update = function (des, hec, vic) {
    this._div.innerHTML = 
    ' <div id="infow" class="card-body">' +
      ' <nav>' +
        ' <div class="nav nav-tabs" id="nav-tab" role="tablist">' +
          ' <button class="nav-link active" id="infodes-tab" data-bs-toggle="tab" data-bs-target="#infodes" type="button" role="tab" aria-controls="infodes" aria-selected="true">Descripción</button>' +
          ' <button class="nav-link" id="infodatos-tab" data-bs-toggle="tab" data-bs-target="#infodatos" type="button" role="tab" aria-controls="infodatos" aria-selected="false">Datos</button>' +
          ' <button class="nav-link" id="infovictima-tab" data-bs-toggle="tab" data-bs-target="#infovictima" type="button" role="tab" aria-controls="infovictima" aria-selected="false">Víctimas</button>' +
          ' <button id="boton-cerrar" type="button" class="btn-close close position-absolute top-0 end-0" aria-label="Close"></button>' +
        ' </div>' +
      ' </nav>' +
          ' <div class="tab-content" id="nav-tabContent">' +
            ' <div class="tab-pane fade show active panel-infomapa" id="infodes" role="tabpanel" aria-labelledby="infodes-tab">'+ des +'</div>' +
            ' <div class="tab-pane fade panel-infomapa" id="infodatos" role="tabpanel" aria-labelledby="infodatos-tab">'+ hec +'</div>' +
             ' <div class="tab-pane fade panel-infomapa" id="infovictima" role="tabpanel" aria-labelledby="infovictima-tab">'+ vic +'</div>' +
          ' </div>' +
    '</div>'
    ;
  };
  info.addTo(mapa);
}

// Cierra la capa flotante desde el boton cerrar
$(document).on('click','#boton-cerrar', function() {
  if (info != undefined) {
    info.remove(mapa);
  }
});

// Cierra la capa flotante desde el boton cerrar
$(document).on('click','#boton-cerrar-ag-capa', function() {
  if (agregaCapaDiv != undefined) {
    agregaCapaDiv.remove(mapa);
  }
});

//Limpia el mapa de casos cada que se filtra
$(document).on('click', '#agregar-casos-osm', function(){
  marcadores.clearLayers(); 
  agregarCasosOsm(usuario_aut_global);
});


//Descargar capa de casos
$(document).on('click', '#descargar-mapa', function() {
  var geojson = marcadores.toGeoJSON();
  var dataStr = "data:text/json;charset=utf-8," + 
    encodeURIComponent(JSON.stringify(geojson));
  var descargaGeo = document.getElementById('enlace-descarga');
  descargaGeo.setAttribute("href",     dataStr     );
  descargaGeo.setAttribute("download", "casos.geojson");
});

//Funciones de agregar supercapas
$(document).on('click', '#agregar-capa', function(){
  agregarCapa();
  var contenidoGeoJson;

  // Función que sube la capa del usuario
  document.getElementById('archivoGeo').addEventListener(
    'change', leerArchivo, false);
  function leerArchivo(e){
    var archivo = e.target.files[0];
    if (!archivo) {
      return;
    }
    var lector = new FileReader();
    lector.onload = function(e) {
      contenidoGeoJson = e.target.result;
    };
    lector.readAsText(archivo);
  }
  $('#subirCapa').on('click', function(){
    nombreCapanueva = $('#nombreCapaNueva').val();
    var geoJsonReconocido = jQuery.parseJSON(contenidoGeoJson);
    var capaGeoJson = L.geoJSON(geoJsonReconocido);
    mapa.addLayer(capaGeoJson);
    controlCapas.addOverlay(capaGeoJson, nombreCapanueva);
    agregaCapaDiv.remove(mapa);
    alert("Capa agregada con éxito");
  });
});

// Botón agregar capas
var agregaCapaDiv;
function agregarCapa() {
  if (agregaCapaDiv != undefined) { // si había información se elimina
    agregaCapaDiv.remove(mapa); 
  }
  agregaCapaDiv = L.control();
  agregaCapaDiv.onAdd = function (mapa) {
    this._div = L.DomUtil.create('div', 'agregaCapaDiv');
    this.updateAgregaCapaDiv();
    return this._div;
  };

  agregaCapaDiv.updateAgregaCapaDiv = function () {
    this._div.innerHTML = '<div class="card border-primary"> ' +
      '<div class="card-body">' +
      '<button type="button" id="boton-cerrar-ag-capa" class="close" aria-label="Close">' +
      '<span aria-hidden="true">&times;</span></button>' +
      '<h5>Agregar capa al mapa</h5>' +
      '<input id="nombreCapaNueva" class="form-group form-control campo-subir" type="text" placeholder="Nombre de la Capa">' +
      '<div class="form-group custom-file campo-subir">' +
      '<input id="archivoGeo" type="file" class="custom-file-input" id="customFileLang" lang="es">' +
      '<label class="custom-file-label" for="customFileLang">Seleccionar archivo GeoJSON</label></div>' +
      '<button id="subirCapa" class="form-group btn btn-primary">Subir</button></div></div>';
  };
  agregaCapaDiv.addTo(mapa);
}
