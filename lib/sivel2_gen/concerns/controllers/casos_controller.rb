# encoding: UTF-8
require 'nokogiri'
module Sivel2Gen
  module Concerns
    module Controllers
      module CasosController
        extend ActiveSupport::Concern

        included do
          before_action :set_caso, only: [:show, :edit, :update, :destroy]
          load_and_authorize_resource class: Sivel2Gen::Caso, 
            except: [:index, :show]
          helper Sip::UbicacionHelper

          MAX_CASOS_REFRESCA_AUTOMATICO=10000

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
              :updated_at
            ]
          end

          # Todos los campos por los que se puede filtrar tienen un 
          # scope conscaso
          def campos_filtro1
            if current_usuario
              [:departamento_id, :municipio_id, :clase_id,
                :fechaini, :fechafin, :presponsable_id, :categoria_id,
                :nombres, :apellidos, :sexo, :rangoedad_id, :descripcion, 
                :usuario_id, :fechaingini, :fechaingfin, :codigo
              ]
            else
              [:departamento_id, :municipio_id, :clase_id,
                :fechaini, :fechafin, :presponsable_id, :categoria_id,
                :nombres, :apellidos, :sexo, :rangoedad_id, :descripcion
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
            for i in campos_filtro1 do
              if params_filtro[i] && params_filtro[i] != '' && 
                params_filtro[i] != ['']
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
              ['Exportar a XRLAT( XML)', 'reprevista.xrlat'],
              ['Exportar a JSON', 'reprevista.json']
            ]
          end
      
         def vistas_manejadas
            return ['Caso']
         end 

          # Valida que el usuario pueda generar la plantilla idplant 
          def valida_plantilla(current_usuario, idplant)
            true
          end


          # GET /casos
          # GET /casos.json
          def index
            if !Rails.application.config.x.sivel2_consulta_web_publica
              authorize! :index, Sivel2Gen::Caso
            end
            begin
              @conscasocount = Conscaso.count
            rescue
              puts Conscaso.refresca_conscaso
              @conscasocount = Conscaso.count
            end
            #if !ActiveRecord::Base.connection.data_source_exists?(
            #  'sivel2_gen_consexpcaso')
            #  Consexpcaso.crea_consexpcaso
            #end
            @cortamemo = cortamemo

            @incluir = incluir_inicial
            @campoord = campoord_inicial
            @conscaso = Sivel2Gen::Conscaso.all

            inicializa_index

            # Filtro
            if params && params[:filtro]
              if params[:filtro][:q] && params[:filtro][:q].length>0
                # Simple
                q = params[:filtro][:q].gsub("-", " ")
                @conscaso = @conscaso.where(
                  "q @@ plainto_tsquery('spanish', unaccent(?))", q
                )
              else
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
            end

            # Ordenamiento
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
            redirect_back fallback_location: config.relative_url_root,
            flash: { error: 
            'La generación de este reporte permite máximo 2000 registros.' +
            ' Puede suscribirse a SIVeL Pro si requiere más' }
          end

          def presenta_index
            # Presentación
            respond_to do |format|
              if @conscaso.count <= 2000 || current_usuario
                format.ods {
                  gen_formato('.ods')
                  return
                }
                if request.format.symbol == 'ods'.to_sym
                  # No funciona el anterior
                  gen_formato('.ods')
                  return
                end
                format.html {
                  if (params['idplantilla'])
                    #byebug
                    case params['idplantilla']
                    when 'reprevista'
                      render params['idplantilla'], layout: nil
                    else
                      redirect_back fallback_location: 
                        config.relative_url_root,
                        flash: { error: "Plantilla desconocida" }
                    end
                  else
                    render layout: 'application'
                  end
                  return
                }

                format.js {
                  render 'sivel2_gen/casos/filtro'
                  return
                }

                format.json {
                  render 'reprevista.json'
                  return
                }

                format.xrlat {
                  render 'reprevista.xrlat'
                  return
                }
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
                  error_plantilla_no_autenticado
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
         
          # GET casos/mapaosm
          def mapaosm
	    @fechadesde = Sip::FormatoFechaHelper.inicio_semestre(Date.today - 182)
	    @fechahasta = Sip::FormatoFechaHelper.fin_semestre(Date.today - 182)
            render 'mapaosm', layout: 'application'
          end

          def self.asegura_camposdinamicos(caso, current_usuario_id)
          end

          # GET /casos/1/edit
          def edit
            self.class.asegura_camposdinamicos(@registro, current_usuario.id)
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
                  if v[:persona_attributes][:persona_trelacion1_attributes]
                    v[:persona_attributes][:persona_trelacion1_attributes].each do |it, t|
                      # Ubicamos los de autocompletacion y para esos creamos un registro 
                      if t && (!t[:id] || t[:id] == '') && 
                          t[:personados_attributes] && 
                          t[:personados_attributes][:id] &&
                          t[:personados_attributes][:id].to_i > 0 &&
                          Sip::Persona.where(
                            id: t[:personados_attributes][:id].to_i).count == 1
                          pt = Sip::PersonaTrelacion.create({
                            persona1: v[:persona_attributes][:id],
                            persona2: t[:personados_attributes][:id]
                          })
                          pt.save!(validate: false)
                          params[:caso][:victima_attributes][iv][:persona_attributes][:persona_trelacion1_attributes][it][:id] = pt.id
                      end
                    end
                  end
                end
              end
              if @caso.update(caso_params)
                #if request.params[:enviarFichaCaso] == '1'
                #  head :no_content
                #  return
                #end
                notificacion = 'Caso actualizado.'
                if Sivel2Gen::Caso.count > MAX_CASOS_REFRESCA_AUTOMATICO
                  notificacion += "  Por la cantidad de casos "+
                    " debe Refrescar para notar " +
                    " el cambio en el listado de casos".html_safe
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
            update_gen
          end

          # Tuve que crear el siguiente para llamarlo desde
          # sivel2_sjr/concerns/controllers/casos_controllers pues no hay super 
          # en módulos y no se logró con prepend u otra forma
          def sivel2_gen_destroy
            if @caso.id
              CasoUsuario.where(id_caso: @caso.id).destroy_all
            end
            @caso.destroy
            notificacion = 'Caso eliminado.'
            if Sivel2Gen::Caso.count > MAX_CASOS_REFRESCA_AUTOMATICO
              notificacion += "  Por la cantidad de casos "+
                " debe Refrescar para notar " +
                " el cambio en el listado de casos".html_safe
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
            @caso = @registro = clase.constantize.find(params[:id])
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end
            if cannot?(:show, Sivel2Gen::Caso) && cannot?(:show, @registro)
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :read, @registro
              return
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
                xml = render_to_string  action: 'show.xml', locals: { caso: @caso }
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
          def importa
            file=params[:file]
            doc = file.read
            docnoko = Nokogiri::XML(doc)
            docnoko.search('observaciones').each do |obs|
              obs.content = obs['tipo'] + '_' + obs.text
            end
            relimportado = Hash.from_xml(docnoko.to_s)
            datossal = {}
            menserror= ''
            @caso = Caso.new
            if docnoko.search('relato').count == 1
              relimportado['relatos'].each do |ca|
                if @caso.importa(ca[1], datossal, menserror, {}).nil?
                  error
                else
                  @caso.save!
                end
              end
            else
              relimportado['relatos']['relato'].each do |ca|
                if @caso.importa(ca, datossal, menserror, {}).nil?
                  error
                else
                  @caso.save!
                end
              end 
            end
            redirect_to casos_path, notice: "Relato importado!"
          end
          private

          # Configuración común o restricciones entre acciones
          def set_caso
            @registro = @caso = Caso.find(params[:id].to_i)
            @caso.current_usuario = current_usuario
          end

          def lista_params
            [ 
              :bienes, 
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
                :filiacion_ids => [],
                :grupoper_attributes => [
                  :anotaciones,
                  :id, 
                  :nombre, 
                ],
                :organizacion_ids => [],
                :profesion_ids => [],
                :rangoedad_ids => [],
              :sectorsocial_ids => [],
                :vinculoestado_ids => []
              ],
            ]
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
