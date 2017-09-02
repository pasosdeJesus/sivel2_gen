class Nulpordefecto < ActiveRecord::Migration[4.2]
  def change
    change_column_default(:sip_persona, :id_pais, nil)
  end
end
