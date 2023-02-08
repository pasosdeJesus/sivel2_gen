class AgregaFuenteprensaTfuente < ActiveRecord::Migration[4.2]
  def change
    add_column :sip_fuenteprensa, :tfuente, :string, limit: 25
  end
end
