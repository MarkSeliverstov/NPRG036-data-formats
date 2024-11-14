// This query retrieves each department, the courses they offer, and calculates the average grade of students enrolled in each course, including course popularity.
MATCH (d:Department)-[offers_rel:OFFERS]->(c:Course)
MATCH (c)<-[:ENROLLED_IN_COURSE]-(e:Enrollment)
WITH d.name AS Department, c.title AS Course, avg(e.grade) AS AverageGrade, offers_rel.popularity AS CoursePopularity
RETURN Department, 
       Course, 
       AverageGrade,
       CoursePopularity
ORDER BY CoursePopularity DESC, AverageGrade DESC
