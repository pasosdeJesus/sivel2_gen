class RenombraOficina < ActiveRecord::Migration
  def up
	  execute <<-SQL 
			ALTER SEQUENCE regionsjr_seq RENAME TO sip_oficina_id_seq;  
		SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_regionsjr RENAME TO sip_oficina;
    SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_actividad
        RENAME COLUMN regionsjr_id TO oficina_id;
    SQL
	  execute <<-SQL
      ALTER TABLE usuario
        RENAME COLUMN regionsjr_id TO oficina_id;
    SQL
  end

  def down
	  execute <<-SQL
      ALTER TABLE usuario
        RENAME COLUMN oficina_id TO regionsjr_id;
    SQL
	  execute <<-SQL
      ALTER TABLE sivel2_gen_actividad
        RENAME COLUMN oficina_id TO regionsjr_id;
    SQL
	  execute <<-SQL 
			ALTER SEQUENCE sip_oficina_id_seq RENAME TO regionsjr_seq;
		SQL
	  execute <<-SQL
      ALTER TABLE sip_oficina RENAME TO sivel2_gen_regionsjr;
    SQL
  end
end
