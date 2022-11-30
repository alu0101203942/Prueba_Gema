#@author: Joel Francisco Escobar Socas
module Aparcamiento
  #@param totalPlazas Plazas totales que tiene el aparcaiento que sera la suma de libres y ocupadas
  #@param LibresValue Numero de plazas libres
  #@param OcupadasValue Numero de plazas ocupadas
  #@param ESTA_COMPLETO string que devuelve si esta coupado
  #@param ESTA_LIBRE string que devuelve si no esta ocupado

  ESTA_COMPLETO=("Esta Lleno")
  ESTA_LIBRE=("Hay Plazas Libres")
  MINUSVALIDOS=("Plaza Minusvalidos")
  NO_MINUSVALIDOS=("Plaza Normal")

  #Funcion encargada de devolver en base a la informaciond e las plazas un estado
  def self.EstadoPlazas()
    if(Aparcamiento::Plaza.Libres() == 0) then
      return ESTA_COMPLETO

    elsif (Aparcamiento::Plaza.Libres() != 0) then
      return ESTA_LIBRE
    else
      return nil
    end
  end

  def self.reserva_minusvalido(aparcamiento)
    return nil unless aparcamiento.is_a?(Aparcamiento::Datos)
    numeroPlazasMinus = aparcamiento.count{|plazas| plazas.minusvalidos = 1}
    numeroPlazasMinus >= aparcamiento.count / 40
  end

  def self.numero_minusvalidas_libres(aparcamiento)
    return nil unless aparcamiento.is_a?(Aparcamiento::Datos)
    aparcamiento.count{|plazas| plazas.estado_plaza == "Hay Plazas Libres" and plazas.minusvalidos == "Plaza Minusvalidos"}
  end 


  def self.plazas_libres_parking(aparcamiento)
    return nil unless aparcamiento.is_a?(Aparcamiento::Datos)
    aparcamiento.count{|plazas| plazas.estado == "Esta Lleno"}
  end


  def self.TipoPlazas(valor)
    if(valor.minusvalidos == "Plaza Normal") then
      return NO_MINUSVALIDOS
    elsif(valor.minusvalidos == "Plaza Minusvalidos") then
      return MINUSVALIDOS
    else
      return nil
    end
  end
  
end