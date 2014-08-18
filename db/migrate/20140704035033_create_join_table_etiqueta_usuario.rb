class CreateJoinTableEtiquetaUsuario < ActiveRecord::Migration
  def change
    create_table :etiqueta_usuario do |t|
      t.references :etiqueta
      t.references :usuario
      t.timestamps
    end
  end
end
