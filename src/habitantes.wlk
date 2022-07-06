import planeta.*
class Persona {
	var property edad
	
	method potencia() = 20
	method inteligencia(){
		if(edad.between(20,40)){
			return 12
		} else (return 8)
	}
	method esDestacado()= edad == 25 || edad == 35
	method valor() = self.potencia() + self.inteligencia()
	
		
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property cantTecnicas = 2
	
	override method potencia() = todasLasPersonas.condicionComun() + masaMuscular * cantTecnicas
	override method esDestacado() = todasLasPersonas.condicionComun() and cantTecnicas > 5
	method entrenar(dias) {
		if(dias == 5) {
			masaMuscular += 1	
		}
	}
	method aprenderTecnica(){
		cantTecnicas += 1
	} 
}

class Docente inherits Persona {
	var property cantCursos = 0
	
	override method inteligencia() = todasLasPersonas.condicionComun() + cantCursos *2
	override method esDestacado() = false
	override method valor() = super() + 5 
}

object todasLasPersonas {
	var property condicionComun
}

class Soldado inherits Persona {
	var property armas = []
	
	override method potencia() = todasLasPersonas.condicionComun() + armas.sum{a => a.potenciaQueOtorga()}
	method tributoQueOfrece(unaCiudad) = unaCiudad.construirMurallas(5)
}

class Pistolete {
	const property largo
	
	method potenciaQueOtorgaA(unSoldado) {
		if(unSoldado.edad() > 30){
			return largo * 3
		} else (return largo *2)
	} 
}

class Espadron {
	const property peso
	
	method potenciaQueOtorgaA(unSoldado) {
		if(unSoldado.edad() < 40){
			return peso / 2
		} else (return 6)
	}
}


