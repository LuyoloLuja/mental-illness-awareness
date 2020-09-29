let express = require('express');
let app = express();
var exphbs  = require('express-handlebars');
const pg = require("pg");
const Pool = pg.Pool;

// use ssl connection
let useSSL = false;
let local = process.env.LOCAL || false;

if (process.env.DATABASE_URL && !local){
    useSSL = true;
}

const connectionString = process.env.DATABASE_URL || 'postgresql://coder:pg123@localhost:5432/mental_illness';

const pool = new Pool({
    connectionString,
    ssl : useSSL
  });

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

app.get("/", function(req, res){
  res.send("Mental Illness Awareness");
});

app.get('/', function (req, res) {
    res.render('home');
});

let PORT = process.env.PORT || 2020;

app.listen(PORT, function(){
  console.log('App starting on port', PORT);
});