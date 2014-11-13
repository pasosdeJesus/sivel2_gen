# encoding: UTF-8
module Sivel2Gen
  class HogarController < ApplicationController

    def tablasbasicas
      authorize! :manage, :tablasbasicas
      @ntablas = {}
      Ability::tablasbasicas.each { |t|
        puts "t=#{t}"
        k = t[0] + '::' + t[1].capitalize
        k = k.constantize 
        puts "k=#{k}"
        n = k.human_attribute_name(t[1].pluralize.capitalize) 
        puts "n=#{n}"
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
