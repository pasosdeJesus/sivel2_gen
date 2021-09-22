
class UbicacionPrincipal < ActiveRecord::Migration[5.2]
  # Cada caso puede tener muchas ubicaciones secundarias
  # Pero una sola principal, que corresponde al lugar
  # donde ocurrieron los hechos, o si es un área muy amplio un
  # lugar emblemático
  # Ese sitio principal será el usado en conteos
  def up
    add_column :sivel2_gen_caso, :ubicacion_id, :integer
    add_foreign_key :sivel2_gen_caso, :sip_ubicacion, column: :ubicacion_id
    execute <<-SQL
      UPDATE sivel2_gen_caso SET
        ubicacion_id=minid FROM (SELECT sivel2_gen_caso.id AS caso_id,
        MIN(sip_ubicacion.id) AS minid FROM sip_ubicacion JOIN
        sivel2_gen_caso ON sip_ubicacion.id_caso=sivel2_gen_caso.id 
        GROUP BY 1) AS smu
        WHERE sivel2_gen_caso.id=smu.caso_id;
    SQL
  end
  def down
    remove_foreign_key :sivel2_gen_caso, :sip_ubicacion, column: :ubicacion_id
    remove_column :sivel2_gen_caso, :ubicacion_id, :integer
  end

end
