import { Controller } from "@hotwired/stimulus"

// Conecta con data-controller="sivel2-gen--enviar-ficha-caso"
export default class extends Controller {
  static targets = ["idcaso"]

  connect() {
    document.getElementById("cargando").style.display = 'none';
    console.log("Conexion de controlador enviar ficha caso establecida")
    const pestanias = document.querySelectorAll('.fichacambia');
    pestanias.forEach(function(pestania) {
      pestania.setAttribute('data-enviar-ficha-caso-target', pestania.id);
      pestania.setAttribute('data-action', 'click->sivel2-gen--enviar-ficha-caso#cambiarficha');
    });

    const pestanaActiva = localStorage.getItem('pestanaActiva');
      if (pestanaActiva != null) {
        pestanias.forEach(function(pestania) {
          if (pestania.id == pestanaActiva) {
            pestania.classList.add('active');
            const atributoId = pestania.getAttribute('data-bs-target');
            const atributo = document.querySelector(atributoId);
            if (atributo) {
              atributo.classList.add('show', 'active');
            }
          } else {
            pestania.classList.remove('active');
            const atributoId = pestania.getAttribute('data-bs-target');
            const atributo = document.querySelector(atributoId);
            if (atributo) {
              atributo.classList.remove('show', 'active');
            }
          }
        });
       localStorage.removeItem('pestanaActiva');
     }
  }

  cambiarficha(){
    if(event.target.dataset.enviarFichaCasoTarget == 'actos-pestana'){
      document.getElementById("cargando").style.display = 'flex';
      let casoId = this.idcasoTarget.value
      let puntomontaje = window.puntomontaje
      let url = puntomontaje + 'casos/' + casoId + '/guardar_y_editar'
      let datosFormulario = new FormData(document.querySelector('form'));
      let objetoFormulario = Object.fromEntries(datosFormulario);
      for (let [key, value] of datosFormulario.entries()) {
        let coincidencia = key.match(/^caso\[(.+?)\]$/);
        if (coincidencia) {
          let ruta = coincidencia[1].split(/\]\[|\[|\]/).filter(p => p !== "");
          let actual = objetoFormulario;

          for (let i = 0; i < ruta.length; i++) {
            if (i === ruta.length - 1) {
                  actual[ruta[i]] = value;
            } else {
                if (!actual[ruta[i]]) {
                  actual[ruta[i]] = (ruta[i + 1].match(/^\d+$/) ? [] : {});
                }
                actual = actual[ruta[i]];
            }
          }
        }
      }

      let datosCaso = { caso: objetoFormulario };
      fetch(url, {
            method: 'PATCH',
            headers: {
                    'X-CSRF-Token': Rails.csrfToken(),
                    'Content-Type': 'application/json'
                  },
            body: JSON.stringify(datosCaso)
          }).then(response => {
              if (response.ok) {
                localStorage.setItem('pestanaActiva', 'actos-pestana');
                window.location = puntomontaje + 'casos/' + casoId + '/edita';
              }
           });

    }
    const campo_presponsables_acto = document.querySelector('#caso_acto_presponsable_id');
    const campo_presponsables_actocol = document.querySelector('#caso_actocolectivo_presponsable_id');
    const campo_victimas_acto = document.querySelector('#caso_acto_persona_id');
    const campo_victimascol_acto = document.querySelector('#caso_actocolectivo_grupoper_id');
    actualizarPresponsables(campo_presponsables_acto)
    actualizarPresponsables(campo_presponsables_actocol)
    actualizarVictimas(campo_victimas_acto)
    // Si funciona el otro enfoque ya no es necesario
    //actualizarGruposper(campo_victimascol_acto)

    function actualizarPresponsables(s) {
      var sel = s.value;
      var cadena = '';
      var campo = document.querySelectorAll('#presponsables .control-group:not([style="display: none;"])');

      campo.forEach(function(v) {
                var id = v.querySelector('select[data-actualiza="presponsable"]').value;
                cadena += "<option value='" + id + "'";
                if (id === sel) {
                              cadena += ' selected';
                          }
                var tx = v.querySelector('select[data-actualiza="presponsable"] option[value="' + id + '"]').textContent;
                cadena += ">" + tx + "</option>";
            });

      s.innerHTML = cadena;
    }

    function actualizarVictimas(s) {
      var sel = s.value;
      var cadena = '';
      var sinid = 0;
      var marcosTurbo = document.querySelectorAll('#victimas_frame turbo-frame[id^="victima"]');
      marcosTurbo.forEach(function(frame) {
        var inputId = frame.querySelector('input[id^="caso_victima_attributes_"][id$="_persona_attributes_id"]');
        var id = inputId ? inputId.value : '';
        var inputNombre = frame.querySelector('input[id^="caso_victima_attributes_"][id$="_persona_attributes_nombres"]');
        var nom = inputNombre ? inputNombre.value : '';
        var inputApellido = frame.querySelector('input[id^="caso_victima_attributes_"][id$="_persona_attributes_apellidos"]');
        var ap = inputApellido ? inputApellido.value : '';
        cadena += "<option value='" + id + "'";
        var tx;
        if (nom === 'N' && ap === 'N') {
                sinid += 1;
                tx = "PERSONA SIN IDENTIFICAR " + sinid;
              } else {
                      tx = (nom + " " + ap).trim();
                    }
        cadena += ">" + tx + "</option>"; 
          });
      s.innerHTML = cadena;
    }

    function actualizarGruposper(s) {
          var sel = s.value;
          var cadena = '';
          var campo = document.querySelectorAll('#victimascolectivas .control-group[style!="display: none;"]');
          campo.each(function(k, v) {
            var id = $(v).find('div').filter(function() {
                  return this.attributes.class.value.match(/caso_victimacolectiva[_0-9]*grupoper_id/);
              }).find('input').val();
            if (typeof id === 'undefined') {
              id = $(v).find('div').filter(function() {
                    return this.attributes.class.value.match(/grupoper_id/);
                }).find('input').val();
            }
            cadena += "<option value='" + id + "'";
            if (id === sel) {
              cadena += ' selected';
            }
            var nom = $(v).find('div').filter(function() {
                          return this.attributes.class.value.match(/caso_victimacolectiva[_0-9]*grupoper_nombre/);
                      }).find('input').val();
            if (typeof nom === 'undefined') {
              nom = $(v).find('div').filter(function() {
                      return this.attributes.class.value.match(/grupoper_nombre/);
                    }).find('input').val();
            }
            var tx = nom.trim();
            cadena += ">" + tx + "</option>";
                });
          s.innerHTML = cadena;
    };
  }

}
