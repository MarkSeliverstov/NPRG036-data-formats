MATCH (s:Student)-[:ENROLLED_IN_PROGRAM]->(p:Program)
RETURN p.name AS Program, AVG(p.duration) AS AvgDuration

