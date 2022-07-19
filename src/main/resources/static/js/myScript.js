function validate(){
		let username = document.getElementById("username");
		let password = document.getElementById("password");
		let confirmPassword = document.getElementById("confirmPassword");
		
		if(username.value == "" || password.value == "" || confirmPassword.value == "") {
			alert("Blanks are not allowed");
			return false;
		}	
		else if(password.value != confirmPassword.value) {
			alert("Different passwords. Check again.");
			return false;
		}	
		else {
			return true;
		}
	}
	
	