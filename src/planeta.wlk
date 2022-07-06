import habitantes.*
class Planeta {
	var property habitantes = []
	var property cantMuseos 
	var property murallas
	
	method delegacionDiplomatica() = habitantes
	method valorInicial() = habitantes.filter({ h => h.potencia() >= 30 })  /**/
	method esCulto() = cantMuseos >= 2 and self.habitantesConDiezInteligencia()
	method habitantesConDiezInteligencia() = habitantes.all({ h => h.inteligencia() >= 10})
	method potenciaReal() = habitantes.sum{ h => h.potencia()}
	method longitudTotalDeMurallas() = murallas.size()
	method construirMurallas(cantidad) = self.longitudTotalDeMurallas() + cantidad
	method fundarMuseo(){
		cantMuseos += 1
	}
	method potenciaAparente() = habitantes.max({h => h.potencia()}) * self.cantidadDeHabitantes()
	method cantidadDeHabitantes() = habitantes.size()
	method necesitaReforzar() = self.potenciaAparente() > self.potenciaReal() *2
	method recibirTributoDocente() {
		self.fundarMuseo()
	}
	method recibirTributoAtleta() {
		return self.construirMurallas(2)
	}
	method habitantesValiosos() = habitantes.filter{ h => h.valor()>= 40
	}
	method apaciguarA(otroPlaneta) = self.habitantesValiosos()
	
}