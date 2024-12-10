import Sivel2Gen__AutocompletaAjaxColectivas from "./AutocompletaAjaxColectivas"
window.Sivel2Gen__AutocompletaAjaxColectivas = Sivel2Gen__AutocompletaAjaxColectivas 

import Sivel2Gen__AutocompletaAjaxFamiliares from "./AutocompletaAjaxFamiliares"
window.Sivel2Gen__AutocompletaAjaxFamiliares = Sivel2Gen__AutocompletaAjaxFamiliares 

import Sivel2Gen__AutocompletaAjaxVictimas from "./AutocompletaAjaxVictimas"
window.Sivel2Gen__AutocompletaAjaxVictimas = Sivel2Gen__AutocompletaAjaxVictimas 

export default class Sivel2Gen__Motor {

  /* 
   * Librería de funciones comunes.
   * Aunque no es un controlador lo dejamos dentro del directorio
   * controllers para aprovechar método de msip para compartir controladores
   * Stimulus de motores.
   *
   * Como su nombre no termina en _controller no será incluido en 
   * controllers/index.js
   *
   * Desde controladores stimulus importelo con
   *
   *  import Sivel2Gen__Motor from "../sivel2_gen/motor"
   *
   * Use funciones por ejemplo con
   *
   *  Sivel2Gen__Motor.funcionestatica(fl, formato)
   *
   * Para poderlo usar desde Javascript global con 
   * window.Sivel2Gen__Motor 
   * asegure que en app/javascript/application.js ejecuta:
   *
   * import Sivel2Gen__Motor from './controllers/sivel2_gen/motor.js'
   * window.Sivel2Gen__Motor = Msip__Motor
   *
   */

  // Se ejecuta cada vez que se carga una página que no está en cache
  // y tipicamente después de que se ha cargado la página y los recursos.
  static ejecutarAlCargarDocumentoYRecursos() {
    console.log("* Corriendo Sivel2Gen__Motor.ejecutarAlCargarDocumentoYRecursos()")

    if (typeof window.puntoMontaje == 'undefined') {
      window.puntoMontaje = '/'
    }
    if (window.puntoMontaje[window.puntoMontaje.length - 1] != '/') {
      window.puntoMontaje = window.puntoMontaje + '/'
    }

    // En victimas permite autocompletar nombres de victima
    Sivel2Gen__AutocompletaAjaxVictimas.iniciar()
    Sivel2Gen__AutocompletaAjaxFamiliares.iniciar()
    Sivel2Gen__AutocompletaAjaxColectivas.iniciar()

    document.addEventListener('change', e => {
      if (e.target.matches("#victimas input[id^=caso_victima][id$=_nombres]")) {
        Sivel2Gen__Motor.consultarNNs()
      }
    })


    // Tras eliminar presponsable, eliminar dependientes
    //j$('#presponsables').on('cocoon:after-remove', '', (e, presponsable) ->
    //    elimina_pendientes(window.elempe);
    //    window.elempe = []
    //  )


    // En formulario usuario, cambia visibilidad de filtro para casos
    // dependiendo de si el grupo incluye 
    // 22 - Observador de parte de los casos
    document.addEventListener('change', e => {
      if (e.target.matches('select[id=usuario_grupo_ids]')) {
        let div_fini = $('.usuario_observadorffechaini')
        let div_ffin = $('.usuario_observadorffechafin')
        let div_fdep = $('.usuario_filtrodepartamento')
        if (e.target.value.includes('22')) {
          div_fini.style.display = "block"
          div_ffin.style.display = "block"
          div_fdep.style.display = "block"
        } else {
          div_fini.style.display = "none"
          div_ffin.style.display = "none"
          div_fdep.style.display = "none"
        }
      }
    })

  }

