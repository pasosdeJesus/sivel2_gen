export default class Sivel2Gen__AutocompletaAjaxVictimas {
  /* No usamos constructor ni this porque en operaElegida sería
   * del objeto AutocompletaAjaxExpreg y no esta clase.
   * Más bien en esta todo static
   */

  // Elije una persona en autocompletación
  static operarElegida (eorig, cadpersona, id, otrosop) {
    Msip__Motor.arreglarPuntomontaje()
    vic_position = eorig.target.id.split("_")[3]
    const cs = id.split(';')
    const idPersona = cs[0]
    const divcp = eorig.target.closest('.' + 
      Sivel2Gen__AutocompletaAjaxVictimas.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubico ' +
        Sivel2Gen__AutocompletaAjaxVictimas.claseEnvoltura)
      return
    }
    const elemIdCaso = document.querySelector('#caso_id')
    if (elemIdCaso == null) {
      window.alert('No se ubico #caso_id')
      return
    }
    const idCaso = elemIdCaso.value
    let d = 'persona_id=' + idPersona
    d += '&caso_id=' + idCaso
    d += "&vic_position=" + vic_position
    const a = window.puntoMontaje + 'personas/remplazar'
    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' + Sivel2Gen__AutocompletaAjaxVictimas.claseEnvoltura)
        let r = resp.querySelector('.' + Sivel2Gen__AutocompletaAjaxVictimas.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
      },
      error: (resp, estado, xhr) => {
        window.alert('Error: ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("Sivel2Gen__AutocompletaAjaxVictimas")
    let url = window.puntoMontaje + 'personas.json'
    var asistentes = new window.AutocompletaAjaxExpreg(
      [ /^caso_victima_attributes_[0-9]*_persona_attributes_nombres$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_apellidos$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_numerodocumento$/ ],
      url,
      Sivel2Gen__AutocompletaAjaxVictimas.idDatalist,
      Sivel2Gen__AutocompletaAjaxVictimas.operarElegida
    )
    asistentes.iniciar()
  }

}

// Sobrellevamos imposibilidad de hacer static claseEnvoltura y
// static idDatalist dentro de la clase Sivel2Gen__AutocompletaAjaxVictimas asi: 
Sivel2Gen__AutocompletaAjaxVictimas.claseEnvoltura = 'campos-persona-con-victima-id'
Sivel2Gen__AutocompletaAjaxVictimas.idDatalist = 'fuente-victimas'
