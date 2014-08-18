class CreateJoinTableActividadareasActividad < ActiveRecord::Migration
  def change
	create_table :actividadareas_actividad do |t|
		t.references :actividad
		t.references :actividadarea
		t.timestamps
    	end
  end
end
