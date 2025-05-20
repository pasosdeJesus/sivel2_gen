# frozen_string_literal: true

class MejoraNombres2 < ActiveRecord::Migration[7.0]
  include Msip::SqlHelper

  SEQ = [
    ["acto_seq", "sivel2_gen_acto_id_seq"],
    ["caso_etiqueta_seq", "sivel2_gen_caso_etiqueta_id_seq"],
    ["caso_presponsable_seq", "sivel2_gen_caso_presponsable_id_seq"],
    ["fotra_seq", "sivel2_gen_fotra_id_seq"],
    ["fuente_directa_seq", "sivel2_gen_fotra_id_seq"],
    ["victima_seq", "sivel2_gen_victima_id_seq"],
    ["sivel2_gen_caso_fotra_seq", "sivel2_gen_caso_fotra_id_seq"],
    ["sivel2_gen_caso_fuenteprensa_seq", "sivel2_gen_caso_fuenteprensa_id_seq"],
    ["sivel2_gen_caso_fuentedirecta_seq", "sivel2_gen_caso_fotra_id_seq"],
  ]

  def up
    SEQ.each do |nomini, nomfin|
      if existe_secuencia_pg?(nomini)
        renombrar_secuencia_pg(nomini, nomfin)
      end
    end
  end

  def down
    SEQ.each do |nomini, nomfin|
      if existe_secuencia_pg?(nomfin)
        renombrar_secuencia_pg(nomfin, nomini)
      end
    end
  end
end
