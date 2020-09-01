class ApplicationController < Sivel2Gen::ApplicationController
  # Previene ataques CSRF lanzando una excepción
  # Para APIs, más bien puede usar :null_session
  protect_from_forgery with: :exception
end
