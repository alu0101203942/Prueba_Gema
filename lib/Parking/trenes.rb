module Aparcamiento
  class Trenes < Datos
    attr_reader :largaEstancia
    def initialize(largaEstancia,accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado, distancia_centro, array, array2, precioMin)
      @largaEstancia = largaEstancia
      super(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado, distancia_centro, array, array2, precioMin)
    end
  end
end