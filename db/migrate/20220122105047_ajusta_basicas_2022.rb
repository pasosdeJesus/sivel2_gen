class AjustaBasicas2022 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE public.sivel2_gen_profesion SET nombre='ENFERMERO/A'
        WHERE id='4'; 
      UPDATE public.sivel2_gen_profesion SET nombre='ADMINISTRADOR/A PÚBLICO/A'
        WHERE id='20'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='SECRETARIAS DTO.'
        WHERE id='18'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='JUZGADOS MPALES.'
        WHERE id='29'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='DEFENSORIA MPAL.'
        WHERE id='31'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='CONTRALORIA MPAL.'
        WHERE id='33'; 
    SQL
  end
  def down
    execute <<-SQL
      UPDATE public.sivel2_gen_profesion SET nombre='ENFERMERO/A (A)'
        WHERE id='4'; 
      UPDATE public.sivel2_gen_profesion SET nombre='ADMINISTRADOR PUBLICO/A'
        WHERE id='20'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='SECRETARIAS (DTO.)'
        WHERE id='18'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='JUZGADOS (MPALES.)'
        WHERE id='29'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='DEFENSORIA (MPAL.)'
        WHERE id='31'; 
      UPDATE public.sivel2_gen_vinculoestado SET nombre='CONTRALORIA (MPAL.)'
        WHERE id='33'; 
    SQL
  end

end
