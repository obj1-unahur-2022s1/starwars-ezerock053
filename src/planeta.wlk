/*
 * Planeta:
 * 1) La colección de habitantes debía implementarse como un conjunto, según definición del 
 * enunciado hacia el final del texto. Dejo la corrección.
 * 2) El método delegacionDiplomatica() debía devolver un subconjunto de la colección de
 * habitantes, y no el conjunto completo. Te dejo la corrección. 
 * 3) El método valorInicial() debía retornar la cantidad de habitantes con potencia de
 * al menos 30 unidades, y no la colección de habitantes con esa potencia. Te dejo la corrección
 * en el código.
 * 4) El método logitudTotalDeMurallas() no es necesario, ya que el atributo murallas 
 * será, según definición, un valor númerico que representa la longitud de las murallas.
 * 5) El método construirMurallas(cantidad) no debía ser un getter, sino un setter, es decir, 
 * debe modificar el valor de murallas sumando la cantidad que recibe por parámetro. Te
 * dejo la forma correcta para su implementación.
 * 6) El método recibir tributo no es una consulta (getter), es decir, no debe retornar
 * nada, sino que es una acción. Te dejo la corrección en el código.
 * 7) El método apaciguarA(otroPlaneta) no es una consulta (getter), es decir, no debe retornar
 * nada, sino que es una acción. Te dejo la corrección en el código.
 */

import habitantes.*
class Planeta {
	var property habitantes = #{}
	var property cantMuseos 
	var property murallas
	
	method delegacionDiplomatica() = habitantes.filter{h=>h.esDestacado()}
	method valorInicial() = habitantes.count({ h => h.potencia() >= 30 })  /**/
	method esCulto() = cantMuseos >= 2 and self.habitantesConDiezInteligencia()
	method habitantesConDiezInteligencia() = habitantes.all({ h => h.inteligencia() >= 10})
	method potenciaReal() = habitantes.sum{ h => h.potencia()}
	method longitudTotalDeMurallas() = murallas.size()
	method construirMurallas(cantidad) { murallas += cantidad }
	method fundarMuseo(){
		cantMuseos += 1
	}
	method potenciaAparente() = habitantes.max({h => h.potencia()}) * self.cantidadDeHabitantes()
	method cantidadDeHabitantes() = habitantes.size()
	method necesitaReforzar() = self.potenciaAparente() >= self.potenciaReal() *2
	method recibirTributo() { habitantes.forEach({h => h.darTributoA(self)}) }
	method habitantesValiosos() = habitantes.filter{ h => h.valor()>= 40 }
	method apaciguarA(otroPlaneta) { 
		self.habitantesValiosos().forEach({ h => h.darTributoA(otroPlaneta)})
	}	
	
}