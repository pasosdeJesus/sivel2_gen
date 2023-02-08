export default class Sivel2GenAutocompletaAjaxColectivas {


  // Elije un grupo en autocompletación
  static operarElegida (eorig, cadgrupo, idGrupo, otrosop) {
    let root = window
    window.msip_arregla_puntomontaje(root)
    const divcp = eorig.target.closest('.' +
        Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubicó ' + 
          Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura)
      return
    }
    
    const elemIdColectivo = divcp.parentElement.querySelector(
        '.caso_victimacolectiva_id').querySelector('input')
    if (elemIdColectivo== null) {
      window.alert('No se ubico .caso_victimacolectiva_id')
      return
    }
    const idColectivo = elemIdColectivo.value

    let d = 'id_victimacolectiva=' + idColectivo
    d += '&id_grupoper=' + idGrupo
    const a = root.puntomontaje + 'gruposper/remplazar'

    window.Rails.ajax({
      type: 'GET',
      url: a,
      data: d,
      success: (resp, estado, xhr) => {
        const divcp = eorig.target.closest('.campos_grupoper')

        let r = resp.querySelector('.campos_grupoper')
        divcp.innerHTML=r.innerHTML
        document.dispatchEvent(new Event('sivel2_gen:autocompleto_grupoper',
          [idColectivo, idGrupo]))
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

Sivel2GenAutocompletaAjaxColectivas.claseEnvoltura = 'nested-fields'
Sivel2GenAutocompletaAjaxColectivas.idDatalist = 'fuente-victimascolectivas'
