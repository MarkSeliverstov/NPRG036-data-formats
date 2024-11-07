MATCH (n) DETACH DELETE n;

CREATE (university:Organization {label: "University"});
CREATE (dataset:Dataset {
    title: "Student Information System",
    alternative: "SIS",
    description: "A simple student information system dataset",
    publisher: "University"
});

CREATE (program1:Program {name: "Computer Science", duration: 4});
CREATE (program2:Program {name: "Data Science", duration: 2});
CREATE (program3:Program {name: "Mathematics", duration: 3});

CREATE (dept1:Department {name: "Computer Science Department", location: "Building A"});
CREATE (dept2:Department {name: "Mathematics Department", location: "Building B"});
CREATE (dept3:Department {name: "Physics Department", location: "Building C"});

CREATE (course1:Course {code: "CS101", title: "Introduction to Computer Science", credits: 4});
CREATE (course2:Course {code: "CS102", title: "Data Structures", credits: 3});
CREATE (course3:Course {code: "CS103", title: "Algorithms", credits: 4});

CREATE (student1:Student {id: 1, name: "Alice", email: "student1@b.cz", phone: "+123456789"});
CREATE (student2:Student {id: 2, name: "Bob", email: "bob@b.cz", phone: "+987654321"});
CREATE (student3:Student {id: 3, name: "Charlie", email: "Charlie@a.cz", phone: "+123456789"});

CREATE (teacher1:Teacher {id: 1, name: "Dr. Smith", email: "smith@b.cz", phone: "+77777777"});
CREATE (teacher2:Teacher {id: 2, name: "Dr. Miller", email: "Miller@b.cz", phone: "+77888777"});
CREATE (teacher3:Teacher {id: 3, name: "Dr. Brown", email: "brown@a.cz", phone: "+123456789"});

CREATE (enrollment1:Enrollment {grade: 2, enrolledOn: date("2020-09-01"), completedOn: date("2021-01-01")});
CREATE (enrollment2:Enrollment {grade: 1, enrolledOn: date("2020-09-01"), completedOn: date("2021-01-01")});
CREATE (enrollment3:Enrollment {grade: 3, enrolledOn: date("2020-09-01"), completedOn: date("2021-01-01")});

MATCH (d:Dataset), (u:Organization {label: "University"})
CREATE (d)-[:PUBLISHED_BY]->(u);

MATCH (s1:Student {name: "Alice"}), (p1:Program {name: "Computer Science"})
CREATE (s1)-[:ENROLLED_IN_PROGRAM]->(p1);

MATCH (s2:Student {name: "Bob"}), (p2:Program {name: "Data Science"})
CREATE (s2)-[:ENROLLED_IN_PROGRAM]->(p2);

MATCH (s3:Student {name: "Charlie"}), (p3:Program {name: "Mathematics"})
CREATE (s3)-[:ENROLLED_IN_PROGRAM]->(p3);

MATCH (s1:Student {name: "Alice"}), (e1:Enrollment {grade: 2}), (c1:Course {code: "CS101"})
CREATE (s1)-[:HAS_ENROLLED]->(e1)-[:ENROLLED_IN_COURSE]->(c1);

MATCH (s2:Student {name: "Bob"}), (e2:Enrollment {grade: 1}), (c2:Course {code: "CS102"})
CREATE (s2)-[:HAS_ENROLLED]->(e2)-[:ENROLLED_IN_COURSE]->(c2);

MATCH (s3:Student {name: "Charlie"}), (e3:Enrollment {grade: 3}), (c3:Course {code: "CS103"})
CREATE (s3)-[:HAS_ENROLLED]->(e3)-[:ENROLLED_IN_COURSE]->(c3);

MATCH (t1:Teacher {name: "Dr. Smith"}), (d1:Department {name: "Computer Science Department"})
CREATE (t1)-[:BELONGS_TO]->(d1);

MATCH (t2:Teacher {name: "Dr. Miller"}), (d2:Department {name: "Mathematics Department"})
CREATE (t2)-[:BELONGS_TO]->(d2);

MATCH (t3:Teacher {name: "Dr. Brown"}), (d2:Department {name: "Mathematics Department"})
CREATE (t3)-[:BELONGS_TO]->(d2);

MATCH (t1:Teacher {name: "Dr. Smith"}), (c1:Course {code: "CS101"}), (c2:Course {code: "CS102"})
CREATE (t1)-[:TEACHES]->(c1), (t1)-[:TEACHES]->(c2);

MATCH (t2:Teacher {name: "Dr. Miller"}), (c3:Course {code: "CS103"})
CREATE (t2)-[:TEACHES]->(c3);

MATCH (t3:Teacher {name: "Dr. Brown"}), (c3:Course {code: "CS103"})
CREATE (t3)-[:TEACHES]->(c3);

MATCH (d1:Department {name: "Computer Science Department"}), (c1:Course {code: "CS101"})
CREATE (d1)-[:OFFERS]->(c1);

MATCH (d2:Department {name: "Mathematics Department"}), (c3:Course {code: "CS103"})
CREATE (d2)-[:OFFERS]->(c3);

MATCH (d3:Department {name: "Physics Department"}), (c2:Course {code: "CS102"})
CREATE (d3)-[:OFFERS]->(c2);
