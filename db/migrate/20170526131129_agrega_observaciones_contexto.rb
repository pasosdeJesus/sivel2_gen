class AgregaObservacionesContexto < ActiveRecord::Migration[5.0]
  def change
    add_column :sivel2_gen_contexto, :observaciones, :string, limit: 5000 
  end
end
