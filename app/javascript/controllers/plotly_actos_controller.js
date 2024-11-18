import { Controller } from "@hotwired/stimulus"
// Calcula edad, edadactual y rango dada fecha de nacimiento o viceversa

import Msip__Motor from "../msip/motor"
//DATOS DEL CSV REORGANIZADOS
var datosr = {} // Reorganiza datos de CSV en este diccionario cuyas
// llaves son fechas donde hay datos, el valor en cada fecha es
// un diccioneario indexado por las categorias de la variable y 
// el valor en cada una es la suma de cuenta por categoria
var datosrFechamin; // Fecha minima en CSV
var datosrFechamax; // Fecha máxima en CSV
var datosrEtiquetas = []  // Etiquetas o categorias posibles en CSV para la variable


// DATOS PRESENTADOS
// Las siguientes dependen de las selecciones del usuario en el filtro
var ejex = []  // Valores en eje x
var seriesEjey = {} // Series posibles en eje y indexadas por etiquetas

// DATOS PRESENTADOS COMO LOS REQUIERE PLOTLY
var trazosPresentados = [] // de plotly llenados por actualiarTrazosPresentados
var totalesEtiqueta = {} // Totales por etiqueta

// Lee CSV, reorganiza los datos, prepara campos de filtro
// Prepara series y presenta datos
// Activa eventos ante cambios en campos de filtro que repintan lo necesario
function procesar_datos(filas, variable) {

  var contenedorFiltros = document.querySelector('.filtros'),
    selectorCategoria= contenedorFiltros.querySelector('#presponsable'),
    campoFechaini = contenedorFiltros.querySelector('#fechaini'),
    campoFechafin = contenedorFiltros.querySelector('#fechafin')
  ;

  var dicEtiquetas = {}
  filas.forEach(function(r) {
    dicEtiquetas[r[variable]] = 0
    if (typeof datosr[r.fecha] == 'undefined') {
      datosr[r.fecha] = {}
      if (typeof datosrFechamin == 'undefined' || r.fecha < datosrFechamin) {
        datosrFechamin = r.fecha
      }
      if (typeof datosrFechamax == 'undefined' || r.fecha > datosrFechamax) {
        datosrFechamax = r.fecha
      }
    }
    if (typeof datosr[r.fecha][r[variable]] == 'undefined') {
      datosr[r.fecha][r[variable]] = +r.cuenta
    } else {
      datosr[r.fecha][r[variable]] += +r.cuenta
    }
  })

  datosrEtiquetas = Object.keys(dicEtiquetas)
  seleccionmAsignarOpciones(selectorCategoria, datosrEtiquetas, true);

  function saneaFechaEstandar(fecha) {
    if (/^[0-9][0-9][0-9][0-9]-[0-9][0-9]?-[0-9][0-9]?$/.test(fecha)) {
      return fecha
    } else {
      return "";
    }
  }

  var fechaminLoc = saneaFechaEstandar(datosrFechamin)

  campoFechaini.value = saneaFechaEstandar(datosrFechamin)

  campoFechafin.value = saneaFechaEstandar(datosrFechamax)


  /*var colores = {
     'F': 'rgb(219, 64, 82)',
    'M': 'rgb(64, 219, 82)',
    'S': 'rgb(64, 82, 219)'
  } */

  function actualizarGraficaFechas() {
    var opelegidas = seleccionmOpcionesElegidas(selectorCategoria)
    var fechaini = campoFechaini.value
    var fechafin = campoFechafin.value
    recalcularSeriesPresentadas(fechaini, fechafin, opelegidas);
  }


  function actualizarGraficaEtiquetas(){
    var opelegidas = seleccionmOpcionesElegidas(selectorCategoria)
    actualizarTrazosPresentados(opelegidas);
  }


  actualizarGraficaFechas()
  selectorCategoria.addEventListener('change', function() {
    actualizarGraficaEtiquetas();
  });
  campoFechaini.addEventListener('change', function() {
    actualizarGraficaFechas();
  });
  campoFechafin.addEventListener('change', function() {
    actualizarGraficaFechas();
  });

}
// Autores: Vladimir Támara y Luis Alejandro Cruz.
// Con base en   https://plotly.com/javascript/line-charts/#styling-line-plot
//
// Desde javascript/packs/application.js se incluyó:
// import hacer_serietiempo from '../serietiempo_plotly'
// que operó dejando al final de este archivo
// export default hacer_serietiempo
//
// <script src='https://cdn.plot.ly/plotly-latest.min.js'></script>
//

// CSV:
// fecha, presponsable, sexonac, ..., cuenta
// 2020-03-01, PARAMILITARES, F, ...,5
// Las gráficas analizaran solo una variable i.e columna e.g presponsable
//   Serie de tiempo: Una linea por categoria de la variable analizada
//      fecha vs. cuenta por categoria
//    Barra: cuenta por categoria (en todo el tiempo)



