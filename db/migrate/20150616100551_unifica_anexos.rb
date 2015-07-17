class UnificaAnexos < ActiveRecord::Migration
  def up
    execute <<-SQL
      INSERT INTO sip_anexo(id, descripcion, adjunto_file_name, 
        adjunto_content_type, adjunto_file_size, adjunto_updated_at,
        created_at, updated_at) 
      (SELECT id+1000, descripcion, adjunto_file_name,
        adjunto_content_type, adjunto_file_size, adjunto_updated_at,
        created_at, updated_at FROM sivel2_gen_anexo_caso ORDER BY id) 
    SQL
    add_column :sivel2_gen_anexo_caso, :id_anexo, :integer
    remove_column :sivel2_gen_anexo_caso, :descripcion
    remove_column :sivel2_gen_anexo_caso, :archivo
    remove_column :sivel2_gen_anexo_caso, :adjunto_file_name
    remove_column :sivel2_gen_anexo_caso, :adjunto_content_type
    remove_column :sivel2_gen_anexo_caso, :adjunto_file_size
    remove_column :sivel2_gen_anexo_caso, :adjunto_updated_at
    execute <<-SQL
      UPDATE sivel2_gen_anexo_caso SET id_anexo=id+1000
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_anexo_caso ALTER COLUMN id_anexo SET NOT NULL
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_anexo_caso ALTER COLUMN id_anexo DROP NOT NULL
    SQL
    add_column :sivel2_gen_anexo_caso, :descripcion, :string, limit: 1500
    add_column :sivel2_gen_anexo_caso, :archivo, :string, limit: 255
    add_column :sivel2_gen_anexo_caso, :adjunto_file_name, :string, limit: 255
    add_column :sivel2_gen_anexo_caso, :adjunto_content_type, :string, limit: 255
    add_column :sivel2_gen_anexo_caso, :adjunto_file_size, :integer
    add_column :sivel2_gen_anexo_caso, :adjunto_updated_at, :timestamp
    execute <<-SQL
      UPDATE sivel2_gen_anexo_caso SET descripcion=sip_anexo.descripcion, 
        adjunto_file_name=sip_anexo.adjunto_file_name, 
        adjunto_content_type=sip_anexo.adjunto_content_type,
        adjunto_file_size=sip_anexo.adjunto_file_size, 
        adjunto_updated_at=sip_anexo.adjunto_updated_at
        FROM sip_anexo WHERE sip_anexo.id=sivel2_gen_anexo_caso.id_anexo
    SQL
    execute <<-SQL
      DELETE FROM sip_anexo USING sivel2_gen_anexo_caso WHERE
        sip_anexo.id = sivel2_gen_anexo_caso.id_anexo
    SQL

    remove_column :sivel2_gen_anexo_caso, :id_anexo

  end
end
