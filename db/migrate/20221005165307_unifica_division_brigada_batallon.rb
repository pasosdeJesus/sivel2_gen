# frozen_string_literal: true.
class UnificaDivisionBrigadaBatallon < ActiveRecord::Migration[7.0]
  def up
    add_column :sivel2_gen_caso_presponsable, :subdivision, :string
    execute <<-SQL
      UPDATE sivel2_gen_caso_presponsable 
        SET subdivision = TRIM(COALESCE(division, '')) || ' / ' || 
          TRIM(COALESCE(brigada, '')) || ' / ' || 
          TRIM(COALESCE(batallon, '')) WHERE
          TRIM(COALESCE(division, ''))<>'' OR
          TRIM(COALESCE(brigada, ''))<>'' OR
          TRIM(COALESCE(batallon, ''))<>'';
    SQL
    remove_column :sivel2_gen_caso_presponsable, :division, :string
    remove_column :sivel2_gen_caso_presponsable, :brigada, :string
    remove_column :sivel2_gen_caso_presponsable, :batallon, :string
  end

  def down
    add_column :sivel2_gen_caso_presponsable, :division, :string
    add_column :sivel2_gen_caso_presponsable, :brigada, :string
    add_column :sivel2_gen_caso_presponsable, :batallon, :string
    cps = Sivel2Gen::CasoPresponsable.all
    cps.each do |cp|
      if cp.subdivision
        p = cp.subdivision.split('/')
        if p.count == 3
          p = p.map {|x| quote(x)}
          execute <<-SQL
            UPDATE sivel2_gen_caso_presponsable 
              SET division=TRIM(#{p[0]}),
                brigada=TRIM(#{p[1]}),
                batallon=TRIM(#{p[2]})
              WHERE id=#{cp.id};
          SQL
        else
          debugger
          execute <<-SQL
            UPDATE sivel2_gen_caso_presponsable 
              SET division='#{cp.subdivision}'
              WHERE id='#{cp.id}';
          SQL
        end
      end
    end
    remove_column :sivel2_gen_caso_presponsable, :subdivision, :string
  end
end
