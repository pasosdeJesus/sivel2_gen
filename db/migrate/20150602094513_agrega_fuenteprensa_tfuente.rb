class AgregaFuenteprensaTfuente < ActiveRecord::Migration
  def change
    add_column :sip_fuenteprensa, :tfuente, :string, limit: 25
  end
end
