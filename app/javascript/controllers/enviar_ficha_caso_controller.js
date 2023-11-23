import { Controller } from "@hotwired/stimulus"

// Conecta con data-controller="sivel2-gen--enviar-ficha-caso"
export default class extends Controller {
  static targets = ["idcaso"]

  connect() {
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
            const paneId = pestania.getAttribute('data-bs-target');
            const pane = document.querySelector(paneId);
            if (pane) {
              pane.classList.add('show', 'active');
            }
          } else {
            pestania.classList.remove('active');
            const paneId = pestania.getAttribute('data-bs-target');
            const pane = document.querySelector(paneId);
            if (pane) {
              pane.classList.remove('show', 'active');
            }
          }
        });
       localStorage.removeItem('pestanaActiva');
     }
  }

  cambiarficha(){
    if(event.target.dataset.enviarFichaCasoTarget == 'actos-pestana'){
      let casoId = this.idcasoTarget.value
      let url = '/sivel22/casos/' + casoId + '/guardar_y_editar'
      let formData = new FormData(document.querySelector('form'));
      let formObject = Object.fromEntries(formData);
      for (let [key, value] of formData.entries()) {
        let match = key.match(/^caso\[(.+?)\]$/);
        if (match) {
          let path = match[1].split(/\]\[|\[|\]/).filter(p => p !== "");
          let current = formObject;

          for (let i = 0; i < path.length; i++) {
            if (i === path.length - 1) {
                  current[path[i]] = value;
            } else {
                if (!current[path[i]]) {
                  current[path[i]] = (path[i + 1].match(/^\d+$/) ? [] : {});
                }
                current = current[path[i]];
            }
          }
        }
      }

      let casoData = { caso: formObject };
      fetch(url, {
            method: 'PATCH',
            headers: {
                    'X-CSRF-Token': Rails.csrfToken(),
                    'Content-Type': 'application/json'
                  },
            body: JSON.stringify(casoData)
          }).then(response => {
              if (response.ok) {
                localStorage.setItem('pestanaActiva', 'actos-pestana');
                window.location = '/sivel22/casos/' + casoId + '/edita';
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
    actualizarGruposper(campo_victimascol_acto)

    function actualizarPresponsables(s) {
      var sel = s.value;
      var nh = '';
      var lcg = document.querySelectorAll('#presponsables .control-group:not([style="display: none;"])');

      lcg.forEach(function(v) {
                var id = v.querySelector('select[data-actualiza="presponsable"]').value;
                nh += "<option value='" + id + "'";
                if (id === sel) {
                              nh += ' selected';
                          }
                var tx = v.querySelector('select[data-actualiza="presponsable"] option[value="' + id + '"]').textContent;
                nh += ">" + tx + "</option>";
            });

      s.innerHTML = nh;
    }

    function actualizarVictimas(s) {
      var sel = s.value;
      var nh = '';
      var sinid = 0;
      var turboFrames = document.querySelectorAll('#victimas_frame turbo-frame');

      turboFrames.forEach(function(frame) {
        var inputId = frame.querySelector('input[id^="caso_victima_attributes_"][id$="_persona_attributes_id"]');
        var id = inputId ? inputId.value : '';
        var inputNombre = frame.querySelector('input[id^="caso_victima_attributes_"][id$="_persona_attributes_nombres"]');
        var nom = inputNombre ? inputNombre.value : '';
        var inputApellido = frame.querySelector('input[id^="caso_victima_attributes_"][id$="_persona_attributes_apellidos"]');
        var ap = inputApellido ? inputApellido.value : '';
        nh += "<option value='" + id + "'";
        var tx;
        if (nom === 'N' && ap === 'N') {
                sinid += 1;
                tx = "PERSONA SIN IDENTIFICAR " + sinid;
              } else {
                      tx = (nom + " " + ap).trim();
                    }
        nh += ">" + tx + "</option>"; 
          });
      s.innerHTML = nh;
    }

    function actualizarGruposper(s) {
          var sel = s.value;
          var nh = '';
          lcg.each(function(k, v) {
            var id = $(v).find('div').filter(function() {
                  return this.attributes.class.value.match(/caso_victimacolectiva[_0-9]*grupoper_id/);
              }).find('input').val();
            if (typeof id === 'undefined') {
              id = $(v).find('div').filter(function() {
                    return this.attributes.class.value.match(/grupoper_id/);
                }).find('input').val();
            }
            nh += "<option value='" + id + "'";
            if (id === sel) {
              nh += ' selected';
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
            nh += ">" + tx + "</option>";
                });
          s.innerHTML = nh;
    };
  }

}
