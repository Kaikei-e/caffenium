import std/times, json, sequtils
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
    debugEcho item

    let sDate = item["start_date"].getStr
    let eDate = item["end_date"].getStr

    let parsedSDate = parse(sDate, "yyyy-MM-dd HH:mm:ss")
    let parsedEDate = parse(eDate, "yyyy-MM-dd HH:mm:ss")

    let singleData = FormData(startDate: parsedSDate, endDate: parsedEDate)
    
    multiData.add(singleData)

    echo multiData


