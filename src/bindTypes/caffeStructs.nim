import times

type TheDecay* = object
  timeline* : DateTime
  caffeineTransition* : float64  

type TheDecays* = object
  theDecays* : seq[TheDecay]

type CaledDecay* = object
  timeline* : Time
  caffeineDecay* : float64