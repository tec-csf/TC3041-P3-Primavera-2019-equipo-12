#Rafael Díaz Medina A01024592
#Juan Jose Santos A010229009
#Ingresar los nodos
LOAD CSV WITH HEADERS FROM 'file:///Idnodes.csv' AS row 
WITH toInteger(row.Id) AS Id
MERGE (a:Patentador {Id: Id})
RETURN count(a)


#Ingresar La relaciones
LOAD CSV WITH HEADERS FROM 'file:///Patents.csv' AS row 
WITH toInteger(row.Id1) AS Id1, toInteger(row.Id2) AS Id2
MATCH (a1:Patentador {Id: Id1})
MATCH (a2:Patentador {Id: Id2})
MERGE (a1)-[Patentacion:Patents]->(a2)
RETURN count(Patentacion)
