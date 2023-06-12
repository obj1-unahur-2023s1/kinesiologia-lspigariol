# Parcial Kinesiologia

En un centro de kinesiología hay distintos tratamientos para la cura de lesiones dolorosas y fortalecimiento muscular.
Se nos pide armar un modelo que permita estudiar algunos parámetros sobre los pacientes, y controlar el uso de los aparatos.


## 1. Aparatos y pacientes.
De cada paciente del centro de kinesiologia interesa conocer la edad, el nivel de fortaleza muscular y el nivel de dolor.  
El nivel de fortaleza y el nivel de dolor son valores que se van modificando a medida que el paciente utiliza aparatos.  
El centro tiene distintos tipos de aparatos, en este enunciado incluimos sólo tres. La incorporación de nuevos tipos de aparatos debe ser sencilla, no debería ser necesario modificar código existente sino solamente agregar nuevas definiciones.
 
Cuando un paciente usa un aparato pasa lo siguiente:
- **Magneto**: el nivel de dolor disminuye en un 10%. Puede ser usado por cualquier persona.
- **Bicicleta**: el nivel de dolor disminuye en 4 puntos, mientras que la fortaleza muscular suma 3 puntos. Solo puede ser usado por personas mayores a 8 años.
- **Minitramp**: El nivel de fortaleza muscular aumenta un 10% de la edad del paciente. Solo puede ser usado por personas cuyo nivel de dolor es inferior a 20.

Requerimientos:
- Saber si un paciente puede usar un aparato
- Que un paciente use un aparato.
- Poder consultar el nivel de dolor y el nivel de fortaleza muscular de un paciente, que deben ir cambiando como resultado del uso de aparatos.

**Atención**:  
por razones que van a aparecer más adelante, conviene definir una clase para cada tipo de aparato, y que los aparatos sean instancias de esas clases.


### Tests parte 1
Consideremos las siguientes dos personas.
- Leonardo, 40 años de edad, nivel de dolor 10, fortaleza 20.
- Milena, 3 años de edad, nivel de dolor 30, fortaleza 50.

Crear un aparato de cada tipo, y verificar que
- Leonardo puede usar los tres aparatos creados, mientras que Milena puede usar sólo el magneto.
- Después de usar el magneto una vez, el nivel de dolor de Leonardo baja a 9.
- Después de usar el magneto una vez, el nivel de dolor de Milena baja a 27.
- Después de usar la bicicleta una vez, el nivel de dolor de Leonardo baja a 6, y la fortaleza sube a 23.
- Después de usar el minitramp una vez, la fortaleza de Leonardo sube a 24.

Estos tests deben ser independientes.


## 2. Rutinas.
A cada paciente se le asigna una serie de aparatos a ser usados en un orden determinado, cuando acude a al centro a realizar una sesión. A esto lo llamaremos la _rutina_ asignada al cliente.  
Una rutina puede incluir que se utilice más de una vez el mismo aparato. Por ejemplo: una bicicleta, un minitramp, la misma bicicleta de nuevo, un magneto.  
Cada vez que un paciente concurre al centro, realiza la rutina que tiene asignada.  
A efectos de simplificar el programa, consideramos que cada paciente tiene "sus" aparatos asignados, y que cada vez que va al centro, usa los mismos. En el ejemplo, aunque el centro tenga 20 bicicletas, el paciente va a usar siempre la misma. 

Requerimiento: 

- Saber si un paciente puede hacer la rutina asignada, para lo cual hay que verificar que pueda utilizar todos
los aparatos asignados al momento de iniciarla.
- Que el paciente realice una sesión completa: debe usar todos los aparatos incluidos en su rutina, en el orden indicado. 


### Tests parte 2
Considerar las dos personas definidas en los tests de la parte 1. La rutina de Leonardo es la indicada en el enunciado. Milena usa, primero un magneto, después una bicicleta. 

Verificar que:
- Leonardo puede hacer la rutina que tiene asignada. Después de hacerla una vez, su nivel de dolor baja a 1.8, y su fortaleza sube a 30.
- Milena no puede hacer la rutina que tiene asignada.


## 3. Pacientes especiales.
El centro observa que algunes de sus pacientes tienen comportamientos particulares. Quedan definidos estos tres tipos de paciente. 

- **Resistente**:  
Cuando realiza una sesión, _luego_ de usar los aparatos, el nivel de fortalecimiento se incrementa en un punto adicional por cada aparato usado.  
Si usa dos veces el mismo aparato se cuenta dos veces, por ejemplo en la rutina: "bicicleta, minitramp, bicicleta de nuevo, magneto" sumaría 4 puntos.

