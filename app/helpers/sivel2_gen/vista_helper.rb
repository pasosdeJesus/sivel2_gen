module Sivel2Gen
  module VistaHelper

    include Rails.application.routes.url_helpers

    # Presenta arbol de presuntos responsables
    # Llamar dentro de <ul>..</ul>
    def presenta_arbol_presp_ul_li(nivel, arbol, opciones={})
      subarbol = ''
      if arbol[:hijos].count > 0
        subarbol = "<ul>\n".html_safe + arbol[:hijos].map{|h| 
          "<li>".html_safe + 
            presenta_arbol_presp_ul_li(nivel+1, h, opciones) +
            "</li>".html_safe
        }.join("\n").html_safe +
        "</ul>\n".html_safe
      end
      r = ''
      if opciones[:conid] && !arbol[:id].nil?
        r = CGI::escapeHTML("("+ arbol[:id].to_s + ") ")
      end
      r += CGI::escapeHTML(arbol[:nombre].to_s) 
      r += "\n" + subarbol
      return r.html_safe
    end
    module_function :presenta_arbol_presp_ul_li


    # Genera mapa svg de departamentos.
    #
    # Se espera que el mapa SVG tenga:
    #
    # - Un elemento `<text id="titulo"...>` para poner como contenido el título
    # - Un elemento `<text id="subtitulo"...>` para poner título
    # - Un elemento `<text id="titulo-rangos"...>` para poner título de rangos
    # - Un elemento `<text id="fuente"...>` para poner fuente
    # - 4 elementos `<text id="rango1"...>` ... `<text id="rango4"...>
    #   para poner rangos de menor a mayor como contenido en c/u
    # - 4 elementos `<rect id="colorrango1" fill="#e8e8fb"...>`  para poner
    #   color de cada rango en atributo fill
    # - Un elemento `<text id="numdep0"...>` para poner número de
    #   victimizaciones sin departamento
    #  - Un elemento `<path id="mixtidep0" fill="#e8e8fb" ..>` para
    #    poner color en atributo `fill` de victimizaciones sin departamento
    #
    # Por cada departamento (por ejemplo Amazonas con divipola 91):
    #  - Un elemento `<path id="mixtidep91" fill="#e8e8fb" ..>` para
    #    poner color en atributo `fill`
    #  - Un elemento `<text id="numdep91" ..>` para poner el número de 
    #    victimizaciones 
    #
    # @param titulo Por centrar
    # @param subtitulo Por centrar
    # @param titulorangos Titulo del cuadro de rangos
    # @param fuente Fuente de datos
    # @param cantidadesdep Cantidad por mostrar en cada departamento
    # @param opciones Entre ellas puede estar: 
    #   :colormax_r, :colormax_v, :colormax_a Componentes rojo, verde y azul de
    #     color más oscuro del mapa. Si no se especifica se usa verde.
    #   :class Para agregar como clase al svg generado
    #
    # Tomo ideas para manipulación svg de 
    # https://thoughtbot.com/blog/organized-workflow-for-svg
    def embeber_mapacalordepcol_svg(titulo, subtitulo, titulorangos, fuente,
                                    cantidadesdep, opciones = {})
      # Color más oscuro (para rango4)
      cr = 0
      cv = 255
      ca = 0
      if opciones[:colormax_r].present? && opciones[:colormax_v].present? && 
          opciones[:colormax_a].present?
        crt = opciones[:colormax_r].to_i 
        cvt = opciones[:colormax_v].to_i 
        cat = opciones[:colormax_a].to_i 
        if cr >= 0 && cr <= 255 && cv >= 0 && cv <= 255 && ca <= 0 && ca <= 255
          cr = crt
          cv = cvt
          ca = cat
        end
      end
      color4 = "rgba(#{cr}, #{cv}, #{ca}, 1)"
      color3 = "rgba(#{cr}, #{cv}, #{ca}, 0.7)"
      color2 = "rgba(#{cr}, #{cv}, #{ca}, 0.4)"
      color1 = "rgba(#{cr}, #{cv}, #{ca}, 0.1)"

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
        tit['x']='50%'
        tit['text-anchor'] = 'middle'
      end
      sub = svg.at_css('#subtitulo')
      if sub && subtitulo
        sub.content = subtitulo
        sub['x']='50%'
        sub['text-anchor'] = 'middle'
      end
      trangos = svg.at_css('#titulo-rangos')
      if trangos && titulorangos
        trangos.content = titulorangos
        #sub['x']='50%'
        #sub['text-anchor'] = 'middle'
      end
      tfuente = svg.at_css('#fuente')
      if tfuente && fuente
        tfuente.content = fuente
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

      # Emplea números con más ceros en rangos
      if l5>10000
        l2 = ((l2/1000)+1)*1000
        l3 = ((l3/1000)+1)*1000
        l4 = ((l4/1000)+1)*1000
        l5 = ((l5/1000)+1)*1000
      elsif l5>1000
        l2 = ((l2/100)+1)*100
        l3 = ((l3/100)+1)*100
        l4 = ((l4/100)+1)*100
        l5 = ((l5/100)+1)*100
      elsif l5>100
        l2 = ((l2/10)+1)*10
        l3 = ((l3/10)+1)*10
        l4 = ((l4/10)+1)*10
        l5 = ((l5/10)+1)*10
      end

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

      # Colores en rangos
      cr1 = svg.at_css('#colorrango1')
      if cr1
        cr1['fill'] = color1
      end
      cr2 = svg.at_css('#colorrango2')
      if cr2
        cr2['fill'] = color2
      end
      cr3 = svg.at_css('#colorrango3')
      if cr3
        cr3['fill'] = color3
      end
      cr4 = svg.at_css('#colorrango4')
      if cr4
        cr4['fill'] = color4
      end

      sindep = 0
      cantidadesdep.each do |iddep, v|
        if Msip::Departamento.where(
            pais_id: Msip.paisomision).
            where(deplocal_cod: iddep).count == 0
          sindep += v.to_i
        end
      end

      Msip::Departamento.where(
        pais_id: Msip.paisomision).each do |dep|
        cant = 0
        if cantidadesdep.keys.include?(dep.deplocal_cod)
          cant = cantidadesdep[dep.deplocal_cod].to_i
        end

        ud = svg.at_css('#numdep' + dep.deplocal_cod.to_s)
        if ud
          if cant > 0
            ud.content="#{cant}"
          else
            ud.content=''
          end
        else
          sindep += cant
        end

        md = svg.at_css('#mixtidep' + dep.deplocal_cod.to_s)
        if md && cant > 0
          if r4.include?(cant)
            md['fill'] = color4
          elsif r3.include?(cant)
            md['fill'] = color3
          elsif r2.include?(cant)
            md['fill'] = color2
          elsif r1.include?(cant)
            md['fill'] = color1
          else
            puts "** OJO Algo falló en calculo de rangos porque #{cant} no está en ninguno"
          end
        end

        #      if nd
        #        nd['fill']='#0f0'
        #        nd.content=dep.nombre + ' ' + dep.deplocal_cod.to_s
        #      end
      end

      ud = svg.at_css('#numdep0')
      if ud
        if sindep > 0
          ud.content="#{sindep}"
        else
          ud.content=''
        end
      end

      md = svg.at_css('#mixtidep0')
      if md && sindep > 0
        if r4.include?(sindep)
          md['fill'] = color4
        elsif r3.include?(sindep)
          md['fill'] = color3
        elsif r2.include?(sindep)
          md['fill'] = color2
        elsif r1.include?(sindep)
          md['fill'] = color1
        else
          puts "** OJO Algo falló en calculo de rangos porque #{sindep} no está en ninguno"
        end
      end

      r= doc.to_s.html_safe
      return r
    end
    module_function :embeber_mapacalordepcol_svg

    # Genera mapa svg de municipios.
    #
    # Se espera que el mapa SVG tenga:
    #
    # - Un elemento `<text id="titulo"...>` para poner como contenido el título
    # - Un elemento `<text id="subtitulo"...>` para poner título
    # - Un elemento `<text id="titulo-rangos"...>` para poner título de rangos
    # - Un elemento `<text id="fuente"...>` para poner fuente
    # - 4 elementos `<text id="rango1"...>` ... `<text id="rango4"...>
    #   para poner rangos de menor a mayor como contenido en c/u
    # - 4 elementos `<rect id="colorrango1" fill="#e8e8fb"...>`  para poner
    #   color de cada rango en atributo fill
    # - Un elemento `<text id="nummun0"...>` para poner número de
    #   victimizaciones sin municipio
    #  - Un elemento `<path id="mixtimun0" fill="#e8e8fb" ..>` para
    #    poner color en atributo `fill` de victimizaciones sin municipio
    #
    # Por cada municipio (por ejemplo Amazonas con divipola 91):
    #  - Un elemento `<path id="mixtimun91" fill="#e8e8fb" ..>` para
    #    poner color en atributo `fill`
    #  - Un elemento `<text id="nummun91" ..>` para poner el número de 
    #    victimizaciones 
    # 
    # @param depid Id de departamento
    # @param depcad Cadena con departamento dividio en municipios en SVG
    # @param titulo Por centrar
    # @param subtitulo Por centrar
    # @param titulorangos Titulo del cuadro de rangos
    # @param fuente Fuente de datos
    # @param cantidadesmun Cantidad por mostrar en cada municipio
    # @param opciones Entre ellas puede estar: 
    #   :colormax_r, :colormax_v, :colormax_a Componentes rojo, verde y azul de
    #     color más oscuro del mapa. Si no se especifica se usa verde.
    #   :class Para agregar como clase al svg generado
    #
    # Tomo ideas para manipulación svg de 
    # https://thoughtbot.com/blog/organized-workflow-for-svg
    def embeber_mapacalormuncol_svg(depid, depcad, titulo, subtitulo, titulorangos, fuente,
                                    cantidadesmun, opciones = {})
      # Color más oscuro (para rango4)
      cr = 0
      cv = 255
      ca = 0
      if opciones[:colormax_r].present? && opciones[:colormax_v].present? && 
          opciones[:colormax_a].present?
        crt = opciones[:colormax_r].to_i 
        cvt = opciones[:colormax_v].to_i 
        cat = opciones[:colormax_a].to_i 
        if cr >= 0 && cr <= 255 && cv >= 0 && cv <= 255 && ca <= 0 && ca <= 255
          cr = crt
          cv = cvt
          ca = cat
        end
      end
      color4 = "rgba(#{cr}, #{cv}, #{ca}, 1)"
      color3 = "rgba(#{cr}, #{cv}, #{ca}, 0.7)"
      color2 = "rgba(#{cr}, #{cv}, #{ca}, 0.4)"
      color1 = "rgba(#{cr}, #{cv}, #{ca}, 0.1)"

      assets = Rails.application.assets

      if assets
        cont = assets.find_asset('svg/plant_mapa_calor.svg').source.force_encoding("UTF-8")
      else
        rutas = Gem::Specification.stubs.map(&:full_gem_path)
        rs = rutas.select {|x| x.include?('sivel2_gen')}.first
        rs += "/app/assets/images/svg/plant_mapa_calor.svg"
        puts "OJO rs=#{rs}"
        cont = File.read(rs).force_encoding("UTF-8")
      end
      doc = Nokogiri::HTML::DocumentFragment.parse cont
      svg = doc.at_css "svg"
      if opciones[:class].present?
        svg["class"] = opciones[:class]
      end

      siluetas = svg.at_css('#siluetas')
      siluetas << depcad

      tit = svg.at_css('#titulo')
      if tit && titulo
        tit.content = titulo
        tit['x']='50%'
        tit['text-anchor'] = 'middle'
      end
      sub = svg.at_css('#subtitulo')
      if sub && subtitulo
        sub.content = subtitulo
        sub['x']='50%'
        sub['text-anchor'] = 'middle'
      end
      trangos = svg.at_css('#titulo-rangos')
      if trangos && titulorangos
        trangos.content = titulorangos
        #sub['x']='50%'
        #sub['text-anchor'] = 'middle'
      end
      tfuente = svg.at_css('#fuente')
      if tfuente && fuente
        tfuente.content = fuente
      end


      min = 0
      max = 0
      if cantidadesmun.count>0
        min = cantidadesmun.values.first
        max = cantidadesmun.values.last
      end
      cantidadesmun.each do |d, c|
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

      # Emplea números con más cerros en rangos
      if l5>10000
        l2 = ((l2/1000)+1)*1000
        l3 = ((l3/1000)+1)*1000
        l4 = ((l4/1000)+1)*1000
        l5 = ((l5/1000)+1)*1000
      elsif l5>1000
        l2 = ((l2/100)+1)*100
        l3 = ((l3/100)+1)*100
        l4 = ((l4/100)+1)*100
        l5 = ((l5/100)+1)*100
      elsif l5>100
        l2 = ((l2/10)+1)*10
        l3 = ((l3/10)+1)*10
        l4 = ((l4/10)+1)*10
        l5 = ((l5/10)+1)*10
      end

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

      # Colores en rangos
      cr1 = svg.at_css('#colorrango1')
      if cr1
        cr1['fill'] = color1
      end
      cr2 = svg.at_css('#colorrango2')
      if cr2
        cr2['fill'] = color2
      end
      cr3 = svg.at_css('#colorrango3')
      if cr3
        cr3['fill'] = color3
      end
      cr4 = svg.at_css('#colorrango4')
      if cr4
        cr4['fill'] = color4
      end

      sinmun = 0
      cantidadesmun.each do |idmun, v|
        if !idmun || Msip::Municipio.where(
            departamento_id: depid).
            where(munlocal_cod: idmun % 1000).count == 0
          sinmun += v.to_i
        end
      end

      Msip::Municipio.where(
        departamento_id: depid).each do |mun|
        cant = 0
        if cantidadesmun.keys.include?(mun.codlocal)
          cant = cantidadesmun[mun.codlocal].to_i
        end

        ud = svg.at_css("#t-mixtimun#{mun.codlocal}")
        if ud
          ud.content = mun.nombre
          if cant > 0
            ud.content += " - #{cant}"
          end
        else
          sinmun += cant
        end

        md = svg.at_css("#r-mixtimun#{mun.codlocal}")
        if md && cant > 0
          if r4.include?(cant)
            md['fill'] = color4
          elsif r3.include?(cant)
            md['fill'] = color3
          elsif r2.include?(cant)
            md['fill'] = color2
          elsif r1.include?(cant)
            md['fill'] = color1
          else
            puts "** OJO Algo falló en calculo de rangos porque #{cant} no está en ninguno"
          end
        end

        #      if nd
        #        nd['fill']='#0f0'
        #        nd.content=mun.nombre + ' ' + mun.codlocal.to_s
        #      end
      end

      ud = svg.at_css('#nummun0')
      if ud
        if sinmun > 0
          ud.content="#{sinmun}"
        else
          ud.content=''
        end
      end

      md = svg.at_css('#mixtimun0')
      if md && sinmun > 0
        if r4.include?(sinmun)
          md['fill'] = color4
        elsif r3.include?(sinmun)
          md['fill'] = color3
        elsif r2.include?(sinmun)
          md['fill'] = color2
        elsif r1.include?(sinmun)
          md['fill'] = color1
        else
          puts "** OJO Algo falló en calculo de rangos porque #{sinmun} no está en ninguno"
        end
      end

      r= doc.to_s.html_safe
      return r
    end
    module_function :embeber_mapacalormuncol_svg


  end
end
