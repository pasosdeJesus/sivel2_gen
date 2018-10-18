class PconsolidadoDihc2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET id_pconsolidado=1 WHERE 
        id IN (10,20,30);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=2 WHERE 
        id IN (87,97,701,703);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=3 WHERE 
        id IN (40,50);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=4 WHERE 
        id IN (11,21,302);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=5 WHERE 
        id IN (76);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=6 WHERE 
        id IN (12,22,36);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=7 WHERE 
        id IN (72);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=8 WHERE 
        id IN (47,56);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=9 WHERE 
        id IN (13,23,33);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=10 WHERE 
        id IN (88,98,702,704);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=11 WHERE 
        id IN (43,53);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=12 WHERE 
        id IN (14,24,301);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=13 WHERE 
        id IN (15,25,35);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=14 WHERE 
        id IN (73);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=15 WHERE 
        id IN (45,55);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=16 WHERE 
        id IN (16,26,37);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=17 WHERE 
        id IN (46,57);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=18 WHERE 
        id IN (141,241,341);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=19 WHERE 
        id IN (715);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=20 WHERE 
        id IN (19,29,39);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=21 WHERE 
        id IN (77);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=22 WHERE 
        id IN (420,520);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=23 WHERE 
        id IN (101);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=24 WHERE 
        id IN (41);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=25 WHERE 
        id IN (48,58);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=26 WHERE 
        id IN (74);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=27 WHERE 
        id IN (714);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=28 WHERE 
        id IN (716);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=29 WHERE 
        id IN (717);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=30 WHERE 
        id IN (718);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=31 WHERE 
        id IN (75);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=32 WHERE 
        id IN (78);
    SQL
  end
end
