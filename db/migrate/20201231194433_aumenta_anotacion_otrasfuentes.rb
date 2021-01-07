class AumentaAnotacionOtrasfuentes < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra
        ALTER COLUMN anotacion TYPE VARCHAR(1024);
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        ALTER COLUMN ubicacion TYPE VARCHAR(1024);
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra
        ALTER COLUMN anotacion TYPE VARCHAR(200);
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        ALTER COLUMN ubicacion TYPE VARCHAR(100);
    SQL
  end
end
