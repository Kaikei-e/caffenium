import json
import formSorter
import ../bindTypes/apiType
import coreCalculator

proc decayCalculator*(caffeData: JsonNode): seq[FormData] =

  let sortedData = formSorter(caffeData)

  for item in sortedData:
    coreCalculator(item)

    echo item
  sortedData
