class UsaIdVictimacolectivaVinculoestado < ActiveRecord::Migration
  def up
   execute <<-SQL
     ALTER TABLE sivel2_gen_comunidad_vinculoestado 
      RENAME TO sivel2_gen_victimacolectiva_vinculoestado;

     ALTER TABLE sivel2_gen_victimacolectiva_vinculoestado 
      ADD COLUMN victimacolectiva_id
        INTEGER REFERENCES sivel2_gen_victimacolectiva(id);

    UPDATE sivel2_gen_victimacolectiva_vinculoestado SET 
      victimacolectiva_id=sivel2_gen_victimacolectiva.id 
      FROM sivel2_gen_victimacolectiva WHERE 
        sivel2_gen_victimacolectiva_vinculoestado.id_grupoper=sivel2_gen_victimacolectiva.id_grupoper
      AND sivel2_gen_victimacolectiva_vinculoestado.id_caso=sivel2_gen_victimacolectiva.id_caso;

    ALTER TABLE sivel2_gen_victimacolectiva_vinculoestado
      DROP COLUMN id_grupoper;
    
     ALTER TABLE sivel2_gen_victimacolectiva_vinculoestado
      DROP COLUMN id_caso;
   SQL
  end
  def down
   execute <<-SQL
     ALTER TABLE sivel2_gen_victimacolectiva_vinculoestado
      ADD COLUMN id_caso INTEGER REFERENCES sivel2_gen_caso;

     ALTER TABLE sivel2_gen_victimacolectiva_vinculoestado
      ADD COLUMN id_grupoper INTEGER REFERENCES sivel2_gen_grupoper;

     UPDATE sivel2_gen_victimacolectiva_vinculoestado SET 
      id_grupoper=sivel2_gen_victimacolectiva.id_grupoper,
      id_caso=sivel2_gen_victimacolectiva.id_caso
      FROM sivel2_gen_victimacolectiva WHERE 
        sivel2_gen_victimacolectiva_vinculoestado.victimacolectiva_id=sivel2_gen_victimacolectiva.id;

     ALTER TABLE sivel2_gen_victimacolectiva_vinculoestado 
      DROP COLUMN victimacolectiva_id;

     ALTER TABLE sivel2_gen_victimacolectiva_vinculoestado
      RENAME TO sivel2_gen_comunidad_vinculoestado ;
   SQL
  end
end
