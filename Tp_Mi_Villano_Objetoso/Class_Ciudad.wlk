
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
	
	method objetosQueTiene()= maravillas

	method seRobaron(_tiene){
	maravillas.remove(_tiene)
	}
	method tieneMaravilla(algoQueTiene)= maravillas.contains(algoQueTiene)
	
	}
	