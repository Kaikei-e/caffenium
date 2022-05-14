import htmlgen, jester, json
import std/times
from ../bindTypes/apiType import FormData
from ../calculator/formSorter import formSorter

proc router*() = 
  settings:
    port = Port(9000)
  routes:
    get "/":
      resp h1("hello world!!")
    post "/ping":
      try:
        let params = request.body.parseJson
        let pong = params["ping"].getStr
        let response = %*{"pong": "Hello " & pong}
        resp response
      except Exception:
        let headers = [("Content-type", "application/json; charset=utf-8")]
        let response = %*{"message": "An error occured"}
        resp Http400, headers, $response
    
    post "/api/v1/calculate":
      try:
        let params = request.body.parseJson
        
        formSorter(params)

        let response = %*{"time_formatted": "getDateStr(caffeData.startDate)"}

        resp response

      except Exception:
        let headers = [("Content-type", "application/json; charset=utf-8")]
        let response = %*{"message": "An error occured"}
        resp Http400, headers, $response
        
  
