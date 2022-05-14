import std/times, json, algorithm
import ../bindTypes/apiType

# type
#   A = object of RootObj
#   B = object of A
#     f: int

# let a: ref A = new(B)
# assert $$a[] == "{}" # not "{f: 0}"

# # unmarshal
# let c = to[B]("""{"f": 2}""")
# assert typeof(c) is B
# assert c.f == 2

proc formSorter*(jsonString: JsonNode) =
  let jsonArray = %* jsonString 

  echo jsonArray
  var multiData = newSeq[FormData]()

  for item in jsonArray.items:
    let sDate = item["start_date"].getStr
    let eDate = item["end_date"].getStr

    let date1 = parse(sDate, "yyyy-MM-dd HH:mm:ss")
    let date2 = parse(eDate, "yyyy-MM-dd HH:mm:ss")

    var dates = @[date1, date2]
    sort(dates)

    let singleData = FormData(startDate: dates[0], endDate: dates[1])
    
    multiData.add(singleData)

    echo multiData


