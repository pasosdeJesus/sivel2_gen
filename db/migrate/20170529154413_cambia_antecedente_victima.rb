class CambiaAntecedenteVictima < ActiveRecord::Migration[5.0]
  def up
   execute <<-SQL
     ALTER TABLE sivel2_gen_antecedente_victima
      DROP CONSTRAINT IF EXISTS antecedente_victima_pkey;

    -- id_victima ya existe

    UPDATE sivel2_gen_antecedente_victima SET 
      id_victima=sivel2_gen_victima.id 
      FROM sivel2_gen_victima WHERE 
        sivel2_gen_antecedente_victima.id_persona=sivel2_gen_victima.id_persona
        AND sivel2_gen_antecedente_victima.id_caso=sivel2_gen_victima.id_caso
        AND id_victima IS NULL ;

    ALTER TABLE sivel2_gen_antecedente_victima
      DROP COLUMN id_persona;
    
     ALTER TABLE sivel2_gen_antecedente_victima
      DROP COLUMN id_caso;
   SQL
  end
  def down
   execute <<-SQL
     ALTER TABLE sivel2_gen_antecedente_victima
      ADD COLUMN id_caso INTEGER REFERENCES sivel2_gen_caso;

     ALTER TABLE sivel2_gen_antecedente_victima
      ADD COLUMN id_persona INTEGER REFERENCES sip_persona(id);

     UPDATE sivel2_gen_antecedente_victima SET 
      id_persona=sivel2_gen_victima.id_persona,
      id_caso=sivel2_gen_victima.id_caso
      FROM sivel2_gen_victima WHERE 
        sivel2_gen_antecedente_victima.victima_id=sivel2_gen_victima.id;

   SQL
  end
end
