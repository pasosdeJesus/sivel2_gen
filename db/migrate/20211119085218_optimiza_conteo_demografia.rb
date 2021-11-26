class OptimizaConteoDemografia < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE INDEX sivel2_gen_victima_id_profesion
        ON sivel2_gen_victima(id_profesion);
      CREATE INDEX sivel2_gen_victima_id_rangoedad
        ON sivel2_gen_victima(id_rangoedad);
      CREATE INDEX sivel2_gen_victima_id_filiacion
        ON sivel2_gen_victima(id_filiacion);
      CREATE INDEX sivel2_gen_victima_id_sectorsocial
        ON sivel2_gen_victima(id_sectorsocial);
      CREATE INDEX sivel2_gen_victima_id_organizacion
        ON sivel2_gen_victima(id_organizacion);
      CREATE INDEX sivel2_gen_victima_id_vinculoestado
        ON sivel2_gen_victima(id_vinculoestado);
      CREATE INDEX sivel2_gen_victima_id_caso
        ON sivel2_gen_victima(id_caso);
      CREATE INDEX sivel2_gen_victima_id_persona
        ON sivel2_gen_victima(id_persona);
      CREATE INDEX sivel2_gen_victima_id_etnia
        ON sivel2_gen_victima(id_etnia);
      CREATE INDEX sivel2_gen_victima_id_iglesia
        ON sivel2_gen_victima(id_iglesia);
      CREATE INDEX sivel2_gen_victima_orientacionsexual
        ON sivel2_gen_victima(orientacionsexual);

      CREATE INDEX sip_departamento_id_pais
        ON sip_departamento(id_pais);
      CREATE INDEX sip_municipio_id_departamento
        ON sip_municipio(id_departamento);
      CREATE INDEX sip_clase_id_municipio
        ON sip_clase(id_municipio);

      CREATE INDEX sip_persona_anionac
        ON sip_persona(anionac);
      CREATE INDEX sip_persona_sexo
        ON sip_persona(sexo);
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX sivel2_gen_victima_id_profesion;
      DROP INDEX sivel2_gen_victima_id_rangoedad;
      DROP INDEX sivel2_gen_victima_id_filiacion;
      DROP INDEX sivel2_gen_victima_id_sectorsocial;
      DROP INDEX sivel2_gen_victima_id_organizacion;
      DROP INDEX sivel2_gen_victima_id_vinculoestado;
      DROP INDEX sivel2_gen_victima_id_caso;
      DROP INDEX sivel2_gen_victima_id_persona;
      DROP INDEX sivel2_gen_victima_id_etnia;
      DROP INDEX sivel2_gen_victima_id_iglesia;
      DROP INDEX sivel2_gen_victima_orientacionsexual;
    SQL

  end
end