// Recibe etiquetas por presentar y actualiza variable trazosPresentados
// dejando justo las series de seriesEjey que corresponden a esas etiquetas
function actualizarTrazosPresentados(etiquetas) {
  var etiquetasP = []
  var i = 0
  trazosPresentados.forEach(function(t) {
    etiquetasP.push(t.name)
    i++;
  });
  var eo = etiquetas.sort()
  var epo = etiquetasP.sort()
  var c = 0
  var cp = 0
  var agregar = []
  var eliminar = []
  while (c < eo.length || cp < epo.length) {
    if (cp >= epo.length || eo[c] < epo[cp]) {
      agregar.push(eo[c])
      c++
    } else if (c >= eo.length || eo[c] > epo[cp]) {
      eliminar.push(epo[cp])
      cp++
    } else {
      c++
      cp++
    }
  }
  eliminar.forEach(function (e) {
    var indpe = trazosPresentados.find(t => t.name == e);
    trazosPresentados.splice(indpe, 1)
  })
  agregar.forEach(function (e) {
    trazosPresentados.push({
      x: ejex, 
      y: seriesEjey[e],
      stackgroup: 'uno',
      //type: 'scatter',
      //mode: 'lines',
      name: e,
      //line: {
      //color: colores[e],
      // width: 1
      //}
    })
  })

  var configuracion = {
    responsive: true, 
    displaylogo: false, 
    locale: 'es',
    showEditInChartStudio: true,
    plotlyServerURL: "https://chart-studio.plotly.com",
    height: 340, 
  }

  Plotly.newPlot('div_serietiempo', trazosPresentados, 
    {title: 'Serie de tiempo de actos', showlegend: false},
    configuracion);

  var valorBarras = []
  etiquetas.forEach(function (e) {
    valorBarras.push(totalesEtiqueta[e])
  })
  var barras = [{
    x: etiquetas,
    y: valorBarras,
    type: 'bar'
  }]
  Plotly.newPlot('div_barras', barras,
    {title: 'Actos por presunto responsable'},
    configuracion);

}



// Recibe fecha inicia, fecha final y etiquetas a presentar
// actualiza datos presentados para que corresponda a ese rango
// y etiquetas
function recalcularSeriesPresentadas(fechaini, fechafin, etiquetas) {
  totalesEtiqueta = {}
  ejex= []
  seriesEjey = {}
  trazosPresentados = [] 
  Object.keys(datosr).sort().forEach(function(fecha) {
    if (fecha >= fechaini & fecha <= fechafin) {
      ejex.push(fecha)
      datosrEtiquetas.forEach(function(e) {
        if (typeof datosr[fecha][e] == 'undefined') {
          datosr[fecha][e] = 0
        }
        if (typeof seriesEjey[e] == 'undefined') {
          seriesEjey[e] = []
        }
        seriesEjey[e].push(datosr[fecha][e])
        if (typeof totalesEtiqueta[e] == 'undefined') {
          totalesEtiqueta[e] = datosr[fecha][e]
        } else {
          totalesEtiqueta[e] += datosr[fecha][e]
        }
      })
    }
  })

  actualizarTrazosPresentados(etiquetas) 
}


// Asigna opciones a un cuadro de selección múltiple inicialmente vacio
// selector es selector del campo de selección múltiple
// opciones es vector con las opciones a crear
// seltodo indica si todas deben elegirse por omisión
function seleccionmAsignarOpciones(selector, opciones, seltodo = true) {
  for (var i = 0; i < opciones.length;  i++) {
    var opcionActual = document.createElement('option');
    if (seltodo) {
      opcionActual.selected = true;
    }
    opcionActual.text = opciones[i];
    selector.appendChild(opcionActual);
  }
  Msip__Motor.refrescarElementoTomSelect(selector)
}


// Retorna opciones elegidas en un campo de selección múltiple
function seleccionmOpcionesElegidas(selector) {
  var res = [];
  var opciones = selector && selector.options;
  var op;

  for (var i = 0, t = opciones.length; i < t; i++) {
    op = opciones[i];

    if (op.selected) {
      res.push(op.value || op.text);
    }
  }
  return res;
}



// Conecta con data-controller="sivel2-gen--plotly-actos"
export default class extends Controller {

  static targets = []

  connect() {
    console.log("Conexion de controlador de Plotly establecida");
    this.plotly_serietiempo_actos();
  }


  plotly_serietiempo_actos() {
    const ruta_relativa = window.location.pathname.split("/")[1]
    Plotly.d3.csv("/" + ruta_relativa + "/" + ruta_relativa + "/csv/actos_individuales.csv", function(err, datos) { 
      if (err) {
        console.error("Error al cargar el archivo CSV:", err);
      } else {
        procesar_datos(datos, 'presponsable') 
      }
    });
  };

}
