object centro {
	
	const pacientes = []
	const aparatos = []
	
	method coloresSinRepeticion() = aparatos.map{ap=>ap.color()}.asSet()
	method pacientesMenores() = pacientes.filter{pa=>pa.edad() < 8 }
	method cantidadPacientesSinSesion() = 
		pacientes.count{pa=>!pa.puedeHacerRutina()}
	
	
	method enOptimasCondiciones() = aparatos.all{ap=> !ap.necesitaMantenimiento()}
	//Saber si está en óptimas condiciones, o sea, si ninguno de sus aparatos necesita mantenimiento.

	method visitaTecnico() {
		aparatos.filter{ap=>ap.necesitaMantenimiento()}.
			forEach{ap=>ap.realizarMantenimiento()}
	}
	
	method estaComplicado() =
	   self.cantidadAparatosMantenimiento() >= self.cantidadAparatos() / 2

	method cantidadAparatosMantenimiento() = aparatos.count{ap=> ap.necesitaMantenimiento()}
	// Registrar una visita de técnico, que tiene el efecto de hacerle mantenimiento a todos los aparatos que lo necesiten.
	
	method cantidadAparatos() = aparatos.size()
}


class Paciente {
	
	var property dolor
	var property edad
	var property fortaleza
	
	const rutina = []
	
	method puedeHacerRutina() = rutina.all({ap=> ap.puedeSerUsadoPor(self)})
	
	method realizarSesion() {
		rutina.forEach{ap=> ap.usar(self) }
		self.otraConsecuencia()
	}
	method otraConsecuencia() {
		
	}

	method disminuirDolor(valor){
		dolor -= valor
	}
	method aumentarFortaleza(valor){
		fortaleza += valor
	}
	method disminuirDolorPorcentual(porcentaje){
		dolor -= dolor*porcentaje/100
	}
	method aumentarFortalezaPorcentual(porcentaje){
		fortaleza += fortaleza*porcentaje/100
	}
}

class PacienteResistente inherits Paciente{
	
	override method otraConsecuencia(){
		self.aumentarFortaleza(rutina.size())
	}
}

class PacienteCaprichoso inherits Paciente{
	
	override method otraConsecuencia(){
		self.realizarSesion()
	}
	
	override method puedeHacerRutina() = super() && self.algunAparatoRojo()
	method algunAparatoRojo() = 
	   rutina.any{ap=>ap.color() == "rojo"}
}


class PacienteRecuperacion inherits Paciente{
	override method otraConsecuencia(){
		self.disminuirDolor(recuperacion.dolor())
	}
	
}

object recuperacion{
	var property dolor = 3
}


class Aparato {
	var property color = "blanco"
//	method realizarMantenimiento()
//	method necesitaMantenimiento() 
//	method puedeSerUsadoPor(persona) 
//	method usar(persona)
}

class Bicicleta inherits Aparato{
	var tornillos = 0
	var aceite = 0
	method puedeSerUsadoPor(persona) = persona.edad() > 8
	
	method usar(persona){
		
		if(persona.dolor() > 30) 
			tornillos += 1
		if(persona.edad().between(30,50))
		    aceite +=1
		persona.disminuirDolor(4)
		persona.aumentarFortaleza(3)
	}
	
	method realizarMantenimiento(){
		aceite = 0
		tornillos = 0
	}
	
	method necesitaMantenimiento() = aceite >= 5 or tornillos >= 10
	
}


class Minitrap inherits Aparato{
	method puedeSerUsadoPor(persona) = persona.dolor() <= 20
	method usar(persona) {
		persona.aumentarFortalezaPorcentual(10)
	} 
	
	method realizarMantenimiento(){
	}
	
	method necesitaMantenimiento() = false 
	
}




class Magneto inherits Aparato{
	var imantacion = 800
	
	method puedeSerUsadoPor(persona) = true
	
	method usar(persona) {
		persona.disminuirDolorPorcentual(10)
		imantacion -= 1
	} 
	
	method realizarMantenimiento(){
		imantacion += 500
//		color = "verde"
	}
	
	method necesitaMantenimiento() = imantacion < 100
}
