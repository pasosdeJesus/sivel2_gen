# frozen_string_literal: true

class NomenclaturaRails < ActiveRecord::Migration[7.0]
  def change
    rename_column(:sivel2_gen_caso, :id_intervalo, :intervalo_id)

    rename_column(:sivel2_gen_victima, :id_caso, :caso_id)
    rename_column(:sivel2_gen_victima, :id_etnia, :etnia_id)
    rename_column(:sivel2_gen_victima, :id_filiacion, :filiacion_id)
    rename_column(:sivel2_gen_victima, :id_iglesia, :iglesia_id)
    rename_column(:sivel2_gen_victima, :id_organizacion, :organizacion_id)
    rename_column(:sivel2_gen_victima, :id_persona, :persona_id)
    rename_column(:sivel2_gen_victima, :id_profesion, :profesion_id)
    rename_column(:sivel2_gen_victima, :id_rangoedad, :rangoedad_id)
    rename_column(:sivel2_gen_victima, :id_sectorsocial, :sectorsocial_id)
    rename_column(:sivel2_gen_victima, :id_vinculoestado, :vinculoestado_id)

    rename_column(:sivel2_gen_acto, :id_presponsable, :presponsable_id)
    rename_column(:sivel2_gen_acto, :id_categoria, :categoria_id)
    rename_column(:sivel2_gen_acto, :id_persona, :persona_id)
    rename_column(:sivel2_gen_acto, :id_caso, :caso_id)

    rename_column(:sivel2_gen_categoria, :id_pconsolidado, :pconsolidado_id)

    rename_column(:sivel2_gen_supracategoria, :id_tviolencia, :tviolencia_id)

    rename_column(:sivel2_gen_caso_usuario, :id_usuario, :usuario_id)
    rename_column(:sivel2_gen_caso_usuario, :id_caso, :caso_id)

    rename_column(:sivel2_gen_actocolectivo, :id_presponsable, :presponsable_id)
    rename_column(:sivel2_gen_actocolectivo, :id_categoria, :categoria_id)
    rename_column(:sivel2_gen_actocolectivo, :id_grupoper, :grupoper_id)
    rename_column(:sivel2_gen_actocolectivo, :id_caso, :caso_id)

    rename_column(
      :sivel2_gen_caso_categoria_presponsable,
      :id_categoria,
      :categoria_id,
    )
    rename_column(
      :sivel2_gen_caso_categoria_presponsable,
      :id_caso_presponsable,
      :caso_presponsable_id,
    )

    rename_column(:sivel2_gen_anexo_caso, :id_caso, :caso_id)
    rename_column(:sivel2_gen_anexo_caso, :id_fotra, :fotra_id)
    rename_column(:sivel2_gen_anexo_caso, :id_anexo, :anexo_id)

    rename_column(:sivel2_gen_antecedente_caso, :id_caso, :caso_id)
    rename_column(:sivel2_gen_antecedente_caso, :id_antecedente, :antecedente_id)

    rename_column(
      :sivel2_gen_antecedente_combatiente,
      :id_combatiente,
      :combatiente_id,
    )
    rename_column(
      :sivel2_gen_antecedente_combatiente,
      :id_antecedente,
      :antecedente_id,
    )

    rename_column(
      :sivel2_gen_antecedente_victima,
      :id_antecedente,
      :antecedente_id,
    )
    rename_column(
      :sivel2_gen_antecedente_victima,
      :id_victima,
      :victima_id,
    )

    rename_column(
      :sivel2_gen_antecedente_victimacolectiva,
      :id_antecedente,
      :antecedente_id,
    )

    rename_column(:sivel2_gen_caso_contexto, :id_contexto, :contexto_id)
    rename_column(:sivel2_gen_caso_contexto, :id_caso, :caso_id)

    rename_column(:sivel2_gen_caso_etiqueta, :id_caso, :caso_id)
    rename_column(:sivel2_gen_caso_etiqueta, :id_etiqueta, :etiqueta_id)
    rename_column(:sivel2_gen_caso_etiqueta, :id_usuario, :usuario_id)

    rename_column(:sivel2_gen_caso_fotra, :id_caso, :caso_id)
    rename_column(:sivel2_gen_caso_fotra, :id_fotra, :fotra_id)

    rename_column(:sivel2_gen_caso_frontera, :id_caso, :caso_id)
    rename_column(:sivel2_gen_caso_frontera, :id_frontera, :frontera_id)

    rename_column(:sivel2_gen_caso_fuenteprensa, :id_caso, :caso_id)

    rename_column(:sivel2_gen_caso_presponsable, :id_caso, :caso_id)
    rename_column(:sivel2_gen_caso_presponsable, :id_presponsable, :presponsable_id)

    rename_column(:sivel2_gen_caso_region, :id_caso, :caso_id)
    rename_column(:sivel2_gen_caso_region, :id_region, :region_id)

    rename_column(:sivel2_gen_combatiente, :id_caso, :caso_id)
    rename_column(:sivel2_gen_combatiente, :id_filiacion, :filiacion_id)
    rename_column(:sivel2_gen_combatiente, :id_organizacion, :organizacion_id)
    rename_column(:sivel2_gen_combatiente, :id_profesion, :profesion_id)
    rename_column(:sivel2_gen_combatiente, :id_rangoedad, :rangoedad_id)
    rename_column(:sivel2_gen_combatiente, :id_resagresion, :resagresion_id)
    rename_column(:sivel2_gen_combatiente, :id_sectorsocial, :sectorsocial_id)
    rename_column(:sivel2_gen_combatiente, :id_vinculoestado, :vinculoestado_id)

    rename_column(
      :sivel2_gen_filiacion_victimacolectiva,
      :id_filiacion,
      :filiacion_id,
    )

    rename_column(
      :sivel2_gen_organizacion_victimacolectiva,
      :id_organizacion,
      :organizacion_id,
    )

    rename_column(
      :sivel2_gen_profesion_victimacolectiva,
      :id_profesion,
      :profesion_id,
    )

    rename_column(
      :sivel2_gen_rangoedad_victimacolectiva,
      :id_rangoedad,
      :rangoedad_id,
    )

    rename_column(
      :sivel2_gen_sectorsocial_victimacolectiva,
      :id_sectorsocial,
      :sectorsocial_id,
    )

    rename_column(:sivel2_gen_victimacolectiva, :id_grupoper, :grupoper_id)
    rename_column(:sivel2_gen_victimacolectiva, :id_caso, :caso_id)

    rename_column(
      :sivel2_gen_victimacolectiva_vinculoestado,
      :id_vinculoestado,
      :vinculoestado_id,
    )
  end
end
