# encoding: UTF-8
module Sivel2Gen
  class HogarController < ApplicationController

    def tablasbasicas
      authorize! :manage, :tablasbasicas
      @ntablas = {}
      Ability::tablasbasicas.each { |t|
        k = Ability::tb_clase(t)
        n = k.human_attribute_name(t[1].pluralize.capitalize) 
        @ntablas[n] = send("admin_" + t[1].pluralize + "_path")
        #puts "@ntablas[n]=#{@ntablas[n]}"
      } 
      @ntablasor = @ntablas.keys.localize(:es).sort.to_a
    end

    def index
      if current_usuario
        authorize! :contar, Caso
      end
    end

    def acercade
    end
  end
end
