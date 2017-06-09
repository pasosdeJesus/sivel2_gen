class CasoSeqAId < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso ALTER COLUMN id DROP DEFAULT;
      ALTER TABLE sivel2_gen_caso ALTER COLUMN id 
        SET DEFAULT(nextval('sivel2_gen_caso_id_seq'));

      ALTER TABLE sip_ubicacion ALTER COLUMN id DROP DEFAULT;
      ALTER TABLE sip_ubicacion ALTER COLUMN id 
        SET DEFAULT(nextval('sip_ubicacion_id_seq'));

      ALTER TABLE sivel2_gen_victima DROP CONSTRAINT victima_orientacionsexual_check;
      ALTER TABLE sivel2_gen_victima ADD CONSTRAINT victima_orientacionsexual_check 
        CHECK (orientacionsexual='L' OR orientacionsexual='G' 
          OR orientacionsexual='B' OR orientacionsexual='T' 
          OR orientacionsexual='H' OR orientacionsexual='S');

      ALTER TABLE sivel2_gen_victima ALTER COLUMN orientacionsexual 
        SET DEFAULT 'S';

      UPDATE sivel2_gen_victima SET  id_iglesia ='1' WHERE id_iglesia IS NULL;
    SQL
  end
  def down
  end
end
