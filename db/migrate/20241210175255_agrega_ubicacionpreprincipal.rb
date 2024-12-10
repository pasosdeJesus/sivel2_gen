class AgregaUbicacionpreprincipal < ActiveRecord::Migration[7.2]
  def change
    add_column :sivel2_gen_caso, :ubicacionpreprincipal_id, :integer
    add_foreign_key :sivel2_gen_caso, :msip_ubicacionpre, 
      column: :ubicacionpreprincipal_id
  end
end
