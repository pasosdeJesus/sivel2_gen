# frozen_string_literal: true

# Grafica con Apexcharts

module Sivel2Gen
  module Fil23Gen
    class GraficarApexchartsController < ApplicationController
      # Control de acceso no estandar en función

      def victimizaciones_individuales
        authorize!(:contar, Sivel2Gen::Caso)

        ## Valores de los filtros
        @vic_fechaini = if params[:filtro]
          Msip::FormatoFechaHelper.fecha_local_estandar(
            params[:filtro][:fechaini],
          )
        else
          Sivel2Gen::Caso.minimum(:fecha).to_s
        end
        @vic_fechafin = if params[:filtro]
          Msip::FormatoFechaHelper.fecha_local_estandar(
            params[:filtro][:fechafin],
          )
        else
          Sivel2Gen::Caso.maximum(:fecha).to_s
        end

        ldep = Msip::Departamento.habilitados.where(
          pais_id: Msip.paisomision,
        ).pluck(:id)
        @vic_dep = if params[:filtro] && params[:filtro][:departamento]
          ldep & params[:filtro][:departamento]
        else
          ldep
        end

        @categorias_gen = Sivel2Gen::Categoria.joins(
          "JOIN sivel2_gen_supracategoria ON " \
            "sivel2_gen_supracategoria.id=sivel2_gen_categoria.supracategoria_id ",
        )
          .where('sivel2_gen_categoria.fechadeshabilitacion is NULL
              AND sivel2_gen_categoria.tipocat=\'I\'')
          .reorder("sivel2_gen_supracategoria.tviolencia_id", :id)
        @categorias = @categorias_gen.pluck(:id).uniq
        @vic_categorias = if params[:filtro] && params[:filtro][:categorias]
          @categorias & params[:filtro][:categorias].map(&:to_i)
        else
          @categorias
        end

        lsexo = Msip::Persona.sexo_opciones.map { |se| se[1].to_s }
        @vic_sexo = if params[:filtro] && params[:filtro][:sexo]
          lsexo & params[:filtro][:sexo]
        else
          lsexo
        end

        def consulta_gen(desagregado, filtros)
          "SELECT caso.fecha AS fecha_caso, count(*) AS total FROM cvt1
          JOIN sivel2_gen_caso AS caso ON caso.id=cvt1.caso_id
          JOIN msip_persona AS persona ON persona.id=persona_id
          JOIN msip_ubicacion AS ubi ON ubi.id=caso.ubicacion_id
          JOIN sivel2_gen_categoria AS categoria ON categoria.id=categoria_id
          WHERE #{desagregado}
          AND caso.fecha >='" + @vic_fechaini + "'
          AND caso.fecha <='" + @vic_fechafin + "'
          #{filtros}
          GROUP BY 1 ORDER BY fecha_caso;"
        end

        def consulta_totsex
          "SELECT persona.sexo AS sexo_persona, COUNT(*) AS total FROM cvt1
          JOIN msip_persona AS persona ON persona.id=persona_id
          GROUP BY 1
          ORDER BY persona.sexo='#{Msip::Persona.convencion_sexo[:sexo_sininformacion]}',
          persona.sexo='#{Msip::Persona.convencion_sexo[:sexo_masculino]}',
          persona.sexo='#{Msip::Persona.convencion_sexo[:sexo_femenino]}';"
        end

        def consulta_totcat
          "SELECT categoria.nombre AS categoria_nom, COUNT(*) AS total
          FROM cvt1
          JOIN sivel2_gen_categoria AS categoria ON categoria.id=categoria_id
          GROUP BY 1;"
        end

        def consulta_totdep
          "SELECT departamento.nombre AS departamento_nombre, COUNT(*) AS total
          FROM cvt1
          JOIN sivel2_gen_caso as caso ON caso.id=cvt1.caso_id
          JOIN msip_ubicacion as ubi ON ubi.id=caso.ubicacion_id
          JOIN msip_departamento as departamento ON departamento.id=ubi.departamento_id
          GROUP BY 1;"
        end

        def graficar_sexo
          series_gen = []
          if (@vic_dep.count == 0) || (@vic_categorias.count == 0)
            flash.now[:info] = "Uno de los filros se encuentra vacío"
          else
            Msip::Persona.sexo_opcoines.each do |sexo|
              desagr = "persona.sexo ='#{sexo[1]}'"
              filtros = ""
              filtros << "
              AND ubi.departamento_id IN (#{@vic_dep.join(", ")})" if @vic_dep.count >= 1
              filtros << "
              AND categoria.id IN (#{@vic_categorias.join(", ")})" if @vic_categorias.count >= 1
              valores_sex = ActiveRecord::Base.connection.execute(consulta_gen(desagr, filtros)).values.to_h
              presex = { name: sexo[0], data: valores_sex }
              series_gen.push(presex)
            end
          end
          series_gen
        end

        if params[:filtro]
          if params[:filtro][:desagregar] == "Sexo"
            series_gen = graficar_sexo
            sexos = Msip::Persona.sexo_opciones.to_h.invert
            valores = ActiveRecord::Base.connection.execute(consulta_totsex).values.to_h
            @valores_tot = valores.to_a.map { |k| [sexos[k[0].to_sym], k[1]] }.to_h
            @opciones_tot = {
              titulo: "Victimizaciones por sexo",
              ejex: "Sexo",
              ejey: "Victimizaciones",
            }
          end
          if params[:filtro][:desagregar] == "Departamento"
            series_gen = []
            deps = Msip::Departamento.habilitados.where(
              pais_id: Msip.paisomision,
            )
            if (@vic_sexo.count == 0) || (@vic_categorias.count == 0)
              flash.now[:info] = "Uno de los filtros se encuentra vacío"
            else
              deps.each do |dep|
                desagr = "ubi.departamento_id ='#{dep.id}'"
                filtros = ""
                filtros << ("
                  AND persona.sexo IN (" + @vic_sexo.map { |k| "'" + k + "'" }.join(", ") + ")") if @vic_sexo.count >= 1
                filtros << ("
                  AND categoria.id IN (" + @vic_categorias.join(", ") + ")") if @vic_categorias.count >= 1
                valores_dep = ActiveRecord::Base.connection.execute(consulta_gen(desagr, filtros)).values.to_h
                predep = { name: dep.nombre, data: valores_dep }
                series_gen.push(predep)
              end
            end
            @valores_tot = ActiveRecord::Base.connection.execute(
              consulta_totdep,
            ).values.to_h
            @opciones_tot = {
              titulo: "Victimizaciones por departamento",
              ejex: "Departamentos",
              ejey: "Victimizaciones",
            }
          end

          if params[:filtro][:desagregar] == "Categoria"
            series_gen = []
            if (@vic_dep.count == 0) || (@vic_sexo.count == 0)
              flash.now[:info] = "Uno de los filtros se encuentra vacío"
            else
              @categorias.each do |cat|
                desagr = "categoria.id ='#{cat}'"
                filtros = ""
                filtros << "
                  AND ubi.departamento_id IN (#{@vic_dep.join(", ")})" if @vic_dep.count >= 1
                filtros << ("
                  AND persona.sexo IN (" + @vic_sexo.map { |k| "'" + k + "'" }.join(", ") + ")") if @vic_sexo.count >= 1
                valores_cat = ActiveRecord::Base.connection.execute(consulta_gen(desagr, filtros)).values.to_h
                precat = { name: cat, data: valores_cat }
                series_gen.push(precat)
              end
            end
            @valores_tot = ActiveRecord::Base.connection.execute(consulta_totcat).values.to_h
            @opciones_tot = {
              titulo: "Victimizaciones por Categorías de violencia",
              ejex: "Categorías de violencia",
              ejey: "Victimizaciones",
            }
          end
        else
          series_gen = graficar_sexo
          sexos = Msip::Persona.sexo_opciones.to_h.invert
          valores = ActiveRecord::Base.connection.execute(consulta_totsex).values.to_h
          @valores_tot = valores.to_a.map { |k| [sexos[k[0].to_sym], k[1]] }.to_h
          @opciones_tot = {
            titulo: "Victimizaciones por sexo",
            ejex: "Sexo",
            ejey: "Victimizaciones",
          }
        end

        render(
          "fil23_gen/graficar_apexcharts/victimizaciones_individuales",
          locals: { series_gen: series_gen },
          layout: "application",
        )
      end
    end
  end
end
