// This query links each student to their teachers via the courses they’re enrolled in, showing student-teacher relationships, with enrollment details.
MATCH (s:Student)-[enroll_rel:HAS_ENROLLED]->(:Enrollment)-[course_rel:ENROLLED_IN_COURSE]->(c:Course)
MATCH (c)<-[teach_rel:TEACHES]-(t:Teacher)
RETURN s.name AS Student, 
       c.title AS Course, 
       t.name AS Teacher,
       enroll_rel.year AS Year
ORDER BY Student, Year DESC, Course
