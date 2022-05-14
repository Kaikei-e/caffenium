import std/marshal, json
import ../bindTypes/apiType

# type
#   A = object of RootObj
#   B = object of A
#     f: int

# let a: ref A = new(B)
# assert $$a[] == "{}" # not "{f: 0}"

# # unmarshal
# let c = to[B]("""{"f": 2}""")
# assert typeof(c) is B
# assert c.f == 2

proc formSorter*(jsonString: JsonNode) =
  let jsonArray = %* jsonString 

  echo jsonArray
  for item in jsonArray.items:
    debugEcho item
    var singleData = to(item, FormData)
    echo singleData

  
    
