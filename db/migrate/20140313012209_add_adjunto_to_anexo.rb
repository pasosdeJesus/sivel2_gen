class AddAdjuntoToAnexo < ActiveRecord::Migration
  def self.up
    add_attachment :anexo, :adjunto
  end

  def self.down
    remove_attachment :anexo, :adjunto
  end
end
