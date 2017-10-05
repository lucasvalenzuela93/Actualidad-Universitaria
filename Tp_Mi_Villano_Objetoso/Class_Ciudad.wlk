import Objetos_Robar.*
class Ciudad {
	var temperatura
	var tiene
	constructor(c,_tiene){
		temperatura=c
		tiene=_tiene
	}
	
	method temperatura()=temperatura

	method reducirTemperatura(t){
	temperatura-=t
	}
	
	method tiene()=tiene

	method sacarObjeto(_tiene){
	tiene.remove(_tiene)
	}

}