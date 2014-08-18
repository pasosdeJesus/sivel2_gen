class AddRegionsjrRefToUsuario < ActiveRecord::Migration
  def change
    add_reference :usuario, :regionsjr, index: true
  end
end
