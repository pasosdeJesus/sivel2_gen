class AddAdjuntoToAnexo < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :anexo, :adjunto
  end

  def self.down
    remove_attachment :anexo, :adjunto
  end
end
