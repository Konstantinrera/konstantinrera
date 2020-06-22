window.addEventListener("resize", AutoScale); //Масштабируем страницу при растягивании окна

AutoScale(); //Масштабируем страницу после загрузки

function AutoScale()
{
    let width = window.innerWidth; //Ширина окна
    //Если вы хотите проверять по размеру экрана, то вам нужно свойство window.screen.width

    if(width > 1280)
    {
   	 ChangeScale("big");
    }
    else if(width <= 1280 && width > 720)
    {
   	 ChangeScale("normal");
    }
    else if(width < 720)
    {
   	 ChangeScale("small");
    }
}
@media print {
.noprint {display: none} 
.print{display: block;} 
}
function printer() {
		window.print();
	}
<!DOCTYPE html>
<html>
<head lang="ru">
    <meta charset="UTF-8">
    <title >сайт</title>
    <link rel="stylesheet" href="print.css" >
	<link rel="stylesheet" href="menu.css">
	<link rel="stylesheet" href="table.css">
	<link rel="stylesheet" href="a.css">
	<script src="https://www.google.com/jsapi"></script>
    </head>
<body>
	<div class = "menu" class = "noprint">
		<p>Кредитний калькулятор</p>
		<div class = "group">
    <input type="text" id="suma" onkeypress= "validatesuma(event)" name="suma" placeholder="Введіть суму кредита" class = "noprint"> <br><br>
			</div>
			<div class = "group ">
            <input type="text" onkeypress="validateperiod(event)" id="period" name="period" placeholder="Введите срок кредита" class = "noprint"> <br><br>
		</div>
		<div class = "group">
            <input type="text" onkeypress= "validatestavka(event)" id="rate" name="rate" 
			placeholder="Введіть відсоткову ставку" class = "noprint"> <br><br>
		</div>
	
	<button id="aunButton"  class = "noprint">ануїтентний</button> 
	<button id="difButton" class = "noprint">диференційний</button> <br>  <br>
		
	<button id = "pri" onclick="printer()" class = "noprint">Роздрукувати</button>
	</div>
	
	<a download href="zipp/test.zip" align = "left">Завантажити</a>
	<br>
	<div class="table"></div>
	<div id="air" style="width: 500px; height: 400px;"></div>

	<script src= "credit.js" type= "text/javascript"></script>	
	<script src = "validate.js" type="text/javascript"></script>
	<script src = "printer.js" type="text/javascript"></script>
	<script src = "normal.js" type = "text/javascript"></script>
    </body>
</html>


<!-- onlick=aut()
onlick=dif() -->
table {

margin-left: 33%;
font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
  border-collapse: collapse;
  color: #686461;
}

caption {
  padding: 10px;
  color: white;
  background: #17861c;
  font-size: 18px;
  text-align: left;
  font-weight: bold;
}

th {
  border-bottom: 3px solid #B9B29F;
  padding: 10px;
  text-align: left;
}

td {
  padding: 10px;
}

tr:nth-child(odd) {
  background: white;
}

tr:nth-child(even) {
  background: #E8E6D1;
}
function validateperiod(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}
function validatestavka(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}
function validatesuma(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}

a {
  text-decoration: none;
  display: inline-block;
  padding: 5px 10px;
  letter-spacing: 1px;
  margin: 0 20px;
  font-size: 24px;
  font-family: 'Fredoka One', cursive;
  transition: .3s ease-in-out;
}
.a {
  color: #FFD201;
  letter-spacing: 1px;
  border-bottom: 1px solid transparent; 
  border-top: 1px solid transparent;
}
.a:hover {
  border-bottom: 1px solid #FFD201; 
  border-top: 1px solid #FFD201; 
 }
