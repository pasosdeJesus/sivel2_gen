class Nulpordefecto < ActiveRecord::Migration
  def change
    change_column_default(:persona, :id_pais, nil)
  end
end
