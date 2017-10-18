Actualidad universitaria

Primera parte: los estudiantes
En el sistema educativo universitario un integrante fundamental es el alumno. A lo largo de
su recorrido institucional va viviendo experiencias que moldean su perfil profesional. En
nuestro sistema informático, de cada uno de ellos se conoce el nombre, una actitud
destacada, un índice de motivación y un conjunto de recuerdos significativos.
Por ejemplo:
cachito = Alumno "Estanislao Pereira" "buena
onda" 15 ["conoci la facultad", "aprobe mi
primer examen", "hice un hola mundo que
funcionaba", "conoci a julia"]
actitudesFrecuentes = ["buena onda",
"predispuesto", "indiferente", …]
Se quiere poder hacer
1) Averiguar si un alumno tiene algún recuerdo significativo que comience con "aprobe"
2) Obtener cómo queda el alumno luego de incrementar su motivación en un 10%
3) Cambiar la actitud de un alumno, en función de la actitud actual, siguiendo el orden
de las actitudes frecuentes que se conocen.
4) Predecir si un estudiante será un buen profesional, teniendo en cuenta sus
recuerdos significativos y su motivación. (Inventar una forma apropiada)
5) Vivir una experiencia, de manera que, dependiendo de cómo está, y a partir de otros
parámetros, pueda agregar un recuerdo significativo, modificar su actitud, alterar su
motivación u otros efectos. Hacerlo según la creatividad personal, utilizando
funciones ya definidas y contemplando al menos 4 casos diferentes (entre ellos, que
si motivacion es 0 o su actitud es "indiferente" no lo afecte en nada)
El tipo de la función debe ser: e xperiencia :: ... -> Alumno -> Alumno

Segunda parte: el contexto social
Es de vital importancia tener en cuenta el contexto en el cual se desarrolla la actividad
universitaria, tanto en lo que hace a la infraestructura, la calidad académica, la situación
social, etc. De lo variado y complejo que puede ser, en nuestro sistema se destacan
algunas situaciones y se representa su nivel con un indicador numérico.
Por ejemplo:
contextoHipotetico = [("aumento salarial", 30.0), ("presupuesto", 2000.0), ("represion de la
protesta social", 1.18), ("inflacion", 35.5), … ]
1) Obtener el indicador correspondiente a una situación en un determinado contexto
por ejemplo, en este caso el indicador de “inflacion” es 35.5.

Tercera parte: los docentes
Así como su rol típico es mediar entre el conocimiento y los estudiantes, en un sentido
amplio actúa como mediador con todo el contexto social y el sistema universitario.
Cada docente asume una determinada acción frente a sus alumnos en función de su forma
de apreciación del contexto.
Por ejemplo:
tito = Profesor “Perez”
laInflacionEsMayorAlAumento paro
luci = Profesor “Garcia” bajoPresupuesto
tomarParcialConProblemasDeActualidad
indi = Profesor “Gonzalez”
paseLoQuePase noHacerNada
otro = … (que haga una movilizacion al
ministerio de educacion)
Las acciones posibles de los docentes
están incompletas, pero se sabe que
todas generan una experiencia en sus alumnos.
paro alumno = experiencia … alumno
movilizacion lugar alumno = experiencia … alumno
claseNormal tema alumno = experiencia … alumno
clasePublica tema alumno = ((experiencia … ).claseNormal tema) alumno
noHacerNada alumno = alumno
tomarParcialConProblemasDeActualidad alumno = experiencia ... alumno
1) Hacer la función unDiaEspecial que recibiendo un determinado contexto, un conjunto
de estudiantes y un docente, el docente analice el contexto a su manera, y si se
verifica su apreciación, realice su acción sobre todos los alumnos
2) Terminar de definir las funciones de los ejemplos.
3) Incluir un nuevo docente, utilizando una expresión lambda
4) Dado un conjunto de docentes, un único contexto y un mismo grupo de estudiantes,
obtener al final de haber pasado un dia especial con todos los docentes cuántos
buenos profesionales habría entre los estudiantes. Mostrar un ejemplo de invocación
y respuesta
5) ¿Qué sucede si hay un estudiante con una lista infinita de recuerdos significativos?
Encontrar ejemplos en las funciones anteriores donde sucedan diferentes cosas.

