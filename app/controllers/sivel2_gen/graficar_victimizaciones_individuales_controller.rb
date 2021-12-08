require 'sivel2_gen/concerns/controllers/graficar_victimizaciones_individuales_controller'

module Sivel2Gen
  class GraficarVictimizacionesIndividualesController < ApplicationController

    # Especial, cada función debe tener autorización
    include Sivel2Gen::Concerns::Controllers::GraficarVictimizacionesIndividualesController

  end
end
