class CreateAnexoactividad < ActiveRecord::Migration
  def change
    create_table :anexoactividad do |t|
      t.references :actividad, index: true
      t.string :descripcion, limit: 1500
      t.string :adjunto_file_name, limit: 255
      t.string :adjunto_content_type, limit: 255
      t.integer :adjunto_file_size
      t.timestamp :adjunto_updated_at
    end
  end
end
