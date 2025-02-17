# frozen_string_literal: true

class CreaProfesionVictima < ActiveRecord::Migration[7.1]
  def change
    create_table(:sivel2_gen_profesion_victima) do |t|
      t.references(:victima, null: false, foreign_key: { to_table: :sivel2_gen_victima })
      t.references(:profesion, null: false, foreign_key: { to_table: :sivel2_gen_profesion })
    end
  end
end
