class CreaSipAnexos < ActiveRecord::Migration
  def up
    if !table_exists? :sip_anexo
      create_table :sip_anexo do |t|
        t.string  :descripcion, null: false, limit:1500
        t.string  :adjunto_file_name, limit: 255
        t.string  :adjunto_content_type, limit: 255
        t.integer :adjunto_file_size
        t.timestamp :adjunto_updated_at
        t.timestamp :created_at
        t.timestamp :updated_at
      end
    end
  end
  def down
    drop_table :sip_anexo
  end
end
