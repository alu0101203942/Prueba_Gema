module Aparcamiento
  #@author: Joel Francisco Escobar Socas
  #@class Clase encargada de representar a un vehiculo de motor hweredando de la herencia de la clase vehiculo
  class Motor < Vehiculo
    include Comparable
    attr_reader :n_ruedas, :n_plazas, :potencia, :velocidad_maxima
    #@Function initializee constructor de mi clase motor que hereda atributos a tarves del super
    #@param n_ruedas numero de ruedas de un vehiculo a motor comprendido entre 1 y 9
    #@param n_plazas numero de plazas (asientos) de un vehiculo a motor
    #@param potencia potencia total en base al numero de cilindros dle motor de un vehiculo a motor
    #@param velocidad_maxima numero que representa al maximo valor que puede añlcanzar el odometro

    def initialize(matricula, altura, ancho, largo, peso, n_ruedas, n_plazas, potencia, n_cilindro, velocidad_maxima)
      super(matricula, altura, ancho, largo, peso)
      @n_ruedas = ComprobarRangoRuedas(n_ruedas)
      @n_plazas = ComprobarRangoPlazas(n_plazas)
      @potencia = CalcularPotencia(potencia, n_cilindro)
      @velocidad_maxima = KilometroMaximo(velocidad_maxima)

    end

    #@function to_s() funcion encargada de realizar la visualizacion de la clase motor
    def to_s()
      out = ""
      out += super.to_s
      out += "El vehiculo es de motor y tiene #{@n_ruedas} ruedas, es de #{@n_plazas} plazas, #{@potencia} centimetros cubicos, #{@velocidad_maxima} km/h maximos."
    end

    #@function ComprobarRangoAsientos funcion encargada de comprobar que los asientos y las ruedas enten en un rango preestablecido
    #@param valor valor que recibe la funcion para comprobar el rango
    def ComprobarRangoPlazas(valor)
      range = (1..9).to_a
      if (range.include?(valor))
        return valor
      else
        return nil
      end
    end
    #@function ComprobarRangoRuedas funcion encargada de comprobar que un vehiculo a mmotor como minimo tenga 2 ruedas
    #@param valor valor que recibe la funcion para comprobar el rango

    def ComprobarRangoRuedas(valor)
      range = (2..9).to_a
      if (range.include?(valor))
        return valor
      else
        return nil
      end
    end

    #@function CalcularPotencia funcion encargada de calcular la potencia en base a los cilindros que tiene el motor y la potencia unitaria
    #@param potencia potencia uitaria que se transformara a potencia total en funcion de los cilindros
    #@param cilindro numero de cilindros de los que dispone el motor

    def CalcularPotencia(potencia, cilindro)
      cilindrada_total = potencia * cilindro 
    end

    #@function KilometroMaximo funcion encargada de comprobar que los kilimetros que se le pasan sean comi minimo 10 y como maximo 300
    #@param max_value valor que se quiere comprobar si esta dentro del maximo establecido

    def KilometroMaximo(max_value)
      range = (10..300).to_a
      if (range.include?(max_value))
        return max_value
      else
        return nil
      end
    end
    
    #function <=> sobrevcarga de la funcion del modulo comparable par comprobar que vehiculo tiene mas plazas
    #@param otro_vehiculoMotor un segundo objeto que representa a un segundo vehiculo

    def <=> (otro_vehiculoMotor)
      return nil unless otro_vehiculoMotor.instance_of? Motor
      @n_plazas <=> otro_vehiculoMotor.n_plazas
    end

  end
end