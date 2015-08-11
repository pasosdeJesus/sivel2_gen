# encoding: UTF-8
module Sivel2Gen
  class CasosController < ApplicationController
    before_action :set_caso, only: [:show, :edit, :update, :destroy]
    #byebug
    load_and_authorize_resource class: Sivel2Gen::Caso
    helper Sip::UbicacionHelper

    # GET /casos
    # GET /casos.json
    def index
      Caso.refresca_conscaso

      if (params && params[:filtro] && params[:filtro][:q] && 
          params[:filtro][:q].length>0)
        q = params[:filtro][:q].gsub("-", " ")
        @conscaso = Conscaso.where(
          "q @@ plainto_tsquery('spanish', unaccent(?))", q
        )
      else
        #@conscaso = @filterrific.find.page(params[:reporte])
        @conscaso = Conscaso.all
        for i in [:departamento_id, :municipio_id, :clase_id, 
                  :fechaini, :fechafin, :presponsable_id, :categoria_id,
                  :nombres, :apellidos, :sexo, :descripcion, 
                  :etiqueta1, :etiqueta2, 
                  :usuario_id, :fechaingini, :fechaingfin,
                  :codigo
        ] do
          if (params[:reporte] && params[:reporte][i] && 
              params[:reporte][i] != '') 
            if @conscaso.respond_to?('filtro_' + i.to_s)
              @conscaso = @conscaso.send('filtro_' + i.to_s, params[:reporte][i])
            end
          end
        end
      end

      @numconscaso = @conscaso.size
      @conscaso = @conscaso.paginate(:page => params[:pagina], per_page: 20)
      respond_to do |format|
        format.js { render 'sivel2_gen/casos/filtro' }
        format.html { render layout: 'application' }
      end
    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
    end


    # GET /casos/1
    # GET /casos/1.json
    def show
      render layout: 'application'
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
      if session[:capturacaso_acordeon]
        render 'editv', layout: 'application'
      else
        render 'edit', layout: 'application'
      end
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

    # GET /casos/1/edit
    def edit
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

      respond_to do |format|
        if @caso.save
          format.html { redirect_to @caso, notice: 'Caso creado.' }
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
    end

    # PATCH/PUT /casos/1
    # PATCH/PUT /casos/1.json
    def update
      respond_to do |format|
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
          format.html { 
            if session[:capturacaso_acordeon]
              render 'editv', layout: 'application' 
            else
              render 'edit', layout: 'application' 
            end
          }
          format.json { render json: @caso.errors, status: :unprocessable_entity }
          format.js   { render action: 'edit' }
        end
      end
    end

    # DELETE /casos/1
    # DELETE /casos/1.json
    def destroy
      if @caso.id
        CasoUsuario.destroy_all(id_caso: @caso.id)
      end
      @caso.destroy
      respond_to do |format|
        format.html { redirect_to casos_url }
        format.json { head :no_content }
      end
    end

    private

    # Configuración común o restricciones entre acciones
    def set_caso
      @caso = Caso.find(params[:id].to_i)
      @caso.current_usuario = current_usuario
    end

    # Lista blanca de parametros
    def caso_params
      params.require(:caso).permit(
        :q,
        :id, :titulo, :fecha, :hora, :duracion,  
        :grconfiabilidad, :gresclarecimiento, :grimpunidad, :grinformacion, 
        :bienes, :id_intervalo, :memo, 
        :victima_attributes => [
          :id, :id_persona, :id_profesion, :id_rangoedad, :id_etnia, 
          :id_filiacion, :id_organizacion, :id_vinculoestado, :anotaciones,
          :id_iglesia, :orientacionsexual, :_destroy, 
          :persona_attributes => [
            :id, :nombres, :apellidos, :anionac, :mesnac, :dianac, 
            :id_pais, :id_departamento, :id_municipio, :id_clase, 
            :nacionalde, :numerodocumento, :sexo, :tdocumento_id
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
        :anexo_caso_attributes => [
          :id, 
          :id_caso,
          :fecha,
          :_destroy,
          :sip_anexo_attributes => [
            :id, :descripcion, :adjunto, :_destroy
          ]
        ],
        :caso_etiqueta_attributes => [
          :id, :id_usuario, :fecha, :id_etiqueta, :observaciones, :_destroy
        ],
        :region_ids => [],
        :frontera_ids => [],
      )
    end
  end
end
