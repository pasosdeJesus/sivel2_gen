module Sivel2Gen
  class InfomapaController < ApplicationController

    def infomapa
      authorize! :contar, Sivel2Gen::Caso

      #res = ActiveRecord::Base.connection.execute(sql)
      render :infomapa, layout: 'application'
      return
    end

  end
end
