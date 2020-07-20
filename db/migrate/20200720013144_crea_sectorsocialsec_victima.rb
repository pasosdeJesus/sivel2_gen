class CreaSectorsocialsecVictima < ActiveRecord::Migration[6.0]
  def change
    create_table :sivel2_gen_sectorsocialsec_victima, id: false do |t|
      t.integer :sectorsocial_id
      t.integer :victima_id
      t.index :sectorsocial_id
      t.index :victima_id
    end
      add_foreign_key :sivel2_gen_sectorsocialsec_victima, 
        :sivel2_gen_sectorsocial, column: :sectorsocial_id
      add_foreign_key :sivel2_gen_sectorsocialsec_victima, 
        :sivel2_gen_victima, column: :victima_id
  end
end
