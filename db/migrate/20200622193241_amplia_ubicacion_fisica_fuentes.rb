class AmpliaUbicacionFisicaFuentes < ActiveRecord::Migration[6.0]
  def up
    change_column :sivel2_gen_caso_fotra, :ubicacionfisica, :string, limit: 1024
    change_column :sivel2_gen_caso_fuenteprensa, :ubicacionfisica, :string, 
      limit: 1024
  end

  def down
    change_column :sivel2_gen_caso_fotra, :ubicacionfisica, :string, limit: 100
    change_column :sivel2_gen_caso_fuenteprensa, :ubicacionfisica, :string, 
      limit: 100
  end
end
