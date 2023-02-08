class CreaSivel2GenMunicipioRegion < ActiveRecord::Migration[6.1]
  def change
    create_table  :sivel2_gen_municipio_region, :id => false do |t|
      t.integer :municipio_id
      t.integer :region_id
    end
  end
end
