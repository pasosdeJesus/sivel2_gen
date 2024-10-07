
require 'sivel2_gen/concerns/models/victimacolectiva_vinculoestado'

module Sivel2Gen
  # Relación n:n entre Víctima Colectiva y Vínculo con el Estado
  class VictimacolectivaVinculoestado < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::VictimacolectivaVinculoestado
  end
end
