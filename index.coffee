SERVER =
    host: '0.0.0.0'
    port: 8080

express = require 'express'
jsonRoutes = require './jsonRoutes'

app = express.createServer()
app.configure ->
    app.use(express.static(__dirname + '/public'))

jsonRoutes.setAPI app


app.listen(SERVER.port, SERVER.host);
console.log("Worker started at "+SERVER.host+":"+SERVER.port+" | PID: "+process.pid)