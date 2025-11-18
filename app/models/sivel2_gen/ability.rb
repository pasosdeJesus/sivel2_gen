# frozen_string_literal: true

module Sivel2Gen
  # Permisos
  class Ability < Msip::Ability
    include CanCan::Ability

    ROLADMIN = 1
    ROLOPERADOR = 5

    ROLES = Msip::Ability::ROLES

    GRUPO_ANALISTA_CASOS = 20
    GRUPO_OBSERVADOR_CASOS = 21
    GRUPO_OBSERVADOR_PARTE_CASOS = 22

    ROLES_CA = [
      "Administrar casos, personas, organizaciones sociales " +
        "Administrar plantillas, formularios y encuestas. " +
        "Crear copias de respaldo cifradas y ver bitácoras. " +
        "Administrar usuarios y tablas básicas. ", # 1
      "", # 2
      "", # 3
      "", # 4
      "Puede ver reportes, conteos y generar plantillas. " +
        "Si es del grupo ANALISTA puede administrar organizaciones sociales, personas y caso. " +
        "O de lo contrario si es del grupo OBSERVADOR podrá consultar toda la información pero sólo podrá cambiar etiquetas de casos. ", # 5
      "O de lo contrario si es del grupo OBSERVADOR DE PARTE podrá consultar la información sólo de algunos casos resultantes de un filtro particular.", # 5
      "", # 6
      "", # 7
    ]

    BASICAS_PROPIAS = [
      ["Sivel2Gen", "actividadoficio"],
      ["Sivel2Gen", "antecedente"],
      ["Sivel2Gen", "categoria"],
      ["Sivel2Gen", "contextovictima"],
      ["Sivel2Gen", "contexto"],
      ["Sivel2Gen", "escolaridad"],
      ["Sivel2Gen", "estadocivil"],
      ["Sivel2Gen", "filiacion"],
      ["Sivel2Gen", "frontera"],
      ["Sivel2Gen", "iglesia"],
      ["Sivel2Gen", "intervalo"],
      ["Sivel2Gen", "maternidad"],
      ["Sivel2Gen", "organizacion"],
      ["Sivel2Gen", "pconsolidado"],
      ["Sivel2Gen", "presponsable"],
      ["Sivel2Gen", "profesion"],
      ["Sivel2Gen", "rangoedad"],
      ["Sivel2Gen", "region"],
      ["Sivel2Gen", "resagresion"],
      ["Sivel2Gen", "sectorsocial"],
      ["Sivel2Gen", "supracategoria"],
      ["Sivel2Gen", "tviolencia"],
      ["Sivel2Gen", "vinculoestado"],
    ]

    def tablasbasicas
      r = (Msip::Ability::BASICAS_PROPIAS -
           [["Msip", "oficina"]]) + BASICAS_PROPIAS
      r
    end

    # Tablas básicas cuyo id no es autoincremental
    BASICAS_ID_NOAUTO = [
      ["Sivel2Gen", "categoria"],
      ["Sivel2Gen", "tviolencia"],
    ]

    def basicas_id_noauto
      Msip::Ability::BASICAS_ID_NOAUTO + BASICAS_ID_NOAUTO
    end

    # Tablas no básicas pero que tienen índice
    NOBASICAS_INDSEQID = [
      ["sivel2_gen", "caso"],
      ["sivel2_gen", "actocolectivo"],
      ["sivel2_gen", "caso_categoria_presponsable"],
      ["Sivel2Gen", "caso_fotra"],
      ["Sivel2Gen", "caso_fuenteprensa"],
      ["sivel2_gen", "caso_solicitud"],
      ["sivel2_gen", "combatiente"],
      # ['Sivel2Gen', 'victima'],
      ["sivel2_gen", "victimacolectiva"],
    ]

    # Tablas no básicas pero que tienen índice con secuencia id_seq
    def nobasicas_indice_seq_con_id
      Msip::Ability::NOBASICAS_INDSEQID + NOBASICAS_INDSEQID
    end

    # Tablas básicas que deben volcarse primero --por ser requeridas
    # por otras básicas
    BASICAS_PRIO = [
      ["Sivel2Gen", "pconsolidado"],
      ["Sivel2Gen", "tviolencia"],
      ["Sivel2Gen", "supracategoria"],
      ["Sivel2Gen", "intervalo"],
      ["Sivel2Gen", "filiacion"],
      ["Sivel2Gen", "organizacion"],
      ["Sivel2Gen", "sectorsocial"],
      ["Sivel2Gen", "vinculoestado"],
      ["Sivel2Gen", "contextovictima"],
    ]
    def tablasbasicas_prio
      Msip::Ability::BASICAS_PRIO + BASICAS_PRIO - [["Msip", "grupo"]]
    end

    def self.derechos
      "Creative Commons Atribución 2.5 Colombia. http://creativecommons.org/licenses/by/2.5/co/"
    end

    def self.organizacion_responsable
      "Banco de Datos del CINEP"
    end

    # if ActiveRecord::Base.connection.data_source_exists?('sivel2_gen_caso')
    # Sivel2Gen::Consexpcaso.crea_consexpcaso(nil)
    # end

    CAMPOS_PLANTILLAS_PROPIAS = {
      "Caso" => {
        campos: [
          :caso_id,
          :fecha,
          :memo,
          :ubicaciones,
          :victimas,
          :presponsables,
          :tipificacion,
          :titulo,
          :hora,
          :duracion,
          :grconfiabilidad,
          :gresclarecimiento,
          :grimpunidad,
          :grinformacion,
          :bienes,
          :intervalo_id,
          :created_at,
          :updated_at,
        ],
        controlador: "Sivel2Gen::CasosController",
        ruta: "/casos",
      },
      "Victima" => {
        campos: if ActiveRecord::Base.connection.data_source_exists?(
          "sivel2_gen_victima",
        )
                  (Sivel2Gen::Victima.column_names + [
                    :departamento_caso,
                    :fecha_caso,
                    :municipio_caso,
                    :nombre,
                    :contextovictima,
                    :profesion,
                    :presponsables_caso,
                    :presponsables_caso_ids,
                    :rot1,
                    :rot2,
                    :rot3,
                    :rot4,
                    :rot5,
                    :rot6,
                    :rot7,
                    :rot8,
                    :rot9,
                    :rot10,
                    :rot11,
                    :rot12,
                    :rot13,
                    :rot14,
                    :rot15,
                    :rot16,
                    :rot17,
                    :rot18,
                    :rot19,
                    :rot20,
                    :rot21,
                    :rot22,
                    :rot23,
                    :rot24,
                    :rot25,
                    :rot26,
                    :rot27,
                    :rot28,
                    :rot29,
                    :rot30,
                    :rot31,
                    :rot32,
                    :rot33,
                    :rot34,
                    :rot35,
                    :rot36,
                    :rot37,
                    :rot38,
                    :rot39,
                    :sexo,
                    :trimestre_caso,
                    :ubicacion_caso,
                  ])
                else
                  []
                end,
        controlador: "Sivel2Gen::CasosController",
        ruta: "/casos",
      },

    }

    def campos_plantillas
      n = Heb412Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS
        .clone.merge(CAMPOS_PLANTILLAS_PROPIAS)
      # byebug
      n
    end

    # Establece autorizaciones con CanCanCan
    def self.initialize_sivel2_gen(habilidad, usuario = nil)
      # Sin autenticación puede consultarse información geográfica
      habilidad.can(:read, [Msip::Pais, Msip::Departamento, Msip::Municipio, Msip::Centropoblado, Msip::Ubicacionpre])

      # Hacer conteos
      habilidad.can(:cuenta, Sivel2Gen::Caso)

      # La consulta web es publica dependiendo de
      if !usuario && Rails.application.config.x.sivel2_consulta_web_publica
        habilidad.can(:read, Msip::Ubicacionpre)

        habilidad.can(
          [
            :buscar,
            :contar,
            :lista,
            :presenta_datos_mapaosm,
          ],
          Sivel2Gen::Caso,
        )

        habilidad.can([:read, :filtra_por_tviolencia], Sivel2Gen::Categoria)

        # API público
        # Mostrar un caso con casos/101
        # Mostrar un caso en XML - HTML con casos/101.xml
        # Mostrar un caso en XML para descarga casos/101.xrlat
        habilidad.can([:read, :show], Sivel2Gen::Caso)

        # Mostrar registros limitados
        habilidad.can(:index4000, Sivel2Gen::Caso)
      end

      if !usuario || usuario.fechadeshabilitacion
        return
      end

      # Los siguientes son para todo autenticado

      habilidad.can(
        [
          :buscar,
          :contar,
          :exportaCSV,
          :lista,
          :presenta_datos_mapaosm,
          :reportar,
        ],
        Sivel2Gen::Caso,
      )
      habilidad.can([:read, :update], Mr519Gen::Encuestausuario)
      habilidad.can(:read, Msip::Orgsocial)

      # Conteos
      habilidad.can(:victimizaciones, Sivel2Gen::Caso)
      habilidad.can(:filtra_por_tviolencia, Sivel2Gen::Categoria)
      habilidad.can(:genvic, Sivel2Gen::Caso)
      habilidad.can(:personas, Sivel2Gen::Caso)

      habilidad.can(:descarga_anexo, Msip::Anexo)
      habilidad.can(:mostrar_portada, Msip::Anexo)
      habilidad.can(:abre_anexo, Msip::Anexo)
      habilidad.can(:manage, Sivel2Gen::AnexoCaso)

      habilidad.can(:manage, Msip::PersonaTrelacion)
      habilidad.can(:contar, Msip::Ubicacion)
      habilidad.can(:mundep, Msip::Ubicacionpre)

      if usuario && usuario.rol
        habilidad.can(:nuevo, Msip::Ubicacion)

        habilidad.can(:manage, [
          Sivel2Gen::CasoEtiqueta,
          Sivel2Gen::CasoFuenteprensa,
          Sivel2Gen::CasoFotra,
          Sivel2Gen::CasoPresponsable,
          Sivel2Gen::CasoSolicitud,
          Sivel2Gen::CasoUbicacionpre,
          Sivel2Gen::Combatiente,
          Sivel2Gen::Victima,
          Sivel2Gen::Victimacolectiva,
        ])
        habilidad.can(:guardar_y_editar, Sivel2Gen::Caso)

        habilidad.can(:read, Sivel2Gen::Presponsable)

        case usuario.rol
        when Ability::ROLANALI
          habilidad.can(:read, Heb412Gen::Doc)
          habilidad.can(:read, Heb412Gen::Plantilladoc)
          habilidad.can(:read, Heb412Gen::Plantillahcm)
          habilidad.can(:read, Heb412Gen::Plantillahcr)
          habilidad.can(:index, Sivel2Gen::Victima)

          if usuario.grupo &&
              usuario.grupo.pluck(:id).include?(GRUPO_ANALISTA_CASOS)
            habilidad.can(
              [:read, :new, :edit, :update, :create],
              Msip::Orgsocial,
            )
            #habilidad.can(:create, Msip::Bitacora, usuario: { id: usuario.id })
            ## creación de registros en bitácora no es mediante interfaz
            habilidad.can(:read, Msip::Bitacora, usuario: { id: usuario.id })
            habilidad.can(:manage, Msip::Persona)
            habilidad.can(:manage, Msip::Grupoper)

            habilidad.can(:manage, Sivel2Gen::Acto)
            habilidad.can(:manage, Sivel2Gen::Actocolectivo)
            habilidad.can(
              [
                :read,
                :new,
                :edit,
                :update,
                :create,
                :importa,
                :importarrelatos,
                :errores_importacion,
                :nuevo,
                :nueva,
                :destroy,
              ],
              Sivel2Gen::Caso,
            )

            habilidad.cannot(:solocambiaretiquetas, Sivel2Gen::Caso)
            habilidad.can([:refresca, :validar], Sivel2Gen::Caso)

            habilidad.can(:read, Sivel2Gen::Victima)
          else
            habilidad.can(:read, Msip::Orgsocial)
            habilidad.can(:read, Msip::Bitacora, usuario: { id: usuario.id })
            habilidad.can(:read, Msip::Persona)
            habilidad.can(:read, Msip::Grupoper)

            habilidad.can(:read, Sivel2Gen::Acto)
            habilidad.can(:read, Sivel2Gen::Actocolectivo)
            habilidad.cannot([:new, :create], Sivel2Gen::Caso)
            habilidad.can(:read, Sivel2Gen::Victima)

            if usuario.grupo &&
                usuario.grupo.pluck(:id)
                    .include?(GRUPO_OBSERVADOR_PARTE_CASOS)
              dicc_filtro = {}
              if usuario.filtrodepartamento_ids.count > 0
                dicc_filtro[:ubicacion] = {
                  departamento_id: usuario.filtrodepartamento_ids,
                }
              end
              fini = if Sivel2Gen::Caso.all.minimum(:fecha)
                Sivel2Gen::Caso.all.minimum(:fecha)
              else
                Date.new(1970, 0o1, 0o1)
              end
              if usuario.observadorffechaini
                fini = usuario.observadorffechaini
              end
              ffin = Date.today
              if usuario.observadorffechafin
                ffin = usuario.observadorffechafin
              end
              dicc_filtro[:fecha] = (fini..ffin)
              habilidad.can([:show, :read], Sivel2Gen::Caso, dicc_filtro)
            else # Suponemos que es Observador de todo
              habilidad.can(
                [:read, :edit, :solocambiaretiquetas, :update],
                Sivel2Gen::Caso,
              )
            end
          end
        when Ability::ROLADMIN
          habilidad.can(:manage, Heb412Gen::Doc)
          habilidad.can(:manage, Heb412Gen::Plantilladoc)
          habilidad.can(:manage, Heb412Gen::Plantillahcm)
          habilidad.can(:manage, Heb412Gen::Plantillahcr)

          habilidad.can(:manage, [
            Mr519Gen::Encuestausuario,
            Mr519Gen::Formulario,
            Mr519Gen::Campo,
            Mr519Gen::Opcioncs,
            Mr519Gen::Planencuesta,
          ])

          habilidad.can(:manage, Msip::Orgsocial)
          habilidad.can(:read, Msip::Bitacora)
          habilidad.can(:manage, Msip::Persona)
          habilidad.can(:manage, Msip::Grupoper)
          habilidad.can(:manage, Msip::Respaldo7z)
          habilidad.can(:manage, Msip::Ubicacionpre)

          habilidad.can(:manage, Sivel2Gen::Acto)
          habilidad.can(:manage, Sivel2Gen::Actocolectivo)
          habilidad.can(:manage, Sivel2Gen::Caso)
          habilidad.cannot(:solocambiaretiquetas, Sivel2Gen::Caso)
          habilidad.can(:read, Sivel2Gen::Victima)

          habilidad.can(:manage, Usuario)
          habilidad.can(:manage, :tablasbasicas)
          habilidad.tablasbasicas.each do |t|
            c = Ability.tb_clase(t)
            habilidad.can(:manage, c)
          end
        end # case
      end # if
    end # def initialize_sivel2_gen

    def initialize_sivel2_gen(usuario = nil)
      Sivel2Gen::Ability.initialize_sivel2_gen(self, usuario)
    end
  end # class
end   # module
