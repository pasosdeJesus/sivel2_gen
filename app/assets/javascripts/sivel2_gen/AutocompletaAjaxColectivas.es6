export default class Sivel2GenAutocompletaAjaxColectivas {


  // Elije un grupo en autocompletación
  static operarElegida (eorig, cadgrupo, idGrupo, otrosop) {
    let root = window
    window.msip_arregla_puntomontaje(root)
    vicol_position = eorig.target.id.split("_")[3]
    const divcp = eorig.target.closest('.' +
        Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubicó ' + 
          Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura)
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
    d += "&vicol_position=" + vicol_position
    const a = root.puntomontaje + 'gruposper/remplazar'
    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.' +
          Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura)

        let r = resp.querySelector('.' + Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura)
        divcp.innerHTML=r.innerHTML
      },
      error: (resp, estado, xhr) => {
        window.alert('Error: ' + resp)
      }
    })
  }

  static iniciar() {
    console.log("AutocompletaAjaxColectivas en sivel2_gen")
    let url = window.puntomontaje + 'gruposper.json'
    var aeColectivas = new window.AutocompletaAjaxExpreg(
      [ /^caso_victimacolectiva_attributes_[0-9]*_grupoper_attributes_nombre$/],
      url,
      Sivel2GenAutocompletaAjaxColectivas.idDatalist,
      Sivel2GenAutocompletaAjaxColectivas.operarElegida
    )
    aeColectivas.iniciar()
  }

}

Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura =
  'campos-grupoper-con-victimacolectiva-id'
Sivel2GenAutocompletaAjaxColectivas.idDatalist = 'fuente-victimascolectivas'
