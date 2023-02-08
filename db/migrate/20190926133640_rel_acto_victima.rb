class RelActoVictima < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_acto ADD CONSTRAINT acto_victima_lf 
        FOREIGN KEY (id_caso, id_persona) 
        REFERENCES sivel2_gen_victima(id_caso, id_persona);
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_acto DROP CONSTRAINT acto_victima_lf;
    SQL
  end
end
