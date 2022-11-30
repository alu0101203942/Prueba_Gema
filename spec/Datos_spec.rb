# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Aparcamiento::Datos do
    context "Pruebas de la clase Datos" do

      before :all do
        Aparcamiento::Plaza.reset()
        @plaza1 = Aparcamiento::Plaza.new([2, 2, 2],0)
        @plaza2 = Aparcamiento::Plaza.new([5, 5, 5],1)
        @plaza3 = Aparcamiento::Plaza.new([5, 5, 5],1)

        @array = [@plaza1,@plaza2]
        @array_mercadona = [@plaza1, @plaza2, @plaza3]
        @vehiculo1 =  Aparcamiento::Vehiculo.new("3025-AV", 2, 3, 4, 50)
        @vehiculo2 =  Aparcamiento::Vehiculo.new("6782-GFT", 1, 2, 3, 150)
        @arrayvehiculo = [@vehiculo1, @vehiculo2]
        @parking_mercadona = Aparcamiento::Datos.new(3,5,40, "Parking Mercadona", "Mixto", "coches", 30, 30, 5000, @array_mercadona, @arrayvehiculo, 20)
        @parking_Lidl = Aparcamiento::Datos.new(1, 10, 7594, "Parking Lidl", "Aire Libre", "motos", 0, 10,5000, @array, @arrayvehiculo, 20)
        @parking_Carrefour = Aparcamiento::Datos.new(5, 20, 899302, "Parking Carrefour", "Techo", "bicicletas", 30, 0, 5000, @array,  @arrayvehiculo, 15)


      end
      it "Pruebas de instancia de la clase Datos" do 
        expect(@parking_mercadona).not_to eq(nil)
        expect(@parking_Lidl).not_to eq(nil)
      end
      it "Pruebas de obtencion de atributos de un aparcamiento (Parking Mercadona)" do 
        expect(@parking_mercadona.accesibilidad).to eq(3)
        expect(@parking_mercadona.seguridad).to eq(5)
        expect(@parking_mercadona.identificador).to eq(40)
        
        expect(@parking_mercadona.nombre_comercial).to eq("Parking Mercadona")
        expect(@parking_mercadona.descripcion).to eq("Mixto")
        expect(@parking_mercadona.tipo).to eq("coches")
        expect(@parking_mercadona.estado).to eq("Hay Plazas Libres")
      end

      it "Pruebas de obtencion de atributos de un aparcamiento (Parking lidl)" do 
        expect(@parking_Lidl.accesibilidad).to eq(1)
        expect(@parking_Lidl.seguridad).to eq(10)
        expect(@parking_Lidl.identificador).to eq(7594)
        expect(@parking_Lidl.nombre_comercial).to eq("Parking Lidl")
        expect(@parking_Lidl.descripcion).to eq("Aire Libre")
        expect(@parking_Lidl.tipo).to eq("motos")
        expect(@parking_Lidl.estado).to eq("Hay Plazas Libres")
      end

      it "Pruebas de obtencion de atributos de un aparcamiento (parking Carrefour)" do 
        expect(@parking_Carrefour.accesibilidad).to eq(5)
        expect(@parking_Carrefour.seguridad).to eq(nil)
        expect(@parking_Carrefour.identificador).to eq(899302)
        expect(@parking_Carrefour.nombre_comercial).to eq("Parking Carrefour")
        expect(@parking_Carrefour.descripcion).to eq(nil)
        expect(@parking_Carrefour.tipo).to eq("bicicletas")
        expect(@parking_Carrefour.estado).to eq("Hay Plazas Libres")
      end

      it "Prueba de que Datos es una instancia de Datos" do
        expect((@parking_mercadona).is_a? Aparcamiento::Datos).to eq(true)
      end

      it "Prueba de que Datos es una instancia de Object" do
        expect((@parking_mercadona).is_a? Object).to eq(true)
      end

      it "Prueba de que Datos es una instancia de BasicObject" do
        expect((@parking_mercadona).is_a? BasicObject).to eq(true)
      end

      it "Prueba de que Datos no es una instancia de Vehiculo" do
        expect((@parking_mercadona).is_a? Aparcamiento::Vehiculo).to eq(false)
      end

      it "Prueba de que Datos no es una instancia de Motor" do
        expect((@parking_mercadona).is_a? Aparcamiento::Motor).to eq(false)
      end
    
      it "Prueba de funciones practica anterior" do
        expect(Aparcamiento.numero_minusvalidas_libres(@parking_mercadona)).to eq(2)
      end
    end
  end
end