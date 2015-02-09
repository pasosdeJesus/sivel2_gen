# Completas campos con información geográfica que se carga con AJAX

#  Completa departamento
@llena_departamento = ($this) -> 
  idpais=$this.attr('id')
  iddep=idpais.replace('id_pais', 'id_departamento')
  idmun=idpais.replace('id_pais', 'id_municipio')
  idcla=idpais.replace('id_pais', 'id_clase')
  pais = $this.val()
  if (+pais > 0) 
      x = $.getJSON("/casos/lista", {tabla: 'departamento', id_pais: pais})
      x.done((data) -> 
          op = '<option value=""></option>'
          $.each( data, ( i, item ) -> 
              op += '<option value="' + 
                item.id + '">' + item.nombre + '</option>'
          )
          $("#" + iddep).html(op)
          $("#" + idmun).html('')
          $("#" + idcla).html('')
      )
      x.error((m1, m2, m3) -> 
          alert(
              'Problema leyendo Departamentos de ' + pais + ' ' + m1 + ' '
              + m2 + ' ' + m3)
      )
      par = {
          tabla: 'pais',
          id: pais
      }
      $("#" + iddep).attr("disabled", false)
  else
      $("#" + iddep).val("")
      $("#" + iddep).attr("disabled", true)
  if (idmun != '') 
      $("#" + idmun).val("")
      $("#" + idmun).attr("disabled", true)
  if (idcla != '') 
      $("#" + idcla).val("")
      $("#" + idcla).attr("disabled", true)


#  Completa municipio.
@llena_municipio = ($this) -> 
  iddep=$this.attr('id')
  idpais=iddep.replace('id_departamento', 'id_pais')
  idmun=iddep.replace('id_departamento', 'id_municipio')
  idcla=iddep.replace('id_departamento', 'id_clase')
  dep = $this.val()
  pais = $("#" + idpais ).val()
  if (+pais > 0 && +dep > 0) 
      x = $.getJSON("/casos/lista", {tabla: 'municipio', id_departamento: dep, id_pais: pais})
      x.done((data) -> 
          op = '<option value=""></option>'
          $.each( data, ( i, item ) -> 
              op += '<option value="' + 
                item.id + '">' + item.nombre + '</option>'
          )
          $("#" + idmun ).html(op)
          $("#" + idcla).html('')
      )
      x.error((m1, m2, m3) -> 
          alert(
              'Problema leyendo Municipios de ' + dep + ' ' + m1 + ' '
              + m2 + ' ' + m3)
      )
      par = {
          tabla: 'departamento',
          id_pais: pais,
          id: dep
      }
      $("#" + idmun).attr("disabled", false)
  else
      $("#" + idmun).val("")
      $("#" + idmun).attr("disabled", true)
  if (idcla != '') 
      $("#" + idcla).val("")
      $("#" + idcla).attr("disabled", true)


# Completa cuadro de selección para clase de acuerdo a depto y mcpio.
@llena_clase = ($this) -> 
  iddep = "id_departamento"
  idcla = "id_clase"
  idmun = $this.attr('id')
  idpais = idmun.replace('id_municipio', 'id_pais')
  iddep = idmun.replace('id_municipio', 'id_departamento')
  idcla = idmun.replace('id_municipio', 'id_clase')
  sincoord = false
  pais = +$("#" + idpais).val();
  dep = +$("#" + iddep).val();
  mun = +$("#" + idmun).val();
  par = {
    tabla: 'clase',
    id_pais: pais,
    id_departamento: dep,
    id_municipio: mun,
  };
  if (+pais > 0 && +dep > 0 && +mun > 0) 
    x = $.getJSON("/casos/lista", par)
    x.done( ( data ) ->
      op = '<option value=""></option>';
      $.each( data, ( i, item ) ->
        op += '<option value="' + item.id + '">' + item.nombre + '</option>';
      )
      $("#" + idcla).html(op);
    )
    x.error( (m1, m2, m3) ->
      alert('Problema leyendo Clase ' + x + m1 + m2 + m3)
    )
    par = {
        tabla: 'municipio',
        id_pais: pais,
        id_departamento: dep,
        id: mun,
    }
  #if (sincoord != true) 
  #  poneCoord(par);
  if (pais == 0 || dep == 0 || mun == 0) 
    $("#" + idcla).attr("disabled", true);
  else 
    $("#" + idcla).attr("disabled", false);

