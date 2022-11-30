# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Aparcamiento::Trenes do
    context "Pruebas de la clase Trenes" do
      before :all do
        Aparcamiento::Plaza.reset()
        Aparcamiento::Vehiculo.resetVehiculo()
        @minusvalida1 = Aparcamiento::Plaza.new([5, 5, 3.5],1)
        @plaza1 = Aparcamiento::Plaza.new([2, 2, 2],0)
        @minusvalida2 = Aparcamiento::Plaza.new([5, 5, 3.5],0)
        @array1 = [@minusvalida1, @minusvalida2]
        @vehiculo1 =  Aparcamiento::Vehiculo.new("3025-AV", 2, 3, 4, 50)
        @vehiculo2 =  Aparcamiento::Vehiculo.new("6782-GFT", 1, 2, 3, 150)
        @arrayvehiculo = [@vehiculo1, @vehiculo2]
        @tren1 = Aparcamiento::Trenes.new(5, 3,5,40, "Parking Mercadona", "Mixto", "coches", 30, 30, 5000, @array1, @arrayvehiculo, 20)

      end

      it "prueba del contador de minisvalidas" do
        expect(@tren1.PlazasMinusvalidas).to eq(2)
      end
      it "prueba del contador de tiempo por minuto" do
        expect(@tren1.precioMin).to eq(3.0)
      end

      it "Prueba del contador de Plazas de minusvalidas libres" do
        expect(Aparcamiento::Plaza.numeroLibresMinusvalido()).to eq(1)
      end
    end
  end
end