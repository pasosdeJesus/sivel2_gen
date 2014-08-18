l = []
atributos_index.each do |atr|  
  l << atr.to_sym
end 
json.array!(@basica) do |basica|
  json.extract! basica, *l
  json.url admin_basica_url(basica, format: :json)
end
