
export default class Sivel2GenAutocompletaAjaxVictimas {
  /* No usamos constructor ni this porque en operaElegida sería
   * del objeto AutocompletaAjaxExpreg y no esta clase.
   * Más bien en esta todo static
   */

  // Elije una persona en autocompletación
  static operarElegida (eorig, cadpersona, id, otrosop) {
    let root = window
    msip_arregla_puntomontaje(root)
    const cs = id.split(';')
    const idPersona = cs[0]
    const divcp = eorig.target.closest('.' + 
      Sivel2GenAutocompletaAjaxVictimas.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubico ' +
        Sivel2GenAutocompletaAjaxVictimas.claseEnvoltura)
      return
    }
    const elemIdCaso = divcp.parentElement.querySelector('.caso_id')
    if (elemIdCaso == null) {
      window.alert('No se ubico .caso_id')
      return
    }
    const idCaso = elemIdCaso.value
    let d = 'persona_id=' + idPersona
    d += "&caso_id=" + idCaso
    const a = root.puntomontaje + 'personas/remplazar'
    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' + Sivel2GenAutocompletaAjaxVictimas.claseEnvoltura)
        let r = resp.querySelector('.' + Sivel2GenAutocompletaAjaxVictimas.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
        document.dispatchEvent(new Event('sivel2_gen:autocompletada-victima'))
      },
      error: (resp, estado, xhr) => {
        window.alert('Error: ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("Sivel2GenAutocompletaAjaxVictimas")
    let url = window.puntomontaje + 'personas.json'
    var asistentes = new window.AutocompletaAjaxExpreg(
      [ /^caso_victima_attributes_[0-9]*_persona_attributes_nombres$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_apellidos$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_numerodocumento$/ ],
      url,
      Sivel2GenAutocompletaAjaxVictimas.idDatalist,
      Sivel2GenAutocompletaAjaxVictimas.operarElegida
    )
    asistentes.iniciar()
  }

}

// Sobrellevamos imposibilidad de hacer static claseEnvoltura y
// static idDatalist dentro de la clase Sivel2GenAutocompletaAjaxVictimas asi: 
Sivel2GenAutocompletaAjaxVictimas.claseEnvoltura = 'campos-persona-con-victima-id'
Sivel2GenAutocompletaAjaxVictimas.idDatalist = 'fuente-victimas'
