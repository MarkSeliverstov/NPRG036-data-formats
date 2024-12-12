.departments[] as $dept | {
  department: $dept.name,
  avg_popularity: ($dept.courses | map(.popularity) | add / length),
  courses: $dept.courses[] | {
    title: .title,
    popularity: .popularity,
    relative_to_avg: (
      if .popularity > ($dept.courses | map(.popularity) | add / length) then "above"
      elif .popularity < ($dept.courses | map(.popularity) | add / length) then "below"
      else "equal"
      end
    )
  }
}