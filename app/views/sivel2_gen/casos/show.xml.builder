xml.instruct!
if ENV['RAILS_ENV'] == 'test'
  rdtd = 'test/dummy/public/relatos-098.dtd'
else
  rdtd = 'https://sincodh.pasosdejesus.org/relatos/relatos-098.dtd'
end

xml.declare! :DOCTYPE, :relatos, :SYSTEM, rdtd
xml.relatos do
  xml << render(:partial => 'sivel2_gen/casos/caso.xrlat', :locals => { :caso => caso} ).gsub(/^/, '     ')

end

