module Sivel2Gen
  module ConteosHelper

    include Rails.application.routes.url_helpers

    def calcularCasos(sol, cond)
      cons = 'SELECT '+ sol.join(", ") + ' FROM sivel2_gen_conscaso ' +
          'JOIN sivel2_gen_caso as caso ' +
          'ON caso.id=sivel2_gen_conscaso.caso_id ' +
          'LEFT JOIN msip_ubicacion ON msip_ubicacion.id=caso.ubicacion_id ' +
          'LEFT JOIN msip_departamento ON msip_departamento.id=msip_ubicacion.departamento_id ' +
          'LEFT JOIN msip_municipio ON msip_municipio.id=msip_ubicacion.municipio_id ' +
          'WHERE ' + cond +
          ' AND msip_ubicacion.latitud IS NOT NULL '+ 
          'AND msip_ubicacion.longitud IS NOT NULL;'
      pl = ActiveRecord::Base.connection.execute(cons).values
    end

    def calcularActos(cond)
      cons = "SELECT COUNT(DISTINCT sivel2_gen_conscaso.caso_id) AS numero_casos, " +
              "COUNT(DISTINCT sivel2_gen_victima.persona_id) AS numero_victimas, " +
              "COUNT(sivel2_gen_acto.id) AS numero_actos, " +
              "(SELECT COUNT(*) FROM (SELECT DISTINCT categoria_id, persona_id, caso_id " +
              "FROM sivel2_gen_acto WHERE caso_id IN (" + cond + ")) " +
              "AS subquery) AS numero_victimizaciones FROM sivel2_gen_conscaso " +
              "JOIN sivel2_gen_caso AS caso ON caso.id = sivel2_gen_conscaso.caso_id " +
              "LEFT JOIN sivel2_gen_victima ON sivel2_gen_victima.caso_id = caso.id " +
              "LEFT JOIN sivel2_gen_acto ON sivel2_gen_acto.caso_id = caso.id " +
              "LEFT JOIN msip_ubicacion ON msip_ubicacion.id = caso.ubicacion_id " +
              "WHERE sivel2_gen_conscaso.caso_id IN (SELECT DISTINCT caso_id " +
              "FROM sivel2_gen_acto WHERE caso_id IN (" + cond + ")) " +
              "AND msip_ubicacion.latitud IS NOT NULL AND msip_ubicacion.longitud IS NOT NULL;"
      pl = ActiveRecord::Base.connection.execute(cons).values[0]
    end

  end
end
