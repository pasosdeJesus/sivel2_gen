
require 'sivel2_gen/concerns/controllers/gruposper_controller'

module Msip
  class GruposperController < ApplicationController

    load_and_authorize_resource class: Msip::Grupoper
    include Sivel2Gen::Concerns::Controllers::GruposperController

  end
end
