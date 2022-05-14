import std/times

type FormData* = object
  startDate*: DateTime
  caffeineMg*: int
  method1or2*: int
  drinkAmountMl* : int