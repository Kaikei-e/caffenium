import json
import formSorter
import ../bindTypes/apiType
import coreCalculator

proc decayCalculator*(caffeData: JsonNode): seq[FormData] =

  let sortedData = formSorter(caffeData)

  multipleCalc(sortedData)

  sortedData
