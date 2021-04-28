class PresponsablePapaId < ActiveRecord::Migration[6.1]
  def change
    rename_column :sivel2_gen_presponsable, :papa, :papa_id
  end
end
