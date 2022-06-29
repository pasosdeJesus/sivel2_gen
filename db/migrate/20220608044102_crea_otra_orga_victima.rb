class CreaOtraOrgaVictima < ActiveRecord::Migration[6.1]
  def up
    if !table_exists?(:sivel2_gen_otraorga_victima) then
      create_table :sivel2_gen_otraorga_victima, id: false do |t|
        t.integer :organizacion_id
        t.integer :victima_id
        t.index :organizacion_id
        t.index :victima_id
      end
      add_foreign_key :sivel2_gen_otraorga_victima,
        :sivel2_gen_organizacion,
        column: :organizacion_id
      add_foreign_key :sivel2_gen_otraorga_victima,
        :sivel2_gen_victima,
        column: :victima_id
    end
  end
    def down
    end
end
