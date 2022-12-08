class CompletaRenombraSipAMsip < ActiveRecord::Migration[7.0]
  include Msip::SqlHelper

  NOMIND= [
    ['sip_clase_id_municipio', 'msip_clase_id_municipio'],
    ['sip_departamento_id_pais', 'msip_departamento_id_pais'],
    ['sip_municipio_id_departamento', 'msip_municipio_id_departamento'],
    ['sip_persona_anionac', 'msip_persona_anionac'],
    ['sip_persona_sexo', 'msip_persona_sexo'],
  ]


  NOMRES = [
    ['msip_fuenteprensa', 'sip_fuenteprensa_check', 'msip_fuenteprensa_check'],
    ['msip_clase', 'sip_clase_id_key', 'msip_clase_id_key'],
    ['msip_municipio', 'sip_municipio_id_key', 'msip_municipio_id_key'],
    ['msip_clase', 'sip_clase_id_municipio_fkey', 
     'msip_clase_id_municipio_fkey'],
    ['msip_persona', 'sip_persona_id_clase_fkey', 'msip_persona_id_clase_fkey'],
    ['msip_persona', 'sip_persona_id_departamento_fkey', 
     'msip_persona_id_departamento_fkey'],
    ['msip_persona', 'sip_persona_id_municipio_fkey', 
     'msip_persona_id_municipio_fkey'],
    ['msip_ubicacion', 'sip_ubicacion_id_clase_fkey', 
     'msip_ubicacion_id_clase_fkey'],
    ['msip_ubicacion', 'sip_ubicacion_id_departamento_fkey', 
     'msip_ubicacion_id_departamento_fkey'],
    ['msip_ubicacion', 'sip_ubicacion_id_municipio_fkey', 
     'msip_ubicacion_id_municipio_fkey'],
  ]


  def up
    NOMIND.each do |nomini,nomfin|
      if existe_índice_pg?(nomini)
        renombrar_índice_pg(nomini, nomfin)
      end
    end

    NOMRES.each do |tr|
      if existe_restricción_pg?(tr[1])
        renombrar_restricción_pg(tr[0], tr[1], tr[2])
      end
    end
  end

  def down
  end
end
