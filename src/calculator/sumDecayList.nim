import std/tables
import ../bindTypes/caffeStructs

proc makeDecaySumList(decays: seq[TheDecay]): seq[TheDecay] =

  var summedResult = toTable()

  for item in decays:
    echo decays
