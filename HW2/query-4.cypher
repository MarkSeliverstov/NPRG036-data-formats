MATCH (s:Student)-[:ENROLLED_IN]->(c:Course)
RETURN s.name AS Student, c.title AS Course
