# encoding: UTF-8
class HogarController < ApplicationController

	def tablasbasicas
		authorize! :manage, :tablasbasicas
    @ntablas = {}
    Ability::tablasbasicas.each { |t|
      #puts "t=#{t}"
      k = t.capitalize.constantize 
      #puts "k=#{k}"
      n = k.human_attribute_name(t.pluralize.capitalize) 
      #puts "n=#{n}"
      @ntablas[n] = send("admin_" + t.pluralize + "_path")
      #puts "@ntablas[n]=#{@ntablas[n]}"
    } 
    @ntablasor = @ntablas.keys.localize(:es).sort.to_a
	end

  def index
  end
end
