class PreparaParaMsip < ActiveRecord::Migration[7.0]
  include Msip::SqlHelper

  NOMIND= [
    ['sivel2_gen_etiqueta_pkey', 'sip_etiqueta_pkey'],
    ['sivel2_gen_ffrecuente_pkey', 'sip_fuenteprensa_pkey'],
    ['sivel2_gen_regionsjr_pkey', 'sip_oficina_pkey'],
    ['sivel2_gen_pais_pkey', 'sip_pais_pkey'],
    ['sivel2_gen_persona_pkey', 'sip_persona_pkey'],
    ['sivel2_gen_tdocumento_pkey', 'sip_tdocumento_pkey'],
    ['sivel2_gen_tsitio_pkey', 'sip_tsitio_pkey'],
    ['sivel2_gen_ubicacion_pkey', 'sip_ubicacion_pkey'],
  ]


  def up
    NOMIND.each do |nomini,nomfin|
      if existe_índice_pg?(nomini)
        renombrar_índice_pg(nomini, nomfin)
      end
    end
  end

  def down
  end
end
