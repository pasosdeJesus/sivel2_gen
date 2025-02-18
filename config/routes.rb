# frozen_string_literal: true

Sivel2Gen::Engine.routes.draw do
  get "/acercade", action: "hogar#acercade"

  get "/buscarrepetidos", action: "buscarrepetidos#reportar", as: :buscarrepetidos
  post "/buscarrepetidos", action: "buscarrepetidos#reportar", 
    as: :envia_buscarrepetidos
  get "/victimas/nuevo", action: "victimas#nuevo"

  get "/casos/busca", action: "casos#busca"
  get "/casos/cuenta", action: "casos#cuenta"
  get "/casos/datos-osm", action: "casos#presenta_datos_mapaosm"
  get "/casos/errores_importacion", action: "casos#errores_importacion",
    as: :casos_errores_importacion
  get "/casos/importarrelatos", action: "casos#importarrelatos"
  get "/casos/:id/fichaimp", action: "casos#fichaimp",
    as: :caso_fichaimp
  get "/casos/:id/fichapdf", action: "casos#fichapdf",
    as: :caso_fichapdf
  get "/casos/lista", action: "casos#lista"
  get "/casos/mapaosm", action: "casos#mapaosm", as: :casos_mapaosm
  get "/casos/refresca", action: "casos#refresca", as: :casos_refresca
  get "/admin/categorias/filtratviolencia", action: "admin/categorias#filtra_por_tviolencia"
  get "/combatientes/nuevo", action: "combatientes#nuevo"

  get "/conteos/genvic", action: "conteos#genvic", as: :conteos_genvic
  get "/conteos/personas", action: "conteos#personas", as: :conteos_personas
  post "/conteos/personas", action: "conteos#personas", as: :post_conteos_personas
  get "/conteos/victimizaciones", action: "conteos#victimizaciones",
    as: :conteos_victimizaciones

  get "/fichacasovertical", action: "hogar#fichacasovertical"

  get "/graficar/actos_individuales", action: "fil23_gen/graficar_plotly#actos_individuales",
    :as => "graficar_actos_individuales"

  get "/graficar/victimizaciones_individuales", action: "graficar_victimizaciones_individuales#graficar",
    :as => "graficar_victimizaciones_individuales"

  post "/graficar/victimizaciones_individuales", action: "graficar_victimizaciones_individuales#graficar",
    :as => "enviar_graficar_victimizaciones_individuales"

  get "/hogar", action: "hogar#index"

  get "/admin/presponsables/nuevo", action: "admin/presponsables#nuevo"

  get "/admin/presponsables/arbol", action: "admin/presponsables#arbol",
    as: :arbol_presponsables

  get "/mapadep/victimizaciones", action: "mapadep#victimizaciones",
    as: :mapadepvic

  get "/mapamun/victimizaciones", action: "mapamun#victimizaciones",
    as: :mapamunvic

  get "/personas/remplazarfamiliar", action: "/msip/personas#remplazarfamiliar"

  get "/tablasbasicas", action: "hogar#tablasbasicas"

  get "/ubicaciones/nuevo", action: "ubicaciones#nuevo"

  get "/validarcasos", action: "validarcasos#validar", as: :validarcasos
  post "/validarcasos", action: "validarcasos#validar", as: :envia_validarcasos

  get "/victimascolectivas/nuevo", action: "victimascolectivas#nuevo"

  resources :actos, only: [], param: :index do
    member do
      delete "(:id)", to: "actos#destroy", as: "eliminar"
      post "/", action: "actos#create", as: "crear"
    end
  end

  resources :actoscolectivos, only: [], param: :index do
    member do
      delete "(:id)", to: "actoscolectivos#destroy", as: "eliminar"
      post "/", action: "actoscolectivos#create", as: "crear"
    end
  end

  resources :anexo_casos, only: [], param: :index do
    member do
      delete "(:id)", to: "anexo_casos#destroy", as: "eliminar"
      post "/", action: "anexo_casos#create", as: "crear"
    end
  end

  resources :casos, path_names: { new: "nuevo", edit: "edita" } do
    collection { post :importa }
    member do
      patch :guardar_y_editar
      patch :resolver_solicitud
    end
  end

  resources :caso_etiqueta, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_etiquetas#destroy", as: "eliminar"
      post "/", action: "caso_etiquetas#create", as: "crear"
    end
  end

  resources :caso_fotra, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_fotras#destroy", as: "eliminar"
      post "/", action: "caso_fotras#create", as: "crear"
    end
  end

  resources :caso_fuentesprensa, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_fuentesprensa#destroy", as: "eliminar"
      post "/", action: "caso_fuentesprensa#create", as: "crear"
    end
  end

  resources :caso_presponsable, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_presponsables#destroy", as: "eliminar"
      post "/", action: "caso_presponsables#create", as: "crear"
    end
  end

  resources :caso_solicitud, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_solicitudes#destroy", as: "eliminar"
      post "/", action: "caso_solicitudes#create", as: "crear"
    end
  end

  resources :caso_ubicacionpre, only: [], param: :index do
    member do
      delete "(:id)", to: "caso_ubicacionespre#destroy", as: "eliminar"
      post "/", action: "caso_ubicacionespre#create", as: "crear"
    end
  end

  resources :combatiente, only: [], param: :index do
    member do
      delete "(:id)", to: "combatientes#destroy", as: "eliminar"
      post "/", action: "combatientes#create", as: "crear"
    end
  end

  resources :familiar, only: [], param: :index do
    member do
      delete "(:id)", to: "familiares#eliminar_familiar", as: "eliminar"
      post "/", to: "familiares#crear_familiar", as: "crear"
    end
  end

  resources :victimas, only: [], param: :index do
    member do
      delete "(:id)", to: "victimas#destroy", as: "eliminar"
      post "/", to: "victimas#create", as: "crear"
    end
  end

  resources :victimascolectivas, only: [], param: :index do
    member do
      delete "(:id)", to: "victimascolectivas#destroy", as: "eliminar"
      post "/", action: "victimascolectivas#create", as: "crear"
    end
  end
  get "/victimas", action: "victimas#index", as: "victimas"

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
