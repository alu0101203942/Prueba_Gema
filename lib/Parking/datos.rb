#@author: Joel Francisco Escobar Socas
module Aparcamiento
  class Datos
    include Enumerable
    #@param accesibilidad rango de como de accesible es el aparcamiento
    #@param seguridad rango de como de seguro es el aparcamiento
    #@param identificador identificador del aparcamiento
    #@param nombre_comercial nombre comercial del aparcamiento
    #@param descripcion tipo de descripcion del aparcamiento (cubierto, aire libre, mixto)
    #@param tipo tipo de vehiculos del aparcamiento (autobus, coche, moto, bicibleta)
    #@param plazas dimensiones de la plaza del aparcamiento
    #@param estado estado del aparcamiento en funcion de si hay plazas lirbes o ocupadas

    attr_reader :accesibilidad, :seguridad, :identificador, :nombre_comercial, :descripcion, :tipo, :estado, :distancia_centro, :PlazasMinusvalidas, :arrayVehiculos, :precioMin  
    #Constructor de la plaza
    def initialize(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado, distancia_centro, array, arrayVehiculos, minutos)
      @accesibilidad = Accesibilidad(accesibilidad)
      @seguridad = Seguridad(seguridad)
      @identificador = identificador
      @nombre_comercial = nombre
      @descripcion = TipoDescripcion(descripcion)
      @tipo = TipoAparcamiento(tipo)
      #@plazas = PlazasAparcamiento::CaracterisiticasPlazas.new(array)
      array.each do |plaza|
        return nil unless plaza.is_a?(Aparcamiento::Plaza)
      end
      @plazas = array
      @estado = Aparcamiento.EstadoPlazas()
      ################################################################
      ### Practica 9: Polimorfismo
      @distancia_centro = DistanciaEnKm(distancia_centro)
      @PlazasMinusvalidas = Aparcamiento::Plaza.minusvalidadDisponibles()
      @arrayVehiculos = arrayVehiculos
      @precioMin = PrecioPorMinutos(minutos)

    end

    def each 
      yield @plazas.each{|plaza| yield plaza}
    end

    #Funcion que comprueba si coincide el tipo de descripcion con una dada
    def TipoDescripcion(desc)
      if (desc == "Cubierto" || desc == "Aire Libre" || desc == "Mixto") then
        return desc
      else  
        return nil
      end
    end

    #Funcion que comprueba si coincide el tipo de vehiculo con un tipo dado
    def TipoAparcamiento(tipo)
      if (tipo == "autobuses" || tipo == "bicicletas" || tipo == "coches" || tipo == "motos" ) then
        return tipo
      else  
        return nil
      end
    end

    #Funcion que comprueba si el valor que se le pasa esta entre unr ango del 1..5
    def Accesibilidad(accesibilidad) 
      range = (1..5).to_a
      if (range.include?(accesibilidad))
        return accesibilidad
      else
        return nil
      end
    end

    def PrecioPorMinutos(minutos)
      precio = minutos * 0.15
    end

    def DistanciaEnKm(metros)
      distancia = metros / 1000.0
    end

    #Funcion que comprueba si el valor que se le pasa esta entre unr ango del 1..10
    def Seguridad(seg) 
      range = (1..10).to_a
      if (range.include?(seg))
        return seg
      else
        return nil
      end
    end
  end
end