import ../bindTypes/apiType
import ../bindTypes/caffeStructs

proc coreCalculator*(sinlgeFormData: FormData): TheDecays =
  result: TheDecays

  var totalCaffeine : float64

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

    count += 1

    toTmax = toTmax * Tmax
    dateAt = dateAt + initDuration(minutes = 1)

    if toTmax > totalCaffeine :
      caffeStruct.caffeineTransition = totalCaffeine
      caffeStruct.timeline = dateAt
      break

    caffeStruct.caffeineTransition = toMax
    caffeStruct.timeline = dateAt

    result.add(caffeStruct)

  let decayRate = 0.99807

  var toZero = totalCaffeine
  dateAt = result[len(caffeStructs) - 1].timeline

  var count2 = 0

  while toZero > 5.00000:
    var caffeDecay: TheDecay

    dateAt = dateAt + initDuration(minutes = 1)
    caffeDecay.timeline = dateAt

    toZero = toZero * decayRate
    caffeDecay.caffeineTransition = toZero

    result.add(caffeDecay)

  result
