# frozen_string_literal: true

class PreparaArregloSigla < ActiveRecord::Migration[7.0]
  def up
    execute(<<-SQL)
      DROP VIEW IF EXISTS sivel2_gen_conscaso1 CASCADE;
    SQL
  end

  def down
    execute(<<-SQL)
      DROP VIEW IF EXISTS sivel2_gen_conscaso1 CASCADE;
    SQL
  end
end
