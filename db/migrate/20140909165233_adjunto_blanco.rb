class AdjuntoBlanco < ActiveRecord::Migration
  def up
	execute "ALTER TABLE anexo ALTER COLUMN archivo DROP NOT NULL;"
  end
end
