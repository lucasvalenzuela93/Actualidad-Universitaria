import Objetos_Robar.*
class Ciudad {
	var temperatura
	var maravillas
	constructor(c,_tiene){
		temperatura=c
		maravillas=_tiene
	}
	
	method temperatura()=temperatura

	method reducirTemperatura(t){
	temperatura-=t
	}
	
	method tiene()=maravillas

	method seRobaron(_tiene){
	maravillas.remove(_tiene)
	}
	method mostrar(algoQueTiene){
		if(maravillas.contains(algoQueTiene)){
			return algoQueTiene
		}else{
			return null
		}
	}

}