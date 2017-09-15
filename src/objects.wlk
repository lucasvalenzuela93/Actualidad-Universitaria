class UserException inherits wollok.lang.Exception {
constructor ( _mensaje ) = super ( _mensaje )
}


class ArbolNavidad {
	var edadArbol=0
	var tamTronco=0
	var conjCosas=[]


	method vejez()= edadArbol
	method vejez(_edadArbol){ edadArbol = _edadArbol}
	
	
	method tamanioTronco()= tamTronco
	method tamanioTronco(_tamTronco){ tamTronco= _tamTronco}
	
	
	method capacidad()= tamTronco*edadArbol
	
	method elementos()= conjCosas
	
	method elementos(_objeto) {
        if ( self.capacidad() <= conjCosas.sum({lugar => lugar.lugaresArbol() } ) ){
			
            throw new UserException ( "El arbol esta lleno" )
        }
        	conjCosas.add(_objeto)
          
    }

    method objSumanImp()=   	
    	conjCosas.filter({ imp => imp.estaColgado()})

	method importancia()= self.objSumanImp().sum({imp => imp.importancia()})
    
    
    method promImportancia()= self.importancia() / self.objSumanImp().size()
    
    method objMayorImp()=
    	conjCosas.filter({imp => imp.importancia() > self.promImportancia()})
    
    method cantMayorImp() = self.objMayorImp().size()
	
	method elimVoluminosos()=
			conjCosas.forEach({objeto => if (objeto.lugaresArbol() > 5 ){conjCosas.remove(objeto)}})
	
	
	// mapeo de los articulos a destinatarios
	method mapDestinatario()=conjCosas.flatMap({adorno1 => adorno1.destinatario()})

	//filtrar solo un destinatario (Coleccion)
	method colMenDest(destinatario1)= self.mapDestinatario().filter({destinatario2 =>  destinatario2 == destinatario1})
	
	//cantidad de veces mencionado
	method cantMismDest(destinatario)=self.colMenDest(destinatario).size()
	
	//Condicion
	method menMayor(dest1,dest2)= self.cantMismDest(dest1)>self.cantMismDest(dest2)
	//Sacar repetidos
	method destSinRep()= self.mapDestinatario().asSet()
	//Destinatarios!!! 
	method destinatarios() = self.destSinRep().sortedBy({dest1,dest2=>self.menMayor(dest1,dest2)})
	
	}	    
	
class Regalos{
	var conjdest = []
	var ocupa = 1
	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
		
	method destinatario(_destinatario){ conjdest.add(_destinatario)}
	
	method destinatario(){ return conjdest}
	
	method importancia()= conjdest.size()*2
		
	method lugaresArbol()= ocupa 
}

class Tarjetas{
	var dest
	var imp=0
	var ocupa=0
	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatario(_destinatario){dest=_destinatario}
	method destinatarios()=[dest]
	
	method importancia(_importancia){ imp = _importancia}
	method importancia()= imp

	method lugaresArbol()=ocupa
} 

class Adornos{
	var peso=0
	var cSup=0

	
	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatarios()= []
	
	
	method pesoBase(_peso){ peso=_peso }
	method pesoBase()=peso
	
	method coefSup(_coef){cSup=_coef}
	method coefSup()=cSup
	
	method importancia()= cSup*peso
	
	method lugaresArbol()=	3.min(peso)
		 
}

class Figuras {

	var conjAdornos=[]

	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado()= colgado==1 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatarios()=[]
	
	method adorno(_adorno){ 
		conjAdornos.add(_adorno)
	}

	method adorno()=conjAdornos
	
	// cambiar importancia. max hace el map.
	method mapImportancia()=conjAdornos.map({adorno1 => adorno1.importancia()})
	method importancia()= self.mapImportancia().max()
	//----------------------------------------------------------------------
	
	method lugaresArbol()= conjAdornos.sum({ocupar=> ocupar.lugaresArbol()})
	
}

 object estrellaDeBelen {

    var conjDest = []
	var colgado= 1
	
	method estaColgado()= colgado==1 
         
    method lugaresArbol() = 1
    method importancia()= 10
    method destinatarios() = conjDest
    method destinatarios(_destinatario){
        conjDest.add(_destinatario)
    }

}




