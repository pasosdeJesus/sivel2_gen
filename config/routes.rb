
Sivel2Gen::Engine.routes.draw do

  patch "/actos/agregar" => 'actos#agregar'
  get "/actos/eliminar" => 'actos#eliminar'

  patch "/actoscolectivos/agregar" => 'actoscolectivos#agregar'
  get "/actoscolectivos/eliminar" => 'actoscolectivos#eliminar'

  get '/acercade' => 'hogar#acercade'

  get "/buscarrepetidos" => 'buscarrepetidos#reportar', as: :buscarrepetidos
  post "/buscarrepetidos" => 'buscarrepetidos#reportar', as: :envia_buscarrepetidos
  get "/casoetiquetas/nueva", 'casoetiquetas#nueva'
  get "/casofotras/nuevo", 'casofotras#nuevo'

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

  get "/personas/remplazarfamiliar" => "/sip/personas#remplazarfamiliar"

  get "/tablasbasicas" => 'hogar#tablasbasicas'

  get '/ubicaciones/nuevo' => 'ubicaciones#nuevo'

  get "/validarcasos" => 'validarcasos#validar', as: :validarcasos
  post "/validarcasos" => 'validarcasos#validar', as: :envia_validarcasos

  get '/victimas' => 'victimas#index', as: :victimas
  get '/victimas/nuevo' => 'victimas#nuevo'

  get '/victimascolectivas/nuevo' => 'victimascolectivas#nuevo'

  resources :casos, path_names: { new: 'nuevo', edit: 'edita' } do
      collection { post :importa }
  end

  resources :casos_fuenteprensa, only: [], param: :index do 
    member do
      delete '(:id)', to: "fuentesprensa#destroy", as: "eliminar"
      post '/' => "fuentesprensa#create"
    end
  end

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
