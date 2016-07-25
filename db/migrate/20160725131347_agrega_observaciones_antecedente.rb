class AgregaObservacionesAntecedente < ActiveRecord::Migration
  def change
    add_column :sivel2_gen_antecedente, :observaciones, :string, limit: 5000
  end
end