function aun() {


let suma = document.querySelector('#suma').value;
let period = document.querySelector('#period').value;
let rate = document.querySelector('#rate').value;
// let suma = +prompt("Введіть бажану суму кредиту: ");
// let period = +prompt("Введіть кількість місяців кредитування: ");
// let rate = +prompt("Введіть відсоткову ставку кредиту: ");


let percents = 0;
let monthlyPayment = 0; 
let mainDebt = 0;
// let remainSuma = 0;
// let ann = 0;
let table = document.querySelector(".table");
let str = '<table><caption>Ануїтентний кредит</caption><th>Борг на початок періоду</th><th>Основний борг</th><th>Відсотки</th><th>Щомісячний платіж</th></tr>';
let monthRate = rate/100/12;
monthlyPayment = (suma * (monthRate + (monthRate)/(Math.pow((1 + monthRate), period) - 1))).toFixed(2);


// let topPart = + (suma * monthRate).toFixed(2);
// let bottomPart = + (1 - (1 / Math.pow(monthRate + 1, period))).toFixed(2);
// aut = + (topPart / bottomPart).toFixed(2);


for(let i = 0; i < period; i++) {
    
	percents = (suma * monthRate).toFixed(2);

	mainDebt = (monthlyPayment - percents).toFixed(2);


	suma = (suma - mainDebt).toFixed(2);
	if (suma < 0) {
		suma = 0;
	}

   str += `<tr><td>${suma}</td><td>${mainDebt}</td><td>${percents}</td><td>${monthlyPayment}</td></tr>`;
   console.log(i);
}

str += "</table>";
table.innerHTML = str;

// console.log("Ануїтентний щомісячний платіж" + ann);
}



function dif() {
// let suma = +prompt("Введіть бажану суму кредиту: ");
// let period = +prompt("Введіть кількість місяців кредитування: ");
// let rate = +prompt("Введіть відсоткову ставку кредиту: ");	

let suma = document.querySelector('#suma').value;
let period = document.querySelector('#period').value;
let rate = document.querySelector('#rate').value;
let dif = 0;
let persents = 0;
let remainSuma = suma;
let mainDebt = + (suma/period).toFixed(2);
let table = document.querySelector(".table");
let monthRate = rate/100/12;

let str = "<table><caption>Диференційний кредит</caption><tr><th>Борг на початок періоду</th><th><th>Основний борг</th><th>Відсотки</th><th>Щомісячний платіж</th></tr>"

for (let i = 0; i < period; i++) {
    str += '<tr><td>' + remainSuma + '<td>' + '<td>' + mainDebt + '</td>';
    persents = + (suma * monthRate).toFixed(2);
    str += '<td>' + persents + '</td>'; 
    remainSuma -= mainDebt;
    remainSuma = + (remainSuma).toFixed(2);
    dif = mainDebt + persents;
    suma = suma - mainDebt;
    str += '<td>'  + parseFloat(dif).toFixed(2) + '</td></tr>';
}

str += "</table>";
table.innerHTML = str;
}

aunButton.onclick = function(){
	aun()
}

difButton.onclick = function(){
	dif()
}


body {
	font-family: Tahoma;
	margin:  0;

}
.menu {
	margin: 0 auto;
	background: linear-gradient(rgba(99,173,50,.3),rgba(0,0,0,.3));
	width: 450px;
	height: 390px;
	padding: 20px;
	box-shadow:  2px 2px 5 px rgba;	
}

p {
	cursor: help;
	margin: 0;
	text-transform: uppercase;
	margin-left: 25%;

}

.group {
	margin: 10px;
	padding: 5px;
	
}

input {
	margin-top: 10px;
	height: 40px;
	width: 400px;
	border-radius: 20/20px;
	border: none;
	padding-left: 15px;
	font-size: 10px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.80);	
}

input:focus {
	border: 2px solid #fff;
	transform: translateX(15px);
	width: 385px;	
}

#difButton  {
	cursor: pointer;
	padding: 10px 40px;
	height: 35px;
	color: #fff;
	background: #17861c;
	border: none;
	text-transform: uppercase;
	font-size: 15px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.80);
}

#difButton:hover {
	opacity: .80;
	font-weight: bold;
	transform: scale(1.1);
}

#aunButton {
	cursor: pointer;
	padding: 10px 40px;
	height: 35px;
	color: #fff;
	background: #17861c;
	border: none;
	text-transform: uppercase;
	font-size: 15px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.50);
	margin-left: 5%;
}

#aunButton:hover {
	opacity: .80;
	font-weight: bold;
	transform: scale(1.1);
}

#pri {
	cursor: pointer;
	padding: 10px 70px;
	height: 35px;
	color: #fff;
	background: #17861c;
	border: none;
	text-transform: uppercase;
	font-size: 15px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.50);
	margin-left: 20%;
}

#pri:hover {
	opacity: .80;
	font-weight: bold;
	transform: scale(1.1);	
}

::-webkit-input-placeholder {color:#000000;}
::-moz-placeholder          {color:#000000;}/* Firefox 19+ */
:-moz-placeholder           {color:#000000;}/* Firefox 18- */
:-ms-input-placeholder      {color:#000000;}