  // Llamar cada vez que se cargue una página detectada con turbo:load
  // Tal vez en cache por lo que podría no haberse ejecutado iniciar 
  // nuevamente.
  // Podría ser llamada varias veces consecutivas por lo que debe detectarlo
  // para no ejecutar dos veces lo que no conviene.
  static ejecutarAlCargarPagina() {
    console.log("* Corriendo Sivel2Gen__Motor.ejecutarAlCargarPagina()")
  
    // Envia formulario al presionar botones con clase fichacambia 
    // con más de 5 segundos de diferencia entre un click y el siguiente
    document.addEventListener('click', e => {
      if (e.target.matches('button.fichacambia[data-bs-target^="#"]')) {
        e.preventDefault()
        let tn = Date.now()
        let d = -1
        if (window.tfichacambia) {
          d = (tn - window.tfichacambia)/1000
        }
        if (d == -1 || d>5) {
          //Sivel2Gen__Motor.enviarFichaCaso()
          window.tfichacambia = Date.now()
        }
      }
    })

    Msip__Motor.registraCambiosParaBitacora(window)


    document.addEventListener('change', e => {
      if (e.target.matches('#filtro_desagregar')) {
        let valor = e.value
        let fil_cat = document.selectorQuery("#filtro_categorias")
        let fil_dep = document.selectorQuery("#filtro_departamentos")
        let fil_sex = document.selectorQuery("#filtro_sexo")
        if (valor == 'Departamento') {
          fil_cat.parentElement.style.display = "block"
          fil_dep.parentElement.style.display = "none"
          fil_sex.parentElement.style.display = "block"
        }
        if (valor == 'Categoria') {
          fil_cat.parentElement.style.display = "none"
          fil_dep.parentElement.style.display = "block"
          fil_sex.parentElement.style.display = "block"
        }
        if (valor == 'Sexo') {
          fil_cat.parentElement.style.display = "block"
          fil_dep.parentElement.style.display = "block"
          fil_sex.parentElement.style.display = "none"
        }
      }
    })

    Sivel2Gen__AutocompletaAjaxColectivas.iniciar()
    Sivel2Gen__AutocompletaAjaxFamiliares.iniciar() // Conflicto con el de msip?
    Sivel2Gen__AutocompletaAjaxVictimas.iniciar()

  }

  // Llamada desde application.js tal vez antes de cargar el documento,
  // paquetes javascript y recursos sprockets
  static iniciar() {
    console.log("* Corriendo Sivel2Gen__Motor.iniciar()")
    // Para usar mapa sobre OpenStreetMap cargue leaflet antes de llamar
    // esta función an application.js asi:
    // import L from 'leaflet'
    // window.L = L
    // import 'leaflet.markercluster'
    if (typeof L != "undefined") {
      // Si uso import iconShadow from 'leaflet/dist/images/marker-shadow.png';
      // queda public/miruta/assets/marker-shadow-MEXDWUU7-a2d94406ba198f61f68...png
      // Más bien se configuró en el config/initializers/assets.rb del motor
      // para que sea incluido en aplicaciones y motores que incluyan este motor.
      // Como se copian con sprockets quedan con firma como las usadas a 
      // continuación:
      L.Icon.Default.mergeOptions({
        iconUrl: "../assets/leaflet/dist/images/marker-icon-3d253116ec4ba0e1f22a01cdf1ff7f120fa4d89a6cd0933d68f12951d19809b4.png",
        iconRetinaUrl: "../assets/leaflet/dist/images/marker-icon-2x-091245b393c16cdcefe54920aa7d3994a0683317ca9a58d35cbc5ec65996398c.png",
        shadowUrl: "../assets/leaflet/dist/images/marker-shadow-a2d94406ba198f61f68a71ed8f9f9c701122c0c33b775d990edceae4aece567f.png"
      });
    }

    Msip__Motor.configurarElementosTomSelect()

    // En filtro avanzado del listado de casos maneja botón Limpiar
    if (document.getElementById('limpiar-campos-filtro')) {
      document.getElementById('limpiar-campos-filtro').addEventListener(
        'click', function(e) {
          // Obtiene todos los campos con la clase 'chosen-select'
          const selectores = document.querySelectorAll('.chosen-select');
          selectores.forEach(select => {
            csDeseleccionarTodas(select.id);
          }); 
        }
      );
    }

  }


