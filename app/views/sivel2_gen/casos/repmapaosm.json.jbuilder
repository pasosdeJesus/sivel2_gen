# frozen_string_literal: true

sol = ['sivel2_gen_conscaso.caso_id']
if params && params[:filtro]
  if params[:filtro][:inc_ubicaciones]
    sol << 'msip_ubicacion.latitud'
    sol << 'msip_ubicacion.longitud'
  end
  if params[:filtro][:inc_ubicaciones].to_i == 2
    sol << 'msip_departamento.nombre'
    sol << 'msip_municipio.nombre'
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

cond = "FALSE"
cond2 = "NULL"
if @conscaso.count > 0
    cond = "sivel2_gen_conscaso.caso_id IN (#{@conscaso.pluck(:caso_id).join(",")})"
end
if @conscaso.count > 0
    cond2 = "#{@conscaso.pluck(:caso_id).join(",")}"
end

cons = 'SELECT '+ sol.join(", ") + ' FROM sivel2_gen_conscaso ' +
    'JOIN sivel2_gen_caso as caso ' +
    'ON caso.id=sivel2_gen_conscaso.caso_id ' +
    'LEFT JOIN msip_ubicacion ON msip_ubicacion.id=caso.ubicacion_id ' +
    'LEFT JOIN msip_departamento ON msip_departamento.id=msip_ubicacion.departamento_id ' +
    'LEFT JOIN msip_municipio ON msip_municipio.id=msip_ubicacion.municipio_id ' +
    'WHERE ' + cond +
    ' AND msip_ubicacion.latitud IS NOT NULL '+ 
    'AND msip_ubicacion.longitud IS NOT NULL;'

pl = Sivel2Gen::ConteosHelper.calcularCasos(sol, cond)

pl2 = Sivel2Gen::ConteosHelper.calcularActos(cond2)

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

datos = {
          "casos": pl2[0],
          "victimas": pl2[1],
          "actos": pl2[2],
          "victimizaciones": pl2[3],
          "respuesta": r.to_h
          }
json.merge!(datos)
