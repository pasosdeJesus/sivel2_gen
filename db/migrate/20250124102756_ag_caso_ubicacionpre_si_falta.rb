# frozen_string_literal: true

class AgCasoUbicacionpreSiFalta < ActiveRecord::Migration[7.2]
  def up
    execute(<<-SQL)
      CREATE SEQUENCE public.sivel2_gen_caso_ubicacionpre_id_seq
          START WITH 1
          INCREMENT BY 1
          NO MINVALUE
          NO MAXVALUE
          CACHE 1;
      CREATE TABLE public.sivel2_gen_caso_ubicacionpre (
          id BIGINT PRIMARY KEY DEFAULT nextval('public.sivel2_gen_caso_ubicacionpre_id_seq'::regclass),
          caso_id INTEGER REFERENCES public.sivel2_gen_caso(id),
          ubicacionpre_id BIGINT REFERENCES public.msip_ubicacionpre(id),
          latitud DOUBLE PRECISION,
          longitud DOUBLE PRECISION,
          tsitio_id INTEGER REFERENCES public.msip_tsitio
      );
    SQL
  end

  def down
    execute(<<-SQL)
      DROP TABLE public.sivel2_gen_caso_ubicacionpre;
      DROP SEQUENCE public.sivel2_gen_caso_ubicacionpre_id_seq;
    SQL
  end
end
