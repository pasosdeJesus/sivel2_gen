# encoding: UTF-8

Sivel2Gen::Engine.routes.draw do

  patch "/actos/agregar" => 'actos#agregar'
  get "/actos/eliminar" => 'actos#eliminar'
  get '/acercade' => 'hogar#acercade'
  get "/casos/busca" => 'casos#busca'
  get '/casos/lista' => 'casos#lista'
  get '/casos/nuevaubicacion' => 'casos#nueva_ubicacion'
  get '/casos/nuevavictima' => 'casos#nueva_victima'
  get '/casos/nuevopresponsable' => 'casos#nuevo_presponsable'
  get '/combatientes/nuevo' => 'combatientes#nuevo'
  get "/fichacasovertical" => 'hogar#fichacasovertical'
  get "/hogar" => 'hogar#index'
  get "/personas" => 'personas#index'
  get "/personas/remplazar" => 'personas#remplazar'
  get "/grupoper/remplazar" => 'grupoper#remplazar'
  get '/presponsables/nuevo' => 'presponsables#nuevo'
  get "/tablasbasicas" => 'hogar#tablasbasicas'
  get '/ubicaciones/nuevo' => 'ubicaciones#nuevo'
  get '/victimas/nuevo' => 'victimas#nuevo'
  get '/victimascolectivas/nuevo' => 'victimascolectivas#nuevo'

  get '/casos/filtro' => 'casos#index', as: :casos_filtro
  post '/casos/filtro' => 'casos#index', as: :envia_casos_filtro

  get '/casos/genera/:idplantilla' => 'casos#index', as: :casos_genera

  get "/conteos/personas" => 'conteos#personas', as: :conteos_personas
  get "/conteos/genvic" => 'conteos#genvic', as: :conteos_genvic
  get "/validarcasos" => 'validarcasos#validar', as: :validarcasos
  post "/validarcasos" => 'validarcasos#validar', as: :envia_validarcasos

  resources :casos, path_names: { new: 'nuevo', edit: 'edita' }

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
