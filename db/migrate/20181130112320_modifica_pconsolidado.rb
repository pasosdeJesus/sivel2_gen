class ModificaPconsolidado < ActiveRecord::Migration[5.2]
  def change
    rename_column :sivel2_gen_pconsolidado, :rotulo, :nombre
    add_column :sivel2_gen_pconsolidado, :observaciones, :string, limit: 500
  end
end
