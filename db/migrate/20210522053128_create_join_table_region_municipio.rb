class CreateJoinTableRegionMunicipio < ActiveRecord::Migration[6.1]
  def change
    create_join_table :sivel2_gen_region, :sip_municipio do |t|
      # t.index [:grupo_id, :sip_municipio_id]
      # t.index [:sip_municipio_id, :region_id]
    end
  end
end
