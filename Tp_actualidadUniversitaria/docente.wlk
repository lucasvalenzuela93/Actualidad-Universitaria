import persona.*
import ContextoSocial.*
class Docente inherits Persona {
	var alumnos=[]
	var contexto
	var acciones=[]
	
	constructor(_nombre,_contexto,_accion)=super(_nombre){
		nombre=_nombre
		contexto=_contexto
		acciones=_accion
	}
	
	method acciones()=acciones
	method acciones(_accion){acciones.add(_accion)}
	
	method alumnos()=alumnos
	method alumnos(_alumno){alumnos.add(_alumno)}
	
	method unDiaEspecial(_contexto){
		if (self.estaDeHumor(_contexto)){
			 alumnos.map({_alumno=>_alumno.motivacion() === _contexto.nivel()})
		}
	}
	
	method estaDeHumor(_contexto){
		return _contexto.nivel() < 20
	}
}
