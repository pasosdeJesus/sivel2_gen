# Grafica con R

module Sivel2Gen
  module Fil23Gen
    class GraficarApexchartsController < ApplicationController
  
      def victimizaciones_individuales
        authorize! :contar, Sivel2Gen::Caso
        render 'fil23_gen/graficar_apexcharts/victimizaciones_individuales', 
          layout: 'application'
      end
    end
  end
end
