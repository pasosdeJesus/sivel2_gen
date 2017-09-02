class AdjuntoBlanco < ActiveRecord::Migration[4.2]
  def up
	execute "ALTER TABLE anexo ALTER COLUMN archivo DROP NOT NULL;"
  end
end
