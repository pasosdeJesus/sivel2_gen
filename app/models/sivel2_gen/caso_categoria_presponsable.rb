
require 'sivel2_gen/concerns/models/caso_categoria_presponsable'

module Sivel2Gen
  # Relación entre Categoria y Presunto Responsable para 
  # relacionar victimizaciones que no son contra personas o que se
  # catalogan de manera especial en el DIHC.
  class CasoCategoriaPresponsable < ActiveRecord::Base
   include Sivel2Gen::Concerns::Models::CasoCategoriaPresponsable 
  end
end
