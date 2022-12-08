
export default class Sivel2GenAutocompletaAjaxFamiliares {
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
    const divcpf = eorig.target.closest('.' + 
      Sivel2GenAutocompletaAjaxFamiliares.claseEnvoltura)
    if (divcpf == null) {
      window.alert('No se ubico ' +
        Sivel2GenAutocompletaAjaxFamiliares.claseEnvoltura)
      return
    }
    const campo_oculto = $(eorig.target.closest(".seccionvictima")).find(".caso_victima_id").find("input[id^=caso_victima_attributes][id$=id]")[0]
    const elemIdVictima = campo_oculto.value
    const elemIdVictimaCocoon = campo_oculto.id.split("_")[3]
    const elemIdFamiliar = divcpf.querySelector('input')
    if (elemIdVictima == null) {
      window.alert('No se ubico id de la víctima')
      return
    }
    const id_victima = elemIdVictima
    const id_trelacion1 = elemIdFamiliar.id.split("_")[9]
    caso = $("form")[0].id.split("_")[2]
    let d = 'id_persona=' + idPersona
    d += "&id_victima=" + id_victima + "&id_trelacion1=" + id_trelacion1
    d += "&id_caso=" + caso
    d += "&id_victcocoon=" + elemIdVictimaCocoon
    console.log(d)
    const a = root.puntomontaje + 'personas/remplazarfamiliar'
    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' + Sivel2GenAutocompletaAjaxFamiliares.claseEnvoltura)
        let r = resp.querySelector('.' + Sivel2GenAutocompletaAjaxFamiliares.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
      },
      error: (resp, estado, xhr) => {
        window.alert('Error con ajax ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("Sivel2GenAutocompletaAjaxFamiliares")
    let url = window.puntomontaje + 'personas.json'
    var asistentes = new window.AutocompletaAjaxExpreg(
      [
      /^caso_victima_attributes_[0-9]*_persona_attributes_persona_trelacion1_attributes_[0-9]*_personados_attributes_nombres$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_persona_trelacion1_attributes_[0-9]*_personados_attributes_apellidos$/,
        /^caso_victima_attributes_[0-9]*_persona_attributes_persona_trelacion1_attributes_[0-9]*_personados_attributes_numerodocumento$/ ],
      url,
      Sivel2GenAutocompletaAjaxFamiliares.idDatalist,
      Sivel2GenAutocompletaAjaxFamiliares.operarElegida
    )
    asistentes.iniciar()
  }

}

// Sobrellevamos imposibilidad de hacer static claseEnvoltura y
// static idDatalist dentro de la clase Sivel2GenAutocompletaAjaxFamiliares asi:
Sivel2GenAutocompletaAjaxFamiliares.claseEnvoltura = 'campos_personados'
Sivel2GenAutocompletaAjaxFamiliares.idDatalist = 'fuente-familiares'
