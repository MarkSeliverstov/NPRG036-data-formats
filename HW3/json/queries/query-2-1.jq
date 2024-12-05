.students | group_by(.programEnrollment.program.programName) | map({
  program: .[0].programEnrollment.program.programName,
  count: length,
  years: map(.programEnrollment.year) | sort,
  student_names: map(.name)
})