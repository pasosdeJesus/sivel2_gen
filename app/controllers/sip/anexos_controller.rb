module Sip
  class AnexosController < ApplicationController
    load_and_authorize_resource class: Sip::Anexo, except: :descarga_anexo

    def descarga_anexo_gen
      if !params[:id].nil?
        @anexo = Anexo.find(params[:id].to_i)
        ruta = @anexo.adjunto_file_name
        if !ruta.nil?
          # Idea para evitar inyeccion de https://www.ruby-forum.com/topic/124471
          n=sprintf(Sip.ruta_anexos.to_s + "/%d_%s", @anexo.id.to_i, 
                    File.basename(ruta))
          logger.debug "Descargando #{n}"
          send_file n, x_sendfile: true
        else
          redirect_to usuarios_url
        end
      end
    end
    def descarga_anexo
      anexo_caso = Sivel2Gen::AnexoCaso.where(id_anexo: params[:id])
      if anexo_caso[0].tipoanexo
        tipoanexo = anexo_caso[0].tipoanexo.id
        if tipoanexo == 2
          descarga_anexo_gen
        else
          authorize! :descarga_anexo, Sip::Anexo
          descarga_anexo_gen
        end
      end
    end
  end
end
