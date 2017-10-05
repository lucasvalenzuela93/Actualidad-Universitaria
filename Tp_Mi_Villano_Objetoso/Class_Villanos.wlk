import Class_Minion.*
import Class_Armas.*
import Class_Ciudad.*

class UserException inherits wollok.lang.Exception {
	constructor(_mensaje) = super(_mensaje)
}
class Villano {
	var ejercitoMinion= []
 	var ciudad
 	var rayoCongelante1 =new Arma("rayoCongelante",10)

	constructor(_ciudad){
		ciudad=_ciudad
	}
	
	//Muestra ciudad donde vive 
	method viveEn()=ciudad
	
	//Cambio de ciudad
	method seMudo(_ciudad){	
		ciudad=_ciudad
	}
	
	//Muestra todos los minions que trabajan   
	method mostrarMinions()= ejercitoMinion

	//Muestra una coleccion de minions que tengan un arma determinada
	/** Busca mediante el nombre del arma(String), no por el arma en si */
	method minionsConArma(arma) {
		return self.mostrarMinions().filter({minion=> minion.tieneArma(arma)})
	}
	//Muestra una coleccion de minion que tengan el nivel de concentracion
	method minionsConcentracionMayor(nivel){
		return self.mostrarMinions().filter({minion=> minion.nivelConcentracion() > nivel})
	}
	
	//Este es util para cuando se hace una maldad congelar
	method requisitosCongelar(nivelConcentracion){
		var cumplidores=[]
		cumplidores= self.minionsConcentracionMayor(nivelConcentracion)
		cumplidores.filter({x=> self.minionsConArma("rayoCongelante").contains(x)})
		
		return cumplidores
	}
	
	//Muestra un minion
	/** Busca al minion mediante el nombre(String)*/
	method buscarMinion(minion)= (self.mostrarMinions().filter({_minion=> _minion.nombre()==minion})).first()
	
	// Saber si un minion ya existe
	method yaExisteMinion(minion)=self.mostrarMinions().any({x=> x.nombre()== minion})
	
	//Agrega un minion a su ejercito, su manera de identificarlo es mediante su nombre
	/**La condicion de tener un nuevo minion es que no exista otro con el mismo nombre,
	ya que si existen minions con el mismo nombre no se podrian identificar */
	method nuevoMinion(nombre){
		if(self.yaExisteMinion(nombre)){
		throw new UserException("El minion ya existe, usar buscarMinion("+'"'+nombre+'"'+") o intentar con otro nombre ")
		}else{
		const minion = new Minion(nombre,"Amarillo",10,rayoCongelante1)
		ejercitoMinion.add(minion)
		}
	}

	//Agregar un arma a un minion
	/** El modo de ingreso, es que minion sea el nombre(String),
	y el arma sea un objecto de la class Armas */
	method otorgarArma(minion,arma){ 
		
		(self.buscarMinion(minion)).agregarArmas(arma)
	}
	
	//Dar mas bananas a un minion
	/** se debe ingresar el nombre del minion(String) y la cantidad de bananas */
	method alimentar (minion,bananas){
			
		(self.buscarMinion(minion)).agregarBananas(bananas)
	}

	//Mostrar el nivel de concentracion de 1 minion
	/** El modo de consulta es ingresando el nombre del minion(String) */
	method nivelConcentracion(minion){	
		
		return (self.buscarMinion(minion)).nivelConcentracion()
	}
	// Mostrar si un minion es peligroso
	/**El modo de consulta es ingresando el nombre del minion(String) */
	method peligroso(minion){	
		
		return (self.buscarMinion(minion)).peligroso()
	}

	// Hacer que un minion tome el suero
	/**El modo de consulta es ingresando el nombre del minion(String) */
	method aplicarSuero(minion){
		return (self.buscarMinion(minion)).beberSuero()
	}
}


