require 'sivel2_gen/concerns/controllers/categorias_controller'

module Sivel2Gen
  module Admin
    class CategoriasController < Msip::Admin::BasicasController
      load_and_authorize_resource class: Sivel2Gen::Categoria

      include Sivel2Gen::Concerns::Controllers::CategoriasController

    end
  end
end
