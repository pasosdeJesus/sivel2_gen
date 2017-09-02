class AdjuntoBlanco < ActiveRecord::Migration[4.1]
  def up
	execute "ALTER TABLE anexo ALTER COLUMN archivo DROP NOT NULL;"
  end
end
