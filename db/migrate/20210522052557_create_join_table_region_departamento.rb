class CreateJoinTableRegionDepartamento < ActiveRecord::Migration[6.1]
  def change
    create_join_table :sivel2_gen_region, :sip_departamento do |t|
      # t.index [:sip_departamento_id, :region_id]
      # t.index [:region_id, :sip_departamento_id]
    end
  end
end
