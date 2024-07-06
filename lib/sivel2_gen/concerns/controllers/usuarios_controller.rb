
require 'msip/concerns/controllers/usuarios_controller'

module Sivel2Gen
  module Concerns
    module Controllers
      module UsuariosController

        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Controllers::UsuariosController

          def atributos_index
            r = [
              :id,
              :nusuario,
              :nombre,
              :email,
              :rol
            ]
            if can?(:manage, Msip::Grupo)
              r += [:grupo]
            end
            r += [
              :descripcion,
              :created_at_localizada,
              :habilitado
            ]
            r
          end

          def atributos_form
            r = [
              :nusuario,
              :nombre,
              :descripcion,
              :email,
              :rol,
            ]
            if can?(:manage, Msip::Grupo)
              r += [:grupo]
            end
            r += [
              :observadorffechaini_localizada,
              :observadorffechafin_localizada,
              :filtrodepartamento_ids,
              :tema,
              :idioma,
              :encrypted_password,
              :fechacreacion,
              :fechadeshabilitacion,
              :failed_attempts,
              :unlock_token,
              :locked_at
            ]
            r
          end

          def atributos_show
            [:id] + atributos_form +
              [:fechacreacion_localizada] +
              [:fechadeshabilitacion_localizada] -
              [:fechacreacion]-
              [:fechadeshabilitacion]
          end

          def vistas_manejadas
            ['Usuario']
          end

          private

          def lista_params_sivel2_gen
            lista_params_msip + [
              :observadorffechaini,
              :observadorffechafin,
              filtrodepartamento_ids: []
            ]
          end

          def usuario_params
            p = params.require(:usuario).permit(
              lista_params_sivel2_gen)
            return p
          end


        end  # included

      end
    end
  end
end
