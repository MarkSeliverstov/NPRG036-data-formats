// This query retrieves each department, the courses they offer, and calculates the average grade of students enrolled in each course.
MATCH (d:Department)-[:OFFERS]->(c:Course)
MATCH (c)<-[:ENROLLED_IN_COURSE]-(e:Enrollment)
WITH d.name AS Department, c.title AS Course, avg(e.grade) AS AverageGrade
RETURN Department,
       Course,
       AverageGrade
ORDER BY AverageGrade DESC
