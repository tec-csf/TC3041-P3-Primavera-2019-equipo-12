#Rafael Díaz Medina A01024592
#Juan Jose Santos A01022009
#Queries
#Para las pruebas no pudimos meter todos los datos ya que mi computadora no cuenta 
#con los recursos necesarios para insertar los 3.7 millones de datos entonces probamos con 1196 nodos
#y esos nodos generaron 999 Relaciones 

#1 Con esta querie pasamos un Id y vemos los Id de sus patentados
MATCH (:Patentador {Id: 3858241})-[Patents]-(Patentados)
Return Patentados.Id

#2 Con esta querie pasamos un Id y vemos a cuantos patentados tiene
MATCH (:Patentador {Id:3858241})-[Patents]-(Patento)
RETURN COUNT(Patents)

#3 Con esta querie vemos que patentador tiene más patentados y cuantos son
MATCH (a:Patentador)-[r:Patents]->()
 WITH a, count(r) as cont
 Return a.Id, cont
 ORDER BY cont DESC LIMIT 1