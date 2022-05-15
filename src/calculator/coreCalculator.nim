import ../bindTypes/apiType
import ../bindTypes/caffeStructs
import times


proc coreCalculator*(sinlgeFormData: FormData): seq[TheDecay] =
  # result: newSeq[TheDecay]()
  var decayData = newSeq[TheDecay]()


  var totalCaffeine: float64

  if sinlgeFormData.method1or2 == 2 :
    totalCaffeine = float64(sinlgeFormData.caffeineMg) * float64(sinlgeFormData.drinkAmountMl) / 100.0
  else:
    totalCaffeine = float64(sinlgeFormData.caffeineMg)

  let Tmax = 1.1333
  var toMax = 1.0
  var dateAt = sinlgeFormData.startDate


  var count = 0

  while toMax < totalCaffeine + 1.0:
    count += 1

    var caffeStruct : TheDecay

    if count == 1 :
      caffeStruct.caffeineTransition = toMax
      caffeStruct.timeline = dateAt

      decayData.add(caffeStruct)

      continue


    toMax = toMax * Tmax
    dateAt = dateAt + initDuration(minutes = 1)

    if toMax > totalCaffeine:
      caffeStruct.caffeineTransition = totalCaffeine
      caffeStruct.timeline = dateAt
      break

    caffeStruct.caffeineTransition = toMax
    caffeStruct.timeline = dateAt

    decayData.add(caffeStruct)

  echo "calc1 was end"

  let decayRate = 0.99807

  var toZero = totalCaffeine

  dateAt = decayData[len(decayData) - 1].timeline

  while toZero > 5.00000:
    var caffeDecay: TheDecay

    dateAt = dateAt + initDuration(minutes = 1)
    caffeDecay.timeline = dateAt

    toZero = toZero * decayRate
    caffeDecay.caffeineTransition = toZero

    decayData.add(caffeDecay)

  echo "calc2 was end"


  decayData
#
#
# proc multipleCalc*(formDatas: seq[FormData]): seq[TheDecay] =
#   result = newSeq[TheDecay]()
#   var decayData = newSeq[TheDecay]()
#
#   for item in formDatas:
#     decayData.add(coreCalculator(item))
#
#   result = decayData
