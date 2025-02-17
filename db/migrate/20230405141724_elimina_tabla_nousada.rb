# frozen_string_literal: true

class EliminaTablaNousada < ActiveRecord::Migration[7.0]
  def up
    if table_exists?(:sivel2_gen_combatiente_presponsable)
      drop_table(:sivel2_gen_combatiente_presponsable)
    end
  end
end
