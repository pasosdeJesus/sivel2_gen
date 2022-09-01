'use strict';
// Este se convertirá a ES5 como módulo CommonJS
// Para que no se quiebre antes debe crearse exports y modules

export default class Sivel2GenMotorEs6 {

  static iniciar() {

    /**
     * Detecta eventos click.
     * @param {event} e evento
     */
    document.addEventListener('click', function (e) {
      if (/^boton-añadir-actos/.test(e.target.id)) {
        console.log('OJO click en añadir acto ' + e.target.id);
        e.preventDefault();
        // Con fetch tiende a JSON, toca poner manual el CSRF-Token 
        // y envia a rails en un formato diferente.
        // Por eso seguimos con Rails.ajax aunque sería mejor
        // promesa
        var f = document.querySelector('form');
        var url = window.puntomontaje + 'actos/agregar';
        var idtabla = 'actos_tabla'
        if (e.target.id == 'boton-añadir-actoscolectivos') {
          url = window.puntomontaje + 'actoscolectivos/agregar';
          idtabla = 'actoscolectivos_tabla'
        }

        // https://www.ombulabs.com/blog/learning/javascript/behind-the-scenes-rails-ujs.html
        const datosFormulario = new FormData(f);

        window.Rails.ajax({
          type: 'PATCH',
          url: url,
          data: datosFormulario,
          dataType: 'html',
          success: (resp, estado, xhr) => {
            var e = document.getElementById(idtabla)
            var t = resp.querySelector('table')
            if (t == null) {
              var b = resp.querySelector('body') ? 
                resp.querySelector('body').innerHTML : 'Error con ' + idtabla
              alert(b)
            } else {
              e.innerHTML = t.outerHTML
            }
          },
          error: (req, estado, xhr) => {
            alert('Error= '+req+estado+xhr);
          }
        })
      }
    }, false);
  }

  static crea_copia_de_combatiente(obj, fobj){
    div_combatiente = obj.parentElement.parentElement;
    valores_input= []
    valores_select= []
    div_combatiente.querySelectorAll('input').forEach(elem => {
      valores_input.push(elem.value)
    });
    div_combatiente.querySelectorAll('select').forEach(elem => {
      if(elem.multiple){
        opciones = elem.options
        valores_multi= []
        for (const opc of opciones){
          if(opc.selected){
            valores_multi.push(opc.value)
          }
        }
        valores_select.push(valores_multi)
      }
      else{
        valores_select.push(elem.value)
      }
    });
    document.querySelector('.agrega-comb').click();
    setTimeout(() =>{
      combatientes = document.querySelector("#combatientes").
        querySelectorAll(".seccioncombatiente")
      comb_agregado = combatientes[combatientes.length- 1]
      comb_agregado.querySelectorAll('input').forEach((elem, i) => {
        if(i >= 0 && i !=35){
          if(elem.type != "hidden"){
            elem.value = valores_input[i]
            elem.dispatchEvent(new Event('input'));
          }
        }
      })
      comb_agregado.querySelectorAll('select').forEach((elem, i) => {
        if(i >= 0 && i !=35){
          if(elem.multiple){
            for(const val of valores_select[i]){
              for (const opc of elem.options) {
                if(opc.value == val){
                  opc.selected = true;
                }
              }
            }
          }
          else{
            elem.value = valores_select[i]
          }
        }
      })
      }
    , 1000);
    return false
  }

}


