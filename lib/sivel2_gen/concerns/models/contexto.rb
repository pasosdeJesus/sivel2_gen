# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Contexto
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          has_and_belongs_to_many :caso,
            class_name: "Sivel2Gen::Contexto",
            foreign_key: "contexto_id",
            association_foreign_key: "caso_id",
            join_table: "sivel2_gen_caso_contexto"
        end
      end
    end
  end
end
