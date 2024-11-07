CREATE (s1:Student {name: "Alice"})
CREATE (s2:Student {name: "Bob"})
CREATE (s3:Student {name: "Charlie"})

CREATE (t1:Teacher {name: "Dr. Smith"})
CREATE (t2:Teacher {name: "Dr. Brown"})
CREATE (t3:Teacher {name: "Prof. Miller"})

CREATE (c1:Course {code: "CS101", title: "Introduction to Computer Science", credits: 4})
CREATE (c2:Course {code: "CS102", title: "Data Structures", credits: 3})
CREATE (c3:Course {code: "CS103", title: "Algorithms", credits: 4})

CREATE (d1:Department {name: "Computer Science Department", location: "Building A"})
CREATE (d2:Department {name: "Mathematics Department", location: "Building B"})

CREATE (p1:Program {name: "Computer Science", duration: 4})
CREATE (p2:Program {name: "Data Science", duration: 2})
CREATE (p3:Program {name: "Mathematics", duration: 3})

MERGE (s1)-[:ENROLLED_IN]->(c1)
MERGE (s2)-[:ENROLLED_IN]->(c2)
MERGE (s3)-[:ENROLLED_IN]->(c1)

MERGE (t1)-[:TEACHES]->(c1)
MERGE (t2)-[:TEACHES]->(c2)
MERGE (t3)-[:TEACHES]->(c3)

MERGE (t1)-[:BELONGS_TO]->(d1)
MERGE (t2)-[:BELONGS_TO]->(d1)
MERGE (t3)-[:BELONGS_TO]->(d2)

MERGE (s1)-[:ENROLLED_IN_PROGRAM]->(p1)
MERGE (s2)-[:ENROLLED_IN_PROGRAM]->(p2)
MERGE (s3)-[:ENROLLED_IN_PROGRAM]->(p3)

