# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Buscarrepetido
        extend ActiveSupport::Concern

        included do
          include ActiveModel::Model
          attr_accessor :fechaini
          attr_accessor :fechafin
        end
      end
    end
  end
end
