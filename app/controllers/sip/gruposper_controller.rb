
require 'sivel2_gen/concerns/controllers/gruposper_controller'

module Sip
  class GruposperController < ApplicationController

    load_and_authorize_resource class: Sip::Grupoper
    include Sivel2Gen::Concerns::Controllers::GruposperController

  end
end
