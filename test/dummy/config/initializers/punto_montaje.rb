Dummy::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/sivel2')
Dummy::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/sivel2') + '/assets'

