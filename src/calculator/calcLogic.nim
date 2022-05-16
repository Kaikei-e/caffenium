import json
import formSorter
import ../bindTypes/apiType
import ../bindTypes/caffeStructs
import coreCalculator
import sumDecayList

proc decayCalculator*(caffeData: JsonNode): seq[TheDecay] =
  var decayData: seq[TheDecay]

  let sortedData = formSorter(caffeData)

  for item in sortedData:
    decayData = coreCalculator(item)

    # echo item

  let dd = makeDecaySumList(decayData)
  #echo dd

  decayData