- **Caprichoso**:  
Tiene una condición adicional para saber si puede realizar una rutina o no: 
al menos uno de los aparatos deben ser de color rojo.  
Se debe agregar a la información que maneja el programa, el color de cada aparato. 
Un buen valor inicial para el color de un aparato es el blanco.  
Un cliente caprichoso, además, en cada sesión realiza siempre _dos veces_ toda la rutina que tiene asignada. 

- **Rápida Recuperación**:  
Luego de aplicar su rutina, el nivel de dolor se decrementa en una cantidad configurable, 
que es la misma para todos los pacientes de rápida recuperación. Un buen valor inicial es 3.

Requerimientos:
- agregar estos tipos de pacientes
- modificar el valor de puntos de dolor que se decrementa para todos los pacientes de Rápida Recuperación.


### Tests parte 3
Considerar las siguientes personas.
- Nicolás es un paciente resistente, edad 40, dolor 10, fortaleza 20, la misma rutina que Leonardo, con los mismos aparatos.
- Victoria es una paciente caprichosa, edad 30, dolor 10, fortaleza 40, la misma rutina que Leonardo, con los mismos aparatos.
- Julián es un paciente caprichoso, edad 20, dolor 54, fortaleza 50. La rutina consiste en: una bicicleta roja, un magneto verde, una bicicleta blanca.
- Zoe es una paciente de rápidad recuperación, edad 50, dolor 14, fortaleza 40, la misma rutina que Leonardo, con los mismos aparatos.

Salvo la bicicleta roja y el magneto verde, todos los aparatos son blancos.

Verificar que:
- Nicolás puede hacer la rutina que tiene asignada. Después de hacerla una vez, su nivel de dolor baja a 1.8, y su fortaleza sube a 34.
- Victoria no puede hacer la rutina que tiene asignada.
- Julián puede hacer la rutina que tiene asignada. Después de hacerla una vez, su nivel de dolor baja a 29.3, y su fortaleza sube a 62.
- Zoe puede hacer la rutina que tiene asignada. Después de asignar a 2 el valor de decremento de dolor para pacientes de rápida recuperación, y de que Zoe haga su rutinauna vez, su nivel de dolor baja a 3.4, y su fortaleza sube a 51.


## 4. El centro.
Agregar al modelo un objeto que represente al centro de kinesiología, con los siguientes requerimientos:
- Saber los colores de sus aparatos, sin repetidos. 
- Saber cuáles son los pacientes menores de 8 años
- Saber la cantidad de pacientes que no pueden cumplir su sesión.



## 5. Mantenimiento de aparatos.
Agregar al modelo lo necesario para poder saber si un aparato necesita mantenimiento, y registrar las consecuencias de los mantenimientos. Para ello, hay que registrar las consecuencias que tiene el uso de un aparato por un paciente, _para el aparato_, de acuerdo a las siguientes definiciones.

- **Magneto**: pierde un punto de imantación en cada uso. Si tiene menos de 100 puntos de imantación, necesita mantenimiento. Hacerle mantenimiento implica agregar 500 puntos de imantación. Un magneto nuevo tiene 800 puntos de imantación.
- **Bicicleta**: para cada bicicleta, agregar dos contadores: la cantidad de veces que se desajustan los tornillos, y la cantidad de veces que pierde aceite, desde el último mantenimiento. Estos valores nacen en 0.  
En cada uso, si el nivel de dolor del paciente _antes del uso_ es mayor a 30, entonces se desajustan los tornillos. Si además tiene entre 30 y 50 años, también pierde aceite. O sea, hay que sumar uno a los contadores que corresponda.  
Una bicicleta necesita mantenimiento se se le han desjustado los tornillos al menos 10 veces, o si perdió aceite al menos 5 veces, desde el último mantenimiento. Al hacerle un mantenimiento, los dos contadores vuelven a 0.
- **Minitramp**: No tiene ninguna consecuencia del uso, nunca necesita mantenimiento, al hacerle un mantenimiento no sufre ningún cambio.

Agregar las siguientes consultas y acciones al centro
- Saber si está en óptimas condiciones, o sea, si ninguno de sus aparatos necesita mantenimiento.
- Saber si está complicado, o sea, si la mitad o más de sus aparatos necesita mantenimiento.
- Registrar una visita de técnico, que tiene el efecto de hacerle mantenimiento a todos los aparatos que lo necesiten.














