export default class Sivel2Gen__AutocompletaAjaxFamiliares {
  /* No usamos constructor ni this porque en operaElegida sería
   * del objeto AutocompletaAjaxExpreg y no esta clase.
   * Más bien en esta todo static
   */


  // Elije una persona en autocompletación
  static operarElegida (eorig, cadpersona, id, otrosop) {
    vic_position = eorig.target.id.split("_")[3]
    fam_position = eorig.target.id.split("_")[9]
    Msip__Motor.arreglarPuntomontaje()
    const cs = id.split(';')
    const idPersona = cs[0]
    const divcpf = eorig.target.closest('.' + 
      Sivel2Gen__AutocompletaAjaxFamiliares.claseEnvoltura)
    if (divcpf == null) {
      window.alert('No se ubico ' +
        Sivel2Gen__AutocompletaAjaxFamiliares.claseEnvoltura)
      return
    }
    const campo_oculto = $(eorig.target.closest(".seccionvictima")).find(".campos-persona-con-victima-id").find(".caso_victima_id").find("input[id^=caso_victima_attributes][id$=id]")[0]
    const elemIdVictima = campo_oculto.value
    const elemIdFamiliar = divcpf.querySelector('input')
    const victima_id = elemIdVictima
    caso = $("form")[0].id.split("_")[2]
    let d = 'persona_id=' + idPersona
    d += "&victima_id=" + victima_id
    d += "&caso_id=" + caso
    d += "&vic_position=" + vic_position
    d += "&fam_position=" + fam_position
    console.log(d)
    const a = window.puntoMontaje + 'personas/remplazarfamiliar'
    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' + Sivel2Gen__AutocompletaAjaxFamiliares.claseEnvoltura)

        let r = resp.querySelector('.' + Sivel2Gen__AutocompletaAjaxFamiliares.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
      },
      error: (resp, estado, xhr) => {
        window.alert('Error con ajax ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("Sivel2Gen__AutocompletaAjaxFamiliares")
    let url = window.puntoMontaje + 'personas.json'
    var asistentes = new window.AutocompletaAjaxExpreg(
      [
      /^caso_victima_attributes_[0-9]*_persona_attributes_persona_trelacion1_attributes_[0-9]*_personados_attributes_nombres$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_persona_trelacion1_attributes_[0-9]*_personados_attributes_apellidos$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_persona_trelacion1_attributes_[0-9]*_personados_attributes_numerodocumento$/ ],
      url,
      Sivel2Gen__AutocompletaAjaxFamiliares.idDatalist,
      Sivel2Gen__AutocompletaAjaxFamiliares.operarElegida
    )
    asistentes.iniciar()
  }

}

// Sobrellevamos imposibilidad de hacer static claseEnvoltura y
// static idDatalist dentro de la clase Sivel2Gen__AutocompletaAjaxFamiliares asi:
Sivel2Gen__AutocompletaAjaxFamiliares.claseEnvoltura = 'campos_personados'
Sivel2Gen__AutocompletaAjaxFamiliares.idDatalist = 'fuente-familiares-victima'
