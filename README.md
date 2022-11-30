# Práctica 8: POO - Herencia
## Autor:: Joel Francisco Escobar Socas

## Introduccion

Partiendo de la [práctica anterior](#id1) se solicita implementar dos nuevas clases. La primera de ellas, es la encargada de representar a un objeto del tipo `Vehiculo`, es decir, representa las caracteristicas de un vehiculo. La segunda clase se encargará de representar un objeto del tipo `Vehiculo de Motor`, que basicamente al ser un tipo de Vehiculo se trabajará el concepto de **Herencia** para hacer que un vehiculo de motor sea una extensión de la clase vehiculo. Heredando metodos y atributos de un vehiculo pero implementando datos concretos como puede ser la potencia del motor entre otros. Se harán uso de las mismas herramientas que la práctica anterior, como diferencia cabe resaltar que se utilizará:
* **El modulo Comparable**: para realizar comprobaciones sobre atributos de una misma clase implementando una sobrecarga sobre `<=>` el cual implementa este modulo.

## Desarrollo

En esta práctica añadiremos dos clases con un poco más de cosas que permitan realizar la representacion especificada en el apartado anterior.

### Clase: Vehiculo

Antes de comenzar a implementar la clase vehiculos realizamos TDD sobre las pruebas de la clase `Vehiculo` esto será tras crear el fichero **Vehiculo_spec.rb** dentro de la carpeta spec realizar como en la practica anterior el describe pertienente y hacemos una instancia de objetos previos a analizar el comportamiento esperado con la palabra reservada `it`, como aun no hay nada definido se queda vacia. Por lo que tras inicializar el contexto en el que se desarrollaran las pruebas decido crear diferentes expectativas sobre el constructor y los metodos getters. Una vez se implementan estos controlando los criterios que han de cumplir los valores en diferentes funciones, realizo el calculo previamente a lo que espero que es que si llamo a la funcion propia de la clase de forma `Vehiculo.contador()` este devolverá el valor de las veces que se han instanciado objetos de este tipo. para el modulo comprable se realizan diversas pruebas sobre el volumen que se calcula multiplicando las dimensiones del vehiculo de esta forma podemos saber si entre dos coches cual tiene un volumen mayor, menor o igual. Para finalizar con los test comprobamos las herencias que tiene nuesra clase, esto lo hacemos a través de `(objeto).is_a? Tipo` con lo que si el objeto cumple el tipo devolverá true y sino false.


```Ruby
# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
  describe Vehiculo do
    before :all do
      @vehiculo1 = Vehiculo.new("3025-AV", 2, 3, 4, 50)
      @vehiculo2 = Vehiculo.new("6782-GFT", 1, 2, 3, 150)
      @vehiculo_falla = Vehiculo.new("1234-T", 8, 9, 11, 3000)
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
      expect(@vehiculo_falla.ancho).to eq(9)

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
      #expect(Vehiculo.contador()).to eq(4)
    end

    it "pruebas de Visualizacion de un vehiculo" do
      expect(@vehiculo1.to_s()).to eq("El vehiculo con matricula: 3025-AV tiene 2 metros de alto, 3 metros de ancho, 4 metros de largo y pesa 0.05 toneladas\n")
      expect(@vehiculo2.to_s()).to eq("El vehiculo con matricula: 6782-GFT tiene 1 metros de alto, 2 metros de ancho, 3 metros de largo y pesa 0.15 toneladas\n")
    end
    it "Prueba de que Vehiculo es un vehiculo" do
      expect((@vehiculo1).is_a?Vehiculo).to eq(true)
      expect((@vehiculo2).is_a?Vehiculo).to eq(true) 

    end

    it "Prueba de que Vehiculo es un Object" do
      expect((@vehiculo1).is_a?Object).to eq(true)
      expect((@vehiculo2).is_a?Object).to eq(true) 

    end

    it "Prueba de que Vehiculo es un BasicObject" do
      expect((@vehiculo1).is_a?BasicObject).to eq(true)
      expect((@vehiculo2).is_a?BasicObject).to eq(true)
    end

    it "Prueba de que Vehiculo es un string" do
      expect((@vehiculo1).is_a?String).to eq(false)
      expect((@vehiculo2).is_a?String).to eq(false)

    end

    it "Prueba de que Vehiculo es un Numeric" do
      expect((@vehiculo1).is_a?Numeric).to eq(false)
      expect((@vehiculo2).is_a?Numeric).to eq(false)

    end

    it "Prueba de que Vehiculo es un Hash" do
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
```

Para la clase `Vehiculos` implementamos una clase simple, la cual inicializamos con los atributos que se piden, estos serán:
* matricula: como identificador del vehiculo, la cual se implementa en un modulo que lo que hace es analizar a través de una expresion regular en Ruby que corresponda con un identificador del tipo `XXXX.YYY`. Siendo las **X** cuatros digitos y las  **Y** Letras mayúsculas del alfabeto como las matriculas actualmente que circulan en el mercado.
* Altura: altura del vehiculo que por defecto se pasará en metros.
* Ancho: ancho del vehiculo que por defecto se pasará en metros.
* Largo: longitud del vehiculo que por defecto se pasará en metros.
* peso: el cual se pasará en kilogramos y automaticamente se calculara en **Toneladas**.

Además de en el constructor inicializar estos metodos y hacer una serie de metodos que comprueban que los valores cumplen las caracteristicas especificadas. Se solicita en el guión una variable que cuente el numero de veces que se instancia un objeto del tipo  `Vehiculo`. Para ello, he decicido crear una variable de clase denominada **contador** que cuando se cree un objeto del tipo Vehiculo esta se actualice su valor sumando un 1. Posteriormente se define la funcion propia llamada contado la cual devuelve el contador para poder comprobar correctamente su valor.

Para finalizar con la funcionalidad de la clase Vehiculos he de comprobar que un vehiculo sea comparable por su volumen. Por lo que debemos utilizar el `Modulo Comparable de Ruby` este modulo se incluye con la palabra reservada *include* y se implementa sobrecargando el operador `<=>`. Por lo que previamente calculamos el volumen como la multiplicacion de los atributos anchura, largo y ancho del vehiculo. Al final al utilizar este metodo lo que primero se hace es devolver nil si no es una instancia de la propia clase en caso de serlo, lo que se hace es comprobar con el volumen de otro vehiculo que se le pasa cual es mayor menor o igual.  De esta forma la clase `Vehiculo` queda funciional y implementada tal y como se solicita.


```Ruby


#Clase que representa a un vehiculos
class Vehiculo
  attr_reader :matricula, :altura, :ancho, :largo, :peso, :volumen
  include Comparable 
  @@contador = 0
  def initialize(matricula, altura, ancho, largo, peso)
    @matricula = expresion(matricula)
    @altura = ComprobarAltura(altura)
    @ancho = ancho
    @largo = largo
    @peso = pesoCalc(peso)
    @volumen = CalcVolumen()
    @@contador += 1
  end

  def expresion(frase)
    expresion_regular = /^[0-9][0-9][0-9][0-9]-[A-Z][A-Z][A-Z]|^[0-9][0-9][0-9][0-9]-[A-Z][A-Z]/
    macheo = expresion_regular.match(frase)

    if (macheo) then
      return macheo
    else
      return nil
    end

  end

  def pesoCalc(peso)
    toneladas = peso / 1000.0
  end

  def self.contador()
    @@contador
  end

  def ComprobarAltura(valor)
    range = (1..5).to_a
    if (range.include?(valor))
      return valor
    else
      return nil
    end
  end


  def ComprobarLongitud(valor)
    range = (1..20).to_a
    if (range.include?(valor))
      return valor
    else
      return nil
    end
  end

  def ComprobarAncho(valor)
    range = (1..3).to_a
    if (range.include?(valor))
      return valor
    else
      return nil
    end
  end

  def CalcVolumen()
    if((@altura == nil) || (@largo == nil) || (@ancho == nil)) then 
      return nil
    else
      return volumen = @altura * @largo * @ancho
    end

  end

  def to_s()
    out = ""
    out += "El vehiculo con matricula: #{@matricula} tiene #{@altura} metros de alto, #{@ancho} metros de ancho, #{@largo} metros de largo y pesa #{@peso} toneladas\n" 
  end
  def <=> (otro_vehiculo)
    return nil unless otro_vehiculo.instance_of? Vehiculo
    @volumen <=> otro_vehiculo.volumen
  end

end
```
### Clase: Vehiculo Motor

Por cuestiones de simplificacion de forma a la lectura de la información he decidido llamar a la clase `VehiculosMotor` como `Motor` por cuestiones de sencillez a la hora de manejar la información. Esta clase es la encargada de representar un vehiculo con motor dentro de nuestra Gema Parking. Previo a la implementacion de la clase implementamos la instancia de los vehiculos de motor creando 2 instancias que funcionan y una que deberia de fallar, y comprobamos que este sea el comportamiento posteriormente hallamos la herencia de los objetos asegurandonos que sea como esperamos es decir, que hereden de vehiculos, object y basicObject y de ninguna clase mas implementada en Ruby como podria ser Numeric, String o clases implementadas por nosotros en practicas anteriores como puede ser Datos.

Una vez nos aseguramos de eso, hacemos que los atributos sean  accesibles y comprobamos sus valores esperados, y para finalizar comprobamos que se visualiza correcta y que se pueda comparar su numero de plazas por todos los metodos comparables proporcionado por el modulo `Comparable`.

```Ruby
# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
    describe Motor do
        context "Pruebas de la clase Vehiculo de Motor" do
          before :all do
            @vehiculoMotor1 = Motor.new("3025-AV", 2, 3, 4, 150, 4, 5, 500, 6, 120)
            @vehiculoMotor2 = Motor.new("6782-GFT", 1, 2, 3,  50, 2, 2, 180, 4, 220)
            @vehiculoMotor3_falla = Motor.new("123-T", 300, 11, 9, 50, 10, 14, 180, 4, 500)

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
            expect((@vehiculoMotor1).is_a?Motor).to eq(true)
            expect((@vehiculoMotor2).is_a?Motor).to eq(true) 

          end

          it "Prueba de que Vehiculo es un vehiculo" do
            expect((@vehiculoMotor1).is_a?Vehiculo).to eq(true)
            expect((@vehiculoMotor2).is_a?Motor).to eq(true) 

          end
  
          it "Prueba de que Vehiculo es un Object" do
            expect((@vehiculoMotor1).is_a?Object).to eq(true)
            expect((@vehiculoMotor2).is_a?Object).to eq(true) 

          end
  
          it "Prueba de que Vehiculo es un BasicObject" do
            expect((@vehiculoMotor1).is_a?BasicObject).to eq(true)
            expect((@vehiculoMotor2).is_a?BasicObject).to eq(true) 

          end
  
          it "Prueba de que Vehiculo es un String" do
            expect((@vehiculoMotor1).is_a?String).to eq(false)
            expect((@vehiculoMotor2).is_a?String).to eq(false)
          end
  
          it "Prueba de que Vehiculo es un Numeric" do
            expect((@vehiculoMotor1).is_a?Numeric).to eq(false)
            expect((@vehiculoMotor2).is_a?Numeric).to eq(false)

          end
  
          it "Prueba de que Vehiculo es un Hash" do
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
```

Un vehiculo a motor deberá heredar de la clase `Vehiculo` implementada en el apartado anterior, esto es debido a que un vehiculo motor debera de tener los atrutos de un vehiculo pero ademas tiene que implementar la informacion relacionada a un vehiculo con motor, estos podrian ser por ejemplo una moto, un coche, un camion, etc... Además de representar una identificacion, altura, ancho, largo y peso. se debe representar:

* Numero de plazas del vehiculo comprendida entre 1 y 9
* Numero de ruedas del vehiculo comprendida entre 1 y 9
* Potencia del motor la cual calcularemos a partir de la potencia unitaria y el numero de cilindros
* Velocidad maxima que puede alcanzar un vehiculo que como minimo será 10 y como maximo 300 km/h

Para heredad de una clase se realiza a traves del operador **<**, es decir, `Motor < Vehiculo` y a través del metodo `super()` se especifican los atributos que se quieren heredar de la clase padre, en mi caso he decidido seleccionar todos.

Además como se solicita que la clase motor sea comparable a través de numero de plazas que sería que vehiculo tiene mas plazas he decidido implementar esta funcionalidad con el modulo `comparable` asegurandome previamente de que las instancias no sean **nil**, que tengan algun valor esperado y posteriormente comparo si puede ser mayor, menos, igual, mayor-igual o menor-igual entre dos numeros de plazas de dos vehiculos diferentes. El resto de metodos son comprobaciones de valores dentro de rangos y el metodo que calcula la potencia total del motor la calculara y la establece en funcion a la potencia unitaria del motor y el numero de cilindros que tiene haciendo una funcion de conversion a centimetros cubicos como potencia total. De esta forma implementamos un objeto que representa a un vehiculo a motor dentro de nuestra Gema tal y como se especifica

```Ruby
class Motor < Vehiculo
  include Comparable
  attr_reader :n_ruedas, :n_plazas, :potencia, :velocidad_maxima
  def initialize(matricula, altura, ancho, largo, peso, n_ruedas, n_plazas, potencia, n_cilindro, velocidad_maxima)
    super(matricula, altura, ancho, largo, peso)
    @n_ruedas = ComprobarRango(n_ruedas)
    @n_plazas = ComprobarRango(n_plazas)
    @potencia = CalcularPotencia(potencia, n_cilindro)
    @velocidad_maxima = KilometroMaximo(velocidad_maxima)

  end

  def to_s()
    out = ""
    out += super.to_s
    out += "El vehiculo es de motor y tiene #{@n_ruedas} ruedas, es de #{@n_plazas} plazas, #{@potencia} centimetros cubicos, #{@velocidad_maxima} km/h maximos."
  end

  def ComprobarRango(valor)
    range = (1..9).to_a
    if (range.include?(valor))
      return valor
    else
      return nil
    end
  end

  def CalcularPotencia(potencia, cilindro)
    cilindrada_total = potencia * cilindro 
  end

  def KilometroMaximo(max_value)
    range = (10..300).to_a
    if (range.include?(max_value))
      return max_value
    else
      return nil
    end
  end

  def <=> (otro_vehiculoMotor)
    return nil unless otro_vehiculoMotor.instance_of? Motor
    @n_plazas <=> otro_vehiculoMotor.n_plazas
  end

end
```





## Bibliografia
* [Guión de la práctica](https://campusingenieriaytecnologia2223.ull.es/pluginfile.php/11833/mod_resource/content/42/2223_LPP_p08.pdf)
* [Expresiones regulares en Ruby](https://rubentejera.com/expresiones-regulares-en-ruby/)
* [Potencia de un Vehiculo](https://www.motorpasion.com/revision/caballos-potencia-cilindrada-par-motor-fuerza-definiciones-ri)
* [Modulo Comparable en Ruby](https://ruby-doc.org/core-3.0.0/Comparable.html)
* [Herencia en Ruby](https://makeitrealcamp.gitbook.io/programacion-orientada-por-objetos-en-ruby/herencia)


────────────────────────────────────────────────────────────────────────────────────────────────

# Práctica 7: Gema Parking <a name="id1"></a>
## Autor: Joel Francisco Escobar Socas

## Introduccion
  El objetivo de esta práctica es implementar una Gema en Ruby para representar a un Aparcamiento con todas sus características. Para realizar todo esto se utilizarán diferentes herramientas proporcionadas por **Ruby**. Especificamente:
  * Bundle: Es una Gema que permite la creación y configuraciónn de una [Gema](https://altenwald.org/2012/01/02/las-gemas-de-ruby/) en Ruby
  * Guard: Es una gema que permite automatizar tareas cuando se detecta algún cambio en el sistema de ficheros. En nuestro caso lo utilizaremos para realizar la ejecución automatizada de pruebas.
  * Yargs: Para realizar la documentación del código.

## Desarrollo

Para el desarrollo de la práctica se solicita crear una clase que represente las caracteristicas de un Aparcamiento y un módulo que implemente la funcionalidad sobre el control de las plazas del aparcamiento, es decir, si estan libres o ocupadas,

### Modulo: Aparcamiento

Para el desarrollo de las pruebas del módulo hay que tener en cuenta que no se pueden instanciar objetos de un modulo ya que un modulo no tiene el mismo comportamiento que una clase, por lo que atendiendo al TDD, antes de comenzar con la implementacion del modulo en ruby se ha definido unas pruebas de constantes que toman cierto valores, y posteirormente se ha implementado en el modulo esta funcionalidad, además hayq eue specificar que nuestra gema parking hace uso de estas pruebas con el `Rspec.decribe Parking do`.De esta manera las pruebas quedan como:

```Ruby
# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Aparcamiento do
    context "Pruebas del módulo Aparcamiento" do

      it "Existe un módulo para representar información del Aparcamiento" do
        expect(Aparcamiento).not_to eq(nil)
      end

      it "Se cuenta con una constante para representar si el aparcamiento esta completo" do
      expect(Aparcamiento.libres(30)).to eq(30)
      end

      it "Se cuenta con una constante para representar si el aparcamiento tiene plazas libres" do
        expect(Aparcamiento.ocupadas(30)).to eq(30)
      end

      it "Se cuenta con una funcion para mostrar el numero total de Aparcamientos" do
        expect(Aparcamiento.totales()).to eq(60)
      end

      it "Se cuenta con una funcion para mostrar el estado de un aparcamiento (completo, plazas libres)" do
        expect(Aparcamiento.EstadoPlazas()).to eq("Hay Plazas Libres")
      end

    end
  end
end
```

Para el desarrollo del módulo se utiliza la palabra reservada en ruby **module** y en mi caso defino 3 constantes globales. La constante libres que representa un numero de plazas libres, la constante ocupadas que representa un numero de plazas ocupadas y la constantes plazastotales que representa al numero total de plazas del aparcamiento, es decir, es la suma de las plazas libres y las plazas ocupadas.

Además se definen cuatro métodos propios del módulo a través de la palabra **self**. los métodos son el calculo de las constantes que se le pasa. Por ejemplo, el método *totales* lo que hace es que la variable inicializada arriba denominada plazastotales le asigna la suma de las otras dos variables, basicamente son metodos de inicialización. Y el último método, el denominado **EstadoPlazas** lo que hace es comprobar si el parking está vacío o esta completo. Para que el parking tenga plazas libres puedne pasar dos cosas, o que la variable ocupadas no coincida con el numero total de plazas o que la variable libre sea igual a 0, por lo que no hay plazas libres. Por otro lado, para que el estado de aparcamiento sea que esté lleno, solo puedeser debido cuando las plazas ocupadas sea igual al numero total de plazas disponibles en el aparcamiento o el numero total de plazas libres no sea 0.

```Ruby
module Aparcamiento
  @@totalPlazas=0
  @@LibresValue=0   #Hay plazas libres 
  @@OcupadasValue=0
  ESTA_COMPLETO=("Lleno")
  ESTA_LIBRE=("Hay Plazas Libres")

  def self.libres(libreParam)
    @@LibresValue = libreParam
  end

  def self.ocupadas(ocupadaParam)
    @@OcupadasValue = ocupadaParam
  end

  def self.totales()
    @@totalPlazas = @@LibresValue + @@OcupadasValue 
  end

  def self.EstadoPlazas()
    if(@@LibresValue == 0) then
      return ESTA_COMPLETO

    elsif (@@LibresValue != 0) then
      return ESTA_LIBRE

    elsif (@@OcupadasValue == @@totalPlazas) then
     return ESTA_COMPLETO

    elsif (@@OcupadasValue != @@totalPlazas) then
      return ESTA_LIBRE
    end

  end

end
```

### Clase: Datos

Esta clase es la encargada de implementar los datos necesarios de un aparcamiento. COmo estamos usando TDD, previamente a la implementación de la clase Datos creamos el fichero de prueba y escribimos las pruebas y a medida que van fallando hacemos una funcionalidad. El fichero de pruebas obtenido despues de terminar con la funcionalidad esperada por la clase es:

```Ruby
# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Datos do
    context "Pruebas de la clase Datos" do

      before :all do
        @parking_mercadona = Datos.new(3,5,40, "Parking Mercadona", "Mixto", "coches", 30, 30)
        @parking_Lidl = Datos.new(1, 10, 7594, "Parking Lidl", "Aire Libre", "motos", 0, 10)
        @parking_Carrefour = Datos.new(5, 20, 899302, "Parking Carrefour", "Techo", "bicicletas", 30, 0)


      end
      it "Pruebas de instancia de la clase Datos" do 
        expect(@parking_mercadona).not_to eq(nil)
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
        expect(@parking_Lidl.estado).to eq("Esta Lleno")
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
    
    end
  end
end
```

Para implementar la clase Datos se tiene importar previamente el modulo del que hareemos uso en la clase para la funcionalidad. Para importar un modulo en Ruby lo que se hace es utilizar la palabra **include** de esta forma la línea que importa el modulo previamente definido es `include Aparcamiento`.

Luego definimos la clase con la palabra reservada **Class** y recogemos la serie de atributos que se solicita en el guión de la práctica. Bajo mi punto de vista, los datos que recoge un aparcamiento seria un atributo que indique la accesibilidad que tiene el aparcamient, como pide que sea entre un rango del 1 al 5 siendo 1 el menos accesible posible y 5 el máximo. lo que creo es una funcion que tiene especificado el rango y comprueblo si el valor introducido por el usuario esta entre ese rango si es asi, asigno el valor a el atributo privado y sino es asi devuelvo un **nil**. 

De la misma manera definimos la seguridad del aparcamiento, lo unico que ahora el rango estará comprendido entre 1 y 10. Posteriormente implementamos un atributo que será el identificador del parking o id, este id es asignado directamente al valor que se introduce. recogemos el nombre comercial del parking. Luego analizamos la descripcion del aparcamiento, es decir en un metodo de la clase denominado `TipoDescripcion` se analiza el valor introducido y se comprueba que sea igual a los posibles valores que puede tomar este atributo, es decir, si la descripcion es si está  cubierto, al aire libre o es Mixto, en otras palabras, que tiene una zona al aire libre y en otra zona esta cobuerta en caso de que lo que se introduzca no coincida con esto se devuelve nil. 

También hacemos lo mismo con el atributo tipo, que recoge los tipos de vehiculos que pueden acceder al aparcamiento, puede ser autobuses, bicicletas, coches o motos. en cualquier otro caso, por ejemplo si fueran camiones, entonces devolvemos **nil** puesto que un aparcamiento no puede ser de ese tipo.

y luego le pasamos dos valores, el numero de plazas libres y el numero de plazas ocupadas y creamos un array auxiliar de dos elementos, el primer valor de array serán las plazas libres y el segundo valor las plazas ocupadas las cuales hace uso del modulo aparcamiento. Para hacer uso del modulo, lo que se hace es escribirm el `nombre_modulo.Funcion_modulo`. Asi es como en el primer campo llamamos a la funcion libres definida en el modulo **Aparcamiento** y enb el segundo campo llamamos a la funcionj ocupada definida en el mismo modulo. Luego el atributo que recoge el estado de aparcamiento será la funcion que devuelve el estado de las plazas segun los valores libres y ocupadas.

Sin embargo, falta un atributo más en la clase, el atributo encargado de representar las caracteristicas de una plaza, sus dimensiones. para ello he decidido hacer uso de un modulo que he implementado y del que se hablará más abajo.

```Ruby
include Aparcamiento

class Datos
  attr_reader :accesibilidad, :seguridad, :identificador, :nombre_comercial, :descripcion, :tipo, :estado, :plazas
  
  def initialize(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado)
    @accesibilidad = Accesibilidad(accesibilidad)
    @seguridad = Seguridad(seguridad)
    @identificador = identificador
    @nombre_comercial = nombre
    @descripcion = TipoDescripcion(descripcion)
    @tipo = TipoAparcamiento(tipo)

    aux = [Aparcamiento.libres(libre),Aparcamiento.ocupadas(ocupado)]
    @estado = Aparcamiento.EstadoPlazas()
  end

  def TipoDescripcion(desc)
    if (desc == "Cubierto" || desc == "Aire Libre" || desc == "Mixto") then
      return desc
    else  
      return nil
    end
  end

  def TipoAparcamiento(tipo)
    if (tipo == "autobuses" || tipo == "bicicletas" || tipo == "coches" || tipo == "motos" ) then
      return tipo
    else  
      return nil
    end
  end

  def Accesibilidad(accesibilidad) 
    range = (1..5).to_a
    if (range.include?(accesibilidad))
      return accesibilidad
    else
      return nil
    end
  end

  def Seguridad(seg) 
    range = (1..10).to_a
    if (range.include?(seg))
      return seg
    else
      return nil
    end
  end

end
```

### Modulo: Plazas

Tal y como se especifica en el guión de la práctica, se solicita un atributo que represente las dimensiones de una plaza del aparcamiento por lo que yo he optado a diseñar un modulo que implemente una clase, en este caso la clase se llama **CaracteristicasPlazas**. Para las pruebas unitarias y hacer TDD lo que hago es implementar el funcionamiento esperado en mi clase e ir completando el el propio modulo situado en el fichero `plazas.rb`. Las pruebas son:


```Ruby
# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
    describe PlazasAparcamiento::CaracterisiticasPlazas do
        context "Pruebas del módulo Plaza Aparcamiento" do
            before :all do
                @plaza1 = PlazasAparcamiento::CaracterisiticasPlazas.new([2, 2, 2])
            end
            it "Existe un módulo para representar información del Aparcamiento" do
                expect(PlazasAparcamiento::CaracterisiticasPlazas).not_to eq(nil)
                expect(@plaza1).not_to eq(nil)
                
            end
            it "Metodo de visualizacion" do 
                expect(@plaza1.to_s()).to eq("[ 2, 2, 2 ]\n")
              end

        end
    end
end
  
```
Basicamente la clase dentro del modulo, es decir, **CaracteristicasPlaza** es una clase que recibe un array e inicializa los atributos correspondientes a las coordenadas de una clase como cada una de los componentes de un array en caso de que la longitud del array que se le pasa al constructor sea diferente de tamaño 3, que serian las coordenadas, devuelve nil sino pues cada uno de las posiciones del atributo del array seran asignada a una constante y con ello tendremos que una plaza de un aparcamiento tendrá longitud, anchura y largo.

```Ruby
module PlazasAparcamiento
    class CaracterisiticasPlazas
      attr_reader :altura, :longitud, :anchura
      def initialize(array1)
        if (array1.length == 3) then
          @altura = array1[0] 
          @longitud = array1[1] 
          @anchura = array1[2]  
         else
          return nil
        end
      end
      def to_s()
        out = ""
        out += "[ "
        out += "#{@altura}, "
        out += "#{@longitud}, "
        out += "#{@anchura}"
        out += " ]\n"
      end
    end
  end
  
```


ya solo faltaría añadir esta funcionalidad dentro de mi clase **Datos** para recoger la informacion referente a las caracteristicas de una plaza de aparcamiento.

Dentro de mi clase lo que he hecho es inicializar un atributo denominado plazas al modulo y el nuevo objeto pasandole un array que recibe en el intiialize.
```Ruby
...
  def initialize(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado, array)
    @plazas = PlazasAparcamiento::CaracterisiticasPlazas.new(array)
  end
```
En las pruebas de la clase ahora en el constructor le pasamos un array y comprobamos que por ejemplo, el metodo to_s que es para visualizar en la en el modulo plazas simplemente mostramos las tres coordenadas juntas

```Ruby
  @parking_mercadona = Datos.new(3,5,40, "Parking Mercadona", "Mixto", "coches", 30, 30, [2, 2, 2])
  ...
  ...
  expect(@parking_mercadona.plazas.to_s()).to eq("[ 2, 2, 2 ]\n")
```

Y con esto ya tendriamos el funcionamiento de nuestra clase para representar un aparcamiento

## Información acerca de la Gema **Parking**
```Markdown
Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/Parking`. To experiment with that code, run `bin/console` for an interactive prompt.

Esta Gema se encarga de representar una clase Aparcamiento que especifique las caracteristicas que tendrá un Aparcamiento, como pude ser su nombre, su numero de plazas etc.

### Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add Parking

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install Parking

### Usage

TODO: Write usage instructions here

### Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Parking.
```

## Bibliografía
* [guión](https://campusingenieriaytecnologia2223.ull.es/pluginfile.php/11807/mod_resource/content/44/2223_LPP_p07.pdf)
* []()
* []()
* []()
* []()
* []()
