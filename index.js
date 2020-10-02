let express = require('express');
let app = express();
const bodyParser = require("body-parser");
var exphbs = require('express-handlebars');
const flash = require("express-flash");
const session = require("express-session");

app.use(flash());
app.use(
	session({
		secret: "<add a secret string here>",
		resave: false,
		saveUninitialized: true,
	})
);

const pg = require("pg");
const Pool = pg.Pool;

const connectionString = process.env.DATABASE_URL || 'postgresql://codex:pg123@localhost:5432/mental_illness';

const pool = new Pool({
  connectionString
});

const mentalIllness = require("./mental");
const mental = mentalIllness(pool);

app.engine('handlebars', exphbs({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');

// app.use(express.static("public"));
app.use(express.static(__dirname + '/public'));
app.use(express.static('views/images'));
// parse appliction
app.use(bodyParser.urlencoded({ extended: false }));
// parse application / json
app.use(bodyParser.json());


app.get("/", function (req, res) {
  res.render("index", {
  });
});

// link to the form page
app.get("/goToForm", async function (req, res) {

  var description = await pool.query('SELECT symptoms.id, description, illness_id, names FROM symptoms join illnesses on illnesses.id = symptoms.illness_id order by illness_id ')

  const symptomNames = description.rows

  let enteredName = mental.getNames() || "";
  let enteredSurname = mental.getSurname() || "";

  res.render("illnessForm", { symptomNames, enteredName, enteredSurname })
})

//this is for the graphs
app.get("/chart", async function (req, res) {
  

  res.render("chart")
  // res.render("chart")
})

app.post("/chart", function(req, res){

  const {name, surname, doctor} = req.body;

  res.render('chart', {
    message: `${name} ${surname} Your appointment with Dr.${doctor} will be scheduled!`
  })

})

app.get('/information', function(req, res){
  res.render('information')
})

app.post("/goToForm", async function (req, res) {

  const answers = req.body;
  
  const illnessCounter = {

  };

  Object
    .keys(answers)
    .forEach(function (answer) {
      const parts = answer.split("_");
      const illness = parts[0];
      if (illnessCounter[illness] == undefined) {
        illnessCounter[illness] = 0;
      }

      if (answers[answer] === 'yes') {
        illnessCounter[illness]++;
      }
    });
  
  const screenData = {
    illnessCounter,
    // symptomNames,
    "bipolar": illnessCounter["Bipolar"],
    "bipolarNot": 5 - illnessCounter["Bipolar"],  

    "depression": illnessCounter["Deppression"],
    "depressionNot": 5 - illnessCounter["Deppression"],

    "schizophrenia": illnessCounter["Schizophrania"],
    "schizophreniaNot": 6 - illnessCounter["Schizophrania"]
  };

  res.render("chart", screenData);

});

let PORT = process.env.PORT || 2020;

app.listen(PORT, function () {
  console.log('App starting on port', PORT);
});