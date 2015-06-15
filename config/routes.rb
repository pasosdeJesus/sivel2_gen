Sivel2Gen::Engine.routes.draw do

  patch "/actos/agregar" => 'actos#agregar'
  get "/actos/eliminar" => 'actos#eliminar'
  get '/acercade' => 'hogar#acercade'
  get '/anexos/descarga_anexo/:id' => 'sivel2_gen/anexos#descarga_anexo'
  get "/casos/busca" => 'casos#busca'
  get '/casos/lista' => 'casos#lista'
  get '/casos/nuevaubicacion' => 'casos#nueva_ubicacion'
  get '/casos/nuevavictima' => 'casos#nueva_victima'
  get '/casos/nuevopresponsable' => 'casos#nuevo_presponsable'
  get "/fichacasovertical" => 'hogar#fichacasovertical'
  get "/hogar" => 'hogar#index'
  get "/personas" => 'personas#index'
  get "/personas/remplazar" => 'personas#remplazar'
  get '/presponsables/nuevo' => 'presponsables#nuevo'
  get "/tablasbasicas" => 'hogar#tablasbasicas'
  get '/ubicaciones/nuevo' => 'ubicaciones#nuevo'
  get '/victimas/nuevo' => 'victimas#nuevo'

  resources :casos, path_names: { new: 'nuevo', edit: 'edita' }

  devise_scope :usuario do
    get 'sign_out' => 'devise/sessions#destroy'
  end
  devise_for :usuarios, :skip => [:registrations], module: :devise
    as :usuario do
          get 'usuarios/edit' => 'devise/registrations#edit', 
            :as => 'editar_registro_usuario'    
          put 'usuarios/:id' => 'devise/registrations#update', 
            :as => 'registro_usuario'            
  end
  resources :usuarios, path_names: { new: 'nuevo', edit: 'edita' } 

  namespace :admin do
    ::Ability.tablasbasicas.each do |t|
      if (t[0] == "Sivel2Gen") 
        c = t[1].pluralize
        resources c.to_sym, 
          path_names: { new: 'nueva', edit: 'edita' }
      end
    end
  end

  root 'sip/hogar#index'
end
