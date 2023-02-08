class AddNacionaldeToPersona < ActiveRecord::Migration[4.2]
  def change
		add_column :persona, :nacionalde, :integer
    reversible do |dir|
      dir.up do
        execute <<-SQL
        ALTER TABLE persona ADD FOREIGN KEY (nacionalde)
            REFERENCES pais(id);
        SQL
      end
      dir.down do 
        execute <<-SQL
        ALTER TABLE persona DROP CONSTRAINT persona_nacionalde_fkey;
        SQL
      end
    end
  end
end
