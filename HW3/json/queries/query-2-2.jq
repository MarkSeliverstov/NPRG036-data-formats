.students | {
  enrollment_patterns: [
    .[] | {
      student: .name,
      pattern: [.courseEnrollments[] | {
        semester,
        year,
        grade
      }] | sort_by(.year, .semester)
    }
  ],
  semester_stats: [
    .[] | .courseEnrollments[] | {semester, year}
  ] | group_by(.semester) | map({
    semester: .[0].semester,
    count: length,
    years: map(.year) | unique | sort
  })
}