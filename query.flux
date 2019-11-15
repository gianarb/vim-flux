l = "location"

from(bucket: "gianarb")
    |> range(start: -10y)
    |> drop(columns: [l])