  // Función para remplazar wrapAll de jQuery
  // Adaptada de https://www.py4u.net/discuss/974438
  static envolverTodos(objetivos, envolvente = document.createElement('div')) 
  {
    [ ...objetivos].forEach(objetivo => {
      envo2 = envolvente.cloneNode()
      objetivo.parentNode.insertBefore(envo2, objetivo);
      objetivo.parentNode.removeChild(objetivo);
      envo2.appendChild(objetivo)
    })
    return 
  }

  // Función para remplazar unwrap de jQuery
  static desenvolver(objetivos) 
  {
    if (objetivos != null) {
      [ ...objetivos].forEach(objetivo => {
        objetivo.parentElement.replaceWith(objetivo)
      })
    }
    return
  }

  // Deseleccionar todas las opciones de un cuadro de selección con la id dada
  static csDeseleccionarTodas(id) {
    document.querySelectorAll("#"+ id + " option:checked").
      forEach( op => op.selected = false )
    let el = document.querySelector('#'+id)
    if (el) {
      el.dispatchEvent(new Event("chosen:updated"));
    }
  }

  // Seleccionar todas las opciones de un cuadro de selección con la id dada
  static csSeleccionarTodasSinSpan(id) {
    document.querySelectorAll("#"+ id + " option").
      forEach( op => op.selected = true )
    document.querySelectorAll("#"+ id + " span option").
      forEach( op => op.selected = false )
    let el = document.querySelector('#'+id)
    if (el) {
      el.dispatchEvent(new Event("chosen:updated"));
    }
  }


  static agregarEvento( obj, evt, fn ) {
    if ( 'undefined' != typeof obj.addEventListener ) {
      obj.addEventListener( evt, fn, false );
    } else if ( 'undefined' != typeof obj.attachEvent ) {
      obj.attachEvent( "on" + evt, fn );
    }
  }

  // Basado en HoverListener de 
  // https://stackoverflow.com/questions/262740/javascript-onhover-event
  static escuchadorHover = {
    agregarElem: function( elem, retrollamada_ins, retrollamada_des, espera ) {
      if ( espera === undefined ) {
        espera = 1000;
      }

      var tempHover;

      gid = elem.id.replace('t-', 'r-');
      nelem = document.querySelector("#" + gid);
      agregarEvento( nelem, 'mouseover', function() {

        tempHover = setTimeout( retrollamada_ins, espera );
      } );

      agregarEvento( nelem, 'mouseout', function() {
        clearTimeout( tempHover );
        retrollamada_des();
      } );
    }
  }


  static get MapaOSMLatInicial() { 
    return window.Sivel2Gen__ServConfig ?
        window.Sivel2Gen__ServConfig.mapaosmLatInicial : 4.6682
  }

  static get MapaOSMLongInicial() {
    return window.Sivel2Gen__ServConfig ?
        window.Sivel2Gen__ServConfig.mapaosmLongInicial : -74.071
  }

