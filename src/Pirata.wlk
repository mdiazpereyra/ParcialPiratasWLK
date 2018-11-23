class Pirata {
	var property energia
	
	constructor(unaEnergia){ energia = unaEnergia }
	
	method poderDeMando()
	
	method tomarRonCon(pirata) { energia -= 50 }
	
	method esFuerte() = self.poderDeMando() > 100
	
	method resultarHerido()
}

class Guerrero inherits Pirata {
	var poderDePelea
	var vitalidad
	
	constructor(unaEnergia, unPoderDePelea, unaVitalidad) = super(unaEnergia){
		poderDePelea = unPoderDePelea
		vitalidad = unaVitalidad
	}
	
	override method poderDeMando() = poderDePelea*vitalidad
	
	override method resultarHerido(){ poderDePelea /= 2 }
}

class Navegador inherits Pirata {
	var inteligencia
	
	constructor(unaEnergia, unaInteligencia) = super(unaEnergia){
		inteligencia = unaInteligencia
	}
	
	override method poderDeMando() = inteligencia**2
	
	override method resultarHerido(){ inteligencia /= 2 }
}

class Cocinero inherits Pirata {
	var moral
	var ingredientes
	
	constructor(unaEnergia, unaMoral, unosIngredientes) = super(unaEnergia){
		moral = unaMoral
		ingredientes = unosIngredientes
	}
	
	override method poderDeMando() = moral*ingredientes.size()
	
	override method tomarRonCon(pirata){
		super(pirata)
		self.perderIngrediente(ingredientes.anyOne(), pirata)
	}
	
	method perderIngrediente(unIngrediente, pirataLadron){
		pirataLadron.recibirIngrediente(unIngrediente)
		ingredientes.remove(unIngrediente)
	}
	
	override method resultarHerido(){ moral /= 2 }
}

object jackSparrow inherits Pirata (500) {
	var poderDePelea = 200
	var inteligencia = 300
	var ingredientes = ["botellaDeRon"]
	
	override method poderDeMando() = energia*poderDePelea*inteligencia
	
	override method tomarRonCon(pirata){
		energia += 100
		pirata.tomarRonCon(self)
	}
	
	method recibirIngrediente(unIngrediente){ ingredientes.add(unIngrediente) }

	override method resultarHerido(){}
}

class MonstruoHumanoide inherits Pirata {
	var poderDePelea
	
	constructor(unaEnergia, unPoderDePelea) = super(unaEnergia){
		poderDePelea = unPoderDePelea
	}
	
	override method poderDeMando() = poderDePelea
	
	override method resultarHerido(){ poderDePelea /= 2 }
}