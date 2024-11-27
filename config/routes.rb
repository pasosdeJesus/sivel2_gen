
Sivel2Gen::Engine.routes.draw do

  get '/acercade' => 'hogar#acercade'

  get "/buscarrepetidos" => 'buscarrepetidos#reportar', as: :buscarrepetidos
  post "/buscarrepetidos" => 'buscarrepetidos#reportar', as: :envia_buscarrepetidos
  get "/victimas/nuevo", 'victimas#nuevo'

  get "/casos/busca" => 'casos#busca'
  get "/casos/cuenta" => 'casos#cuenta'
  get '/casos/errores_importacion' => 'casos#errores_importacion',
    as: :casos_errores_importacion
  get '/casos/importarrelatos' => 'casos#importarrelatos'
  get "/casos/:id/fichaimp" => "casos#fichaimp",
    as: :caso_fichaimp
  get "/casos/:id/fichapdf" => "casos#fichapdf",
    as: :caso_fichapdf
  get '/casos/lista' => 'casos#lista'
  get '/casos/mapaosm' => 'casos#mapaosm', as: :casos_mapaosm
  get '/casos/refresca' => 'casos#refresca', as: :casos_refresca
  get '/admin/categorias/filtratviolencia' => 'admin/categorias#filtra_por_tviolencia'
  get '/combatientes/nuevo' => 'combatientes#nuevo'

  get "/conteos/genvic" => 'conteos#genvic', as: :conteos_genvic
  get "/conteos/personas" => 'conteos#personas', as: :conteos_personas
  post "/conteos/personas" => 'conteos#personas', as: :post_conteos_personas
  get "/conteos/victimizaciones" => 'conteos#victimizaciones', 
    as: :conteos_victimizaciones

  get "/fichacasovertical" => 'hogar#fichacasovertical'

  get '/graficar/actos_individuales' => 'fil23_gen/graficar_plotly#actos_individuales', 
    :as => 'graficar_actos_individuales'

  get '/graficar/victimizaciones_individuales' => 'graficar_victimizaciones_individuales#graficar', 
#  get '/graficar/victimizaciones_individuales' => 'fil23_gen/graficar_apexcharts#victimizaciones_individuales', 
    :as => 'graficar_victimizaciones_individuales'

  post '/graficar/victimizaciones_individuales' => 'graficar_victimizaciones_individuales#graficar', 
    :as => 'enviar_graficar_victimizaciones_individuales'

  get "/hogar" => 'hogar#index'

  get '/admin/presponsables/nuevo' => 'admin/presponsables#nuevo'

  get '/admin/presponsables/arbol' => 'admin/presponsables#arbol',
    as: :arbol_presponsables

  get '/mapadep/victimizaciones' => 'mapadep#victimizaciones',
    as: :mapadepvic

  get '/mapamun/victimizaciones' => 'mapamun#victimizaciones',
    as: :mapamunvic

  get "/personas/remplazarfamiliar" => "/msip/personas#remplazarfamiliar"

  get "/tablasbasicas" => 'hogar#tablasbasicas'

  get '/ubicaciones/nuevo' => 'ubicaciones#nuevo'

  get "/validarcasos" => 'validarcasos#validar', as: :validarcasos
  post "/validarcasos" => 'validarcasos#validar', as: :envia_validarcasos

  get '/victimascolectivas/nuevo' => 'victimascolectivas#nuevo'

  resources :actos, only: [], param: :index do 
    member do
      delete '(:id)', to: "actos#destroy", as: "eliminar"
      post '/' => "actos#create", as: "crear"
    end
  end

  resources :actoscolectivos, only: [], param: :index do 
    member do
      delete '(:id)', to: "actoscolectivos#destroy", as: "eliminar"
      post '/' => "actoscolectivos#create", as: "crear"
    end
  end

  resources :anexo_casos, only: [], param: :index do 
    member do
      delete '(:id)', to: "anexo_casos#destroy", as: "eliminar"
      post '/' => "anexo_casos#create", as: "crear"
    end
  end

  resources :casos, path_names: { new: 'nuevo', edit: 'edita' } do
    collection { post :importa }
    member do
      patch :guardar_y_editar
      patch :resolver_solicitud
    end
  end

  resources :caso_etiqueta, only: [], param: :index do 
    member do
      delete '(:id)', to: "caso_etiquetas#destroy", as: "eliminar"
      post '/' => "caso_etiquetas#create", as: "crear"
    end
  end

  resources :caso_fotra, only: [], param: :index do 
    member do
      delete '(:id)', to: "caso_fotras#destroy", as: "eliminar"
      post '/' => "caso_fotras#create", as: "crear"
    end
  end

  resources :caso_fuentesprensa, only: [], param: :index do 
    member do
      delete '(:id)', to: "caso_fuentesprensa#destroy", as: "eliminar"
      post '/' => "caso_fuentesprensa#create", as: "crear"
    end
  end

  resources :caso_presponsable, only: [], param: :index do 
    member do
      delete '(:id)', to: "caso_presponsables#destroy", as: "eliminar"
      post '/' => "caso_presponsables#create", as: "crear"
    end
  end

  resources :caso_solicitud, only: [], param: :index do 
    member do
      delete '(:id)', to: "caso_solicitudes#destroy", as: "eliminar"
      post '/' => "caso_solicitudes#create", as: "crear"
    end
  end

  resources :caso_ubicacionpre, only: [], param: :index do 
    member do
      delete '(:id)', to: "caso_ubicacionespre#destroy", as: "eliminar"
      post '/' => "caso_ubicacionespre#create", as: "crear"
    end
  end

  resources :combatiente, only: [], param: :index do 
    member do
      delete '(:id)', to: "combatientes#destroy", as: "eliminar"
      post '/' => "combatientes#create", as: "crear"
    end
  end

  resources :familiar, only: [], param: :index do 
    member do
      delete '(:id)', to: "familiares#eliminar_familiar", as: "eliminar"
      post '/', to: "familiares#crear_familiar", as: "crear"
    end
  end

  resources :victimas, only: [], param: :index do
    member do
      delete '(:id)', to: "victimas#destroy", as: "eliminar"
      post '/', to: "victimas#create", as: "crear"
    end
  end

  resources :victimascolectivas, only: [], param: :index do 
    member do
      delete '(:id)', to: "victimascolectivas#destroy", as: "eliminar"
      post '/' => "victimascolectivas#create", as: "crear"
    end
  end
  get '/victimas' => 'victimas#index', as: "victimas"


  namespace :admin do
    ab=::Ability.new
    ab.tablasbasicas.each do |t|
      if (t[0] == "Sivel2Gen") 
        c = t[1].pluralize
        resources c.to_sym, 
          path_names: { new: 'nueva', edit: 'edita' }
      end
    end
  end

end
