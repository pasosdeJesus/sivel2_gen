
// REEMPLAZOS DE FUNCIONES EN JQUERY

// Función para remplazar wrapAll de jQuery
// Adaptada de https://www.py4u.net/discuss/974438
function envolverTodos(objetivos, envolvente = document.createElement('div')) 
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
function desenvolver(objetivos) 
{
  if (objetivos != null) {
    [ ...objetivos].forEach(objetivo => {
      objetivo.parentElement.replaceWith(objetivo)
    })
  }
  return
}

// Deseleccionar todas las opciones de un cuadro de selección con la id dada
function csDeseleccionarTodas(id) {
  document.querySelectorAll("#"+ id + " option:checked").
    forEach( op => op.selected = false )
  let el = document.querySelector('#'+id)
  if (el) {
    el.dispatchEvent(new Event("chosen:updated"));
  }
}

// Seleccionar todas las opciones de un cuadro de selección con la id dada
function csSeleccionarTodasSinSpan(id) {
  document.querySelectorAll("#"+ id + " option").
    forEach( op => op.selected = true )
  document.querySelectorAll("#"+ id + " span option").
    forEach( op => op.selected = false )
  let el = document.querySelector('#'+id)
  if (el) {
    el.dispatchEvent(new Event("chosen:updated"));
  }
}

console.log("* En sivel2_gen/motor2.js creando escuchadores de eventos")

// FILTRO DE CATEGORÍAS
document.addEventListener('change', function(e) {
  if (typeof(e.target.id)=='string') {
    switch (e.target.id) {
        // Radio Ninguno/Todos
      case 'filtro_mostrar_cats_0':
        csDeseleccionarTodas('filtro_categoria')
        break;
      case 'filtro_mostrar_cats_1':
        csSeleccionarTodasSinSpan('filtro_categoria')
        break;

        // Cuadro de Selección Tipo de Violencia
      case 'filtro_tviolencia_id':
        fc = document.querySelector("#filtro_categoria")
        tviolencia = document.querySelector("#filtro_tviolencia_id option:checked").text
        filtro = "optgroup[label='".concat(tviolencia).concat("']")
        csDeseleccionarTodas('filtro_categoria')
        val = e.target.value
        desenvolver(document.querySelectorAll('span > optgroup'))
        if (val != '') {
          envolverTodos(document.querySelectorAll('optgroup:not([label="' + 
            tviolencia + '"])'), document.createElement('span')) 
        }
        csSeleccionarTodasSinSpan('filtro_categoria')
        rb = document.querySelector('#filtro_mostrar_cats_1')
        if (rb) {
          rb.checked = true
        }
        if (fc) {
          fc.dispatchEvent(new Event("chosen:updated"));
        }
        break;

      default:
        console.log(e.target.id)
    }
  }
})

function sivel2genManejarCambioCategorias() {
  algunas = document.querySelector('#filtro_mostrar_cats_2')
  ninguna = document.querySelector('#filtro_mostrar_cats_0')
  todas = document.querySelector('#filtro_mostrar_cats_1')
  fc = document.querySelector('#filtro_categoria')
  op_totales = fc.options.length
  op_sel = fc.querySelectorAll("option:checked").length
  if (op_sel == 0) {
    ninguna.checked = true
  } else if (op_sel == op_totales) {
    todas.checked = true
  } else {
    algunas.checked = true
  }
}

// DEPENDIENDO DE JQUERY DEBIDO A CHOSEN
$(document).on('change', '#filtro_categoria', function(e) {

  // Se ha intentado sin exito:
  // document.querySelector('#filtro_categoria').dispatchEvent(new Event("change"));
  // No entra en recursión ni llama al otro
  sivel2genManejarCambioCategorias()
})

