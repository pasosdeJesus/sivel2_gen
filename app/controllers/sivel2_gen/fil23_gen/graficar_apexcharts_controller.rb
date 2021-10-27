# Grafica con Apexcharts

module Sivel2Gen
  module Fil23Gen
    class GraficarApexchartsController < ApplicationController

      # Control de acceso no estandar en función

      def victimizaciones_individuales
        authorize! :contar, Sivel2Gen::Caso

        ## Valores de los filtros
        @vic_fechaini = params[:filtro] ? Sip::FormatoFechaHelper.fecha_local_estandar(params[:filtro][:fechaini]) : "1998-01-01"
        @vic_fechafin = params[:filtro] ? Sip::FormatoFechaHelper.fecha_local_estandar(params[:filtro][:fechafin]) : "2020-12-31"

        @vic_dep = params[:filtro] ? params[:filtro][:departamentos] : Sip::Departamento.habilitados.pluck(:id)
        @categorias = Sivel2Gen::Categoria.from(
          'sivel2_gen_categoria, sivel2_gen_supracategoria').
          where('sivel2_gen_supracategoria.id=sivel2_gen_categoria.supracategoria_id 
              AND sivel2_gen_categoria.fechadeshabilitacion is NULL 
              AND sivel2_gen_categoria.tipocat=\'I\'').
              reorder('sivel2_gen_supracategoria.id_tviolencia', :id).pluck(:nombre).uniq 
        @vic_categorias = params[:filtro] ? params[:filtro][:categorias] : @categorias
        filtro_sexo = params[:filtro] ? params[:filtro][:sexo] : Sip::Persona::SEXO_OPCIONES.map{|se| se[1].to_s}
        @vic_sexo = filtro_sexo == "" ? ["S", "M", "H"] : filtro_sexo
        ## Consulta para desagregar por Sexo
        def consulta_sexo(sexo)
          "select caso.fecha as fecha_caso, count(*) as total from cvt1 JOIN sivel2_gen_caso as caso ON caso.id=id_caso 
          JOIN sip_persona AS persona ON persona.id=id_persona
          JOIN sip_ubicacion as ubi ON ubi.id=caso.ubicacion_id
          JOIN sivel2_gen_categoria AS categoria ON categoria.id=id_categoria
          WHERE persona.sexo ='#{sexo}' 
          AND caso.fecha >='" + @vic_fechaini + "'
          AND caso.fecha <='" + @vic_fechafin + "'
          AND ubi.id_departamento IN (#{(@vic_dep - ['']).join(', ')})
          AND categoria.nombre IN (" + (@vic_categorias - ['']).map{|k| "'" + k + "'"}.join(', ') + ")
          GROUP BY fecha_caso ORDER BY fecha_caso;"
        end

        ## Consulta para desagregar por Departamento
        def consulta_dep(dep_id)
          "select caso.fecha as fecha_caso, count(*) as total from cvt1 JOIN sivel2_gen_caso as caso ON caso.id=id_caso 
          JOIN sip_persona AS persona ON persona.id=id_persona
          JOIN sip_ubicacion as ubi ON ubi.id=caso.ubicacion_id
          JOIN sivel2_gen_categoria AS categoria ON categoria.id=id_categoria
          WHERE ubi.id_departamento ='#{dep_id}' 
          AND caso.fecha >='" + @vic_fechaini + "'
          AND caso.fecha <='" + @vic_fechafin + "'
          AND persona.sexo IN (" + (@vic_sexo - ['']).map{|k| "'" + k + "'"}.join(', ') + ")
          AND categoria.nombre IN (" + (@vic_categorias - ['']).map{|k| "'" + k + "'"}.join(', ') + ")
          GROUP BY fecha_caso ORDER BY fecha_caso;"
        end
        def consulta_totsex
          "select persona.sexo as sexo_persona, count(*) as total from cvt1
          JOIN sip_persona AS persona ON persona.id=id_persona 
          GROUP BY sexo_persona 
          ORDER BY persona.sexo='S', persona.sexo='M', persona.sexo='F';"
        end
        valores_m = ActiveRecord::Base.connection.execute(consulta_sexo('M')).values.to_h 
        valores_f = ActiveRecord::Base.connection.execute(consulta_sexo('F')).values.to_h 
        valores_s = ActiveRecord::Base.connection.execute(consulta_sexo('S')).values.to_h 
        @valores_totsex = ActiveRecord::Base.connection.execute(consulta_totsex).values.to_h

        if params[:filtro]
          if params[:filtro][:desagregar] == 'Sexo' 
              series_gen= [
                {name: "Hombres",
                 data: valores_m},
                {name: "Mujeres",
                 data: valores_f},
                {name: "Sin sexo",
                 data: valores_s}
              ]
          end
          if params[:filtro][:desagregar] == 'Departamento' 
            series_gen= []
            deps = Sip::Departamento.habilitados
            deps.each do |dep|
              valores_dep = ActiveRecord::Base.connection.execute(consulta_dep(dep.id)).values.to_h 
              predep = {name: dep.nombre, data: valores_dep}
              series_gen.push(predep)
            end
          end
        else 
          series_gen= []
        end

        render 'fil23_gen/graficar_apexcharts/victimizaciones_individuales', locals: {series_gen: series_gen},  
          layout: 'application'
      end
    end
  end
end
