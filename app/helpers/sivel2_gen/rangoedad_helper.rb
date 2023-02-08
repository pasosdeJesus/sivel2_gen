module Sivel2Gen
  module RangoedadHelper

    # Retorna edad de una persona en cierta fecha
    # @param anionac año de nacimiento
    # @param mesnac mes de nacimiento
    # @param dianac dia de nacimiento
    # @ return -1 si no puede calcularse por falta de años
    def edad_de_fechanac_fecha(anionac, mesnac, dianac, 
                                  anio, mes, dia)
      if anionac.nil? || anionac == ''
        return -1
      end
      if anio.nil? || anio == ''
        return -1
      end
      if anio < anionac
        return -1
      end
      na = anio-anionac
      if mesnac && mesnac > 0 && mes && mes > 0 && mesnac >= mes
        if mesnac > mes || (dianac && dianac > 0 && dia && dia > 0 && 
            dianac > dia)
          na -= 1
        end
      end

      return na
    end
    module_function :edad_de_fechanac_fecha


    # @parama modelorango es nombre de modelo con rangos e.g 
    #   'Sivel2Gen::Rangoead' o 'Cor1440Gen::Rangoedadac'
    # @return id en tabla del rango o si no se puede calcular
    #   retorna ID del registro SIN INFORMACIÓN (o -1 si no hay
    #   SIN INFORMACIÓN)
    def buscar_rango_edad(edad, modelorango)
      if (!modelorango || !defined?(modelorango.constantize) || 
          !defined?(!modelorango.constantize.habilitados))
        puts "No se pudo usar modelorango"
        return -1
      end
      t = modelorango.constantize.habilitados
      idsin = t.where(nombre: 'SIN INFORMACIÓN')
      if idsin.count == 1
        idsin = idsin.take.id
      else
        idsin = -1
      end
      c = t.where('(limiteinferior IS NULL) OR (limiteinferior  <= ?)', edad).
        where('(limitesuperior IS NULL) OR (? <= limitesuperior)', edad)
      ret = idsin
      if c.count == 0
        puts "No se encontró edad #{edad} en tabla #{modelorango}"
      elsif c.count > 1
        puts "Traslape de #{c.count} rangos en edad #{edad}"
      else # c.count == 1
        ret = c.take.id
      end
      return ret
    end
    module_function :buscar_rango_edad

    # Calcula matriz con poblacion de un caso por sexo y rangos de edad 
    # @param caso_id # Caso
    # @param (anio,mes,dia) Fecha de referencia para calculo de edades
    # @param modelorango Modelo con rangos de edades por usar
    # @param rangoedad Incrementa este hash/matriz que tiene [sexo][rango]
    #   tipicamente funciona llamadora lo inicia con
    #   rangoedad = {'S' => {}, 'M' => {}, 'F' => {}}
    # @param totsexo Incrementa este hash con llaves 'S' 'M' y 'F',
    #   tipicamente función llamador lo inicia con:
    #   totsexo ={}
    # @return true sii puede calcular poblacion por sexo y rangos de edad
    def poblacion_por_sexo_rango(caso_id, anio, mes, dia, modelorango, rangoedad, totsexo)
      caso = Sivel2Gen::Caso.where(id: caso_id)
      if caso.count < 1 
        return false
      end

      caso.take.victima.joins(
        'JOIN sip_persona ON sip_persona.id=sivel2_gen_victima.id_persona').
        each do |v|
        re = Sivel2Gen::RangoedadHelper.buscar_rango_edad(
          Sivel2Gen::RangoedadHelper.edad_de_fechanac_fecha(
            v.persona.anionac, v.persona.mesnac, v.persona.dianac,
            anio, mes, dia), modelorango)
        if !rangoedad[v.persona.sexo]
          rangoedad[v.persona.sexo] = {}
        end
        if !rangoedad[v.persona.sexo][re]
          rangoedad[v.persona.sexo][re] = 0
        end
        rangoedad[v.persona.sexo][re] += 1
        totsexo[v.persona.sexo] = totsexo[v.persona.sexo] ? 
          totsexo[v.persona.sexo] + 1 : 1
      end
      return true
    end 
    module_function :poblacion_por_sexo_rango

    def poblacion_por_rango_sexo(caso_id, anio, mes, dia, modelorango, 
                                 rangoedadsexo, totsexo)
      caso = Sivel2Gen::Caso.where(id: caso_id)
      if caso.count < 1 
        return false
      end

      caso.take.victima.joins(
        'JOIN sip_persona ON sip_persona.id=sivel2_gen_victima.id_persona').
        each do |v|
        re = Sivel2Gen::RangoedadHelper.buscar_rango_edad(
          Sivel2Gen::RangoedadHelper.edad_de_fechanac_fecha(
            v.persona.anionac, v.persona.mesnac, v.persona.dianac,
            anio, mes, dia), modelorango)
        if !rangoedadsexo[re]
          rangoedadsexo[re] = {}
        end
        if !rangoedadsexo[re][v.persona.sexo]
          rangoedadsexo[re][v.persona.sexo] = 0
        end
        rangoedadsexo[re][v.persona.sexo] += 1
        totsexo[v.persona.sexo] = totsexo[v.persona.sexo] ? 
          totsexo[v.persona.sexo] + 1 : 1
      end
      return true
    end
    module_function :poblacion_por_rango_sexo

  end
end
