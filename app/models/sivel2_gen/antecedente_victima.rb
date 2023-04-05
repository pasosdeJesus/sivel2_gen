
module Sivel2Gen
  class AntecedenteVictima < ActiveRecord::Base
    belongs_to :antecedente, foreign_key: "antecedente_id",
      class_name: 'Sivel2Gen::Antecedente', optional: false
    belongs_to :victima, foreign_key: "victima_id",
      class_name: 'Sivel2Gen::Victima', optional: false
  end
end
