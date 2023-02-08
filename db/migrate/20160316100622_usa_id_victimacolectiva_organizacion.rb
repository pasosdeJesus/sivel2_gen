class UsaIdVictimacolectivaOrganizacion < ActiveRecord::Migration[4.2]
  def up
   execute <<-SQL
     ALTER TABLE sivel2_gen_comunidad_organizacion 
      RENAME TO sivel2_gen_organizacion_victimacolectiva;

     ALTER TABLE sivel2_gen_organizacion_victimacolectiva 
      ADD COLUMN victimacolectiva_id
        INTEGER REFERENCES sivel2_gen_victimacolectiva(id);

    UPDATE sivel2_gen_organizacion_victimacolectiva SET 
      victimacolectiva_id=sivel2_gen_victimacolectiva.id 
      FROM sivel2_gen_victimacolectiva WHERE 
        sivel2_gen_organizacion_victimacolectiva.id_grupoper=sivel2_gen_victimacolectiva.id_grupoper
      AND sivel2_gen_organizacion_victimacolectiva.id_caso=sivel2_gen_victimacolectiva.id_caso;

    ALTER TABLE sivel2_gen_organizacion_victimacolectiva
      DROP COLUMN id_grupoper;
    
     ALTER TABLE sivel2_gen_organizacion_victimacolectiva
      DROP COLUMN id_caso;
   SQL
  end
  def down
   execute <<-SQL
     ALTER TABLE sivel2_gen_organizacion_victimacolectiva
      ADD COLUMN id_caso INTEGER REFERENCES sivel2_gen_caso;

     ALTER TABLE sivel2_gen_organizacion_victimacolectiva
      ADD COLUMN id_grupoper INTEGER REFERENCES sivel2_gen_grupoper;

     UPDATE sivel2_gen_organizacion_victimacolectiva SET 
      id_grupoper=sivel2_gen_victimacolectiva.id_grupoper,
      id_caso=sivel2_gen_victimacolectiva.id_caso
      FROM sivel2_gen_victimacolectiva WHERE 
        sivel2_gen_organizacion_victimacolectiva.victimacolectiva_id=sivel2_gen_victimacolectiva.id;

     ALTER TABLE sivel2_gen_organizacion_victimacolectiva 
      DROP COLUMN victimacolectiva_id;

     ALTER TABLE sivel2_gen_organizacion_victimacolectiva
      RENAME TO sivel2_gen_comunidad_organizacion ;
   SQL
  end
end
