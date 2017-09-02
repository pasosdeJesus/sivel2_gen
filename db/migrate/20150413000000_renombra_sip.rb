class RenombraSip < ActiveRecord::Migration[4.2]
  def up
	  execute <<-SQL 
			ALTER SEQUENCE sivel2_gen_pais_id_seq RENAME TO sip_pais_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_pais RENAME TO sip_pais;
    SQL

	  execute <<-SQL 
			ALTER SEQUENCE departamento_seq RENAME TO sip_departamento_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_departamento RENAME TO sip_departamento;
    SQL

	  execute <<-SQL 
			ALTER SEQUENCE municipio_seq RENAME TO sip_municipio_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_municipio RENAME TO sip_municipio;
    SQL

		execute <<-SQL 
			ALTER SEQUENCE clase_seq RENAME TO sip_clase_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_clase RENAME TO sip_clase;
    SQL

		execute <<-SQL 
			ALTER SEQUENCE etiqueta_seq RENAME TO sip_etiqueta_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_etiqueta RENAME TO sip_etiqueta;
    SQL

		execute <<-SQL 
			ALTER SEQUENCE sivel2_gen_tdocumento_id_seq 
				RENAME TO sip_tdocumento_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_tdocumento RENAME TO sip_tdocumento;
    SQL

		execute <<-SQL 
			ALTER SEQUENCE persona_seq RENAME TO sip_persona_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_persona RENAME TO sip_persona;
    SQL

		execute <<-SQL 
			ALTER SEQUENCE tsitio_seq RENAME TO sip_tsitio_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_tsitio RENAME TO sip_tsitio;
    SQL

		# ubicacion merece migracion aparte para sacar id_caso
		execute <<-SQL 
			ALTER SEQUENCE ubicacion_seq RENAME TO sip_ubicacion_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_ubicacion RENAME TO sip_ubicacion;
    SQL

		# anexo merece migracion aparte
	
		execute <<-SQL 
			ALTER SEQUENCE usuario_seq RENAME TO usuario_id_seq;  
		SQL

		execute <<-SQL
      ALTER TABLE sivel2_gen_persona_trelacion RENAME TO sip_persona_trelacion;
    SQL

		execute <<-SQL
      ALTER TABLE sivel2_gen_tclase RENAME TO sip_tclase;
    SQL

		execute <<-SQL
      ALTER TABLE sivel2_gen_trelacion RENAME TO sip_trelacion;
    SQL
  end

  def down
		execute <<-SQL
      ALTER TABLE sip_trelacion RENAME TO sivel2_gen_trelacion;
    SQL

		execute <<-SQL
      ALTER TABLE sip_tclase RENAME TO sivel2_gen_tclase;
    SQL

		execute <<-SQL
      ALTER TABLE sip_persona_trelacion RENAME TO sivel2_gen_persona_trelacion;
    SQL

	  execute <<-SQL 
			ALTER SEQUENCE usuario_id_seq RENAME TO usuario_seq;  
		SQL

		execute <<-SQL
      ALTER TABLE sip_ubicacion RENAME TO sivel2_gen_ubicacion;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_ubicacion_id_seq RENAME TO ubicacion_seq;  
		SQL

		execute <<-SQL
      ALTER TABLE sip_tsitio RENAME TO sivel2_gen_tsitio;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_tsitio_id_seq RENAME TO tsitio_seq;  
		SQL

		execute <<-SQL
      ALTER TABLE sip_persona RENAME TO sivel2_gen_persona;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_persona_id_seq RENAME TO persona_seq;  
		SQL

		execute <<-SQL
      ALTER TABLE sip_tdocumento RENAME TO sivel2_gen_tdocumento;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_tdocumento_id_seq 
				RENAME TO sivel2_gen_tdocumento_id_seq;  
		SQL

		execute <<-SQL
      ALTER TABLE sip_etiqueta RENAME TO sivel2_gen_etiqueta;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_etiqueta_id_seq RENAME TO etiqueta_seq;  
		SQL

    execute <<-SQL
      ALTER TABLE sip_clase RENAME TO sivel2_gen_clase;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_clase_id_seq RENAME TO clase_seq;  
		SQL

    execute <<-SQL
      ALTER TABLE sip_municipio RENAME TO sivel2_gen_municipio;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_municipio_id_seq RENAME TO municipio_seq;  
		SQL

    execute <<-SQL
      ALTER TABLE sip_departamento RENAME TO sivel2_gen_departamento;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_departamento_id_seq RENAME TO departamento_seq;  
		SQL

    execute <<-SQL
      ALTER TABLE sip_pais RENAME TO sivel2_gen_pais;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_pais_id_seq RENAME TO sivel2_gen_pais_id_seq;  
		SQL

  end
end
