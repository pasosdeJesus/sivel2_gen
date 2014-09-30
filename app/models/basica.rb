# encoding: UTF-8

module Basica
  def habilitados
    where(fechadeshabilitacion: nil)
  end
end
