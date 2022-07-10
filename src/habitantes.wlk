/*
 * Persona: Bien
 * Atleta:
 * 1) No era necesario definir un objeto común a todasLasPersonas que definiese la condición
 * común de potencia, con el método potencia() de la clase Persona es suficiente, y luego
 * el resto de las clases que heredan de Persona sobreescriben el método. Igualmente faltaría
 * definir el valor de concición común en el objeto todasLasPersonas, te lo corrijo para que
 * funcionen los test de potencia().
 * 2) Está mal implementado el método esDestacado(), ya que como vimos arriba, la condición
 * común la usamos para la potencia (aunque no es la solución esperada), entonces para resolver
 * esDestacado(), debía utilizarse la palabra super() para utilizar la condición de Persona
 * que hereda la clase Atleta. Además, el conector lógico debía ser or y no and. 
 * Lo corrijo en el código para que veas la solución correcta.
 * 3) El método entrenar pedía que cada 5 días de entrenamiento, se sumara 1 kg, y la forma en que
 * lo implementaste, requería que sean múltiplos de 5, lo que provoca que si por ejemplo entrena 14 días
 * no sume 2kg de masa muscular. Te dejo en el código la forma de resolverlo.
 * Docente:
 * 4) El método inteligencia() debía utilizar la definición de la clase de la que hereda, 
 * por lo tanto la forma correcta era usando super(). Te dejo la corrección en el código.
 * 5) El método esDestacado() debe devolver true si dio más de 3 cursos, en tu implementación
 * siempre devuelve false. Te dejo la corrección en el código. 
 * Soldado:
 * 6) El método potencia() no implementa correctamente la suma de potenciaQueOtorga cada arma, 
 * ya que debería utilizar el parámetro self, en la forma potenciaQueOtorga(self) para indicar
 * la instancia de Soldado, necesaria luego para calcular la potencia del arma según el
 * soldado. Te dejo la corrección en el código.
 *  
 */

import planeta.*
class Persona {
	var property edad
	
	method potencia() = 20
	method inteligencia(){
		if(edad.between(20,40)){
			return 12
		} else {return 8}
	}
	method esDestacado()= edad == 25 || edad == 35
	method valor() = self.potencia() + self.inteligencia()
	method darTributoA(unPlaneta){}
	
		
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property cantTecnicas = 2
	
	override method potencia() = todasLasPersonas.condicionComun() + masaMuscular * cantTecnicas
	override method esDestacado() = super() or cantTecnicas > 5
	method entrenar(cantDias) { masaMuscular += cantDias.div(5) }
	method aprenderTecnica(){
		cantTecnicas += 1
	} 
	override method darTributoA(unPlaneta) {
		unPlaneta.construirMurallas(2)
		}
}

class Docente inherits Persona {
	var property cantCursos = 0
	
	override method inteligencia() = super() + cantCursos*2
	override method esDestacado() = cantCursos > 3
	override method valor() = super() + 5 
	override method darTributoA(unaCiudad) {
		unaCiudad.fundarMuseo()
		}
}

object todasLasPersonas {
	const property condicionComun = 20
}

class Soldado inherits Persona {
	var property armas = []
	
	override method potencia() = todasLasPersonas.condicionComun() + armas.sum{a => a.potenciaQueOtorga(self)}
	override method darTributoA(unaCiudad){
		unaCiudad.construirMurallas(5)
		}
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


