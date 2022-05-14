import ../bindTypes/apiType
import ../bindTypes/caffeStructs

proc coreCalculator*(sinlgeFormData: FormData): TheDecays =
  result: TheDecays

  var totalCaffeine : int

  if sinlgeFormData.method1or2 == 2 :
    totalCaffeine = sinlgeFormData.caffeineMg * sinlgeFormData.drinkAmountMl / 100
  else:
    totalCaffeine = sinlgeFormData.caffeineMg

  let Tmax = 1.1333
  var toMax = 1.0
  var dateAt = sinlgeFormData.startDate

  var count = 0
  while toMax < 10 * totalCaffeine :
    var caffeStruct : TheDecay

    if count == 0 :
      caffeStruct.caffeineTransition = toMax
      caffeStruct.timeline = dateAt

      result.add(caffeStruct)

      continue

    toTmax = toTmax * Tmax
    dateAt = dateAt + initDuration(minutes = 1)


