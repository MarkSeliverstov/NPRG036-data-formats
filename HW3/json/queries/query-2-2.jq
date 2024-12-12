{
  enrollment_patterns: [
    ."@graph"[] | 
    select(."@type" == "ex:Student") | {
      student: .name,
      program: (."@graph"[] | select(."@type" == "ex:Program" and ."@id" == .enrolledIn) | .programName),
      enrollments: [
        ."@graph"[] | 
        select(."@type" == "ex:Enrollment" and .enrolledIn == ."@id") |
        {
          course: .course,
          grade: .grade,
          date: .enrolledOn
        }
      ]
    }
  ],
  program_stats: [
    ."@graph"[] | 
    select(."@type" == "ex:Program") | {
      program: .programName,
      duration: .duration,
      student_count: (
        ."@graph"[] | 
        select(."@type" == "ex:Student" and .enrolledIn == ."@id") | 
        length
      )
    }
  ]
}