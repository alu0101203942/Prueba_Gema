# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
    describe Aparcamiento::Plaza do
        context "Pruebas del módulo Plaza Aparcamiento" do
            before :all do
                Aparcamiento::Plaza.reset()
                @plaza1 = Aparcamiento::Plaza.new([2, 2, 2],0)
                @plaza2 = Aparcamiento::Plaza.new([2, 2, 2],1)

            end
            it "Existe un módulo para representar información del Aparcamiento" do
                expect(Aparcamiento::Plaza).not_to eq(nil)
                expect(@plaza1).not_to eq(nil)
            end

            it "Pruebas de los arreglos" do
                expect(Aparcamiento::Plaza.Libres()).to eq(1)
                expect(Aparcamiento::Plaza.Ocupadas()).to eq(1)
                expect(Aparcamiento::Plaza.plazas_totales()).to eq(2)

            end

            it "Metodo de visualizacion" do 
                expect(@plaza1.to_s()).to eq("[ 2, 2, 2 ]\n")
              end

        end
    end
end
  