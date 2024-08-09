require 'sivel2_gen/concerns/controllers/familiares_controller'

module Sivel2Gen
  class FamiliaresController < Heb412Gen::ModelosController
    load_and_authorize_resource class: Msip::PersonaTrelacion
    include Sivel2Gen::Concerns::Controllers::FamiliaresController
  end
end
