# Grafica con R

module Sivel2Gen
  module Fil23Gen
    class GraficarPlotlyController < ApplicationController

      # Control de acceso no estándar en función

      def actos_individuales
        authorize! :contar, Sivel2Gen::Caso

        @rutadircsv = File.join(
          Rails.root, "public#{Rails.configuration.relative_url_root}" +
          "csv").to_s
        unless Dir.exist?(@rutadircsv)
          Dir.mkdir(@rutadircsv)
        end

        @rutacsv = File.join(
          Rails.root, "public#{Rails.configuration.relative_url_root}" +
          "csv/actos_individuales.csv").to_s

        tarc = Tempfile.new(['actos_individuales', '.csv'], '/var/www/tmp/')
        rutatmp = tarc.path
        tarc.close
        tarc.unlink
        sql = "COPY (SELECT DISTINCT " \
          "caso.fecha, " \
          "supracategoria.tviolencia_id AS tviolencia_id," \
          "categoria.id AS categoria_id, " \
          "categoria.nombre AS categoria_nombre, " \
          "supracategoria.tviolencia_id || categoria.id || ' ' || categoria.nombre AS categoria_rotulo, " \
          "acto.presponsable_id AS presponsable_id, " \
          "presponsable.nombre AS presponsable, " \
          "ubicacion.departamento_id AS departamento_id, " \
          "ubicacion.municipio_id AS municipio_id, " \
          "departamento.nombre AS departamento, " \
          "municipio.nombre AS municipio, " \
          "COUNT(*) as cuenta " \
          "FROM sivel2_gen_acto AS acto " \
          "JOIN sivel2_gen_caso AS caso ON caso.id = acto.caso_id " \
          "JOIN sivel2_gen_categoria AS categoria ON categoria.id=acto.categoria_id " \
          "JOIN sivel2_gen_supracategoria AS supracategoria ON supracategoria.id = categoria.supracategoria_id " \
          "JOIN sivel2_gen_presponsable AS presponsable ON presponsable.id=acto.presponsable_id " \
          "LEFT JOIN msip_ubicacion AS ubicacion ON ubicacion.id=caso.ubicacion_id " \
          "LEFT JOIN msip_departamento AS departamento ON ubicacion.departamento_id=departamento.id " \
          "LEFT JOIN msip_municipio AS municipio ON ubicacion.municipio_id=municipio.id " \
          "GROUP BY 1,2,3,4,5,6,7,8,9,10,11) " \
          " TO '#{rutatmp}' DELIMITER ',' CSV HEADER;" 
        ActiveRecord::Base.connection.execute(sql)
        @rutadircsv = "/"
        if File.exist?(@rutacsv)
          File.unlink(@rutacsv)
        end
        FileUtils.cp(rutatmp, @rutacsv)
        render 'fil23_gen/graficar_plotly/actos_individuales', 
          layout: 'application'
      end
    end
  end
end
