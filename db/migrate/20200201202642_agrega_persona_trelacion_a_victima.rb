class AgregaPersonaTrelacionAVictima < ActiveRecord::Migration[6.0]
  def change
    add_column :sivel2_gen_victima, :id_persona_trelacion, :int
  end
end
