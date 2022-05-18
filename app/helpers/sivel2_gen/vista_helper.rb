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

  end
end
