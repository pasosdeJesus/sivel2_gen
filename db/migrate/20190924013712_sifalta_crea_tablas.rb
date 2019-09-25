class SifaltaCreaTablas < ActiveRecord::Migration[6.0]
  def up
    if !table_exists?(:sivel2_gen_actividadoficio)
      create_table :sivel2_gen_actividadoficio do |t|
        t.string :nombre, limit: 500, null: false
        t.string :observaciones, limit: 5000
        t.date :fechacreacion, null: false
        t.date :fechadeshabilitacion
        t.timestamp :created_at, null: false
        t.timestamp :updated_at, null: false
      end
    end
    if !table_exists?(:sivel2_gen_escolaridad)
      create_table :sivel2_gen_escolaridad do |t|
        t.string :nombre, limit: 500, null: false
        t.string :observaciones, limit: 5000
        t.date :fechacreacion, null: false
        t.date :fechadeshabilitacion
        t.timestamp :created_at, null: false
        t.timestamp :updated_at, null: false
      end
    end
    if !table_exists?(:sivel2_gen_estadocivil)
      create_table :sivel2_gen_estadocivil do |t|
        t.string :nombre, limit: 500, null: false
        t.string :observaciones, limit: 5000
        t.date :fechacreacion, null: false
        t.date :fechadeshabilitacion
        t.timestamp :created_at, null: false
        t.timestamp :updated_at, null: false
      end
    end
    if !table_exists?(:sivel2_gen_maternidad)
      create_table :sivel2_gen_maternidad do |t|
        t.string :nombre, limit: 500, null: false
        t.string :observaciones, limit: 5000
        t.date :fechacreacion, null: false
        t.date :fechadeshabilitacion
        t.timestamp :created_at, null: false
        t.timestamp :updated_at, null: false
      end
    end
  end


  def down
  end
end
