import json
import formSorter
import ../bindTypes/apiType

proc decayCalculator*(caffeData: JsonNode): seq[FormData] =

  let sortedData = formSorter(caffeData)

  sortedData
