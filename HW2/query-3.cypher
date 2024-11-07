MATCH (s:Student)-[:ENROLLED_IN_PROGRAM]->(p:Program)
RETURN s.name AS Student, p.name AS Program
