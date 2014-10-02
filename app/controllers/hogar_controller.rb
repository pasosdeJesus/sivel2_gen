# encoding: UTF-8
class HogarController < ApplicationController

	def tablasbasicas
		authorize! :manage, :tablasbasicas
    @ntablas = {}
    Ability::tablasbasicas.each { |t|
      k = t.capitalize.constantize 
      n = k.human_attribute_name(t.pluralize.capitalize) 
      @ntablas[n] = send("admin_" + t.pluralize + "_path")
    } 
    @ntablasor = @ntablas.keys.localize(:es).sort.to_a
	end

  def index
  end
end
