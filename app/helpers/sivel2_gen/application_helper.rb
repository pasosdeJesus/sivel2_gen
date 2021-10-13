
module Sivel2Gen
  module ApplicationHelper

    include Sip::PaginacionAjaxHelper

    def cadena_escapa(c)
      Sivel2Gen::Caso.connection.quote_string(c)
    end
    module_function :cadena_escapa

    def param_escapa(params, p)
      if (p.is_a? String) || (p.is_a? Symbol) then
        params[p] ? cadena_escapa(params[p]) : ''
      elsif (p.is_a? Array) && p.length == 1 then
        params[p[0]] ? cadena_escapa(params[p[0]]) : ''
      elsif (p.is_a? Array) && p.length > 1 && params[p[0]] then
        n = params[p[0]]
        i = 1
        while i < (p.length - 2) do
          if n[p[i]] then
            n = n[p[i]]
          else
            return ''
          end
          i += 1
        end
        if n[p[i]] then
          return cadena_escapa(n[p[i]])
        else
          return ''
        end
      else
        return ''
      end
    end
    module_function :param_escapa

  end
end
