.departments[] | select(.teachers[].teaches | length > 1) | {
  department: .name,
  teachers: [
    .teachers[] | select(.teaches | length > 1) | {
      name: .teacherName,
      courses: .teaches | length,
      avg_rating: (.teaches | map(.rating) | add / length)
    }
  ]
}