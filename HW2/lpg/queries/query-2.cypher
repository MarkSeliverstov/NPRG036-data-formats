// This query retrieves each student, the program they are enrolled in, and calculates their average grade across enrolled courses.
MATCH (s:Student)-[:ENROLLED_IN_PROGRAM]->(p:Program)
MATCH (s)-[:HAS_ENROLLED]->(e:Enrollment)
RETURN s.name AS Student,
       p.name AS Program,
       avg(e.grade) AS AverageGrade
ORDER BY AverageGrade DESC
