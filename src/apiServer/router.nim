import htmlgen, jester, json
import std/times

type CaffeineData* = object
  startDate: DateTime
  endDate: DateTime

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
        let sDate = params["start_date"].getStr
        let eDate = params["end_date"].getStr

        let parsedSDate = parse(sDate, "yyyy-MM-dd HH:mm:ss")
        let parsedEDate = parse(eDate, "yyyy-MM-dd HH:mm:ss")

        let caffeData = CaffeineData(startDate: parsedSDate, endDate: parsedEDate)

        echo caffeData
        let response = %*{"time_formatted": getDateStr(caffeData.startDate)}
        resp response

      except Exception:
        let headers = [("Content-type", "application/json; charset=utf-8")]
        let response = %*{"message": "An error occured"}
        resp Http400, headers, $response
        
  
