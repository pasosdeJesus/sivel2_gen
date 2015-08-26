class Nulpordefecto < ActiveRecord::Migration
  def change
    change_column_default(:sip_persona, :id_pais, nil)
  end
end
