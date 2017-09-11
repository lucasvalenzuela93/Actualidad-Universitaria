class ArbolNavidad {
    var edadArbol=0
    var tamTronco=0
    var conjCosas=[]


    method vejez()= edadArbol
    method vejez(_edadArbol){ edadArbol = _edadArbol}
    
    
    method tamanioTronco()= tamTronco
    method tamanioTronco(_tamanoTronco){ tamTronco= _tamanoTronco}
    
    
    method capacidad()= tamTronco*edadArbol
    
    method elementos()= conjCosas
    
    method agregar(_elemento) {
   	 if ( self.capacidad() <= conjCosas.fold(0,{acum, lugar => acum + lugar.lugaresArbol() } ) ) {
   		 throw new UserException ( "El arbol esta lleno" )
   	 }    
   	 conjCosas.add(_elemento)
    }

    
	method objSumanImp()=  	 
   	 conjCosas.filter({ imp => imp.estaColgado()})

    method importancia()= self.objSumanImp().fold(0,{acum, imp => acum + imp.importancia()})
    
    
	method promImportancia()= self.importancia() / self.objSumanImp().size()
    
	method objMayorImp()=
   	 conjCosas.filter({imp => imp.importancia() > self.promImportancia()})

     method cantMayorImp() = self.objMayorImp().size()
	
    
    method elimVoluminosos()=
   		 conjCosas.forEach({objeto => if (objeto.lugaresArbol() > 5 ){conjCosas.remove(objeto)}})
    
    // se podra "unir metodos"? para que queden una menor cantidad
	// mapeo de los objetos a destinatarios
	method mapDestinatario()=conjCosas.flatMap({adorno1 => adorno1.destinatario()})

	//filtrar solo un destinatario 
	method colMenDest(_x)= self.mapDestinatario().filter({y => y == _x})
	
	//cantidad de veces mencionado
	method cantMismDest(_y)=self.colMenDest(_y).size()
	
	//Condicion
	method menMayor(_mayor,_menor)= self.cantMismDest(_mayor) >self.cantMismDest(_menor)
	
	//Sacar repetidos
	method destSinRep()= self.mapDestinatario().asSet()
	
	//Destinatarios!!! 
	method destinatario() = self.destSinRep().sortedBy({x,y=>self.menMayor(x,y)})	
 }

class UserException inherits wollok.lang.Exception {
constructor ( _mensaje ) = super ( _mensaje )
}


class Regalos{
    var conjdest = []
    var ocupa = 1
    //estado 1=Colgado, para cualquier otro no lo esta
    var colgado= 1
    
    method estaColgado()= colgado==1
    method estaColgado(_alpiso){colgado=_alpiso}
   	 
    method destinatario(_destinatario){ conjdest.add(_destinatario)}
    
    method destinatario()= return conjdest
    
    method importancia()= conjdest.size()*2
   	 
   	method lugaresArbol()= ocupa
}

class Tarjetas{
    var dest=[]
    var imp=0
    var ocupa=0
    //estado 1=Colgado, para cualquier otro no lo esta
    var colgado= 1
    
    method estaColgado()= colgado == 1
    method estaColgado(_alpiso){colgado=_alpiso}
    
    //size=0 => agrega,sino lo deja como esta
    method destinatario(_destinatario){if (dest.size()<1) {dest.add(_destinatario)}}
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
    
    method estaColgado()= colgado==1
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
    
    method estaColgado()= colgado==1
    method estaColgado(_alpiso){colgado=_alpiso}
    
    method destinatario()=destinatario
    
    method adorno(_adorno){
   	 conjAdornos.add(_adorno)
    }
    
    method adorno(){ return conjAdornos}
    
	// mapear los adornos por sus importancias
	method mapImportancia()=conjAdornos.map({adorno1 => adorno1.importancia()})
	method importancia()= self.mapImportancia().max()
    
    method lugaresArbol()= conjAdornos.fold(1,{acum,ocupar=>acum+ocupar.lugaresArbol()})
    
}

class EstrellaDeBelen {
	var ocupa = 1
	var imp = 10
	var conjDest = []
    var colgado= 1
    
    method estaColgado()= colgado==1
    	 
	method lugaresArbol() = ocupa
	method importancia()= imp
	method destinatario() = conjDest
	method destinatario(_destinatario){
    	conjDest.add(_destinatario)
	}

}


