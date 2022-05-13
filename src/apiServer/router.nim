import htmlgen, jester, json

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

  
