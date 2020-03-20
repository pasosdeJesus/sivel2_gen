# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Contextovictima
        extend ActiveSupport::Concern

        included do
          include Sip::Basica
          
        end # included

      end
    end
  end
end
