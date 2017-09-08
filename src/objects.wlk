class ArbolNavidad {
    var edadArbol=0
    var tamTronco=0
    var conjCosas=[]


    method vejez()= edadArbol
    method vejez(_edadArbol){ edadArbol = _edadArbol}
    
    
    method tamanioTronco()= tamTronco
    method tamanioTronco(_tamanoTronco){ tamTronco= _tamanoTronco}
    
    
    method capacidad(){return tamTronco*edadArbol}
    method lugaresObjetos()= conjCosas.fold(0,{acum, lugar => acum + lugar.lugaresArbol()})
    
    
    method elementos(){return conjCosas}
    
    method elementos(_objeto) {
    	if ( self.capacidad() <= self.lugaresObjetos() ) {
   		 //no compila  ):
        	//throw new UserException("El arbol esta lleno")
    	}else{
   		 conjCosas.add(_objeto)
    	}    
	}
    
	method objSumanImp()=  	 
   	 conjCosas.filter({ imp => imp.estaColgado()})

    method importancia()= self.objSumanImp().fold(0,{acum, imp => acum + imp.importancia()})
    
    
	method promImportancia()= self.importancia() / self.objSumanImp().size()
    
	method cantObjMayorImp(){
   	 conjCosas.filter({imp => imp.importancia() > self.promImportancia()})
   	 return conjCosas.size()
    
	}
    
    method elimVoluminosos()=
   		 conjCosas.forEach({objeto => if (objeto.lugaresArbol() > 5 ){conjCosas.remove(objeto)}})
    
    

    method destinatario(_destinatario){
	conjCosas.map({objeto => objeto.destinatario()})
   	 
	}
    
}

class Regalos{
    var conjdest = []
    var ocupa = 1
    var imp = 0
    //estado 1=Colgado, para cualquier otro no lo esta
    var colgado= 1
    
    method estaColgado(){return colgado==1}
    method estaColgado(_alpiso){colgado=_alpiso}
   	 
    method destinatario(_destinatario){ conjdest.add(_destinatario)}
    
    method destinatario(){ return conjdest}
    
    method importancia(){
   	 imp = conjdest.size()*2
   	 return imp
    }
    
    method lugaresArbol()= ocupa
}

class Tarjetas{
    var dest=""
    var imp=0
    var ocupa=0
    //estado 1=Colgado, para cualquier otro no lo esta
    var colgado= 1
    
    method estaColgado(){return colgado==1}
    method estaColgado(_alpiso){colgado=_alpiso}
    
    method destinatario(_destinatario){ dest=_destinatario}
    method destinatario()=dest
    
    method importancia(_importancia){ imp = _importancia}
    method importancia()= imp

    method lugaresArbol()=ocupa
}

class Adornos{
    var peso=0
    var cSup=0
    var destinatario=null
    
    //estado 1=Colgado, para cualquier otro no lo esta
    var colgado= 1
    
    method estaColgado(){return colgado==1}
    method estaColgado(_alpiso){colgado=_alpiso}
    
    method destinatario()= destinatario
    
    
    method pesoBase(_peso){ peso=_peso }
    method pesoBase()=peso
    
    method coefSup(_coef){cSup=_coef}
    method coefSup()=cSup
    
    method importancia()= cSup*peso
    
    method lugaresArbol(){
   	 if (peso<=3)
   	  {return peso}
   		 else
   			 {return 3}
    }
}

class Figuras {

    var conjAdornos=[]
    var destinatario=null
    //estado 1=Colgado, para cualquier otro no lo esta
    var colgado= 1
    
    method estaColgado(){return colgado==1}
    method estaColgado(_alpiso){colgado=_alpiso}
    
    method destinatario()=destinatario
    
    method adorno(_adorno){
   	 conjAdornos.add(_adorno)
    }
    
    method adorno(){ return conjAdornos}
    
    method importancia(){
   	 conjAdornos.map({ adorno => adorno.importancia() })
   	 return conjAdornos.max()
    }
    
    method lugaresArbol()= conjAdornos.fold(1,{acum,ocupar=>acum+ocupar.lugaresArbol()})
    
}

class EstrellaDeBelen {
	var ocupa = 1
	var imp = 10
	var conjDest = []
    var colgado= 1
    
    method estaColgado(){return colgado==1}
    	 
	method lugaresArbol() = ocupa
	method importancia()= imp
	method destinatario() = conjDest
	method destinatario(_destinatario){
    	conjDest.add(_destinatario)
	}

}


