# frozen_string_literal: true

Rails.application.config.assets.paths << Rails.root.join("node_modules/leaflet/dist/images/")

# Precompilar recursos adicionales.
# application.js, application.css, y todo lo que no es JS/CSS
#   en la carpeta app/assets ya han sido agregados.
Rails.application.config.assets.precompile += [
  "layers-2x.png",
  "layers.png",
  "marker-icon.png",
  "marker-icon-2x.png",
  "marker-shadow.png",
]
