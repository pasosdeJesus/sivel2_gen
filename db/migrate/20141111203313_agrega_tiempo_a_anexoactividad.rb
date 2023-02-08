class AgregaTiempoAAnexoactividad < ActiveRecord::Migration[4.2]
  def change
    add_column :sivel2_gen_anexoactividad, :created_at, :datetime
    add_column :sivel2_gen_anexoactividad, :updated_at, :datetime
  end
end
