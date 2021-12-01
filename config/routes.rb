
Sivel2Gen::Engine.routes.draw do

  patch "/actos/agregar" => 'actos#agregar'
  get "/actos/eliminar" => 'actos#eliminar'

  patch "/actoscolectivos/agregar" => 'actoscolectivos#agregar'
  get "/actoscolectivos/eliminar" => 'actoscolectivos#eliminar'

  get '/acercade' => 'hogar#acercade'

  get "/buscarrepetidos" => 'buscarrepetidos#reportar', as: :buscarrepetidos
  post "/buscarrepetidos" => 'buscarrepetidos#reportar', as: :envia_buscarrepetidos
  get "/casofotras/nuevo", 'casofotras#nuevo'

  get "/casos/busca" => 'casos#busca'
  get "/casos/cuenta" => 'casos#cuenta'
  get '/casos/importarrelatos' => 'casos#importarrelatos'
  get "/casos/:id/fichaimp" => "casos#fichaimp",
    as: :caso_fichaimp
  get "/casos/:id/fichapdf" => "casos#fichapdf",
    as: :caso_fichapdf
  get '/casos/lista' => 'casos#lista'
  get '/casos/mapaosm' => 'casos#mapaosm', as: :casos_mapaosm
  get '/casos/nuevaubicacion' => 'casos#nueva_ubicacion'
  get '/casos/nuevavictima' => 'casos#nueva_victima'
  get '/casos/refresca' => 'casos#refresca', as: :casos_refresca

  get '/combatientes/nuevo' => 'combatientes#nuevo'

  get "/conteos/genvic" => 'conteos#genvic', as: :conteos_genvic
  get "/conteos/personas" => 'conteos#personas', as: :conteos_personas
  get "/conteos/victimizaciones" => 'conteos#victimizaciones', 
    as: :conteos_victimizaciones

  get "/fichacasovertical" => 'hogar#fichacasovertical'

  get "/fuentesprensa/nuevo", 'fuentesprensa#nuevo'

  get '/graficar/actos_individuales' => 'fil23_gen/graficar_plotly#actos_individuales', 
    :as => 'graficar_actos_individuales'

  get '/graficar/victimizaciones_individuales' => 'fil23_gen/graficar_apexcharts#victimizaciones_individuales', 
    :as => 'graficar_victimizaciones_individuales'

  post '/graficar/victimizaciones_individuales' => 'fil23_gen/graficar_apexcharts#victimizaciones_individuales', 
    :as => 'enviar_graficar_victimizaciones_individuales'

  get "/hogar" => 'hogar#index'

  get '/admin/presponsables/nuevo' => 'admin/presponsables#nuevo'

  get '/admin/presponsables/arbol' => 'admin/presponsables#arbol',
    as: :arbol_presponsables

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
