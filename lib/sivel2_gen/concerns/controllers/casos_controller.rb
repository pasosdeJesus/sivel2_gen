require 'nokogiri'
require 'csv'

module Sivel2Gen
  module Concerns
    module Controllers
      module CasosController
        extend ActiveSupport::Concern

        included do
          # Los siguientes deben ir en clase que incluya esta modulo
          #before_action :set_caso, only: [:show, :edit, :update, :destroy]
          #load_and_authorize_resource class: Sivel2Gen::Caso,
          #  except: [:index, :show]
          helper Sip::UbicacionHelper

          MAX_CASOS_REFRESCA_AUTOMATICO = 30000

          def registrar_en_bitacora
            true
          end

          def clase
            'Sivel2Gen::Caso'
          end

          def genclase
            'M'
          end

          def atributos_show
            [
              # basicos
              :id,
              :fecha,
              :titulo,
              :hora,
              :duracion,
              :intervalo,
              :region,
              :frontera,

              # ubicacion
              :ubicaciones,

              # fuentes frec.
              :fuentesfrecuentes,

              # otras fuentes
              :otrasfuentes,

              # contexto
              :contexto,
              :antecedente,
              :bienes,

              # p. responsables
              :presponsables,

              # victimas
              :victimas,

              #colectivas
              :victimascolectivas,

              #combatientes
              :combatientes,

              #actos
              :actos,

              #descripcion
              :memo ,

              #anexos
              :anexos,

              #etiquetas
              :etiquetas,

              #evaluacion
              :grconfiabilidad,
              :gresclarecimiento,
              :grimpunidad,
              :grinformacion,

              # Otras
              :created_at,
              :updated_at,
              :registros_bitacora
            ]
          end

          # Todos los campos por los que se puede filtrar tienen un
          # scope conscaso
          def campos_filtro1_gen
            campos_filtro1
          end

          def campos_filtro1
            if current_usuario
              [:departamento_id, :municipio_id, :clase_id,
                :fechaini, :fechafin, :presponsable_id, :categoria_id,
                :nombres, :apellidos, :victimacol, :sexo, :rangoedad_id,
                :organizacion_id, :profesion_id, :descripcion,
                :usuario_id, :fechaingini, :fechaingfin, :contexto_id, 
                :contextovictima_id, :codigo, :orientacionsexual,
                :sectorsocial_id 
              ]
            else
              [:departamento_id, :municipio_id, :clase_id,
                :fechaini, :fechafin, :presponsable_id, :categoria_id,
                :nombres, :apellidos, :sexo, :rangoedad_id, :descripcion, 
                :sectorsocial_id 
              ]
            end
          end

          # Todas las columnas que pueden presentarse
          def incluir_inicial
            ['casoid', 'fecha', 'ubicaciones', 'presponsables',
              'tipificacion', 'victimas', 'memo']
          end

          # Ordenamiento inicial por este campo
          def campoord_inicial
            'ubicacion'
          end

          # Filtro estándar
          def filtro_avanzado(conscaso, params_filtro)
            for i in campos_filtro1_gen do
              if params_filtro[i] && params_filtro[i] != '' &&
                params_filtro[i] != [''] &&
                conscaso.respond_to?('filtro_' + i.to_s)
                conscaso = conscaso.send('filtro_' + i.to_s, params_filtro[i])
              end
            end

            for i in [:etiqueta1, :etiqueta2] do
              if params_filtro[i] && params_filtro[i] != ''  &&
                conscaso.respond_to?('filtro_etiqueta')
                op = 'con' + i.to_s
                c = params_filtro[op.to_sym] &&
                  params_filtro[op.to_sym] == 'true'
                conscaso = conscaso.send('filtro_etiqueta', c, params_filtro[i])
              end
            end
            if params_filtro[:q] && params_filtro[:q].length>0
              q = params_filtro[:q].gsub("-", " ")
              conscaso = conscaso.where(
                "q @@ plainto_tsquery('spanish', unaccent(?))", q
              )
            end

            return conscaso
          end

          # Filtro particular por ejemplo para autenticar
          def filtro_particular(conscaso, params_filtro)
            return conscaso
          end

          def cortamemo
            0
          end


          def inicializa_index
            @plantillas = Heb412Gen::Plantillahcm.where(
              vista: 'Caso').select('nombremenu, id').map {
                |c| [c.nombremenu, c.id] }
            @plantillas += [
              ['Reporte Revista HTML', 'reprevista.html'],
              ['Reporte Revista no bélicas HTML', 'reprevistanobelicas.html'],
              ['Reporte General HTML', 'repgeneral.html'],
              ['Exportar a XRLAT( XML)', 'reprevista.xrlat'],
              ['Exportar a JSON', 'reprevista.json']]
            if can? :exportaCSV, Sivel2Gen::Caso
              @plantillas += [
                ['Exportar a CSV', 'reprevista.csv']
              ]
            end
          end

         def vistas_manejadas
            return ['Caso']
         end

          # Valida que el usuario pueda generar la plantilla idplant
          def valida_plantilla(current_usuario, idplant)
            true
          end

          # Prefiltra de acuerdo a control de acceso
          def filtrar_ca(reg)
            f = Sivel2Gen::Caso.accessible_by(current_ability)
            reg = reg.where("caso_id in (#{f.select(:id).to_sql})")
            reg
          end

          # GET /casos
          # GET /casos.json
          def index
            if !Rails.configuration.x.sivel2_consulta_web_publica
              authorize! :index, Sivel2Gen::Caso
            end
            begin
              @conscasocount = Conscaso.count
            rescue
              puts Conscaso.refresca_conscaso
              @conscasocount = Conscaso.count
            end
            #byebug
            #if !ActiveRecord::Base.connection.data_source_exists?(
            #  'sivel2_gen_consexpcaso')
            #  Consexpcaso.crea_consexpcaso
            #end
            @cortamemo = cortamemo

            @incluir = incluir_inicial
            @campoord = campoord_inicial
            @conscaso = Sivel2Gen::Conscaso.all

            # Las 2 siguientes se agregaron para evaluar OBSERVADOR_PARTE
            # pero hacen demasiado ineficiente la consulta del listado
            # de casos --Una consulta de 35.000 casos pasa de 3s a 28s.
            #casos = Sivel2Gen::Caso.accessible_by(current_ability)
            #@conscaso = @conscaso.where(caso_id: casos.map(&:id))
            #@conscaso = @conscaso.accessible_by(current_ability)

            @conscaso = filtrar_ca(@conscaso)
            @conscasocount = @conscaso.count
            inicializa_index

            # Filtro
            if params && params[:filtro]
              # if params[:filtro][:q] && params[:filtro][:q].length>0
              # Simple
              #   q = params[:filtro][:q].gsub("-", " ")
              #   @conscaso = @conscaso.where(
              #     "q @@ plainto_tsquery('spanish', unaccent(?))", q
              #   )
              # else
              # Avanzado
              @conscaso = filtro_avanzado @conscaso, params[:filtro]
              #puts @conscaso.to_sql; byebug
              # Columnas por incluir
              nincluir = []
              for i in @incluir do
                s = 'inc_' + i
                if params[:filtro][s.to_sym] && params[:filtro][s.to_sym] == '1'
                  nincluir.push(i)
                end
              end
              @incluir = nincluir
              # Cambiar Ordenamiento
              if params[:filtro][:orden]
                @campoord = params[:filtro][:orden]
              end
              # Otros (puede cambiar consulta, @incluir o @campoord)
              @conscaso = filtro_particular @conscaso, params[:filtro]
              #puts @conscaso.to_sql; byebug
            end

            # Ordenamiento y control de acceso
            if defined? @conscaso.ordenar_por
              @conscaso = @conscaso.ordenar_por @campoord
            end

            # Cuenta y Paginación
            @numconscaso = @conscaso.size
            @paginar = !params || !params[:filtro] ||
              !params[:filtro][:paginar] ||
              params[:filtro][:paginar] != '0'
            if @paginar && params[:idplantilla].nil? && defined?(@conscaso.paginate)
              @conscaso = @conscaso.paginate(
                page: params[:pagina], per_page: 20)
            else
              @paginar = false
            end
            #if @usa_consexpcaso
            #  if @paginar && params[:idplantilla].nil? && defined?(@consexpcaso.paginate)
            #    @consexpcaso = @consexpcaso.paginate(
            #      page: params[:pagina], per_page: 20)
            #  else
            #    @paginar = false
            #  end
            #end
            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario ?
                              current_usuario.id : nil,
                              request.url, params, 'Sivel2Gen::Caso',
                              0,  'listar', '')
            end
            presenta_index
          end

          def self.index_reordenar(registros)
            registros.reorder([:caso_id])
          end

          def gen_formato(formato)
            Consexpcaso.crea_consexpcaso(@conscaso, @campoord)
            if params[:filtro].nil? || params[:idplantilla].nil?
              head :no_content
            elsif params[:idplantilla].to_i <= 0
              head :no_content
            elsif Heb412Gen::Plantillahcm.where(
              id: params[:idplantilla].to_i).take.nil?
              head :no_content
            elsif !valida_plantilla(current_usuario,
                                    params[:idplantilla].to_i)
              head :no_content
            end
            @consexpcaso = Consexpcaso.all
            @registros = @consexpcaso
            programa_generacion_listado(params, formato, :caso_id)
          end

          def error_plantilla_no_autenticado
            redirect_back fallback_location: Rails.configuration.relative_url_root, flash:{ 
              error: "La generación de este reporte permite máximo "\
              "#{Rails.configuration.x.sivel2_consweb_max ?
              Rails.configuration.x.sivel2_consweb_max.to_s : '0' }"\
              " registros. "\
              " #{Rails.configuration.x.sivel2_consweb_epilogo ? 
              Rails.configuration.x.sivel2_consweb_epilogo : ''}"
            }
          end

          def presenta_mas_index(formato)
            formato.csv {
              authorize! :exportaCSV, Sivel2Gen::Caso
              atributos = %w{caso_id fecha ubicaciones victimas presponsables tipificacion memo}
              r = CSV.generate(headers: true) do |csv|
                csv << ["Identificacion", "Fecha", "Ubicaciones", "Víctimas", "Presuntos Responsables", "Tipificación", "Memo"]
                @conscaso.try(:each) do |caso|
                  fila = []
                  for i in atributos
                    case i
                    when 'victimas'
                      vic = ''
                      if caso[i]
                        vic += caso[i]
                      end 
                      hayind = caso[i] && caso[i].strip.length > 0
                      haycol = false 
                      gps = Sivel2Gen::Victimacolectiva.where(id_caso: caso.caso_id).pluck(:id_grupoper)
                      if gps.count> 0 && (!params || !params[:filtro] || 
                        !params[:filtro][:inc_victimacol] || 
                       params[:filtro][:inc_victimacol] != '0') 
                        haycol = true
                        if hayind 
                          vic += '. '
                        end 
                        vic += Sip::Grupoper.where(id: gps).pluck(:nombre).join(", ")
                      end
                      com = Sivel2Gen::Combatiente.where(id_caso: caso.caso_id)
                      if com.count > 0
                        if hayind || haycol
                          vic += '. '
                        end
                        vic += com.pluck(:nombre).join(", ")
                      end
                      fila << vic
                    when 'tipificacion'
                      tip = ''
                      haytip = false 
                      haycatcol = false
                      if caso[i] && caso[i].strip.length > 0
                        tip += caso[i]
                        haytip = true
                      end
                      ids_catcol = Sivel2Gen::Actocolectivo.where(id_caso: caso.caso_id).pluck(:id_categoria)
                      if ids_catcol.count > 0
                        haycatcol = true 
                        if haytip 
                          tip += '. '
                        end 
                        catcol = Sivel2Gen::Categoria.where(id: ids_catcol) 
                        tip += catcol.inject("") {|memo, r| 
                         (memo == "" ? "" : memo + ", ") + 
                         r.supracategoria.id_tviolencia + ':' +
                         r.supracategoria.codigo.to_s + ':' +
                         r.id.to_s + ' ' + r.nombre} 
                      end 
                      ids_casopres = Sivel2Gen::CasoPresponsable.where(id_caso: caso.caso_id).pluck(:id) 
                      ids_cat = Sivel2Gen::CasoCategoriaPresponsable.where(id_caso_presponsable: ids_casopres).pluck(:id_categoria)
                      if ids_cat.count > 0 
                        if haytip || haycatcol
                          tip += '. '
                        end 
                      catsinv = Sivel2Gen::Categoria.where(id: ids_cat) 
                      tip += catsinv.inject("") {|memo, r| 
                       (memo == "" ? "" : memo + ", ") + 
                         r.supracategoria.id_tviolencia + ':' +
                         r.supracategoria.codigo.to_s + ':' +
                         r.id.to_s + ' ' + r.nombre}
                      end 
                      fila << tip
                    else
                      fila << caso.send(i)
                    end
                  end
                  csv << fila
                end
              end
              send_data r, filename: "casos-sivel2.csv" 
              return true
            }
            return false
          end

          def presenta_index
            # Presentación
            respond_to do |format|
              if current_usuario || (Rails.configuration.x.sivel2_consweb_max &&
                  @conscaso.count <= Rails.configuration.x.sivel2_consweb_max.to_i)
                format.html {
                  if (params['idplantilla'])
                    #byebug
                    case params['idplantilla']
                    when 'reprevista', 'reprevistanobelicas', 
                      'repgeneral'
                      render params['idplantilla'], layout: nil
                    else
                      redirect_back fallback_location:
                        Rails.configuration.relative_url_root,
                        flash: { error: "Plantilla desconocida" }
                    end
                  else
                    render layout: 'application'
                  end
                  return
                }

                format.ods {
                  gen_formato('.ods')
                  return
                }
                format.xlsx {
                  gen_formato('.xlsx')
                  return
                }
                if request.format.symbol == :ods || 
                    request.format.symbol == :xlsx
                  # En caso de que no funcionen anteriores
                  gen_formato(".#{request.format.symbol.to_s}")
                  return
                end
                format.js {
                  render 'sivel2_gen/casos/filtro'
                  return
                }

                format.json {
                  render 'reprevista'
                  return
                }

                format.xrlat {
                  render 'reprevista'
                  return
                }
                
                r = presenta_mas_index(format)
                if !r
                  format.any {
                  }
                end
              else
                format.html {
                  if (params['idplantilla'])
                    case params['idplantilla']
                    when 'reprevista'
                      error_plantilla_no_autenticado
                    end
                  else
                    render layout: 'application'
                  end
                  return
                }

                format.ods {
                  error_plantilla_no_autenticado
                  return
                }

                format.js {
                  render 'sivel2_gen/casos/filtro'
                  return
                }

                format.json {
                  render inline: {}
                  return
                }
                format.xrlat {
                  error_plantilla_no_autenticado
                  return
                }
              end
            end
          end

          def new_sivel2_gen
            @caso.current_usuario = current_usuario
            @caso.fecha = DateTime.now.strftime('%Y-%m-%d')
            @caso.memo = ''
            @caso.save!
            @formulario_sin_titulo = true
            cu = CasoUsuario.new
            cu.id_usuario = current_usuario.id
            cu.id_caso = @caso.id
            cu.fechainicio = DateTime.now.strftime('%Y-%m-%d')
            cu.save!
            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                              request.url, params, 'Sivel2Gen::Caso',
                              @caso.id,  'iniciar', '')
            end

            @registro = @caso
          end

          # GET /casos/new
          def new
            new_sivel2_gen
            redirect_to edit_caso_path(@registro)
          end

          def lista
            if params[:tabla]
              r = nil
              if (params[:tabla] == "departamento" && params[:id_pais].to_i > 0)
                r = Sip::Departamento.where(fechadeshabilitacion: nil,
                                            id_pais: params[:id_pais].to_i).order(:nombre)
              elsif (params[:tabla] == "municipio" && params[:id_pais].to_i > 0 &&
                     params[:id_departamento].to_i > 0 )
                r = Sip::Municipio.where(
                  id_departamento: params[:id_departamento].to_i,
                  fechadeshabilitacion: nil).order(:nombre)
              elsif (params[:tabla] == "clase" && params[:id_pais].to_i > 0 &&
                     params[:id_departamento].to_i > 0 &&
                     params[:id_municipio].to_i > 0)
                r = Sip::Clase.where(
                                     id_municipio: params[:id_municipio].to_i,
                                     fechadeshabilitacion: nil).order(:nombre)
              end
              respond_to do |format|
                format.js { render json: r }
                format.html { render json: r }
              end
              return
            end
            respond_to do |format|
              format.html { render inline: 'No' }
            end
          end

          # GET casos/mapa
          def mapagm
            render 'mapagm', layout: 'application'
          end

          def cuenta
            casoscontados = []
            fechasinicial = Sivel2Gen::Caso.all.order(fecha: :asc).pluck(:fecha).uniq
            fechafinal = params[:fechafin] ? params[:fechafin] : Date.today
            fechainicial = params[:fechaini] ? params[:fechaini] : 
              (fechasinicial.count > 0 ? fechasinicial[0] : '2001-01-01')
            sql = "select fecha, count(distinct sivel2_gen_caso.id) AS cuenta, sip_departamento.nombre FROM sivel2_gen_caso LEFT JOIN sip_ubicacion ON sivel2_gen_caso.ubicacion_id = sip_ubicacion.id LEFT JOIN sip_departamento ON sip_ubicacion.id_departamento = sip_departamento.id WHERE sivel2_gen_caso.fecha BETWEEN '" + fechainicial.to_s + "' AND '" + fechafinal.to_s + "' group by 1,3 order by 1;"
            array_cuentas = ActiveRecord::Base.connection.execute(sql)
            render 'cuenta.json', layout: 'application', locals: {casosc: array_cuentas}
          end

          # GET casos/importarrelatos
          def importarrelatos
            render 'importarrelatos', layout: 'application'
          end

          # GET casos/mapaosm
          def mapaosm
            if !Rails.configuration.x.sivel2_consulta_web_publica
              authorize! :index, Sivel2Gen::Caso
            end

            diasatras = Rails.configuration.x.sivel2_mapaosm_diasatras ?
              Rails.configuration.x.sivel2_mapaosm_diasatras.to_i : 182

            @fechadesde = ENV['SIVEL2_MAPAOSM_FECHADESDE'] ? 
              Date.parse(ENV['SIVEL2_MAPAOSM_FECHADESDE']) : Sip::FormatoFechaHelper.inicio_semestre(Date.today - diasatras)
            @fechahasta = ENV['SIVEL2_MAPAOSM_FECHAHASTA'] ?
              Date.parse(ENV['SIVEL2_MAPAOSM_FECHAHASTA']) : Sip::FormatoFechaHelper.fin_semestre(Date.today - diasatras)
            @clase_divcontenido = ''
            @margensup_divcontenido = '-9x'
            render 'mapaosm', layout: 'application', 
              locals: {clasedivcontenido: '', margensupdivcontenido: '-9px'}
          end


          def pestanas_formulariocaso
            #byebug
            if current_usuario && can?(:solocambiaretiquetas, Sivel2Gen::Caso)
              [
                { titulo: 'Etiquetas', parcial: 'etiquetas'},
              ]
            elsif current_usuario && can?(:update, Sivel2Gen::Caso)
              [
                { titulo: 'Datos Básicos', parcial: 'basicos'},
                { titulo: 'Ubicación', parcial: 'ubicaciones'},
                { titulo: 'Fuentes Frecuentes', parcial: 'fuentesprensa'},
                { titulo: 'Otras Fuentes', parcial: 'fotras'},
                { titulo: 'Contexto', parcial: 'contextos'},
                { titulo: 'Presuntos Responsables', parcial: 'presponsables'},
                { titulo: 'Víctimas', parcial: 'victimas'}] +
              (Rails.configuration.x.sivel2_desaparicion && 
               can?(:pestanadesaparicion, Sivel2Gen::Caso) ?
               [{titulo: 'Desaparición', parcial: 'Formulario::desaparicion'}]:
               []) +
              [
                { titulo: 'Víctimas Colectivas', parcial: 'victimascolectivas'},
                { titulo: 'Combatientes', parcial: 'combatientes'},
                { titulo: 'Actos', parcial: 'actos'},
                { titulo: 'Descripción', parcial: 'memo'},
                { titulo: 'Anexos', parcial: 'sivel2_gen/casos/anexos'},
                { titulo: 'Etiquetas y Solicitudes', parcial: 'etiquetas'},
                { titulo: 'Evaluación', parcial: 'evaluacion'}
              ]
           else
              []
            end
          end

          def self.asegura_camposdinamicos(caso, current_usuario_id, pestanas)
            if caso.nil?  || caso.id.nil?
              return
            end

            vfid = []  # ids de formularios que deben presentarse
            pestanas.each do |p|
              if p[:parcial].starts_with?('Formulario::')
                mf = Mr519Gen::Formulario.where(nombreinterno: p[:parcial][12..-1])
                #byebug
                if mf.count == 1
                  f = mf.take
                  vfid << f.id
                  aw = caso.respuestafor.where(formulario_id: f.id) 
                  if  aw.count == 0
                    rf = Mr519Gen::Respuestafor.create(
                      formulario_id: f.id,
                      fechaini: Date.today,
                      fechacambio: Date.today)
                    cr = Sivel2Gen::CasoRespuestafor.create(
                      caso_id: caso.id,
                      respuestafor_id: rf.id,
                    )
                  else # aw.count == 1
                    r = aw.take
                    cr = Sivel2Gen::CasoRespuestafor.where(
                      caso_id: caso.id,
                      respuestafor_id: r.id,
                    ).take
                  end
                  Mr519Gen::ApplicationHelper::asegura_camposdinamicos(
                    cr, current_usuario_id)
                end
              end
            end
            # Elimina sobrantes
            if vfid.count > 0
              cr = Sivel2Gen::CasoRespuestafor.
                where(caso_id: caso.id).
                joins(:respuestafor).
                where("formulario_id NOT IN (#{vfid.join(', ')})")
            else #vfid.count == 0
              cr = Sivel2Gen::CasoRespuestafor.
                where(caso_id: caso.id)
            end
            if cr.count > 0
              rb = cr.map(&:respuestafor_id)
              Sivel2Gen::CasoRespuestafor.connection.
                execute("DELETE FROM sivel2_gen_caso_respuestafor
                        WHERE caso_id=#{caso.id} 
                        AND respuestafor_id IN (#{rb.join(', ')})")
              Mr519Gen::Respuestafor.where(id: rb).destroy_all
            end
          end

          # GET /casos/1/edit
          def edit
            self.class.asegura_camposdinamicos(@registro, current_usuario.id,
                                              pestanas_formulariocaso)
            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                              request.url, params, 'Sivel2Gen::Caso',
                              @caso.id,  'editar', '')
            end
            if session[:capturacaso_acordeon]
              render 'editv', layout: 'application'
            else
              render 'edit', layout: 'application'
            end
          end

          # POST /casos
          # POST /casos.json
          def create
            @caso.current_usuario = current_usuario
            @caso.memo = ''
            @caso.titulo = ''

            notificacion = 'Caso creado.'
            if @conscasocount > MAX_CASOS_REFRESCA_AUTOMATICO
              notificacion += "  Por la cantidad de casos (#{@conscasocount})"+
                " debe Refrescar para actualizar " +
                " el cambio en el listado de casos"
            end
            respond_to do |format|
              if @caso.save
                if registrar_en_bitacora
                  Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                                  request.url, params, 'Sivel2Gen::Caso',
                                  @caso.id,  'crear', '')
                end

                format.html {
                  redirect_to @caso,
                  notice: notificacion
                }
                format.json {
                  render action: 'show', status: :created, location: @caso,
                  layout: 'application'
                }
              else
                format.html {
                  render action: 'new', layout: 'application'
                }
                format.json {
                  render json: @caso.errors, status: :unprocessable_entity
                }
              end
            end
            begin
              @conscasocount = Conscaso.count
              if @conscasocount <= MAX_CASOS_REFRESCA_AUTOMATICO
                puts Conscaso.refresca_conscaso
              end
            rescue
               puts Conscaso.refresca_conscaso
            end
          end

          def refresca
            @resrefresca = Conscaso.refresca_conscaso
            render 'refresca', layout: 'application'
          end

          # PATCH/PUT /casos/1
          # PATCH/PUT /casos/1.json
          def update_gen
            respond_to do |format|
              # En etiquetas pone usuario actual por omision
              if (!params[:caso][:caso_etiqueta_attributes].nil?)
                params[:caso][:caso_etiqueta_attributes].each  do |k,v|
                  if (v[:id_usuario].nil? || v[:id_usuario] == "")
                    v[:id_usuario] = current_usuario.id
                  end
                end
              end

              # En familiares si falta crear trelacion_persona para personas
              # autocompletadas los crea
              if caso_params[:victima_attributes]
                caso_params[:victima_attributes].each do |iv, v|
                  if v[:persona_attributes] &&
                      v[:persona_attributes][:persona_trelacion1_attributes]
                    v[:persona_attributes][:persona_trelacion1_attributes].each do |it, t|
                      # Ubicamos los de autocompletacion y para esos creamos un registro
                      if t && (!t[:id] || t[:id] == '') &&
                          t[:personados_attributes] &&
                          t[:personados_attributes][:id] &&
                          t[:personados_attributes][:id].to_i > 0 &&
                          Sip::Persona.where(
                            id: t[:personados_attributes][:id].to_i).count == 1
                          pt_e = Sip::PersonaTrelacion.where(
                            persona1: v[:persona_attributes][:id],
                            persona2: t[:personados_attributes][:id]
                          )
                          if !pt_e
                            pt = Sip::PersonaTrelacion.create({
                              persona1: v[:persona_attributes][:id],
                              persona2: t[:personados_attributes][:id]
                            })
                            pt.save!(validate: false)
                            params[:caso][:victima_attributes][iv][:persona_attributes][:persona_trelacion1_attributes][it][:id] = pt.id
                          else
                            params[:caso][:victima_attributes][iv][:persona_attributes][:persona_trelacion1_attributes][it][:id] = pt_e[0].id
                          end
                      end
                    end
                  end
                end
              end
              if @caso.update(caso_params)
                if registrar_en_bitacora
                  Sip::Bitacora.agregar_actualizar(
                    request, :caso, :bitacora_cambio, 
                    current_usuario.id, params, 'Sivel2Gen::Caso',
                    @caso.id
                  )
                end
                #if request.params[:enviarFichaCaso] == '1'
                #  head :no_content
                #  return
                #end

                notificacion = 'Caso actualizado.'
                if Sivel2Gen::Caso.count > MAX_CASOS_REFRESCA_AUTOMATICO
                  notificacion += "  Por la cantidad de casos "+
                    " debe Refrescar para notar " +
                    " el cambio en el listado de casos"
                end
                format.html {
                  redirect_to @caso,
                  notice: notificacion
                }
                format.json { head :no_content }
                format.js   { head :no_content }
              else
                format.html {
                  if session[:capturacaso_acordeon]
                    render 'editv', layout: 'application'
                  else
                    render 'edit', layout: 'application'
                  end
                }
                format.json { render json: @caso.errors,
                              status: :unprocessable_entity }
                format.js   { render json: @caso.errors,
                              status: :unprocessable_entity }
              end
            end
            begin
              @conscasocount = Conscaso.count
              if @conscasocount <= MAX_CASOS_REFRESCA_AUTOMATICO
                puts Conscaso.refresca_conscaso
              end
            rescue
               puts Conscaso.refresca_conscaso
               @conscasocount = Conscaso.count
            end
          end

          def update
            if cannot?(:update, Sivel2Gen::Caso) &&
                cannot?(:update, @registro)
              authorize! :update, @registro
              return
            end
            update_gen
          end

          # Tuve que crear el siguiente para llamarlo desde
          # sivel2_sjr/concerns/controllers/casos_controllers pues no hay super
          # en módulos y no se logró con prepend u otra forma
          def sivel2_gen_destroy
            tcaso_id=@caso.id
            if @caso.id
              CasoUsuario.where(id_caso: @caso.id).destroy_all
            end
            @caso.destroy

            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                              request.url, params, 'Sivel2Gen::Caso',
                              tcaso_id,  'eliminar', '')
            end

            notificacion = 'Caso eliminado.'
            if Sivel2Gen::Caso.count > MAX_CASOS_REFRESCA_AUTOMATICO
              notificacion += "  Por la cantidad de casos "+
                " debe Refrescar para notar " +
                " el cambio en el listado de casos"
            end
            respond_to do |format|
              format.html { redirect_to casos_path, notice: notificacion }
              format.json { head :no_content }
            end
            begin
              @conscasocount = Conscaso.count
              if @conscasocount <= MAX_CASOS_REFRESCA_AUTOMATICO
                puts Conscaso.refresca_conscaso
              end
            rescue
               puts Conscaso.refresca_conscaso
            end
          end

          # Despliega detalle de un registro
          def show_sivel2_gen
            if !Rails.configuration.x.sivel2_consulta_web_publica
              authorize! :read, Sivel2Gen::Caso
            end

            if (!params[:id] || params[:id].to_i <= 0 || 
                clase.constantize.where(id: params[:id].to_i)==0)
              merr = "No existe caso con id #{params[:id].to_i}"
              respond_to do |format|
                format.html {
                  render(inline: merr, 
                         status: :unprocessable_entity, 
                         layout: 'application')
                }
                format.json {
                  render json: merr, status: :unprocessable_entity
                }
              end
              return
            end


            @caso = @registro = clase.constantize.find(params[:id].to_i)
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end
            if cannot?(:show, Sivel2Gen::Caso) || cannot?(:show, @registro)
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :read, @registro
              return
            end
            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario ?
                              current_usuario.id : nil,
                              request.url, params, 'Sivel2Gen::Caso',
                              @registro.id,  'presentar', '')
            end

            show_plantillas

            respond_to do |format|
              format.html {
                render layout: 'application', locals: { caso: @caso }
              }
              format.json {
                render 'show.json', locals: { caso: @caso }
              }
              format.xrlat {
                xml = render_to_string(
                  action: 'show', locals: { caso: @caso },
                  formats: [:xml, :xrlat]
                )
                send_data xml, :type=>"text/xml"
              }
              format.xml {
                render 'show.xml', locals: { caso: @caso }
              }
              format.odt {
                fichaimp
              }
              format.pdf {
                fichapdf
              }
            end

          end

          def show
            show_sivel2_gen
          end

          # DELETE /casos/1
          # DELETE /casos/1.json
          def destroy
            sivel2_gen_destroy
          end

          def self.importar_relato(doc, menserror, sintaxis_errores, mensexito, ids_importados,
                                   usuario_id, formato_sexo)
            if !Nokogiri::XML(doc).errors.empty?
              Nokogiri::XML(doc).errors.each do |error|
                sintaxis_errores.push(error.message)
              end
              return
            end
            docnoko_inicial = Nokogiri::XML(doc) do |config|
              config.strict.noent
            end
            ## Verifica si trae un enlace a un dtd válido (097, 098 o 099)
            enlace = docnoko_inicial.children[0].system_id
            pre = "http://sincodh.pasosdejesus.org/relatos/relatos-"
            aceptados = [pre + "097.dtd", pre + "098.dtd", pre + "099.dtd"]
            if aceptados.include? enlace
              # Adaptado de respuesta de the Tin Man de 
              # https://nokogiri.org/tutorials/parsing_an_html_xml_document.html#encoding
              nuevo_doc = Nokogiri::XML('<relatos/>') do |config|
                config.strict.noent
              end
              rutas = Gem::Specification.stubs.map(&:full_gem_path)
              rs = rutas.select {|x| x.include?('sivel2_gen')}.first
              rs = rs.nil? ? "#{File.expand_path("../../../", Dir.pwd)}/sivel2_gen" : rs
              rs = rs + "/test/dummy/public/relatos-#{enlace[-7..-5]}.dtd"
              nuevo_doc.create_internal_subset('relatos', nil, rs)
              nuevo_doc.at('relatos').children = docnoko_inicial.at('relatos').children
              ## Verifica si sigue correctamente el dtd
              options = Nokogiri::XML::ParseOptions::DTDVALID
              doc_val = Nokogiri::XML::Document.parse(nuevo_doc.to_s, nil, nil, options)
              if doc_val.nil? 
                menserror << " Imposible importar relato(s). No pudo reconocer XML de #{nuevo_doc.to_s}}."
                return false
              end
              if !doc_val.external_subset.nil? 
                errores_dtd = doc_val.external_subset.validate(doc_val)
                if errores_dtd.count > 0
                  menserror << " Imposible importar relato(s). Su contenido no sigue el dtd: #{errores_dtd.join('. ')}."
                  return false
                end
              else
                puts " Imposible importar relato(s). No tien subconjunto externo #{nuevo_doc.to_s}}."
              end
            else
              menserror << " Imposible importar relato(s). El enlace al dtd #{enlace} no corresponde a los aceptados."
              return false
            end
            docnoko = nuevo_doc 
            docnoko.search('observaciones').each do |obs|
              obs.content = obs['tipo'] + '_' + obs.text
            end
            total_importados = 0
            total_errores = 0
            docnoko.xpath('relatos/relato').each do |relato|
              datossal = {}
              relimportado = Hash.from_xml(relato.to_s)
              @caso = Sivel2Gen::Caso.new
              menserror_uno = ''
              importado = @caso.importa(relimportado["relato"],
                                        datossal, formato_sexo,
                                        menserror_uno, {})
              casousuario = Sivel2Gen::CasoUsuario.new
              casousuario.id_usuario = usuario_id
              casousuario.id_caso = importado.id
              casousuario.fechainicio = DateTime.now.strftime('%Y-%m-%d')
              casousuario.save!
              if importado.nil?
                menserror << "No se pudo importar relato número #{numr}.  "
                total_errores += 1
              else
                @caso.save!(validate: false)
                total_importados += 1
                puts "OJO total_importados=#{total_importados}"
                @etiquetaImp = Sivel2Gen::CasoEtiqueta.new
                @etiquetaImp.id_caso = @caso.id
                @etiquetaImp.id_etiqueta = Sip::Etiqueta.where(
                  nombre: "IMPORTA_RELATO").ids[0]
                if !@etiquetaImp.id_etiqueta.nil?
                  @etiquetaImp.fecha = Date.today
                  @etiquetaImp.id_usuario = usuario_id
                  @etiquetaImp.save!
                end
                ids_importados << "#{@caso.id} "
                if menserror_uno != ''
                  total_errores += 1
                  @etiquetaErr = Sivel2Gen::CasoEtiqueta.new
                  @etiquetaErr.id_caso = @caso.id
                  @etiquetaErr.id_etiqueta = Sip::Etiqueta.where(
                    nombre: "ERROR_IMPORTACIÓN").ids[0]
                  if !@etiquetaErr.id_etiqueta.nil?
                    @etiquetaErr.observaciones = menserror_uno
                    @etiquetaErr.fecha = Date.today
                    @etiquetaErr.id_usuario = usuario_id
                    @etiquetaErr.save!
                  end
                end
              end
            end
            if total_importados > 0
              mensexito << "¡Se importaron #{total_importados} relatos!  "
            end
            if total_errores > 0
              menserror << "Se encontraron errores en #{total_errores} " \
                "relatos. Se detallan en etiquetas de los casos importados.  "
            end
            return true
          end # importar_relato

          def errores_importacion
            render 'errores_importacion', locals:{errores: @errores}, layout: 'application'
          end

          def importa
            authorize! :update, Sivel2Gen::Caso
            arc = params[:arc]
            doc = nil
            begin
              doc = arc.read
            rescue
              flash[:error]  = "No se pudo leer archivo '#{arc}'"
              redirect_to casos_path
              return
            end
            menserror = ''
            mensexito = ''
            sintaxis_errores=[]
            ids_importados = ''
            if params[:formatosexo]
              formato_sexo = params[:formatosexo]
            else
              formato_sexo = "sexomfs"
            end
            importa_exito = Sivel2Gen::CasosController.importar_relato(
              doc, menserror, sintaxis_errores, mensexito,
              ids_importados, current_usuario.id, formato_sexo
                            )

            if sintaxis_errores.length > 0
              redirect_to casos_errores_importacion_path(errores: sintaxis_errores)
              return 
            end
            if mensexito != ''
              flash[:success] = mensexito
              if registrar_en_bitacora
                ids_importados.split(" ").each do |idcaso|
                  Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                                  request.url, params, 'Sivel2Gen::Caso',
                                  idcaso.to_i,  'importar', '')
                end
              end
            end
            if menserror != ''
              flash[:error]  = menserror.length > 1000 ? 
                (menserror[0..1000] + '...') : menserror
              puts "OJO menserror=#{menserror}"
            end
            if importa_exito != true
              redirect_to casos_path
            else 
              Conscaso.refresca_conscaso
              ruta_importados = casos_path + '?filtro[q]=&filtro[codigo]=' + 
                ids_importados + '&filtro[inc_casoid]=1&filtro[inc_ubicaciones]=1&filtro[inc_fecha]=1&filtro[inc_presponsables]=1&filtro[inc_victimas]=1&filtro[inc_memo]=1&filtro[inc_tipificacion]=1'
              redirect_to ruta_importados
              end
          end

          private

          # Configuración común o restricciones entre acciones
          def set_caso
            if params[:id] && params[:id].to_i > 0
              @registro = @caso = Caso.find(params[:id].to_i)
              @caso.current_usuario = current_usuario
            end
          end

          def lista_params_sivel2_gen
            if current_usuario && can?(:solocambiaretiquetas, Sivel2Gen::Caso)
              [
                :caso_etiqueta_attributes => [
                  :fecha,
                  :fecha_localizada,
                  :id,
                  :id_etiqueta,
                  :id_usuario,
                  :observaciones,
                  :_destroy
                ]
              ]
            elsif current_usuario && can?(:update, Sivel2Gen::Caso)
              [
                :bienes,
                #:bitacora_cambio,
                :duracion,
                :fecha,
                :fecha_localizada,
                :grconfiabilidad,
                :gresclarecimiento,
                :grimpunidad,
                :grinformacion,
                :hora,
                :id,
                :id_intervalo,
                :memo,
                :q,
                :titulo,
                :acto_attributes => [
                  :id, :id_presponsable, :id_categoria,
                  :id_persona, :_destroy
                ],
                :anexo_caso_attributes => [
                  :id,
                  :id_caso,
                  :fecha,
                  :fecha_localizada,
                  :_destroy,
                  :sip_anexo_attributes => [
                    :id, :descripcion, :adjunto, :_destroy
                  ]
                ],
                :antecedente_ids => [],
                :caso_etiqueta_attributes => [
                  :fecha,
                  :fecha_localizada,
                  :id,
                  :id_etiqueta,
                  :id_usuario,
                  :observaciones,
                  :_destroy
                ],
                :caso_fotra_attributes => [
                  :anexo_caso_id,
                  :anotacion,
                  :fecha,
                  :fecha_localizada,
                  :id,
                  :nombre,
                  :tfuente,
                  :ubicacionfisica,
                  :_destroy
                ],
                :caso_fuenteprensa_attributes => [
                  :anexo_caso_id,
                  :clasificacion,
                  :fecha,
                  :fecha_localizada,
                  :fuenteprensa_id,
                  :id,
                  :ubicacion,
                  :ubicacionfisica,
                  :_destroy
                ],
                :caso_presponsable_attributes => [
                  :batallon,
                  :bloque,
                  :brigada,
                  :division,
                  :frente,
                  :id,
                  :id_presponsable,
                  :otro,
                  :tipo,
                  :_destroy,
                  :categoria_ids => []
                ],
                :caso_solicitud_attributes => [
                  :id, 
                  :_destroy,
                  :solicitud_attributes => [
                    :id,
                    :usuario_id, 
                    :fecha,
                    :fecha_localizada,
                    :solicitud,
                    :estadosol_id,
                    :usuarionotificar_ids => []
                  ]
                ],
                :combatiente_attributes => [
                  :alias,
                  :edad,
                  :id,
                  :id_filiacion,
                  :id_organizacion,
                  :id_profesion,
                  :id_rangoedad,
                  :id_resagresion,
                  :id_sectorsocial,
                  :id_vinculoestado,
                  :nombre,
                  :organizacionarmada,
                  :sexo,
                  :_destroy,
                  :antecedente_ids => []
                ],
                :contexto_ids => [],
                :frontera_ids => [],
                :region_ids => [],
                respuestafor_attributes: [
                  :id,
                  valorcampo_attributes: [ 
                    :valor,
                    :campo_id,
                    :id ] + 
                    [:valor_ids => []]
                ],
                :ubicacion_attributes => [
                    :id,
                    :id_clase,
                    :id_departamento,
                    :id_municipio,
                    :id_pais,
                    :id_tsitio,
                    :latitud,
                    :longitud,
                    :lugar,
                    :principal,
                    :sitio,
                    :_destroy
                  ],
                :victima_attributes => [
                  :anotaciones,
                  :hijos,
                  :id,
                  :id_etnia,
                  :id_filiacion,
                  :id_iglesia,
                  :id_organizacion,
                  :id_persona,
                  :id_profesion,
                  :id_rangoedad,
                  :id_sectorsocial,
                  :id_vinculoestado,
                  :organizacionarmada,
                  :orientacionsexual,
                  :_destroy,
                  :sectorsocialsec_ids => [],
                  :otraorga_ids => [],
                  :contextovictima_ids => [],
                  :antecedente_ids => [],
                  :persona_attributes => [
                    :anionac,
                    :apellidos,
                    :dianac,
                    :id,
                    :id_pais,
                    :id_departamento,
                    :id_municipio,
                    :id_clase,
                    :mesnac,
                    :nombres,
                    :nacionalde,
                    :numerodocumento,
                    :sexo,
                    :tdocumento_id,
                    :persona_trelacion1_attributes => [
                      :id,
                      :id_trelacion,
                      :_destroy,
                      :personados_attributes => [
                        :id,
                        :nombres,
                        :apellidos,
                        :sexo,
                        :tdocumento_id,
                        :numerodocumento
                      ]
                    ]
                  ]
                ],
                :victimacolectiva_attributes => [
                  :id,
                  :organizacionarmada,
                  :personasaprox,
                  :_destroy,
                  :etnia_ids => [],
                  :filiacion_ids => [],
                  :grupoper_attributes => [
                    :anotaciones,
                    :id,
                    :nombre,
                  ],
                  :antecedente_ids => [],
                  :organizacion_ids => [],
                  :profesion_ids => [],
                  :rangoedad_ids => [],
                  :sectorsocial_ids => [],
                  :vinculoestado_ids => []
                ],
              ]
            else
              []
            end
          end

          def lista_params
            return lista_params_sivel2_gen
          end

          # Lista blanca de parametros
          def caso_params
            params.require(:caso).permit(lista_params)
          end
        end

        module ClassMethods
        end

      end
    end
  end
end
