# frozen_string_literal: true

Sivel2Gen::Engine.routes.draw do
  get "/acercade", to: "hogar#acercade"

  resources :actos, only: [], param: :index do
    member do
      delete "(:id)", to: "actos#destroy", as: "eliminar"
      post "/", to: "actos#create", as: "crear"
    end
  end

  resources :actoscolectivos, only: [], param: :index do
    member do
      delete "(:id)", to: "actoscolectivos#destroy", as: "eliminar"
      post "/", to: "actoscolectivos#create", as: "crear"
    end
  end

  get "/admin/categorias/filtratviolencia", to: "admin/categorias#filtra_por_tviolencia"

  get "/admin/presponsables/nuevo", to: "admin/presponsables#nuevo"
  get "/admin/presponsables/arbol",
    to: "admin/presponsables#arbol",
    as: :arbol_presponsables

  resources :anexo_casos, only: [], param: :index do
    member do
      delete "(:id)", to: "anexo_casos#destroy", as: "eliminar"
      post "/", to: "anexo_casos#create", as: "crear"
    end
  end

  get "/buscarrepetidos", to: "buscarrepetidos#reportar", as: :buscarrepetidos
  post "/buscarrepetidos",
    to: "buscarrepetidos#reportar",
    as: :envia_buscarrepetidos

  resources :caso_etiqueta, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_etiquetas#destroy", as: "eliminar"
      post "/", to: "caso_etiquetas#create", as: "crear"
    end
  end

  resources :caso_fotra, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_fotras#destroy", as: "eliminar"
      post "/", to: "caso_fotras#create", as: "crear"
    end
  end

  resources :caso_fuentesprensa, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_fuentesprensa#destroy", as: "eliminar"
      post "/", to: "caso_fuentesprensa#create", as: "crear"
    end
  end

  resources :caso_presponsable, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_presponsables#destroy", as: "eliminar"
      post "/", to: "caso_presponsables#create", as: "crear"
    end
  end

  resources :caso_solicitud, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_solicitudes#destroy", as: "eliminar"
      post "/", to: "caso_solicitudes#create", as: "crear"
    end
  end

  resources :caso_ubicacionpre, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_ubicacionespre#destroy", as: "eliminar"
      post "/", to: "caso_ubicacionespre#create", as: "crear"
    end
  end

  get "/casos/busca", to: "casos#busca"
  get "/casos/cuenta", to: "casos#cuenta"
  get "/casos/datos-osm", to: "casos#presenta_datos_mapaosm"
  get "/casos/errores_importacion",
    to: "casos#errores_importacion",
    as: :casos_errores_importacion
  get "/casos/importarrelatos", to: "casos#importarrelatos"
  get "/casos/:id/fichaimp",
    to: "casos#fichaimp",
    as: :caso_fichaimp
  get "/casos/:id/fichapdf",
    to: "casos#fichapdf",
    as: :caso_fichapdf
  get "/casos/lista", to: "casos#lista"
  get "/casos/mapaosm", to: "casos#mapaosm", as: :casos_mapaosm
  get "/casos/refresca", to: "casos#refresca", as: :casos_refresca

  resources :casos, path_names: { new: "nuevo", edit: "edita" } do
    collection { post :importa }
    member do
      patch :guardar_y_editar
      patch :resolver_solicitud
    end
  end


  resources :combatiente, only: [], param: :index do
    member do
      delete "(:id)", to: "combatientes#destroy", as: "eliminar"
      post "/", to: "combatientes#create", as: "crear"
    end
  end

  get "/combatientes/nuevo", to: "combatientes#nuevo"

  get "/conteos/genvic", to: "conteos#genvic", as: :conteos_genvic
  get "/conteos/personas", to: "conteos#personas", as: :conteos_personas
  post "/conteos/personas", to: "conteos#personas", as: :post_conteos_personas
  get "/conteos/victimizaciones",
    to: "conteos#victimizaciones",
    as: :conteos_victimizaciones

  resources :familiar, only: [], param: :index do
    member do
      delete "(:id)", to: "familiares#eliminar_familiar", as: "eliminar"
      post "/", to: "familiares#crear_familiar", as: "crear"
    end
  end

  get "/fichacasovertical", to: "hogar#fichacasovertical"

  get "/graficar/actos_individuales",
    to: "fil23_gen/graficar_plotly#actos_individuales",
    as: "graficar_actos_individuales"

  get "/graficar/victimizaciones_individuales",
    to: "graficar_victimizaciones_individuales#graficar",
    as: "graficar_victimizaciones_individuales"

  post "/graficar/victimizaciones_individuales",
    to: "graficar_victimizaciones_individuales#graficar",
    as: "enviar_graficar_victimizaciones_individuales"

  get "/hogar", to: "hogar#index"

  get "/mapadep/victimizaciones",
    to: "mapadep#victimizaciones",
    as: :mapadepvic

  get "/mapamun/victimizaciones",
    to: "mapamun#victimizaciones",
    as: :mapamunvic

  get "/personas/remplazarfamiliar", to: "/msip/personas#remplazarfamiliar"

  get "/tablasbasicas", to: "hogar#tablasbasicas"

  get "/ubicaciones/nuevo", to: "ubicaciones#nuevo"

  get "/validarcasos", to: "validarcasos#validar", as: :validarcasos
  post "/validarcasos", to: "validarcasos#validar", as: :envia_validarcasos

  resources :victimas, only: [], param: :index do
    member do
      delete "(:id)", to: "victimas#destroy", as: "eliminar"
      post "/", to: "victimas#create", as: "crear"
    end
  end

  get "/victimas", to: "victimas#index", as: "victimas"

  get "/victimas/nuevo", to: "victimas#nuevo"

  resources :victimascolectivas, only: [], param: :index do
    member do
      delete "(:id)", to: "victimascolectivas#destroy", as: "eliminar"
      post "/", to: "victimascolectivas#create", as: "crear"
    end
  end

  get "/victimascolectivas/nuevo", to: "victimascolectivas#nuevo"

  namespace :admin do
    ab = Ability.new
    ab.tablasbasicas.each do |t|
      next unless t[0] == "Sivel2Gen"

      c = t[1].pluralize
      resources c.to_sym,
        path_names: { new: "nueva", edit: "edita" }
    end
  end
end
