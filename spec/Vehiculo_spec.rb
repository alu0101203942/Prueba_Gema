# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
  describe  Aparcamiento::Vehiculo do
    before :all do
      Aparcamiento::Vehiculo.resetVehiculo()
      @vehiculo1 =  Aparcamiento::Vehiculo.new("3025-AV", 2, 3, 4, 50)
      @vehiculo2 =  Aparcamiento::Vehiculo.new("6782-GFT", 1, 2, 3, 150)
      @vehiculo_falla =  Aparcamiento::Vehiculo.new("1234-T", 8, 9, 11, 3000)
    end

    it "Pruebas de instacia de la clase Vehiculo" do
      expect(@vehiculo1).not_to eq(nil)
      expect(@vehiculo2).not_to eq(nil)
      expect(@vehiculo3).to eq(nil) 
    end


    it "Pruebas de Getters de Altura de la clase Vehiculos" do
      expect(@vehiculo1.altura).to eq(2)
      expect(@vehiculo2.altura).to eq(1)
      expect(@vehiculo_falla.altura).to eq(nil)
    end

    it "Pruebas de Getters de Ancho de la clase Vehiculos" do
      expect(@vehiculo1.ancho).to eq(3)
      expect(@vehiculo2.ancho).to eq(2)
      expect(@vehiculo_falla.ancho).to eq(nil)

    end

    it "Pruebas de Getters de Largo de la clase Vehiculos" do
      expect(@vehiculo1.largo).to eq(4)
      expect(@vehiculo2.largo).to eq(3)
      expect(@vehiculo_falla.largo).to eq(11)

    end

    it "Pruebas de Getters de peso de la clase Vehiculos" do
      expect(@vehiculo1.peso).to eq(0.05)
      expect(@vehiculo2.peso).to eq(0.15)
      expect(@vehiculo_falla.peso).to eq(3.0)

    end
    
    it "Pruebas de Getter de volumen de la clase Vehiculos" do
      expect(@vehiculo1.volumen).to eq(24)
      expect(@vehiculo2.volumen).to eq(6)
    end

    it "Pruebas del contador de vehiculos" do
      expect( Aparcamiento::Vehiculo.contador()).to eq(3)
    end

    it "pruebas de Visualizacion de un vehiculo" do
      expect(@vehiculo1.to_s()).to eq("El vehiculo con matricula: 3025-AV tiene 2 metros de alto, 3 metros de ancho, 4 metros de largo y pesa 0.05 toneladas\n")
      expect(@vehiculo2.to_s()).to eq("El vehiculo con matricula: 6782-GFT tiene 1 metros de alto, 2 metros de ancho, 3 metros de largo y pesa 0.15 toneladas\n")
    end
    it "Prueba de que Vehiculo es un vehiculo" do
      expect((@vehiculo1).is_a? Aparcamiento::Vehiculo).to eq(true)
      expect((@vehiculo2).is_a? Aparcamiento::Vehiculo).to eq(true) 

    end

    it "Prueba de que Vehiculo es un Object" do
      expect((@vehiculo1).is_a?Object).to eq(true)
      expect((@vehiculo2).is_a?Object).to eq(true) 

    end

    it "Prueba de que Vehiculo es un BasicObject" do
      expect((@vehiculo1).is_a?BasicObject).to eq(true)
      expect((@vehiculo2).is_a?BasicObject).to eq(true)
    end

    it "Prueba de que Vehiculo no es un string" do
      expect((@vehiculo1).is_a?String).to eq(false)
      expect((@vehiculo2).is_a?String).to eq(false)

    end

    it "Prueba de que Vehiculo no es un Numeric" do
      expect((@vehiculo1).is_a?Numeric).to eq(false)
      expect((@vehiculo2).is_a?Numeric).to eq(false)

    end

    it "Prueba de que Vehiculo no es un Hash" do
      expect((@vehiculo1).is_a?Hash).to eq(false)
      expect((@vehiculo2).is_a?Hash).to eq(false) 
    end

    it "Prueba del modulo comparable" do
      expect(@vehiculo1 > @vehiculo2).to eq(true)
      expect(@vehiculo1 < @vehiculo2).to eq(false)
      expect(@vehiculo1 == @vehiculo2).to eq(false)
      expect(@vehiculo1 >= @vehiculo2).to eq(true)
      expect(@vehiculo1 <= @vehiculo2).to eq(false)
    end
  end
end