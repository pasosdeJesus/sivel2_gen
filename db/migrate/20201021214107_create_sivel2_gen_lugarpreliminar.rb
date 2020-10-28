class CreateSivel2GenLugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    create_table :sivel2_gen_lugarpreliminar do |t|
      t.date :fecha
      t.string :codigositio
      t.timestamps
    end
  end
end
