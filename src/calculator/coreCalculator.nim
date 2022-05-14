import ../bindTypes/apiType
import ../bindTypes/caffeStructs

proc coreCalculator*(sinlgeFormData: FormData): TheDecays =
  result: TheDecays

  if sinlgeFormData.method1or2 == 2 :
    let totalCaffeine = sinlgeFormData.caffeineMg
