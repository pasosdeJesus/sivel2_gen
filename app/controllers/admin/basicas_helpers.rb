# encoding: UTF-8
module Admin
  module BasicasHelpers
    include ActionView::Helpers::TextHelper

    # Retorna nombre de talba de un objeto tipo Basica
    def nombreobj(o)
      r = ""
      if defined? o.name
        r = o.name.downcase
      else
        r = o.class.name.downcase
      end
      if r == "activerecord::relation"
        r = o.name.downcase
      end
      return r
    end

    # Ruta para administrar tabla basica o
    def admin_basicas_path(o)
      n = "admin_" + self.nombreobj(o).pluralize + "_path"
      send(n.to_sym)
    end

    # Url para administrar tabla basica o
    def admin_basicas_url(o)
      n = "admin_" + self.nombreobj(o).pluralize + "_url"
      send(n.to_sym)
    end

    # Ruta para examinar un registro de tabla basica o
    def admin_basica_path(o)
      n = "admin_" + self.nombreobj(o) + "_path"
      send(n.to_sym, o)
    end

    # URL para examinar un registro de tabla basica o
    def admin_basica_url(o, format)
      n = "admin_" + self.nombreobj(o) + "_url"
      send(n.to_sym, o, format)
    end

    # Ruta para crear un registro de la tabla básica o
    def new_admin_basica_path(o)
      n = "new_admin_" + self.nombreobj(o) + "_path"
      send(n.to_sym)
    end

    # Ruta para editar un registro de la tabla básica o
    def edit_admin_basica_path(o)
      n = "edit_admin_" + self.nombreobj(o) + "_path"
      send(n.to_sym, o)
    end
  end
end
