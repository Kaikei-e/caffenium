import std/tables
import times
import ../bindTypes/caffeStructs

proc makeDecaySumList*(decays: seq[TheDecay]): seq[TheDecay] =

  var summedResult = initTable[DateTime, float64]()

  for item in decays:
    echo item.timeline
    # summedResult[item.timeline] = item.caffeineTransition

  decays