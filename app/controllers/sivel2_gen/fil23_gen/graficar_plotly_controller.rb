# Grafica con R

module Sivel2Gen
  module Fil23Gen
    class GraficarPlotlyController < ApplicationController

      # Control de acceso no estándar en función
      
      def actos_individuales
        authorize! :contar, Sivel2Gen::Caso

        @rutacsv = File.join(
          Rails.root, "public#{Rails.configuration.relative_url_root}" +
          "csv/actos_individuales.csv").to_s

        tarc = Tempfile.new(['actos_individuales', '.csv'], '/var/www/tmp/')
        rutatmp = tarc.path
        tarc.close
        tarc.unlink
        sql = "COPY (SELECT DISTINCT " \
          "caso.fecha, " \
          "supracategoria.id_tviolencia AS tviolencia_id," \
          "categoria.id AS categoria_id, " \
          "categoria.nombre AS categoria_nombre, " \
          "supracategoria.id_tviolencia || categoria.id || ' ' || categoria.nombre AS categoria_rotulo, " \
          "acto.id_presponsable AS presponsable_id, " \
          "presponsable.nombre AS presponsable, " \
          "ubicacion.id_departamento AS departamento_id, " \
          "ubicacion.id_municipio AS municipio_id, " \
          "departamento.nombre AS departamento, " \
          "municipio.nombre AS municipio, " \
          "COUNT(*) as cuenta " \
          "FROM sivel2_gen_acto AS acto " \
          "JOIN sivel2_gen_caso AS caso ON caso.id = acto.id_caso " \
          "JOIN sivel2_gen_categoria AS categoria ON categoria.id=acto.id_categoria " \
          "JOIN sivel2_gen_supracategoria AS supracategoria ON supracategoria.id = categoria.supracategoria_id " \
          "JOIN sivel2_gen_presponsable AS presponsable ON presponsable.id=acto.id_presponsable " \
          "LEFT JOIN msip_ubicacion AS ubicacion ON ubicacion.id=caso.ubicacion_id " \
          "LEFT JOIN msip_departamento AS departamento ON ubicacion.id_departamento=departamento.id " \
          "LEFT JOIN msip_municipio AS municipio ON ubicacion.id_municipio=municipio.id " \
          "GROUP BY 1,2,3,4,5,6,7,8,9,10,11) " \
          " TO '#{rutatmp}' DELIMITER ',' CSV HEADER;" 
        res = ActiveRecord::Base.connection.execute(sql)
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
