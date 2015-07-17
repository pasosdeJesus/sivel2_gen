class AgregaObservaciones < ActiveRecord::Migration
  def change
    add_column :sivel2_gen_frontera, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_categoria, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_iglesia, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_rangoedad, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_estadocivil, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_supracategoria, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_actividadoficio, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_profesion, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_tviolencia, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_maternidad, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_region, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_presponsable, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_etnia, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_escolaridad, :observaciones, :string, limit: 5000
    add_column :sivel2_gen_ffrecuente, :observaciones, :string, limit: 5000
  end
end
