import std/times, json, algorithm
import ../bindTypes/apiType

proc formSorter*(jsonString: JsonNode) =
  let jsonArray = %* jsonString 

  echo jsonArray
  var multiData = newSeq[FormData]()

  for item in jsonArray.items:
    let sDate = item["start_date"].getStr
    let caffeine = item["caffeine_mg"].getInt
    let method1or2 = item["which_method"].getInt

    let dateStarted = parse(sDate, "yyyy-MM-dd HH:mm:ss")

    let singleData = FormData(startDate: dateStarted, caffeineMg: caffeine, method1or2: method1or2)
    
    multiData.add(singleData)

    echo multiData

  proc dateCmp(x, y: FormData): int =
    cmp(x.startDate, y.startDate)

  multiData.sort(dateCmp)

  echo multiData
  
