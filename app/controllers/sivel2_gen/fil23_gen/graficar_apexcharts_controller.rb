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

        @vic_dep = (params[:filtro] ? params[:filtro][:departamentos] : Sip::Departamento.habilitados.pluck(:id)) - [""]
        @categorias = Sivel2Gen::Categoria.from(
          'sivel2_gen_categoria, sivel2_gen_supracategoria').
          where('sivel2_gen_supracategoria.id=sivel2_gen_categoria.supracategoria_id 
              AND sivel2_gen_categoria.fechadeshabilitacion is NULL 
              AND sivel2_gen_categoria.tipocat=\'I\'').
              reorder('sivel2_gen_supracategoria.id_tviolencia', :id).pluck(:nombre).uniq 
        @vic_categorias = (params[:filtro] ? params[:filtro][:categorias] : @categorias) - [""]
        @vic_sexo = (params[:filtro] ? params[:filtro][:sexo] : Sip::Persona::SEXO_OPCIONES.map{|se| se[1].to_s}) - [""]

        def consulta_gen(desagregado, filtros)
          "select caso.fecha as fecha_caso, count(*) as total from cvt1 
          JOIN sivel2_gen_caso as caso ON caso.id=id_caso 
          JOIN sip_persona AS persona ON persona.id=id_persona
          JOIN sip_ubicacion as ubi ON ubi.id=caso.ubicacion_id
          JOIN sivel2_gen_categoria AS categoria ON categoria.id=id_categoria
          WHERE #{desagregado} 
          AND caso.fecha >='" + @vic_fechaini + "'
          AND caso.fecha <='" + @vic_fechafin + "'
          #{filtros} 
          GROUP BY fecha_caso ORDER BY fecha_caso;"
        end

        def consulta_totsex
          "select persona.sexo as sexo_persona, count(*) as total from cvt1
          JOIN sip_persona AS persona ON persona.id=id_persona 
          GROUP BY sexo_persona 
          ORDER BY persona.sexo='S', persona.sexo='M', persona.sexo='F';"
        end

        def consulta_totcat
          "select categoria.nombre as categoria_nom, count(*) as total from cvt1
          JOIN sivel2_gen_categoria AS categoria ON categoria.id=id_categoria
          GROUP BY categoria_nom;"
        end

        def consulta_totdep
          "select departamento.nombre as departamento_nombre, count(*) as total from cvt1
          JOIN sivel2_gen_caso as caso ON caso.id=id_caso 
          JOIN sip_ubicacion as ubi ON ubi.id=caso.ubicacion_id
          JOIN sip_departamento as departamento ON departamento.id=ubi.id_departamento
          GROUP BY departamento_nombre;"
        end

        def graficar_sexo
          series_gen= []
          if (@vic_dep.count == 0) || (@vic_categorias.count == 0)
            flash.now[:info] = "Uno de los filros se encuentra vacío"
          else
            Sip::Persona::SEXO_OPCIONES.each do |sexo|
              desagr = "persona.sexo ='#{sexo[1].to_s}'" 
              filtros= ""
              filtros << "
              AND ubi.id_departamento IN (#{(@vic_dep).join(', ')})" if @vic_dep.count >= 1
              filtros << "
              AND categoria.nombre IN (" + (@vic_categorias).map{|k| "'" + k + "'"}.join(', ') + ")" if @vic_categorias.count >= 1
              valores_sex = ActiveRecord::Base.connection.execute(consulta_gen(desagr, filtros)).values.to_h 
              presex = {name: sexo[0], data: valores_sex}
              series_gen.push(presex)
            end
          end
          return series_gen
        end 

        if params[:filtro]
          if params[:filtro][:desagregar] == 'Sexo' 
            series_gen = graficar_sexo
            sexos = Sip::Persona::SEXO_OPCIONES.to_h.invert
            valores = ActiveRecord::Base.connection.execute(consulta_totsex).values.to_h
            @valores_tot= valores.to_a.map{|k| [sexos[k[0].to_sym], k[1]]}.to_h
            @opciones_tot = {
              titulo: 'Victimizaciones por sexo',
              ejex: 'Sexo',
              ejey: 'Victimizaciones'
            }
          end
          if params[:filtro][:desagregar] == 'Departamento' 
            series_gen= []
            deps = Sip::Departamento.habilitados
            if (@vic_sexo.count == 0) || (@vic_categorias.count == 0)
              flash.now[:info] = "Uno de los filtros se encuentra vacío"
            else
              deps.each do |dep|
                desagr = "ubi.id_departamento ='#{dep.id}'"
                filtros = ""
                filtros << ("
                  AND persona.sexo IN (" + (@vic_sexo).map{|k| "'" + k + "'"}.join(', ') + ")") if @vic_sexo.count >= 1
                filtros << ("
                  AND categoria.nombre IN (" + (@vic_categorias).map{|k| "'" + k + "'"}.join(', ') + ")") if @vic_categorias.count >= 1
                valores_dep = ActiveRecord::Base.connection.execute(consulta_gen(desagr, filtros)).values.to_h 
                predep = {name: dep.nombre, data: valores_dep}
                series_gen.push(predep)
              end
            end
            @valores_tot = ActiveRecord::Base.connection.execute(consulta_totdep).values.to_h
            @opciones_tot = {
              titulo: 'Victimizaciones por departamento',
              ejex: 'Departamentos',
              ejey: 'Victimizaciones'
            }
          end

          if params[:filtro][:desagregar] == 'Categoria' 
            series_gen= []
            if (@vic_dep.count == 0) || (@vic_sexo.count == 0)
              flash.now[:info] = "Uno de los filtros se encuentra vacío"
            else
              @categorias.each do |cat|
                desagr = "categoria.nombre ='#{cat}'"
                filtros= ""
                filtros << "
                  AND ubi.id_departamento IN (#{(@vic_dep).join(', ')})" if @vic_dep.count >= 1 
                filtros << ("
                  AND persona.sexo IN (" + (@vic_sexo).map{|k| "'" + k + "'"}.join(', ') + ')') if @vic_sexo.count >= 1  
                valores_cat = ActiveRecord::Base.connection.execute(consulta_gen(desagr, filtros)).values.to_h 
                precat = {name: cat, data: valores_cat}
                series_gen.push(precat)
              end
            end
            @valores_tot = ActiveRecord::Base.connection.execute(consulta_totcat).values.to_h
            @opciones_tot = {
              titulo: 'Victimizaciones por Categorías de violencia',
              ejex: 'Categorías de violencia',
              ejey: 'Victimizaciones'
            }
          end
        else 
          series_gen = graficar_sexo
          sexos = Sip::Persona::SEXO_OPCIONES.to_h.invert
          valores = ActiveRecord::Base.connection.execute(consulta_totsex).values.to_h
          @valores_tot= valores.to_a.map{|k| [sexos[k[0].to_sym], k[1]]}.to_h 
          @opciones_tot = {
            titulo: 'Victimizaciones por sexo',
            ejex: 'Sexo',
            ejey: 'Victimizaciones'
          }
        end


        render 'fil23_gen/graficar_apexcharts/victimizaciones_individuales', locals: {series_gen: series_gen},  
          layout: 'application'
      end
    end
  end
end
