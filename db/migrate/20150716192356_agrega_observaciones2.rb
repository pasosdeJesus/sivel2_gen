class AgregaObservaciones2 < ActiveRecord::Migration[4.2]
  def change
    add_column :sivel2_gen_intervalo, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_filiacion, :observaciones, :string, limit: 5000
    
    add_column :sivel2_gen_organizacion, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_sectorsocial, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_vinculoestado, :observaciones, :string, limit: 5000
  end
end
