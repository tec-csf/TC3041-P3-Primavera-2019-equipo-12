#Rafael Díaz Medina A01024592
#Juan Jose Santos A01022009
from neo4j import GraphDatabase

uri = "bolt://localhost:11001" #Mi computadora no puede abrir ciertos puertos y solo dio permiso en ese
                               #Lo Reconoce como un puerto seguro
driver = GraphDatabase.driver(uri, auth=("neo4j", "nayra161"))

def regresador(tx):
    return tx.run("MATCH (a:Patentador)-[r:Patents]->() "
                         "WITH a, count(r) as cont"
                         "Return a.Id, cont"
                         "ORDER BY cont DESC LIMIT 1").values()

def regresador1(tx):
    return tx.run("MATCH (:Patentador {Id: 3858241})-[Patents]-(Patento) "
                         "RETURN COUNT(Patents)").values()


def regresador2(tx):
    return tx.run("MATCH (:Patentador {Id: 3858241})-[Patents]-(Patentados)"
                         "Return Patentados.Id").values()


with driver.session() as session:
    
    
    result = regresador(session)
    print(result)

    result = regresador1(session)
    print(result)

    result = regresador2(session)
    print(result)
