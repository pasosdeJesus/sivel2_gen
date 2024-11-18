export default class Sivel2Gen__AutocompletaAjaxColectivas {


  // Elije un grupo en autocompletación
  static operarElegida (eorig, cadgrupo, idGrupo, otrosop) {
    Msip__Motor.arreglarPuntomontaje()
    vicol_posicion = eorig.target.id.split("_")[3]
    const divcp = eorig.target.closest('.' +
        Sivel2Gen__AutocompletaAjaxColectivas.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubicó ' + 
          Sivel2Gen__AutocompletaAjaxColectivas.claseEnvoltura)
      return
    }

    const elemIdCaso = document.querySelector('#caso_id')
    if (elemIdCaso == null) {
      window.alert('No se ubico .caso_id')
      return
    }
    const idCaso = elemIdCaso.value
    let d = '&caso_id=' + idCaso
    d += '&grupoper_id=' + idGrupo
    d += "&vicol_posicion=" + vicol_posicion
    const a = window.puntoMontaje + 'gruposper/remplazar'
    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' +
          Sivel2Gen__AutocompletaAjaxColectivas.claseEnvoltura)

        let r = resp.querySelector('.' + Sivel2Gen__AutocompletaAjaxColectivas.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
      },
      error: (resp, estado, xhr) => {
        window.alert('Error: ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("AutocompletaAjaxColectivas en sivel2_gen")
    let url = window.puntoMontaje + 'gruposper.json'
    var aeColectivas = new window.AutocompletaAjaxExpreg(
      [ /^caso_victimacolectiva_attributes_[0-9]*_grupoper_attributes_nombre$/],
      url,
      Sivel2Gen__AutocompletaAjaxColectivas.idDatalist,
      Sivel2Gen__AutocompletaAjaxColectivas.operarElegida
    )
    aeColectivas.iniciar()
  }

}

Sivel2Gen__AutocompletaAjaxColectivas.claseEnvoltura =
  'campos-grupoper-con-victimacolectiva-id'
Sivel2Gen__AutocompletaAjaxColectivas.idDatalist = 'fuente-victimascolectivas'
