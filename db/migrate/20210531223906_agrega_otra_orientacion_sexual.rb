class AgregaOtraOrientacionSexual < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_victima DROP CONSTRAINT 
        victima_orientacionsexual_check;
      ALTER TABLE sivel2_gen_victima ADD CONSTRAINT 
        victima_orientacionsexual_check CHECK (
          orientacionsexual = 'B' OR 
          orientacionsexual = 'G' OR 
          orientacionsexual = 'H' OR 
          orientacionsexual = 'I' OR 
          orientacionsexual = 'L' OR 
          orientacionsexual = 'O' OR 
          orientacionsexual = 'S' OR
          orientacionsexual = 'T' 
        );
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_victima DROP CONSTRAINT 
        victima_orientacionsexual_check;
      ALTER TABLE sivel2_gen_victima ADD CONSTRAINT 
        victima_orientacionsexual_check CHECK (
          orientacionsexual = 'L' OR 
          orientacionsexual = 'G' OR 
          orientacionsexual = 'B' OR 
          orientacionsexual = 'T' OR 
          orientacionsexual = 'H' OR 
          orientacionsexual = 'S'
        );
    SQL
  end

end
