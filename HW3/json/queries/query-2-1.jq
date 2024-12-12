."@graph" | 
    group_by(select(."@type" == "ex:Program") | ."@id") | 
    map({
      program: (.[0] | select(."@type" == "ex:Program") | .programName),
      students: [
        ."@graph"[] | 
        select(."@type" == "ex:Student" and .enrolledIn == (.[0] | select(."@type" == "ex:Program") | ."@id")) |
        .name
      ]
    })