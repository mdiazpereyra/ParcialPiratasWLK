class Barco {
	var resistencia
	var poderDeFuego
	var municiones
	var tripulacion
	var bando
	
	constructor(unaResistencia, unPoderDeFuego, unasMuniciones, unaTripulacion, unBando){
		resistencia = unaResistencia
		poderDeFuego = unPoderDeFuego
		municiones = unasMuniciones
		tripulacion = unaTripulacion
		bando = unBando
	}
	
	method capitan() = tripulacion.max({ unTripulante => unTripulante.poderDeMando() })
	
	method enfrentar(barco){
		if( barco.fuerza() > self.fuerza() )
			self.salirPerdedor(barco)
		else
			barco.salirPerdedor(self)
	}
	
	method fuerza() = tripulacion.sum({ unTripulante => unTripulante.poderDeMando() })

	method salirPerdedor(barcoVencedor){
		self.herirTripulacion()
		barcoVencedor.recibirTripulacionFuerte(self.tripulacionFuerte())
		tripulacion.clear()
		self.quedarDesolado()
	}
	
	method herirTripulacion(){ tripulacion.forEach({ unTripulante => unTripulante.resultarHerido() })}
	
	method tripulacionFuerte() = tripulacion.filter({ unTripulante => unTripulante.esFuerte() })

	method recibirTripulacionFuerte(tripulantes){ tripulacion += tripulantes}

	method quedarDesolado(){
		resistencia = 0
		poderDeFuego = 0
		municiones = 0
	}
	
	method dispararCanionazos(cantidad, barcoAtacado){
		if(municiones > cantidad){
			municiones -= cantidad
			barcoAtacado.recibirCanionazos(cantidad)
		}
		else
			self.error("No hay suficientes municiones.")
	}
	
	method recibirCanionazos(cantidad){
		resistencia -= 50*cantidad
		tripulacion = tripulacion.filter({ unTripulante => unTripulante.energia() > 20 })
	}
	
	method obtenerBonus(){ bando.bonus(self) }
	
	method recibirBonusDeArmadaInglesa(){ municiones += municiones*0.3 }
	
	method recibirBonusDeUnionPirata(){ poderDeFuego += 60 }
	
	method recibirBonusDeArmadaDelHolandesErrante(){ tripulacion += tripulacion }

	method cambiarDeBando(nuevoBando){ bando = nuevoBando}
}