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
            presenta_arbol_presp_ul_li(nivel+1, h)+
            "</li>".html_safe
        }.join("\n").html_safe +
        "</ul>\n".html_safe
      end
      r = CGI::escapeHTML(arbol[:nombre]) + "\n" + subarbol
      return r.html_safe
    end
    module_function :presenta_arbol_presp_ul_li

  end
end