  // Responde a boton para crear copia de víctima
  static crearCopiaDeVictima(obj, fobj) {
    let div_victima = obj.parentElement.parentElement;
    let valores_input= []
    let valores_select= []
    div_victima.querySelectorAll('input').forEach(elem => {
      if(elem.type != "hidden" && elem.type != 'submit' && 
        !elem.id.includes('personados') && !elem.classList.contains('chosen-search-input')){
        valores_input.push(elem.value)
      }
    });
    div_victima.querySelectorAll('select').forEach(elem => {
      if(elem.type != "hidden" && elem.type != 'submit' && 
        !elem.id.includes('personados') && !elem.id.includes('persona_trelacion1')){
        console.log([elem.value, elem.type, elem.id])
        if(elem.multiple){
          let opciones = elem.options
          let valores_multi= []
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
      }
    });
    event.preventDefault(); // Evita el comportamiento predeterminado del link.

    // Encuentra el botón de "Agregar Combatiente"
    const agregarBoton = document.querySelector('#agregar-victima');

    if (!agregarBoton) {
      console.error("No se encontró el botón de agregar víctima.");
      return;
    }

    // Encuentra el formulario que contiene el botón
    const form = agregarBoton.closest('form');

    if (!form) {
      console.error("No se encontró el formulario asociado.");
      return;
    }

    // Envía el formulario usando el botón actual
    form.requestSubmit(agregarBoton);
    const mensajeElement = document.getElementById('mensaje-copia-vic');
    mensajeElement.style.display = 'block'; // Mostrar el mensaje antes de setTimeout()

    setTimeout(() =>{
      let victimas = document.querySelector("#victimas_frame").querySelectorAll(".seccionvictima")
      let vic_agregado = victimas[victimas.length- 1]
      let indice_tipo_input = 0; 
      vic_agregado.querySelectorAll('input').forEach((elem, i) => {
        if(i >= 0 && i !=35){
          if(elem.type != "hidden" && elem.type != 'submit' &&
            !elem.id.includes('personados') && !elem.classList.contains('chosen-search-input')){
            elem.value = valores_input[indice_tipo_input]
            elem.dispatchEvent(new Event('input'));
            indice_tipo_input += 1;
          }
        }
      })
      let indice_tipo_select = 0; 
      vic_agregado.querySelectorAll('select').forEach((elem, i) => {
        if(i >= 0 && i !=35){
          if(elem.type != "hidden" && elem.type != 'submit' && !elem.id.includes('personados')){
            if(elem.multiple){
              for(const val of valores_select[indice_tipo_select]){
                for (const opc of elem.options) {
                  if(opc.value == val){
                    opc.selected = true;
                  }
                }
              }
            }
            else{
              elem.value = valores_select[indice_tipo_select]
            }
            indice_tipo_select += 1;
          }
        }
      })
      mensajeElement.style.display = 'none'; 
      }
    , 7000);
    return false;
  }

  // Responde a botón para crear copia de combatiente
  static crearCopiaDeCombatiente(obj, fobj){
    let div_combatiente = obj.parentElement.parentElement;
    let valores_input= []
    let valores_select= []
    div_combatiente.querySelectorAll('input').forEach(elem => {
      valores_input.push(elem.value)
    });
    div_combatiente.querySelectorAll('select').forEach(elem => {
      if (elem.multiple) {
        let opciones = elem.options
        let valores_multi= []
        for (const opc of opciones) {
          if(opc.selected) {
            valores_multi.push(opc.value)
          }
        }
        valores_select.push(valores_multi)
      }
      else{
        valores_select.push(elem.value)
      }
    });
    event.preventDefault(); // Evita el comportamiento predeterminado del link.

    // Encuentra el botón de "Agregar Combatiente"
    const agregarBoton = document.querySelector('#agregar-combatiente');

    if (!agregarBoton) {
      console.error("No se encontró el botón de agregar combatiente.");
      return;
    }

    // Encuentra el formulario que contiene el botón
    const form = agregarBoton.closest('form');

    if (!form) {
      console.error("No se encontró el formulario asociado.");
      return;
    }

    // Envía el formulario usando el botón actual
    form.requestSubmit(agregarBoton);
    const mensajeElement = document.getElementById('mensaje-copia-com');
    mensajeElement.style.display = 'block'; // Mostrar el mensaje antes de setTimeout()
    setTimeout(() =>{
      let combatientes = document.querySelector("#combatientes").
        querySelectorAll(".seccioncombatiente")
      let comb_agregado = combatientes[combatientes.length- 1]
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
      mensajeElement.style.display = 'none'; 
      }
    , 1000);
    return false
  }


}


