# encoding: UTF-8
class AnexosController < ApplicationController
  def descarga_anexo
    if !params[:id].nil?
      @anexo = Anexo.find(params[:id])
      ruta = @anexo.adjunto_file_name
      if !ruta.nil?
        n=sprintf("%s/public/system/anexos/adjuntos/000/000/%03d/original/%s", 
                 Rails.root, @anexo.id, ruta)
        n=sprintf(Sivel2Gen.ruta_anexos + "/%d_%s", @anexo.id, ruta)
        puts n
        send_file n, x_sendfile: true
      else
        redirect_to casos_url
      end
    end
  end
end
