/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//

console.log('Hola Mundo desde Webpacker')

import Rails from "@rails/ujs"
Rails.start()

import Turbolinks from "turbolinks"
Turbolinks.start()

import $ from "expose-loader?exposes=$,jQuery!jquery";
import 'jquery-ui'
import 'jquery-ui/ui/widgets/autocomplete'
import 'jquery-ui/ui/data'
import 'jquery-ui/ui/focusable'
import 'jquery-ui/ui/widgets/tooltip'
import 'popper.js'              // Dialogos emergentes usados por bootstrap
import * as bootstrap from 'bootstrap'              // Maquetacion y elementos de diseño
import 'chosen-js/chosen.jquery';       // Cuadros de seleccion potenciados
import 'bootstrap-datepicker'
import 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'

// Apexcharts
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts
import apexes from 'apexcharts/dist/locales/es.json'
Apex.chart = {
  locales: [apexes],
  defaultLocale: 'es',
}

// Leaflet
var L = require('leaflet');
var mc= require('leaflet.markercluster');

import plotly_serietiempo_actos from '../plotly_actos'

document.addEventListener("DOMContentLoaded", function() {

  var p = new URL(document.URL).pathname.split('/')
  var p2ult = ''
  if (p.length>2) { 
    p2ult = p[p.length - 2] + "/" + p[p.length - 1]
  }
  console.log("p2ult=" + p2ult)
  if (p2ult == 'graficar/actos_individuales') {
    plotly_serietiempo_actos() 
  }

});

