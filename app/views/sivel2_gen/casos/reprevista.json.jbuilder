# frozen_string_literal: true

sol = [:caso_id]
if params && params[:filtro]
  if params[:filtro][:inc_ubicaciones]
    sol << 'sip_ubicacion.latitud'
    sol << 'sip_ubicacion.longitud'
  end
  if params[:filtro][:inc_ubicaciones].to_i == 2
    sol << 'sip_departamento.nombre'
    sol << 'sip_municipio.nombre'
  end
  if params[:filtro][:inc_titulo]
    sol << :titulo
  end
  if params[:filtro][:inc_fecha]
    sol << 'sivel2_gen_conscaso.fecha'
  end
  if params[:filtro][:inc_memo].to_i == 2
    sol << :memo
  end
end
cons = @conscaso.joins('JOIN sivel2_gen_caso as caso ON caso.id=caso_id ' +
    'LEFT JOIN sip_ubicacion ON sip_ubicacion.id=caso.ubicacion_id ' +
    'LEFT JOIN sip_departamento ON sip_departamento.id=sip_ubicacion.id_departamento ' +
    'LEFT JOIN sip_municipio ON sip_municipio.id=sip_ubicacion.id_municipio '
    )
pl = cons.pluck(*sol)
r = pl.map {|l|
      h = {}
      if params && params[:filtro]
        p = 1
        if params[:filtro][:inc_ubicaciones]
          h.merge!(latitud: l[p].to_s)
          p += 1
          h.merge!(longitud: l[p].to_s)
          p += 1
        end
        if params[:filtro][:inc_ubicaciones].to_i == 2
          h.merge!(departamento: l[p].to_s)
          p += 1
          h.merge!(municipio: l[p].to_s)
          p += 1
        end
        if params[:filtro][:inc_titulo]
          h.merge!(titulo: l[p].to_s)
          p += 1
        end
        if params[:filtro][:inc_fecha]
          h.merge!(fecha: l[p].to_s)
          p += 1
        end
        if params[:filtro][:inc_memo].to_i == 2
          h.merge!(descripcion: l[p].to_s)
          p += 1
        end
      end
      [l[0], h]
    }
json.merge!(r.to_h)
