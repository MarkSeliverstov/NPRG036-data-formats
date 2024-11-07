// This query links each student to their teachers via the courses they’re enrolled in, showing student-teacher relationships.
MATCH (s:Student)-[:HAS_ENROLLED]->(:Enrollment)-[:ENROLLED_IN_COURSE]->(c:Course)
MATCH (c)<-[:TEACHES]-(t:Teacher)
RETURN s.name AS Student, 
       c.title AS Course, 
       t.name AS Teacher
ORDER BY Student, Course
