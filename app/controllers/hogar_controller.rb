# encoding: UTF-8
class HogarController < ApplicationController

	def tablasbasicas
		authorize! :manage, :tablasbasicas
	end

  def index
  end
end
