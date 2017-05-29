class AgrandaGrinformacion < ActiveRecord::Migration[5.0]
  def up
    change_column :sivel2_gen_caso, :grimpunidad, :string, limit: 8
    change_column :sivel2_gen_caso, :grinformacion, :string, limit: 8
  end

  def down
    change_column :sivel2_gen_caso, :grimpunidad, :string, limit: 5
    change_column :sivel2_gen_caso, :grinformacion, :string, limit: 5
  end
end
