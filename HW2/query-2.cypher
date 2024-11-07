MATCH (t:Teacher)-[:TEACHES]->(c:Course)
RETURN t.name AS Teacher, c.title AS Course, c.credits AS Credits
