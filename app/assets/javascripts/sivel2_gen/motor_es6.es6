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
      if (/^boton-añadir-actos$/.test(e.target.id)) {
        console.log('OJO click en añadir acto ' + e.target.id);
        e.preventDefault();
        var f = document.querySelector('form');
        // FormData parece no operar con rails
        //const datosFormulario = new FormData(f);
        var s = SipSerializarFormularioEnArreglo(f);
        var param = SipConvertirArregloAParam(s);
        var url = window.puntomontaje + 'actos/agregar';
        window.mrujs.fetch(
          url,
          {
            headers: {"Content-Type": "application/json"},
            // Si headers es "Content-Type": "text/html" no pasa parámetros
            // al controlador
            method: 'PATCH',
            //body: JSON.stringify(s)
            body: JSON.stringify(s)
            // Si en lugar de JSON.stringify(s) se usa s, param,
            // JSON.stringify(param),JSON.stringify(datosFormulario)
            // no llegan datos al controlador en rails
            // Con datosFormulario si llegan porque rails 7 presenta mensajes
            // pero falla sin llegar al controlador.
          }
        )
          .then(response => { 
            return response.text();
          })
          .then(html => { 
            var e = document.getElementById('actos_tabla')
            e.innerHTML = html
          })
          .catch(error => {
            alert('Error= '+error);
          });
      }

    }, false);


    document.addEventListener("ajax:success", (event) => {
      if (event.detail.submitter && 
        event.detail.submitter.id == 'sivel2_gen-filtrar-casos') {
        let p1=event.detail.fetchResponse.html().then(html => {
          var parser = new DOMParser();
          var doc = parser.parseFromString(html, "text/html");
          var casos = doc.querySelector('#casos');
          var ncasos = doc.querySelector('#numconscaso');
          document.querySelector('#numconscaso').innerHTML= ncasos.innerHTML
          document.querySelector('#casos').innerHTML = casos.innerHTML
        })
      }
    })

  }
}


