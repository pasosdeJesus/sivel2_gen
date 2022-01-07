xml.instruct!
if ENV['RAILS_ENV'] == 'test'
  rdtd = 'test/dummy/public/relatos-099.dtd'
else
  rdtd = 'http://sincodh.pasosdejesus.org/relatos/relatos-099.dtd'
end

xml.declare! :DOCTYPE, :relatos, :SYSTEM, rdtd
xml.relatos do

  @conscaso.try(:each) do |conscaso|
    caso= conscaso.caso
    xml << render(:partial => 'sivel2_gen/casos/caso', :locals => { :caso => caso} ).gsub(/^/, '     ')

  end
end


