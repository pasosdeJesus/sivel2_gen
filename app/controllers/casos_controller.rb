# encoding: UTF-8
class CasosController < ApplicationController
  before_action :set_caso, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /casos
  # GET /casos.json
  def index
    @casos = @casos.order(fecha: :desc).paginate(:page => params[:pagina], per_page: 20)
  end

  # GET /casos/1
  # GET /casos/1.json
  def show
  end

  # GET /casos/new
  def new
    @caso.current_usuario = current_usuario
    @caso.fecha = DateTime.now.strftime('%Y-%m-%d')
    @caso.memo = ''
    @caso.save!
    cu = CasoUsuario.new
    cu.id_usuario = current_usuario.id
    cu.id_caso = @caso.id
    cu.fechainicio = DateTime.now.strftime('%Y-%m-%d')
    cu.save!
    render action: 'edit'
  end


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


  def nuevo_presponsable
    if !params[:caso_id].nil?
      @presponsable = CasoPresponsable.new
      @presponsable.id_caso = params[:caso_id]
      @presponsable.id_presponsable = 35
      @presponsable.tipo = 0
      if @presponsable.save
        respond_to do |format|
          format.js { render text: @presponsable.id.to_s }
          format.json { render json: @presponsable.id.to_s, status: :created }
          format.html { render inline: @presponsable.id.to_s }
        end
      else
        respond_to do |format|
          format.html { render action: "error" }
          format.json { render json: @presponsable.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render inline: 'Falta identificacion del caso' }
      end
    end
  end


  def nueva_victima
    if !params[:caso_id].nil?
      @persona = Persona.new
      @victima = Victima.new
      @persona.nombres = 'N'
      @persona.apellidos = 'N'
      @persona.sexo = 'S'
      if !@persona.save
        respond_to do |format|
          format.html { render inline: 'No pudo crear persona' }
        end
        return
      end
      @victima.id_caso = params[:caso_id]
      @victima.id_persona = @persona.id
      if @victima.save
        respond_to do |format|
          format.js { render json: {'victima' => @victima.id.to_s,
            'persona' => @persona.id.to_s} }
          format.json { render json: {'victima' => @victima.id.to_s,
            'persona' => @persona.id.to_s}, status: :created }
          format.html { render json: {'victima' => @victima.id.to_s,
            'persona' => @persona.id.to_s} }
        end
      else
        respond_to do |format|
          format.html { render action: "error" }
          format.json { render json: @victima.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render inline: 'Falta identificacion del caso' }
      end
    end
  end

  def nueva_ubicacion
    if !params[:caso_id].nil?
      @ubicacion = Ubicacion.new
      @ubicacion.id_caso = params[:caso_id]
      @ubicacion.id_pais = 170
      if @ubicacion.save
        respond_to do |format|
          format.js { render text: @ubicacion.id.to_s }
          format.json { render json: @ubicacion.id.to_s, status: :created }
          format.html { render inline: @ubicacion.id.to_s }
        end
      else
        respond_to do |format|
          format.html { render action: "error" }
          format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render inline: 'Falta identificacion del caso' }
      end
    end
  end


	def lista
    if !params[:tabla].nil?
			r = nil
			if (params[:tabla] == "departamento" && params[:id_pais].to_i > 0)
				r = Departamento.where(fechadeshabilitacion: nil,
                               id_pais: params[:id_pais].to_i).order(:nombre)
			elsif (params[:tabla] == "municipio" && params[:id_pais].to_i > 0 && 
             params[:id_departamento].to_i > 0 )
				r = Municipio.where(id_pais: params[:id_pais].to_i, 
                            id_departamento: params[:id_departamento].to_i,
                            fechadeshabilitacion: nil).order(:nombre)
			elsif (params[:tabla] == "clase" && params[:id_pais].to_i > 0 && 
             params[:id_departamento].to_i > 0 && 
             params[:id_municipio].to_i > 0)
        r = Clase.where(id_pais: params[:id_pais].to_i, 
                        id_departamento: params[:id_departamento].to_i, 
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


  # GET /casos/1/edit
  def edit
  end

  # POST /casos
  # POST /casos.json
  def create
    @caso.current_usuario = current_usuario
    @caso.memo = ''
    @caso.titulo = ''

    respond_to do |format|
      if @caso.save
        format.html { redirect_to @caso, notice: 'Caso creado.' }
        format.json { render action: 'show', status: :created, location: @caso }
      else
        format.html { render action: 'new' }
        format.json { render json: @caso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casos/1
  # PATCH/PUT /casos/1.json
  def update
    respond_to do |format|
=begin
      if (!params[:caso][:acto_attributes].nil?) 
        params[:caso][:acto_attributes].each {|k,v| 
          if (v[:_destroy].nil? || v[:_destroy] != 1)
            acto = Acto.new
            acto.id_presponsable = v[:id_presponsable]
            acto.id_persona = v[:id_persona]
            acto.id_categoria = v[:id_categoria]
            acto.id_caso = @caso.id
            acto.save
          end
        }
      end
=end
      if (!params[:caso][:caso_etiqueta_attributes].nil?)
        params[:caso][:caso_etiqueta_attributes].each  do |k,v|
          if (v[:id_usuario].nil? || v[:id_usuario] == "") 
            v[:id_usuario] = current_usuario.id
          end
        end
      end
      if @caso.update(caso_params)
        format.html { redirect_to @caso, notice: 'Caso actualizado.' }
        format.json { head :no_content }
        format.js   { redirect_to @caso, notice: 'Caso actualizado.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @caso.errors, status: :unprocessable_entity }
        format.js   { render action: 'edit' }
      end
    end
  end

  # DELETE /casos/1
  # DELETE /casos/1.json
  def destroy
    @caso.destroy
    respond_to do |format|
      format.html { redirect_to casos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caso
      @caso = Caso.find(params[:id])
      @caso.current_usuario = current_usuario
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caso_params
      params.require(:caso).permit(
        :id, :titulo, :fecha, :hora, :duracion,  
        :grconfiabilidad, :gresclarecimiento, :grimpunidad, :grinformacion, 
        :bienes, :id_intervalo, :memo, 
        :victima_attributes => [
          :id, :id_persona, :id_profesion, :id_rangoedad, :id_etnia, 
          :id_iglesia, :orientacionsexual, :_destroy, 
          :persona_attributes => [
            :id, :nombres, :apellidos, :anionac, :mesnac, :dianac, 
            :id_pais, :id_departamento, :id_municipio, :id_clase, 
            :nacionalde, :numerodocumento, :sexo, :tipodocumento
          ],
        ], 
        :ubicacion_attributes => [
          :id, :id_pais, :id_departamento, :id_municipio, :id_clase, 
          :lugar, :sitio, :latitud, :longitud, :id_tsitio, 
          :_destroy
        ],
        :caso_presponsable_attributes => [
          :id, :id_presponsable, :tipo, 
          :bloque, :frente, :brigada, :batallon, :division, :otro, :_destroy
        ],
        :acto_attributes => [
          :id, :id_presponsable, :id_categoria, 
          :id_persona, :_destroy
        ],
        :anexo_attributes => [
					:id, :fecha, :descripcion, :archivo, :adjunto, :_destroy
				],
        :caso_etiqueta_attributes => [
          :id, :id_usuario, :fecha, :id_etiqueta, :observaciones, :_destroy
        ],
        :region_ids => [],
        :frontera_ids => [],
      )
    end
end
