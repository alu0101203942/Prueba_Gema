module Aparcamiento
  class Aeropuerto < Datos
    include Enumerable
    attr_reader :numeroPlantas
    def initialize(numeroPlantas,accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado, array)
      @numeroPlantas = numeroPlantas
      super(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado, array)
    end
  end
end