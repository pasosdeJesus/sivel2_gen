import { Controller } from "@hotwired/stimulus"

import Msip__Motor from "../msip/motor"


export default class extends Controller {

  connect() {
    console.log("Conexion de controlador Mapa osm");
    const usuarioAutenticado = this.data.get("usuarioAutenticado") === 'true';
    if (!this.constructor.marcadores) {
      this.constructor.marcadores = L.markerClusterGroup();
    }
    if (!this.constructor.mapa) {
      this.constructor.mapa = L.map('mapa-osm',
        {
          zoomControl:
          false,
          minZoom:
          2
        })
      this.constructor.mapa.on('zoomend', this.onMapZoom.bind(this));
    }
    if (!this.constructor.baldosasOsm) {
      this.constructor.baldosasOsm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        {
          attribution:'&copy; Contribuyentes de' +
          '<a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        });
    }
    if (!this.constructor.info) {
      this.constructor.info = L.control();
    }
    if (!this.constructor.agregaCapaDiv) {
      this.constructor.agregaCapaDiv = L.control();
    }
    if (!this.constructor.controlCapas) {
      var capasBase =
        {
          "OpenStreetMap": this.constructor.baldosasOsm,
          "Satelite (ArcGIS)":
          L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'),
          "Oscuro (CartoDB)":
          L.tileLayer('https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png')
        };

      this.constructor.controlCapas =
        L.control.layers(capasBase,
          this.leerCapasSuperpuestas(),
          {
            position:
            'topleft'
          });
    }
    this.presentarMapaOsm(usuarioAutenticado);
  }

  filtrar(){
    this.constructor.marcadores.clearLayers();
    var usuario_aut_global = true;
    this.agregarCasosOsm(usuario_aut_global);
  }

  filtrar_adicionales() {
    return [];
  }

  agregarFuncionesExternasMapaosm() {
    return null;
  }

  leerCapasSuperpuestas() {
    var capasSuperpuestas = {
      "Transporte (OpenPtmap)": L.tileLayer('http://www.openptmap.org/tiles/{z}/{x}/{y}.png'),
    };
    return capasSuperpuestas;
  }

  presentarMapaOsm(usuario_autenticado) {
    var usuario_aut_global = usuario_autenticado;
    // Borrar clase container y ocultar pie de página
    document.querySelector('.navbar').classList.add('navbarosm');
    document.querySelector('.card-body').classList.add('cardbodyosm');
    document.querySelector('.card').classList.add('cardosm');

    var pageHeader = document.querySelector('.page-header');
    if (pageHeader) {
      pageHeader.remove();
    }

    var container = document.querySelector('.container');
    if (container) {
      container.classList.add('divcontenido');
      container.classList.remove('container');
    }

    var divContenido = document.getElementById('div_contenido');
    if (divContenido) {
      divContenido.style.position = 'relative';
      divContenido.classList.remove('container');
      divContenido.classList.add('container-fluid');
    }

    var piePagina =document.getElementById('pie_pagina');
    if (piePagina) {
      piePagina.style.display
        = 'none';
    }

    var filtro = L.control({
      position: 'topleft'
    });
    filtro.onAdd = function(mapa){
      this._div = document.getElementById('filtro-osm');
      return this._div;
    };

    //Carga funciones externas implementadas en otras aplicaciones que usan este mapa
    this.agregarFuncionesExternasMapaosm();
    if (document.getElementById('agrega-capa')
      !==
      null
      &&
      document.getElementById('descarga-capa')
      !==
      null)
    {
      var descargamapaBtn =L.control({
        position:
        'bottomleft'
      });
      descargamapaBtn.onAdd = function(mapa){
        this._div = document.getElementById('descarga-mapa');
        return this._div;
      };

      var agregaCapaBtn = L.control({
        position:
        'bottomleft'
      });
      agregaCapaBtn.onAdd = function(mapa)
      {
        this._div = document.getElementById('agregaCapa');
        return this._div;
      };

      this.constructor.mapa.addLayer(this.constructor.baldosasOsm)
        .addControl(filtro)
        .addControl(L.control.zoom({
          position:
          'topleft'
        }))
        .setView(["4.6682", "-74.071"],
          6)
        .addControl(this.constructor.controlCapas)
        .addControl(agregaCapaBtn)
        .addControl(descargamapaBtn);
    }
    else
    {
      this.constructor.mapa.addLayer(this.constructor.baldosasOsm)
        .addControl(filtro)
        .addControl(L.control.zoom({
          position:
          'topleft'
        }))
        .setView(["4.6682", "-74.071"], 6)
        .addControl(this.constructor.controlCapas);
    }

    L.control.scale({
      imperial:
      false
    }).addTo(this.constructor.mapa);

    window.setTimeout(() =>
      this.agregarCasosOsm(usuario_autenticado),
      0);
  }

  onMapZoom() {
    this.constructor.info.remove(this.constructor.mapa);
    this.constructor.agregaCapaDiv.remove(this.constructor.mapa);
  }

  mostrarCargador() {
    document.getElementById('cargador').style.display = 'block';
  }

  ocultarCargador() {
    document.getElementById('cargador').style.display = 'none';
  }

  descargarUrl(url, retrollamada) {
    var request = window.ActiveXobject ?
      new ActiveXObject('Microsoft.XMLHTTP') : new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState === 4) {
        retrollamada(request);
      }
    };
    request.open('GET', url, true);
    request.send(null);
  }

  // Construye URL para consulta agregando el punto de montaje antes de
  // // ruta_sin_puntomontaje y los filtros acordes a lo elegido a continuación

  armarRutaConsulta(rutaSinPuntomontaje, usuarioAutenticado) {
    var ruta = window.puntomontaje + rutaSinPuntomontaje;
    var desde = document.getElementById('campo-desde').value;
    var hasta = document.getElementById('campo-hasta').value;
    var departamento = document.getElementById('departamento').value;
    var prresp = document.getElementById('presponsable').value;
    var tvio = document.getElementById('tvio').value;
    var fechainicial = Date.parse(desde);
    var fechafinal = Date.parse(hasta);
    if (+fechainicial > +fechafinal) {
      alert("La fecha Final debe ser más antigua que la inicial");
      window.location.reload();
      return;
    }
    var urlSolicitud = ruta + '?filtro[q]=' +
      '&filtro[fechaini]=' + desde +
      '&filtro[fechafin]=' + hasta;
    if (departamento !== undefined && departamento !== '0') {
      urlSolicitud += '&filtro[departamento_id]=' + departamento;
    }
    if (prresp !== undefined && prresp !== '0') {
      urlSolicitud += '&filtro[presponsable_id]=' + prresp;
    }
    if (tvio !== undefined && tvio !== '0') {
      urlSolicitud += '&filtro[categoria_id]=' + tvio;
    }
    var filtros_adicionales = this.filtrar_adicionales(usuarioAutenticado);
    for (var fi in filtros_adicionales) {
      if (filtros_adicionales.hasOwnProperty(fi)) {
        urlSolicitud += filtros_adicionales[fi];
      }
    }
    urlSolicitud += '&filtro[inc_fecha]=1&filtro[inc_ubicaciones]=2' +
      '&filtro[disgenera]=reprevista.json' +
      '&idplantilla=reprevista' +
      '&commit=Enviar';
    return urlSolicitud;
  }

  agregarCasosOsm(usuario_autenticado) {
    if (typeof window.formato_fecha === 'undefined') {
      Msip__Mootr.preparaEventosComunes(window);
    }
    var urlSolicitud = this.armarRutaConsulta('casos.json', usuario_autenticado);
    this.mostrarCargador();
    const self = this;
    this.descargarUrl(urlSolicitud, function(req) {
      var data = req.responseText;
      if (data === null || data.charAt(0) !== '{') {
        document.getElementById('cargador').style.display = 'none';
        document.getElementById('nrcasos').innerHTML = "0";
        window.alert("El URL " + urlSolicitud + " no retornó información JSON.\n\n" + data);
        return;
      }
      var listaMarcadores = [];
      var o = JSON.parse(data);
      var numResultados = 0;
      for (var codigo in o) {
        if (o.hasOwnProperty(codigo)) {
          var lat = o[codigo].latitud;
          var lng = o[codigo].longitud;
          if (!lat || lat === 'NaN' || !lng || lng === 'NaN') {
            continue;
          }
          var latf = parseFloat(lat);
          var lngf = parseFloat(lng);
          numResultados++;
          var punto = new L.LatLng(latf, lngf);
          listaMarcadores.push(self.creaMarcador(punto, codigo));
        }
      }
      //Crea los cúmulos de casos y agrega casos
      self.constructor.marcadores.addLayers(listaMarcadores);
      self.constructor.mapa.addLayer(self.constructor.marcadores);
      document.getElementById('nrcasos').innerHTML = numResultados + ' Casos mostrados';
      self.ocultarCargador();
    });
  }

  creaMarcador(punto, codigo, titulo) {
    // Exportar los casos a formato GeoJson
    var marcadorCaso = new L.Marker(punto);
    // Acción al hacer clic en caso en el mapa
    marcadorCaso.on('click', clicMarcadorCaso);
    const self = this;
    function clicMarcadorCaso() {
      self.mostrarCargador();
      Msip__Motor.arreglarPuntomontaje(window);
      var ruta = window.puntomontaje + 'casos/';
      var urlSolicitud = ruta + codigo + ".json";  
      self.descargarUrl(urlSolicitud, function(req) {
        var data = req.responseText;
        if (data == null || data.substr(0, 1) != '{') {
          document.getElementById('cargador').style.display = 'none';
          window.alert("El URL " + urlSolicitud + " no retornó detalles del caso\n " + data);
          return;
        }
        var o = JSON.parse(data);
        var id = (typeof o['caso'].id != 'undefined') ? o['caso'].id : -1;
        var titulo = (typeof o['caso'].titulo != 'undefined') ? o['caso'].titulo : '';
        var hechos = (typeof o['caso'].hechos != 'undefined') ? o['caso'].hechos : '--';
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
        hechosCont += ((typeof departamento != 'undefined') && departamento != "") ? 
          '<tr><td>Departamento:</td><td>' + departamento + '</td></tr>' : '';
        hechosCont += ((typeof municipio != 'undefined') && municipio != "") ? 
          '<tr><td>Municipio:</td><td>' + municipio + '</td></tr>' : '';
        hechosCont += ((typeof centro_poblado != 'undefined') && centro_poblado != "") ? 
          '<tr><td>Centro Poblado:</td><td>' + centro_poblado + '</td></tr>' : '';
        hechosCont += ((typeof lugar != 'undefined') && lugar != "") ? 
          '<tr><td>Vereda:</td><td>' + lugar + '</td></tr>' : '';
        hechosCont += ((typeof codigo != 'undefined') && codigo != "") ? 
          '<tr><td>Código:</td><td>' + codigo + '</td></tr>' : '';
        hechosCont += '</table></div>';
        var victimasCont = self.obtener_info_victimas(victimas, prresp, o['caso']);
        self.capaInfo(descripcionCont, hechosCont, victimasCont);
        self.ocultarCargador();
      });
    }
    return marcadorCaso;
  }

  obtener_info_victimas(victimas, prresp, caso) {
    var victimasCont = '<div><table>' +
      '<tr><td>Víctimas:</td><td>';
    for (var cv in victimas) {
      if (victimas.hasOwnProperty(cv)) {
        var victima = victimas[cv];
        victimasCont += ((typeof victima != 'undefined') && victima != "") ? victima + '<br />' : 'SIN INFORMACIÓN';
      }
    }
    victimasCont += '</td></tr><tr>' +
      '<td>Presuntos Responsables:</td><td>';
    for (var cp in prresp) {
      if (prresp.hasOwnProperty(cp)) {
        var prrespel = prresp[cp];
        victimasCont += ((typeof prrespel != 'undefined') && prrespel != "") ? prrespel + '<br />' : 'SIN INFORMACIÓN';
      }
    }
    victimasCont += '</td></tr></table></div>';
    return victimasCont;
  }

  // Variable global donde se carga la capa flotante
  // Capa flotante donde se muestra información al pulsar un marcador

  capaInfo(des, hec, vic) {
    if (this.constructor.info != undefined) { // si ya tenía información se quita primero
      this.constructor.info.remove(this.constructor.mapa); 
    }
    this.constructor.info.onAdd = function (mapa) {
      this._div = L.DomUtil.create('div', 'info card');
      this.update(des, hec, vic);
      return this._div;
    };
    this.constructor.info.update = function (des, hec, vic) {
      this._div.innerHTML = 
        ' <div id="infow" class="card-body">' +
        ' <nav>' +
        ' <div class="nav nav-tabs" id="nav-tab" role="tablist">' +
        ' <button class="nav-link active" id="infodes-tab" data-bs-toggle="tab" data-bs-target="#infodes" type="button" role="tab" aria-controls="infodes" aria-selected="true">Descripción</button>' +
        ' <button class="nav-link" id="infodatos-tab" data-bs-toggle="tab" data-bs-target="#infodatos" type="button" role="tab" aria-controls="infodatos" aria-selected="false">Datos</button>' +
        ' <button class="nav-link" id="infovictima-tab" data-bs-toggle="tab" data-bs-target="#infovictima" type="button" role="tab" aria-controls="infovictima" aria-selected="false">Víctimas</button>' +
        ' <button id="boton-cerrar" type="button" data-action="click->sivel2-gen--mapaosm#cerrarinfo"  class="btn-close close position-absolute top-0 end-0" aria-label="Close"></button>' +
        ' </div>' +
        ' </nav>' +
        ' <div class="tab-content" id="nav-tabContent">' +
        ' <div class="tab-pane fade show active panel-infomapa" id="infodes" role="tabpanel" aria-labelledby="infodes-tab">' + des + '</div>' +
        ' <div class="tab-pane fade panel-infomapa" id="infodatos" role="tabpanel" aria-labelledby="infodatos-tab">' + hec + '</div>' +
        ' <div class="tab-pane fade panel-infomapa" id="infovictima" role="tabpanel" aria-labelledby="infovictima-tab">' + vic + '</div>' +
        ' </div>' +
        '</div>';
    };
    this.constructor.info.addTo(this.constructor.mapa);
  }

  // Cierra la capa flotante desde el botón cerrar

  cerrarinfo(){
    if (this.constructor.info != undefined) {
      this.constructor.info.remove(this.constructor.mapa);
    }
  }


  // Descargar capa de casos

  descargarCapaCasos() {
    var geojson = this.constructor.marcadores.toGeoJSON();
    var dataStr = "data:text/json;charset=utf-8," + 
      encodeURIComponent(JSON.stringify(geojson));
    var descargaGeo = document.getElementById('enlace-descarga');
    descargaGeo.setAttribute("href", dataStr);
    descargaGeo.setAttribute("download", "casos.geojson");
  };

  // Funciones de agregar supercapas


  agregarCapaGeojson() {
    this.agregarCapa();
    var contenidoGeoJson;
    document.getElementById('archivoGeo').addEventListener('change', leerArchivo, false);
    function leerArchivo(e) {
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
    document.getElementById('subirCapa').addEventListener('click', function() {
      var nombreCapanueva = document.getElementById('nombreCapaNueva').value;
      var geoJsonReconocido = JSON.parse(contenidoGeoJson);
      var capaGeoJson = L.geoJSON(geoJsonReconocido);
      this.constructor.mapa.addLayer(capaGeoJson);
      this.constructor.controlCapas.addOverlay(capaGeoJson, nombreCapanueva);
      this.constructor.agregaCapaDiv.remove(this.constructor.mapa);
      alert("Capa agregada con éxito");
    });
  };


  // Botón agregar capas

  agregarCapa() {
    if (this.constructor.agregaCapaDiv != undefined) { // si había información se elimina
      this.constructor.agregaCapaDiv.remove(this.constructor.mapa);
    }
    this.constructor.agregaCapaDiv.onAdd = function(mapa) {
      this._div = L.DomUtil.create('div', 'agregaCapaDiv');
      this.updateAgregaCapaDiv();
      return this._div;
    };

    this.constructor.agregaCapaDiv.updateAgregaCapaDiv = function() {
      this._div.innerHTML = '<div class="card border-primary"> ' +
        '<div class="card-body">' +
        '<button type="button" id="boton-cerrar-ag-capa" data-action="sivel2-gen--mapaosm#cierraCapaDiv"  class="close" aria-label="Close">' +
        '<span aria-hidden="true">&times;</span></button>' +
        '<h5>Agregar capa al mapa</h5>' +
        '<input id="nombreCapaNueva" class="form-group form-control campo-subir" type="text" placeholder="Nombre de la Capa">' +
        '<div class="form-group custom-file campo-subir">' +
        '<input id="archivoGeo" type="file" class="custom-file-input" id="customFileLang" lang="es">' +
        '<label class="custom-file-label" for="customFileLang">Seleccionar archivo GeoJSON</label></div>' +
        '<button id="subirCapa" class="form-group btn btn-primary">Subir</button></div></div>';
    };
    this.constructor.agregaCapaDiv.addTo(this.constructor.mapa);
  }

  // Cierra la capa flotante desde el botón cerrar de agregar capa
  cierraCapaDiv(){
    if (this.constructor.agregaCapaDiv != undefined) {
      this.constructor.agregaCapaDiv.remove(this.constructor.mapa);
    }
  };

}
