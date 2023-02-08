class IndicesSivel2GenMejoraConscasosjr < ActiveRecord::Migration[6.0]
  def change
    add_index :sip_ubicacion, :id_caso, 
      name: 'indice_sip_ubicacion_sobre_id_caso'

    add_index :sivel2_gen_caso, :ubicacion_id, 
      name: 'indice_sivel2_gen_caso_sobre_ubicacion_id'
    add_index :sivel2_gen_caso, :fecha, 
      name: 'indice_sivel2_gen_caso_sobre_fecha'

    add_index :sivel2_gen_caso_presponsable, :id_presponsable, 
      name: 'indice_sivel2_gen_caso_presponsable_sobre_id_presponsable'
    add_index :sivel2_gen_caso_presponsable, :id_caso, 
      name: 'indice_sivel2_gen_caso_presponsable_sobre_id_caso'
    add_index :sivel2_gen_caso_presponsable, [:id_caso, :id_presponsable],
      name: 'indice_sivel2_gen_caso_presponsable_sobre_ids_caso_presp'
    add_foreign_key :sivel2_gen_caso_presponsable, :sivel2_gen_caso,
      column: :id_caso
    add_foreign_key :sivel2_gen_caso_presponsable, :sivel2_gen_presponsable,
      column: :id_presponsable

    add_index :sivel2_gen_acto, :id_presponsable,
      name: 'indice_sivel2_gen_acto_sobre_id_presponsable'
    add_index :sivel2_gen_acto, :id_categoria,
      name: 'indice_sivel2_gen_acto_sobre_id_categoria'
    add_index :sivel2_gen_acto, :id_persona,
      name: 'indice_sivel2_gen_acto_sobre_id_persona'
    add_index :sivel2_gen_acto, :id_caso,
      name: 'indice_sivel2_gen_acto_sobre_id_caso'

    add_index :sivel2_gen_categoria, :supracategoria_id,
      name: 'indice_sivel2_gen_categoria_sobre_supracategoria_id'

  end
end
