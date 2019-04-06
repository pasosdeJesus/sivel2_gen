# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Consexpcaso 
        extend ActiveSupport::Concern

        included do
          belongs_to :conscaso, class_name: 'Sivel2Gen::Conscaso'

          has_many :ubicacion, through: :caso,
            class_name: 'Sip::Ubicacion'

          has_many :caso_presponsable, through: :caso,
            class_name: 'Sivel2Gen::CasoPresponsable'

          has_many :acto, through: :caso,
            class_name: 'Sivel2Gen::Acto'

          has_many :victima, through: :caso,
            class_name: 'Sivel2Gen::Victima'

          has_many :persona, through: :victima,
            class_name: 'Sip::Persona'

          has_many :caso_etiqueta, through: :caso,
            class_name: 'Sivel2Gen::CasoEtiqueta'

          has_many :caso_usuario, through: :caso,
            class_name: 'Sivel2Gen::CasoUsuario'

        end

        module ClassMethods

          def interpreta_ordenar_por(ordenar_por)
            ordenar_por
          end

          def consulta_consexpcaso 
            "SELECT conscaso.*,
              caso.titulo,
              caso.hora,
              caso.duracion,
              caso.grconfiabilidad,
              caso.gresclarecimiento,
              caso.grimpunidad,
              caso.grinformacion,
              caso.bienes,
              caso.id_intervalo,
              caso.created_at,
              caso.updated_at
              FROM public.sivel2_gen_conscaso AS conscaso
              JOIN public.sivel2_gen_caso AS caso ON caso.id=conscaso.caso_id
              "
          end

          def crea_consexpcaso(conscaso, ordenar_por = nil)
            if ARGV.include?("db:migrate")
              return
            end
            if !ActiveRecord::Base.connection.data_source_exists? 'sivel2_gen_conscaso'
              Sivel2Gen::Conscaso.refresca_conscaso
            end
            if ActiveRecord::Base.connection.data_source_exists? 'sivel2_gen_consexpcaso'
              ActiveRecord::Base.connection.execute(
                "DROP MATERIALIZED VIEW IF EXISTS sivel2_gen_consexpcaso;")
            end
            w = "WHERE TRUE=FALSE"
            if conscaso && conscaso.count > 0
              w = "WHERE conscaso.caso_id IN (#{conscaso.select(:caso_id).to_sql})"
            end
            if ordenar_por
              w += ' ORDER BY ' + self.interpreta_ordenar_por(ordenar_por)
            end
            ActiveRecord::Base.connection.execute("CREATE 
              MATERIALIZED VIEW sivel2_gen_consexpcaso AS
              #{self.consulta_consexpcaso}
              #{w} ;")
          end # def crea_consexpcaso

        end # module ClassMethods

      end
    end
  end
end
