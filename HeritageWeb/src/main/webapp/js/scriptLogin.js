var nickname = document.getElementById("nickname");
var password = document.getElementById("password");
var submit = document.getElementById("invia");
var form = document.getElementById("form");
var errorNickname = document.getElementById("error-nickname");

/*
function ajaxLogin(param, value) {

	var richiesta = new XMLHttpRequest();
	var risposta;

	richiesta.open("POST", "../TestServlet");
	richiesta.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	richiesta.send(param + "=" + value);

	richiesta.onload = function() {
		
		// Parse in JSON
		risposta = JSON.parse(richiesta.responseText);
		
		if(richiesta.responseText == 0){
			
			errorNickname.innerHTML = "Utente non esistente";
			
			setTimeout(function(){
			errorNickname.innerHTML = "";
			}, 4000)
		}
		
	}

	/*richiesta.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			return JSON.parse(richiesta.responseText);
		}
	}

}
*/
function validaNickname(stringa) {
	var pattern = new RegExp("^[a-zA-Z0-9_]*$");
	return pattern.test(stringa);
}

function validaPassword(password) {
	var patternPass = new RegExp("^[a-zA-Z0-9_]*$");
	return patternPass.test(password);
}

nickname.addEventListener("blur", function() {

	if (!validaNickname(nickname.value)) { 
		console.log("Caratteri non ammessi");
		return;
	}
	
	//ajaxLogin("nickname", nickname.value);
		
})

password.addEventListener("blur", function() {
	if (!validaPassword(password.value)) {
		console.log("Valori sbagliati password");
		return;
	}
})

submit.addEventListener("click", function(event) {
	event.preventDefault();

	if (validaPassword(password.value) && validaNickname(nickname.value)) {
		document.getElementById("form").submit();
	} else {
		console.log("valori errati");
		return;
	}

})




