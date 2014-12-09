# encoding: UTF-8
module Sivel2Gen
  class HogarController < ApplicationController

    def tablasbasicas
      authorize! :manage, :tablasbasicas
      @ntablas = {}
      Ability::tablasbasicas.each { |t|
        k = Ability::tb_clase(t)
        n = k.human_attribute_name(t[1].pluralize.capitalize) 
        r = "admin/#{t[1].pluralize}"
#        fr = "admin_" + t[1].pluralize + "_path"
#        cmd = "send('#{fr}')";
#        if (t[0] != '' && t[0] != 'Sivel2Gen') 
#          cmd = "#{t[0].underscore.gsub(/\//, '_')}." + cmd
#        end
#        puts "OJO en hogar@tablasbasicas t[0]=" + t[0] + ", fr=" + fr + 
#          ", cmd=" + cmd
#        if (t[1] == 'emprendimiento') 
#            #byebug
#        else
#          @ntablas[n] = eval(cmd);
#          puts "@ntablas[n]=#{@ntablas[n]}"
#        end
          @ntablas[n] = r
      } 
      @ntablasor = @ntablas.keys.localize(:es).sort.to_a
      render layout: 'application'
    end

    def index
      if current_usuario
        authorize! :contar, Sivel2Gen::Caso
      end
      render layout: 'application'
    end

    def acercade
      render layout: 'application'
    end
  end
end
