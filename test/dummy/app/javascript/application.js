/* eslint no-console:0 */

console.log('Hola Mundo desde ESM')

import Rails from "@rails/ujs";
if (typeof window.Rails == 'undefined') {
  Rails.start();
  window.Rails = Rails;
}

import "@hotwired/turbo-rails";

import 'gridstack'

import './jquery'

import 'popper.js'              // Dialogos emergentes usados por bootstrap
import * as bootstrap from 'bootstrap'              // Maquetacion y elementos de diseño

import Msip__Motor from "./controllers/msip/motor"
window.Msip__Motor = Msip__Motor
Msip__Motor.iniciar()  // Este se ejecuta una vez cuando se está cargando la aplicación tal vez antes que la página completa o los recursos

import TomSelect from 'tom-select';
window.TomSelect = TomSelect;
window.configuracionTomSelect = {
  create: false,
  diacritics: true, //no sensitivo a acentos
  sortField: {
    field: "text",
    direction: "asc"
  }
}

// Apexcharts
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts
import apexes from 'apexcharts/dist/locales/es.json'
Apex.chart = {
  locales: [apexes],
  defaultLocale: 'es',
}

// Leaflet
import L from 'leaflet';
import 'leaflet.markercluster';

import plotly_serietiempo_actos from './plotly_actos'

import {AutocompletaAjaxExpreg} from '@pasosdejesus/autocompleta_ajax'
window.AutocompletaAjaxExpreg = AutocompletaAjaxExpreg

let esperarRecursosSprocketsYDocumento = function (resolver) {
  if (typeof window.puntomontaje == 'undefined') {
    setTimeout(esperarRecursosSprocketsYDocumento, 100, resolver)
    return false
  }
  if (document.readyState !== 'complete') {
    setTimeout(esperarRecursosSprocketsYDocumento, 100, resolver)
    return false
  }
  resolver("Recursos manejados con sprockets cargados y documento presentado en navegador")
    return true
  }

let promesaRecursosSprocketsYDocumento = new Promise((resolver, rechazar) => {
  esperarRecursosSprocketsYDocumento(resolver)
})

promesaRecursosSprocketsYDocumento.then((mensaje) => {
  console.log(mensaje)
  var root = window;
  msip_prepara_eventos_comunes(root);
  mr519_gen_prepara_eventos_comunes(root);
  heb412_gen_prepara_eventos_comunes(root);
  sivel2_gen_prepara_eventos_comunes(root);
  sivel2_gen_prepara_eventos_unicos(root);

  Msip__Motor.ejecutarAlCargarDocumentoYRecursos()  // Este se ejecuta cada vez que se carga una página que no está en cache y tipicamente después de que se ha cargado la página completa y los recursos

  var p = new URL(document.URL).pathname.split('/')
  var p2ult = ''
  if (p.length>2) {
    p2ult = p[p.length - 2] + "/" + p[p.length - 1]
  }
  console.log("p2ult=" + p2ult)
  if (p2ult == 'graficar/actos_individuales') {
    plotly_serietiempo_actos()
  }

})


document.addEventListener('turbo:load', (e) => {
 /* Lo que debe ejecutarse cada vez que turbo cargue una página,
 * tener cuidado porque puede dispararse el evento turbo varias
 * veces consecutivas al cargarse  la misma página.
 */

  console.log('Escuchador turbo:load')

  Msip__Motor.ejecutarAlCargarPagina()  // Este puede ejecutarse varias veces consecutivas cada vez que se termina de cargar una página que incluso pudiera estar en cache
  msip_ejecutarAlCargarPagina(window)
})

import "./controllers"
