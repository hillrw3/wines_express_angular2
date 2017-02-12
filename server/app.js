var express = require('express');
var app = express();
var apiPort = process.env.API_PORT || 3000;

app.get('/', function (req, res) {
  res.send('Boooooom')
})

app.get('/ping', function(req, res) {
  res.json({pong: true})
})

app.listen(apiPort, function () {
  console.log('Example app listening on port ' + apiPort)
})