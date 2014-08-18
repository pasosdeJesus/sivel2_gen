l = []
atributos_index.each do |atr|  
  l << atr.to_sym
end 
json.extract! @basica, *l
