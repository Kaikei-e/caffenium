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
        let sDate = params[0]["start_date"].getStr
        let eDate = params[1]["end_date"].getStr

        let parsedSDate = parse(sDate, "yyyy-MM-dd HH:mm:ss")
        let parsedEDate = parse(eDate, "yyyy-MM-dd HH:mm:ss")

        let caffeData = FormData(startDate: parsedSDate, endDate: parsedEDate)

        formSorter(params)

        let response = %*{"time_formatted": getDateStr(caffeData.startDate)}

        resp response

      except Exception:
        let headers = [("Content-type", "application/json; charset=utf-8")]
        let response = %*{"message": "An error occured"}
        resp Http400, headers, $response
        
  
