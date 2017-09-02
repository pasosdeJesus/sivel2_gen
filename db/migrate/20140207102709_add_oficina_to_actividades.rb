class AddOficinaToActividades < ActiveRecord::Migration[4.0]
  def change
    add_reference :actividad, :regionsjr
    execute <<-SQL
        UPDATE actividad SET regionsjr_id = '1';
        ALTER TABLE actividad ADD FOREIGN KEY (regionsjr_id)
            REFERENCES regionsjr(id);
        ALTER TABLE actividad ALTER COLUMN regionsjr_id SET NOT NULL;
    SQL
  end
end
