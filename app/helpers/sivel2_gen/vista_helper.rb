module Sivel2Gen
  module VistaHelper

    include Rails.application.routes.url_helpers

    # Presenta arbol de presuntos responsables
    # Llamar dentro de <ul>..</ul>
    def presenta_arbol_presp_ul_li(nivel, arbol)
      subarbol = ''.html_safe
      if arbol[:hijos].count > 0
        subarbol = "<ul>\n".html_safe + arbol[:hijos].map{|h| 
          "<li>".html_safe + 
            presenta_arbol_presp_ul_li(nivel+1, h).html_safe +
            "</li>".html_safe
        }.join("\n".html_safe).html_safe +
        "</ul>\n".html_safe
      end
      #return link_to(Sip::ModeloHelper.modelo_path(
      #  Sivel2Gen::Presponsable.find(arbol[:id])), arbol[:nombre]).html_safe + 
      return arbol[:nombre].html_safe + 
      "\n".html_safe +
      subarbol.html_safe
    end
    module_function :presenta_arbol_presp_ul_li

  end
end
