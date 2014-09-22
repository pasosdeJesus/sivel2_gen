class CambiaTdocumento < ActiveRecord::Migration
  def up
    execute "ALTER TABLE persona ADD COLUMN tdocumento_id INTEGER REFERENCES tdocumento(id)"
    execute "UPDATE persona SET tdocumento_id=tdocumento.id FROM tdocumento WHERE tdocumento.sigla=persona.tipodocumento"
    execute "ALTER TABLE persona DROP COLUMN tipodocumento"
    execute "ALTER TABLE persona ALTER COLUMN numerodocumento TYPE VARCHAR(100)"
  end

  def down
    raise ActiveRecord::IrreversibleMigration 
  end
end
