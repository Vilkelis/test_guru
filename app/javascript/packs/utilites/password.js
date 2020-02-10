// Indication for password confirmation
document.addEventListener('turbolinks:load', function(){	
	let passwordConfirmation = document.getElementById('user_password_confirmation')

	if (passwordConfirmation) { 		
		let password = document.getElementById('user_password')

		if (password) {

			passwordConfirmation.addEventListener('keyup', passwordChange) 
			password.addEventListener('keyup',passwordChange)
			
			function passwordChange() {
				let userPasswordsMatch = passwordConfirmation.parentNode.querySelector('.user-passwords-match') 
				let userPasswordsNotMatch = passwordConfirmation.parentNode.querySelector('.user-passwords-not-match') 

				if ( !(userPasswordsMatch && userPasswordsNotMatch) ) { return }

				if (passwordConfirmation.value == '') {					
					userPasswordsMatch.classList.add('d-none')
					userPasswordsNotMatch.classList.add('d-none')					 
				} else if (passwordConfirmation.value == password.value) {
					userPasswordsMatch.classList.remove('d-none')
					userPasswordsNotMatch.classList.add('d-none')										 
				} else {
					userPasswordsMatch.classList.add('d-none')
					userPasswordsNotMatch.classList.remove('d-none')															 
				}				
			}

		}
	} 

})



