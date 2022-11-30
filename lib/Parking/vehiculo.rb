module Aparcamiento
  #@author: Joel Francisco Escobar Socas
  #Clase que representa a un vehiculos
  class Vehiculo
    include Enumerable
    attr_reader :matricula, :altura, :ancho, :largo, :peso, :volumen
    include Comparable 
    #@param contador contador que se encargara de ir contando el numero de instancias del objeto
    @@contador = 0
    #@function initialize constructor de la clase que se encarga de representar un vehiculo dentro de mi programa
    #@param matricula matriucla de identificacion del vehiculo funciona como id
    #@param altura altura dle vehiculo
    #@param ancho ancho de un vehiculo
    #@param largo longitud del vehiculo en base a la especificacion
    #@param peso peso del vehiculo en toneladas
    #@param volumen volumen que se calcula en base a la altura anchura y longitud
    def initialize(matricula, altura, ancho, largo, peso)
      @matricula = expresion(matricula)
      @altura = ComprobarAltura(altura)
      @ancho = ComprobarAncho(ancho)
      @largo = ComprobarLongitud(largo)
      @peso = pesoCalc(peso)
      @volumen = CalcVolumen()
      @@contador += 1
    end

    def each
      yield @altura
      yield @ancho
      yield @largo
      yield @peso
    end
    #Funcion que se encarga de comprobar que una matricula sea de tipo XXXX-YY o XXXX-YY
    #@param frase frase que se encarga de buscar ñla expresion regular es coincidente o no

    def expresion(frase)
      expresion_regular = /^[0-9][0-9][0-9][0-9]-[A-Z][A-Z][A-Z]|^[0-9][0-9][0-9][0-9]-[A-Z][A-Z]/
      macheo = expresion_regular.match(frase)

      if (macheo) then
        return macheo
      else
        return nil
      end

    end

    #Funcion que se encarga de calcular el peso en toneladas cuando se le pasa en km
    #@param peso peso en kg que recibe para transformarlo a tonelada
    def pesoCalc(peso)
      toneladas = peso / 1000.0
    end
    
    def self.resetVehiculo()
      @@contador = 0
    end

    #Funcion propia de la clase que se encarga de obtener el contador que dice cuantas veces se ha instanciado
    def self.contador()
      @@contador
    end


    #Funcion que se encarga de comprobar que la altura este parametrizada segun las normas de trafico
    #@param valor valor que comprueba si esta en las especificaciones de un rango

    def ComprobarAltura(valor)
      range = (1..5).to_a
      if (range.include?(valor))
        return valor
      else
        return nil
      end
    end

    #Funcion que se encarga de comprobar que la longitud este parametrizada segun las normas de trafico
    #@param valor valor que comprueba si esta en las especificaciones de un rango

    def ComprobarLongitud(valor)
      range = (1..20).to_a
      if (range.include?(valor))
        return valor
      else
        return nil
      end
    end

    #Funcion que se encarga de comprobar que el ancho de un vehiculo este parametrizada segun las normas de trafico
    #@param valor valor que comprueba si esta en las especificaciones de un rango
    def ComprobarAncho(valor)
      range = (1..3).to_a
      if (range.include?(valor))
        return valor
      else
        return nil
      end
    end

    #Funcion que se encarga de comprobar que no sean atributos nil y calcula el volumen si son aceptados
    def CalcVolumen()
      if((@altura == nil) || (@largo == nil) || (@ancho == nil)) then 
        return nil
      else
        return volumen = @altura * @largo * @ancho
      end

    end

    #Funcion que se encarga de visualizar los parametros de un vehiculo
    def to_s()
      out = ""
      out += "El vehiculo con matricula: #{@matricula} tiene #{@altura} metros de alto, #{@ancho} metros de ancho, #{@largo} metros de largo y pesa #{@peso} toneladas\n" 
    end

    #Funcion que se sobrecarga para implementar el modulo comparable en la clase vehiculo cuyo objetivo es comparar el volumen de dios coches y decir cual es mas grande
    #@param otro_vehiculo atributo que recibe otro vehiculo y comprueba si no es nil el volumen
    def <=> (otro_vehiculo)
      return nil unless otro_vehiculo.instance_of? Vehiculo
      @volumen <=> otro_vehiculo.volumen
    end

  end
end