class AgregaObservacionesAntecedente < ActiveRecord::Migration[5.0]
  def change
    add_column :sivel2_gen_antecedente, :observaciones, :string, limit: 5000
  end
end
