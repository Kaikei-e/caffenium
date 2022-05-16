import json
import std/tables, std/sequtils
import times
import formSorter
import ../bindTypes/caffeStructs
import coreCalculator
import sumDecayList

proc decayCalculator*(caffeData: JsonNode): seq[TheDecay] =
  var decayData: seq[TheDecay]
  var summedResult = initTable[DateTime, float64]()

  let sortedData = formSorter(caffeData)

  var tmpSeq = newSeq[TheDecay]()
  for item in sortedData:
    tmpSeq = coreCalculator(item)
    decayData.add(tmpSeq)

    # echo item

  

  let dd = makeDecaySumList(decayData)
  #echo dd

  decayData
