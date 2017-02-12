var express = require('express');
var app = express();
var apiPort = process.env.API_PORT || 3000;
const Knex = require('knex');
const knexConfig = require('./knexfile');
const knex = Knex(knexConfig.development);


// allow cross origin requests

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


app.get('/', function (req, res) {
  res.send('Hello')
})

app.get('/ping', function(req, res) {
  res.json({pong: true})
})

app.get('/wines', function(req, res) {
  // const wines = [{name: 'Chardonnay'}, {name: 'Pinot Noir'}, {name: 'Cabernet Franc'}]
  knex('wines').select('*').then(function(wines) {
    res.json(wines)
  })
})

app.listen(apiPort, function () {
  console.log('Example app listening on port ' + apiPort)
})