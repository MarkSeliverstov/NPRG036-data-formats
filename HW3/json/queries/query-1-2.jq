.departments[] | select(.name != null) | {
  department: .name,
  teachers: [
    .teachers[] | {
      name: .teacherName,
      courses: [.teaches[] | {course: .course."@id", rating: .rating}]
    }
  ],
  avg_rating: (
    [.teachers[].teaches[].rating] | add / length
  )
}