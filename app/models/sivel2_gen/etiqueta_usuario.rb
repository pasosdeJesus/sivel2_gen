# encoding: UTF-8
module Sivel2Gen
  class EtiquetaUsuario < ActiveRecord::Base
    belongs_to :etiqueta, class_name: 'Sivel2Gen::Etiqueta'
    belongs_to :usuario
  end
end
