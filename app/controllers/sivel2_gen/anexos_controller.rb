# encoding: UTF-8
module Sivel2Gen
  class AnexosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Anexo

    def descarga_anexo
      if !params[:id].nil?
        @anexo = Anexo.find(params[:id])
        ruta = @anexo.adjunto_file_name
        if !ruta.nil?
          # Idea para evitar inyeccion de https://www.ruby-forum.com/topic/124471
          n=sprintf(Sivel2Gen.ruta_anexos + "/%d_%s", @anexo.id, 
                    File.basename(ruta))
          logger.debug "Descargando #{n}"
          send_file n, x_sendfile: true
        else
          redirect_to casos_url
        end
      end
    end
  end
end
