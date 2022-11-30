#@author: Joel Francisco Escobar Socas
module Aparcamiento
  class Plaza
    include Enumerable
    #@param altura  Altura de la plaza
    #@param longitud longitud de la plaza
    #@param anchura anchura de la plaza
    @@PlazaLibre=0
    @@PlazaOcupada=0
    @@PlazasMinusvalidos=0
    @@LibresMinus=0
      attr_reader :altura, :longitud, :anchura, :estado_plaza, :minusvalidos
      #Constructor de la clase CaracteristicasPlazas
    def initialize(array1,estado)
      if (array1.length == 3) then
        @altura = array1[0] 
        @longitud = array1[1] 
        @anchura = array1[2]
      else
        return nil
      end
      @estado_plaza = estado

      if(estado_plaza == 0) then @@PlazaLibre += 1
      elsif(estado_plaza == 1) then @@PlazaOcupada += 1
      else return nil
       end

       if (@altura >= 5) && (@longitud >= 5) && (@anchura >= 3.5) then 
          @minusvalidos = "Plaza Minusvalidos"
         @@PlazasMinusvalidos += 1
         if(estado_plaza == 0) then
          @@LibresMinus += 1
         end
       else 
          @minusvalidos = "Plaza Normal"
       end
    end
    def self.reset()
      @@PlazaLibre=0
      @@PlazaOcupada=0
      @@PlazasMinusvalidos=0
      @@LibresMinus=0

    end

    def self.numeroLibresMinusvalido()
      return @@LibresMinus
    end

    def self.minusvalidadDisponibles()
      return @@PlazasMinusvalidos
    end

    def self.Libres()
      @@PlazaLibre
    end
    def self.Ocupadas()
      @@PlazaOcupada
    end
    def self.plazas_totales()
      return total = @@PlazaLibre + @@PlazaOcupada
    end

    def Aparcar(plaza, vehiculo)
      if(plaza.estado == 0) then
        if((vehiculo.altura < plaza.altura) && (vehiculo.ancho < plaza.ancho) && (vehiculo.largo < plaza.largo)) then
          return 
        else
          return nil
        end
      else
        return nil
      end
    end

    def each
      yield @altura
      yield @anchura
      yield @longitud
      yield @estado_plaza
      yield @minusvalidos
    end

    #Metodo de visualizacion de la clase
    def to_s()
      out = ""
      out += "[ "
      out += "#{@altura}, "
      out += "#{@longitud}, "
      out += "#{@anchura}"
      out += " ]\n"
    end
  end
end