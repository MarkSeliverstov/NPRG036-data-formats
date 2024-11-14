// This query finds teachers, the department they belong to, and lists all the courses they teach, grouped by department and sorted by average rating.
MATCH (t:Teacher)-[:BELONGS_TO]->(d:Department)
MATCH (t)-[teach_rel:TEACHES]->(c:Course)
RETURN d.name AS Department, 
       t.name AS Teacher, 
       collect(c.title) AS CoursesTaught,
       avg(teach_rel.rating) AS AverageRating
ORDER BY Department, AverageRating DESC
