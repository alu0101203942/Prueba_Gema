# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Aparcamiento do
    context "Pruebas del módulo Aparcamiento" do
      before :all do
        @plaza1 = Aparcamiento::Plaza.new([2, 2, 2],0)
        @plaza2 = Aparcamiento::Plaza.new([2, 2, 2],1)
        @minusvalidos = Aparcamiento::Plaza.new([5, 5, 3.5],1)

      end

      it "Existe un módulo para representar información del Aparcamiento" do
        expect(Aparcamiento).not_to eq(nil)
      end

      it "Se cuenta con una constante para representar si el aparcamiento esta completo" do
        expect(Aparcamiento::Plaza.Libres()).to eq(1)
      end

      it "Se cuenta con una constante para representar si el aparcamiento tiene plazas libres" do
        expect(Aparcamiento::Plaza.Ocupadas()).to eq(2)
      end

      it "Se cuenta con una funcion para mostrar el numero total de Aparcamientos" do
        expect(Aparcamiento::Plaza.plazas_totales()).to eq(3)
      end

      it "Se cuenta con una funcion para mostrar el estado de un aparcamiento (completo, plazas libres)" do
        expect(Aparcamiento.EstadoPlazas()).to eq("Hay Plazas Libres")
      end

      it "Se cuenta con una funcion para mostrar el estado de un aparcamiento minusvalidos o no" do
        expect(Aparcamiento.TipoPlazas(@minusvalidos)).to eq("Plaza Minusvalidos")
      end

      it "Prueba de que Aparcamiento es una instancia de Module" do
        expect((Aparcamiento).is_a? Module).to eq(true)
      end

      it "Prueba de que Aparcamiento es una instancia de Object" do
        expect((Aparcamiento).is_a? Object).to eq(true)
      end

      it "Prueba de que Aparcamiento es una instancia de BasicObject" do
        expect((Aparcamiento).is_a? BasicObject).to eq(true)
      end

      it "Prueba de que Aparcamiento no es una instancia de Class" do
        expect((Aparcamiento).is_a? Class).to eq(false)
      end

      it "Prueba de que Aparcamiento no es una instancia de Vehiculo" do
        expect((Aparcamiento).is_a? Aparcamiento::Motor).to eq(false)
      end

      it "Prueba de que Aparcamiento no es una instancia de Motor" do
        expect((Aparcamiento).is_a? Aparcamiento::Vehiculo).to eq(false)
      end

    end
  end
end