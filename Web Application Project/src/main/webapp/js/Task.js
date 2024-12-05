window.onclick = function(event) {
    if (!event.target.matches('.profile-menu a')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.style.display === "block") {
                openDropdown.style.display = "none";
            }
        }
    }
}


//Überprüfung des NewPassword
function checkInput(myForm){
	if (document.buttonClicked === "btnAktualisierenPasswort") return true;
	let myNewPassword = myForm.newPassword.value;
	let newPasswordOk =  this.checkNewPassword(myNewPassword);
	
	if (newPasswordOk){
		return true;
	} else {
		return false;
		}
	
}
	
function checkNewPassword(password){
	let myFehlerfeldDiv = document.getElementById("errorNewPassword");
	
	
	if(password.length < 7){
		myFehlerfeldDiv.innerText = "Das Passwort muss mindestens 7 Zeichen lang sein";
		return false;
	}else{
		myFehlerfeldDiv.innerText = "";
		return true;
	}
	
}

//Überprüfung mithilfe von JavaScript ob alle Registrierungsfelder ok sind.

function setButtonClicked(btnName){
	document.buttonClicked = btnName;
}


function checkInput(myForm){
	if (document.buttonClicked === "losgehts") return true;
	let myFirstname = myForm.firstNameReg.value;
	let myLastname = myForm.lastNameReg.value;
	let myUsername = myForm.usernameReg.value;
	let myEmail    = myForm.emailReg.value;
	let myPassword = myForm.passwordReg.value;
	let myPhone 	= myForm.telefonnummer.value;
	
	let firstNameOk =  this.checkFirstname(myFirstname);
	let lastNameOk =  this.checkLastname(myLastname);
	let nicknameOk =  this.checkUsername(myUsername);
	let emailOk    =  this.checkEmail(myEmail);
	let passwordOk =  this.checkPassword(myPassword);
	let phonenumberOk =  this.checkPhone(myPhone);
	

	//Formular nur abschicken, wenn alle Tests erfolgreich
	if (firstNameOk && lastNameOk && nicknameOk && emailOk && passwordOk && phonenumberOk){
		//alert("Account '" + myUsername + "' wurde erfolgreich angelegt. Jetzt können Sie sich einloggen.")
		return true;
	} else {
		return false;
		}
	
}

function checkFirstname(firstNameReg){
	let myFehlerfeldDiv = document.getElementById("errorFirstname");
	
	if (firstNameReg){
		myFehlerfeldDiv.innerText = "";
		return true;
	}else{
		myFehlerfeldDiv.innerText = "Den Vorname nicht vergessen";
		return false;
	}
}

function checkLastname(lastNameReg){
	let myFehlerfeldDiv = document.getElementById("errorLastname");
	
	if (lastNameReg){
		myFehlerfeldDiv.innerText = "";
		return true;
	}else{
		myFehlerfeldDiv.innerText = "Bitte den Nachname eintippen";
		return false;
	}
}


function checkUsername(usernameReg){
	let myFehlerfeldDiv = document.getElementById("errorUsername");

	if (usernameReg){
		myFehlerfeldDiv.innerText = "";
		return true;
	}else{
		myFehlerfeldDiv.innerText = "Es fehlt noch den Benutzername";
		return false;
	}
}

function checkEmail(emailReg){
	let myFehlerfeldDiv = document.getElementById("errorEmail");
	if (emailReg){
		return true;
	} else{
		myFehlerfeldDiv.innerText = "Vergessen Sie bitte nicht die E-Mail";
		return false;
	}
}

function checkPassword(passwordReg){
	let myFehlerfeldDiv = document.getElementById("errorPassword");

	
	if (!passwordReg){
		myFehlerfeldDiv.innerText = "Das Passwort muss ausgefüllt werden";
		return false;
	}else if(passwordReg.length < 7){
		myFehlerfeldDiv.innerText = "Das Passwort muss mindestens 7 Zeichen lang sein";
		return false;
	}else{
		myFehlerfeldDiv.innerText = "";
		return true;
	}
	
}



function checkPhone(telefonnummer){
	let myFehlerfeldDiv = document.getElementById("errorPhone");
	if (telefonnummer){
		return true;
	} else{
		myFehlerfeldDiv.innerText = "Telefonnummer muss ausgefüllt werden";
		return false;
	}
}



//blende das Kontaktformular ein und aus, wenn der User auf den entsprechenden Button klickt.

function showModal() {
    var modal = document.getElementById('contactModal');
    modal.style.display = 'block';
}

function closeModal() {
    var modal = document.getElementById('contactModal');
    modal.style.display = 'none';
}

function validateContactForm() {
    var name = document.getElementById('contactName').value.trim();
    var email = document.getElementById('contactEmail').value.trim();
    var message = document.getElementById('contactMessage').value.trim();

    if (name === '' || email === '' || message === '') {
        alert('Bitte füllen Sie alle Felder aus.');
        return false;
    }
    return true;a
}

// Close modal if user clicks outside of it
window.onclick = function(event) {
    var modal = document.getElementById('contactModal');
    if (event.target === modal) {
        modal.style.display = 'none';
    }
};


