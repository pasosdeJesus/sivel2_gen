# encoding: UTF-8

module Basica
  def habilitados(campoord = "nombre")
    where(fechadeshabilitacion: nil).order(campoord.to_sym)
  end
end
