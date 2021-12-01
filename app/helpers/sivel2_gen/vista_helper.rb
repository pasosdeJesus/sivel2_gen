module Sivel2Gen
  module VistaHelper

    include Rails.application.routes.url_helpers

    # Presenta arbol de presuntos responsables
    # Llamar dentro de <ul>..</ul>
    def presenta_arbol_presp_ul_li(nivel, arbol)
      subarbol = ''
      if arbol[:hijos].count > 0
        subarbol = "<ul>\n".html_safe + arbol[:hijos].map{|h| 
          "<li>".html_safe + 
            presenta_arbol_presp_ul_li(nivel+1, h) +
            "</li>".html_safe
        }.join("\n") +
        "</ul>\n".html_safe
      end
      return arbol[:nombre] + "\n" + subarbol
    end
    module_function :presenta_arbol_presp_ul_li


  # Basado en función de https://thoughtbot.com/blog/organized-workflow-for-svg
  def embeber_mapacalordepcol_svg(titulo, subtitulo, cantidadesdep, opciones = {})
    assets = Rails.application.assets

    if assets
      cont = assets.find_asset('svg/mapacalordep.svg').source.force_encoding("UTF-8")
    else
      rutas = Gem::Specification.stubs.map(&:full_gem_path)
      rs = rutas.select {|x| x.include?('sivel2_gen')}.first
      rs += "/app/assets/images/svg/mapacalordep.svg"
      puts "OJO rs=#{rs}"
      cont = File.read(rs).force_encoding("UTF-8")
    end
    doc = Nokogiri::HTML::DocumentFragment.parse cont
    svg = doc.at_css "svg"
    if opciones[:class].present?
      svg["class"] = opciones[:class]
    end

    tit = svg.at_css('#titulo')
    if tit && titulo
      tit.content = titulo
    end
    sub = svg.at_css('#subtitulo')
    if sub && subtitulo
      sub.content = subtitulo
    end

    min = 0
    max = 0
    if cantidadesdep.count>0
      min = cantidadesdep.values.first
      max = cantidadesdep.values.last
    end
    cantidadesdep.each do |d, c|
      if c < min
        min = c
      end
      if c > max
        max = c
      end
    end
    l2 = (max * 0.25 > 1 ? max * 0.25 : 1).to_i
    l3 = (max * 0.5 > 1  ? max * 0.5  : 1).to_i
    l4 = (max * 0.75 > 1 ? max * 0.75 : 1).to_i
    l5 = (max > 1 ? max : 1).to_i
    r1=((0 < l2 ? 1 : 0)..l2)
    r2=((l2 < l3 ? l2 + 1 : l2)..l3)
    r3=((l3 < l4 ? l3 + 1 : l3)..l4)
    r4=((l4 < l5 ? l4 + 1 : l4)..l5)
    sr1 = svg.at_css('#rango1')
    if sr1
      sr1.content = "#{r1.min} - #{r1.max}"
    end
    sr2 = svg.at_css('#rango2')
    if sr2
      sr2.content = "#{r2.min} - #{r2.max}"
    end
    sr3 = svg.at_css('#rango3')
    if sr3
      sr3.content = "#{r3.min} - #{r3.max}"
    end
    sr4 = svg.at_css('#rango4')
    if sr4
      sr4.content = "#{r4.min} - #{r4.max}"
    end

    Sip::Departamento.where(id_pais: 170).each do |dep|
      cant = 0
      if cantidadesdep.keys.include?(dep.id_deplocal)
        cant = cantidadesdep[dep.id_deplocal].to_i
      end

      ud = svg.at_css('#numdep' + dep.id_deplocal.to_s)
      if ud
        if cant > 0
          ud.content="#{cant}"
        else
          ud.content=''
        end
      end

      md = svg.at_css('#mixtidep' + dep.id_deplocal.to_s)
      if md && cant > 0
        if r4.include?(cant)
          md['fill'] = '#0000f0'
        elsif r3.include?(cant)
          md['fill'] = '#5656fb'
        elsif r2.include?(cant)
          md['fill'] = '#a8a8fb'
        elsif r1.include?(cant)
          md['fill'] = '#e8e8fb'
        else
          puts "** OJO Algo fallo en calculo de rangos porque #{cant} no está en ninguno"
        end
      end

#      if nd
#        nd['fill']='#0f0'
#        nd.content=dep.nombre + ' ' + dep.id_deplocal.to_s
#      end
    end
    r= doc.to_s.html_safe
    return r
  end
  module_function :embeber_mapacalordepcol_svg

  end
end
