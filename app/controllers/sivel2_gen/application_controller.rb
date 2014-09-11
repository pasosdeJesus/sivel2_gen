# encoding: UTF-8
module Sivel2Gen
  class ApplicationController < ActionController::Base
    before_filter do
      resource = controller_name.singularize.to_sym
      method = "#{resource}_params"
      params[resource] &&= send(method) if respond_to?(method, true)
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

    # Clas que hereda debe llamar 
    #protect_from_forgery with: :exception

    def current_ability
      @current_ability ||= Ability.new(current_usuario)
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :nusuario
      devise_parameter_sanitizer.for(:account_update) << 
      [:nombre, :email, :descripcion]
    end
  end
end
