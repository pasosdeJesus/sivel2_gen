module Sivel2Gen
  class InfomapaController < ApplicationController

    def infomapa
      authorize! :contar, Sivel2Gen::Caso

      #res = ActiveRecord::Base.connection.execute(sql)
      render :infomapa, layout: 'application'
      return
    end
    def datoscovid
      render :file => '/public/data/all_minified.json', 
        :content_type => 'application/json',
          :layout => false
    end
    def worldjson
      render :file => '/public/maps/WORLD.json', 
        :content_type => 'application/json',
          :layout => false
    end
  end
end
