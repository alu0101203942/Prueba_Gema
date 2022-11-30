# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
    describe  Aparcamiento::Motor do
        context "Pruebas de la clase Vehiculo de Motor" do
          before :all do
            @vehiculoMotor1 = Aparcamiento::Motor.new("3025-AV", 2, 3, 4, 150, 4, 5, 500, 6, 120)
            @vehiculoMotor2 =  Aparcamiento::Motor.new("6782-GFT", 1, 2, 3,  50, 2, 2, 180, 4, 220)
            @vehiculoMotor3_falla =  Aparcamiento::Motor.new("123-T", 300, 11, 9, 50, 10, 14, 180, 4, 500)

          end

            it "Pruebas de instacia de la clase Vehiculo de Motor" do
            expect(@vehiculoMotor1).not_to eq(nil)
            expect(@vehiculoMotor2).not_to eq(nil)
            expect(@vehiculoMotor3_falla).not_to eq(nil)
          end

          it "Prueba del valor Matricula heredado de la clase Vehiculo en la clase motor" do
            expect(@vehiculoMotor3_falla.matricula).to eq(nil)
          end

          it "Prueba del valor n_plazas de la clase Motor" do
            expect(@vehiculoMotor1.n_plazas).to eq(5)
            expect(@vehiculoMotor2.n_plazas).to eq(2)
            expect(@vehiculoMotor3_falla.n_plazas).to eq(nil)

          end

          it "Prueba del valor n_ruedas de la clase Motor" do
            expect(@vehiculoMotor1.n_ruedas).to eq(4)
            expect(@vehiculoMotor2.n_ruedas).to eq(2)
            expect(@vehiculoMotor3_falla.n_ruedas).to eq(nil)

          end

          it "Prueba del valor kilometro maximo de la clase Motor" do
            expect(@vehiculoMotor1.velocidad_maxima).to eq(120)
            expect(@vehiculoMotor2.velocidad_maxima).to eq(220)
            expect(@vehiculoMotor3_falla.velocidad_maxima).to eq(nil)
          end

          it "Prueba del valor potencia de la clase Motor" do
            expect(@vehiculoMotor1.potencia).to eq(3000)
            expect(@vehiculoMotor2.potencia).to eq(720)
            expect(@vehiculoMotor3_falla.potencia).to eq(720)
          end



          it "Prueba de que Vehiculo es un Vehiculo motor" do
            expect((@vehiculoMotor1).is_a? Aparcamiento::Motor).to eq(true)
            expect((@vehiculoMotor2).is_a? Aparcamiento::Motor).to eq(true) 

          end

          it "Prueba de que Vehiculo es un vehiculo" do
            expect((@vehiculoMotor1).is_a? Aparcamiento::Vehiculo).to eq(true)
            expect((@vehiculoMotor2).is_a? Aparcamiento::Motor).to eq(true) 

          end
  
          it "Prueba de que Vehiculo es un Object" do
            expect((@vehiculoMotor1).is_a?Object).to eq(true)
            expect((@vehiculoMotor2).is_a?Object).to eq(true) 

          end
  
          it "Prueba de que Vehiculo es un BasicObject" do
            expect((@vehiculoMotor1).is_a?BasicObject).to eq(true)
            expect((@vehiculoMotor2).is_a?BasicObject).to eq(true) 

          end
  
          it "Prueba de que Vehiculo no es un String" do
            expect((@vehiculoMotor1).is_a?String).to eq(false)
            expect((@vehiculoMotor2).is_a?String).to eq(false)
          end
  
          it "Prueba de que Vehiculo no es un Numeric" do
            expect((@vehiculoMotor1).is_a?Numeric).to eq(false)
            expect((@vehiculoMotor2).is_a?Numeric).to eq(false)

          end
  
          it "Prueba de que Vehiculo no es un Hash" do
            expect((@vehiculoMotor1).is_a?Hash).to eq(false)
            expect((@vehiculoMotor2).is_a?Hash).to eq(false)

          end

          it "pruebas de Visualizacion de un vehiculo motor" do
            expect(@vehiculoMotor1.to_s()).to eq("El vehiculo con matricula: 3025-AV tiene 2 metros de alto, 3 metros de ancho, 4 metros de largo y pesa 0.15 toneladas\nEl vehiculo es de motor y tiene 4 ruedas, es de 5 plazas, 3000 centimetros cubicos, 120 km/h maximos.")
            expect(@vehiculoMotor2.to_s()).to eq("El vehiculo con matricula: 6782-GFT tiene 1 metros de alto, 2 metros de ancho, 3 metros de largo y pesa 0.05 toneladas\nEl vehiculo es de motor y tiene 2 ruedas, es de 2 plazas, 720 centimetros cubicos, 220 km/h maximos.")
          end

          it "Prueba del metodo <=> de la clase motor" do
            expect(@vehiculoMotor1 > @vehiculoMotor2).to eq(true)
            expect(@vehiculoMotor1 < @vehiculoMotor2).to eq(false)
            expect(@vehiculoMotor1 == @vehiculoMotor2).to eq(false)
            expect(@vehiculoMotor1 >= @vehiculoMotor2).to eq(true)
            expect(@vehiculoMotor1 <= @vehiculoMotor2).to eq(false)


          end
          
        end
    end
end