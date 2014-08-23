# encoding: UTF-8
require 'bcrypt'

class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = @usuarios.paginate(:page => params[:pagina], per_page: 20)
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario.current_usuario = current_usuario
    @usuario.regionsjr_id = current_usuario.regionsjr_id.nil? ?  
      0 : current_usuario.regionsjr_id
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario.current_usuario = current_usuario
    @usuario.encrypted_password = BCrypt::Password.create(
      params[:usuario][:encrypted_password],
      {:cost => Rails.application.config.devise.stretches})
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @usuario }
      else
        format.html { render action: 'new' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    if (!params[:usuario][:encrypted_password].nil? &&
       params[:usuario][:encrypted_password] != "")
      params[:usuario][:encrypted_password] = BCrypt::Password.create(
        params[:usuario][:encrypted_password],
        {:cost => Rails.application.config.devise.stretches})
    end
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    	@usuario.current_usuario = current_usuario
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(
        :id, :nusuario, :password, 
        :nombre, :descripcion, :regionsjr_id, 
        :rol, :idioma, :email, :encrypted_password, :reset_password_token, 
        :reset_password_sent_at, :remember_created_at, :sign_in_count, 
        :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, 
        :failed_attempts, :unlock_token, :locked_at,
        :last_sign_in_ip, :etiqueta_ids => []
      )
    end
end
