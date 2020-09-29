let express = require('express');
let app = express();
var exphbs  = require('express-handlebars');

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