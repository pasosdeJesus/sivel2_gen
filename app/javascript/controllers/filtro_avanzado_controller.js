import { Controller } from "@hotwired/stimulus"
// Maneja filrto avanzado de casos con stimulus

import Msip__Motor from "../msip/motor"

// Conecta con data-controller="sivel2-gen--filtro-avanzado"
export default class extends Controller {

  static targets = [
    "botonesFin"
  ]

  connect() {
    console.log("Conexion de controlador filtro avanzado establecida")
  }

  abrir(e){
    if (e.target && e.target.id === 'boton_filtro_avanzado') {
      var botonFiltro = e.target;

      if (botonFiltro.getAttribute('aria-expanded') === 'true') {
        this.botonesFinTarget.classList.remove('float-end');
        this.botonesFinTarget.classList.add('d-flex', 'justify-content-center');
      } else {
        this.botonesFinTarget.classList.remove('d-flex', 'justify-content-center');
        this.botonesFinTarget.classList.add('float-end');
      }
    }
  }

  filtrar_tviolencia(e){
    if (e.target && e.target.id === 'filtro_tviolencia_id') {
      var tviolencia_id = e.target.value;
      var select = e.target;

      if (tviolencia_id !== "Z") {
        var url = window.puntomontaje + 'admin/categorias/filtratviolencia';

        var xhr = new XMLHttpRequest();
        xhr.open('GET', url + '?tviolencia=' + encodeURIComponent(tviolencia_id), true);
        xhr.responseType = 'json';

        xhr.onreadystatechange = function() {
          if (xhr.readyState === 4) {
            if (xhr.status === 200) {
              var datos = xhr.response;
              var div_padre = select.closest('div');
              var div_grid = div_padre.parentElement;
              var div_filtro = div_grid.parentElement.parentElement;
              var input_cat = div_filtro.querySelector('select[id=filtro_categoria_id]');

              //Msip__Motor.configurarElementoTomSelect(input_cat.value = datos[0]);
            } else {
              alert('Error: ' + xhr.responseText);
            }
          }
        };

        xhr.send();
      }
    }
  }

  filtrar_categoria(e){
    if (e.target && e.target.id === 'filtro_categoria_id') {
      var categoria_id = e.target.value;
      var select = e.target;
      var url = window.puntomontaje + 'admin/categorias/filtratviolencia';

      var xhr = new XMLHttpRequest();
      xhr.open('GET', url + '?categorias_seleccionadas=' + encodeURIComponent(categoria_id), true);
      xhr.responseType = 'json';

      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
          if (xhr.status === 200) {
            var datos = xhr.response;
            if (datos[0] === false) {
              var div_padre = select.closest('div');
              var div_grid = div_padre.parentElement;
              var div_filtro = div_grid.parentElement.parentElement;
              var input_tipo = div_filtro.querySelector('select[id=filtro_tviolencia_id]');
              Msip__Motor.configurarElementoTomSelect(input_tipo.value = 'Z');
            }
          } else {
            alert('Error: ' + xhr.responseText);
          }
        }
      };

      xhr.send();
    }
  }

}
