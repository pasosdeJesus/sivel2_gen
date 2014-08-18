# encoding: UTF-8
module Admin
  class BasicasController < ApplicationController
    include BasicasHelpers
    helper BasicasHelpers
    load_and_authorize_resource

    # GET /basicas
    # GET /basicas.json
    def index
      c = clase.capitalize.constantize
      @basica = c.order(:nombre).paginate(:page => params[:pagina], per_page: 20)
    end

    # GET /basicas/1
    # GET /basicas/1.json
    def show
    end

    # GET /basicas/new
    def new
      @basica = clase.capitalize.constantize.new
      @basica.fechacreacion = DateTime.now.strftime('%Y-%m-%d')
    end

    # GET /basicas/1/edit
    def edit
      @basica = clase.capitalize.constantize.find(params[:id])
    end

    # POST /basicas
    # POST /basicas.json
    def create
      @basica = clase.capitalize.constantize.new(send(clase + '_params'))

      respond_to do |format|
        if @basica.save
          format.html { redirect_to admin_basica_path(@basica), notice: clase + ' creada.' }
          format.json { render action: 'show', status: :created, location: @basica}
        else
          format.html { render action: 'new' }
          format.json { render json: @basica.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /basicas/1
    # PATCH/PUT /basicas/1.json
    def update
      respond_to do |format|
        if @basica.update(send(clase + "_params"))
          format.html { redirect_to admin_basica_path(@basica), notice: clase + ' actualizada.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @basica.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /basicas/1
    # DELETE /basicas/1.json
    def destroy
      @basica.destroy
      respond_to do |format|
        format.html { redirect_to admin_basicas_url(@basica) }
        format.json { head :no_content }
      end
    end

    def clase 
      "BASICA_CAMBIAR"
    end

		def genclase
			return 'F';
		end

    def atributos_index
      ["id", "nombre", "fechacreacion", "fechadeshabilitacion"]
    end

    def atributos_form
      atributos_index - ["id"]
    end

    helper_method :clase, :atributos_index, :atributos_form, :genclase
  end
end