SOLUCION
data Alumno = Alumno {nombre::String, actitud::String, motivacion::Double,
recuerdos::[String]} deriving Show
cachito = Alumno "Estanislao Pereira" "buena onda" 15 ["conoci la facultad",
"aprobe mi primer examen", "hice un hola mundo que funcionaba", "conoci a julia"]
actitudesFrecuentes = ["buena onda", "predispuesto", "indiferente"]
contextoHipotetico = [("aumento salarial", 30.0), ("presupuesto", 2000.0),
("represion de la protesta social", 1.18), ("inflacion", 35.5)]
data Profesor = Profesor {apellido::String, apreciacion::[(String, Double)]->Bool,
accion::Alumno->Alumno}
tito = Profesor "Perez" laInflacionEsMayorAlAumento paro
luci = Profesor "Garcia" bajoPresupuesto tomarParcialConProblemasDeActualidad
indi = Profesor "Gonzalez" paseLoQuePase noHacerNada
--otro = â€¦ (que haga una movilizacion al ministerio de educacion)
-- Primera parte
-- 1
algunRecuerdoAprobacion alumno = any ((=="aprobe").take 6) (recuerdos alumno)
-- 2
incrementarMotivacion (Alumno nombre actitud motivacion recuerdos) = Alumno nombre
actitud (motivacion*1.1) recuerdos
-- 3
cambiarActitud (Alumno nombre actitud motivacion recuerdos) = Alumno nombre
(siguienteActitud actitud) motivacion recuerdos
siguienteActitud actitud
| posicion == (length actitudesFrecuentes - 1) = head actitudesFrecuentes
| otherwise = actitudesFrecuentes !! (posicion+1)
where posicion = encontrarPosicion actitud actitudesFrecuentes 0
encontrarPosicion actitud [_] pos = pos
encontrarPosicion actitud (x:xs) pos
| actitud == x = pos
| otherwise = encontrarPosicion actitud xs (pos+1)
-- 4
buenProfesional alumno = algunRecuerdoAprobacion alumno && motivacion alumno > 30
-- 5
experiencia recuerdosNuevos cambioDeMotivacion (Alumno nombre actitud motivacion
recuerdos)
| (motivacion == 0 || actitud == "indiferente") = (Alumno nombre actitud
motivacion recuerdos)
| otherwise = Alumno nombre actitud (cambioDeMotivacion motivacion)
(recuerdos++recuerdosNuevos)
-- Segunda parte
-- 1
obtenerIndicador tematica contexto = (snd.head.filter ((==tematica).fst)) contexto
-- Tercera parte
-- 1
unDiaEspecial contexto estudiantes docente
| (apreciacion docente) contexto = map (accion docente) estudiantes
| otherwise = estudiantes
-- 2
paro alumno = experiencia ["paro"] (*0.8) alumno
movilizacion lugar alumno = experiencia ["movilizacion"] id alumno
claseNormal tema alumno = experiencia [] (+10.0) alumno
clasePublica tema alumno = ((experiencia ["clase publica"] (*1.5)).claseNormal
tema) alumno
noHacerNada alumno = alumno
tomarParcialConProblemasDeActualidad alumno = experiencia [] (+1.0) alumno
laInflacionEsMayorAlAumento contexto = (obtenerIndicador "inflacion" contexto) >
(obtenerIndicador "aumento salarial" contexto)
bajoPresupuesto contexto = (obtenerIndicador "presupuesto" contexto) < 1000.0
paseLoQuePase _ = True
-- 4
cuantosSeranBuenosProfesionales contexto docentes estudiantes = (length.filter
buenProfesional) (foldl (unDiaEspecial contexto) estudiantes docentes)