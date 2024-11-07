// Find Students with Their Programs and Enrolled Courses
MATCH (s:Student)-[:ENROLLED_IN_PROGRAM]->(p:Program),
      (s)-[:HAS_ENROLLED]->(e:Enrollment)-[:ENROLLED_IN_COURSE]->(c:Course)
RETURN s.name AS Student, 
       p.name AS Program, 
       c.title AS Course, 
       e.grade AS Grade
ORDER BY s.name
