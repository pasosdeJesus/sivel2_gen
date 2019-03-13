class CambiaIdFuncionarioIdUsuario < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :sivel2_gen_caso_etiqueta, :id_funcionario
      rename_column :sivel2_gen_caso_etiqueta, :id_funcionario, :id_usuario
    end
  end
end
