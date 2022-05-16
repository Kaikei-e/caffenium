import std/tables
import times
import ../bindTypes/caffeStructs

proc makeDecaySumList*(decays: seq[TheDecay]): Table[DateTime, float64] =

  var summedResult = initTable[DateTime, float64]()

  for item in decays:
    # echo item.timeline
    let tTmp = item.timeline
    summedResult[tTmp] = item.caffeineTransition

  summedResult
  # decays