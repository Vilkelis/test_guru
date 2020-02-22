// Helpers for Test edit form
document.addEventListener('turbolinks:load', function(){	
  // Show/Hide controls according time limited checkbox
	let timeLimitedCheckbox = document.getElementById('test_time_limited')
	if (timeLimitedCheckbox) {
		timeLimitedCheckbox.addEventListener('change', testTimeLimitedChangeLinkHandler) 		
		testTimeLimitedChangeHandler(timeLimitedCheckbox) //Init view according current value of time limited checkbox
	}
})

function testTimeLimitedChangeLinkHandler() {
	testTimeLimitedChangeHandler(this)
}

// Show/Hide controls according time limited checkbox
function testTimeLimitedChangeHandler(checkboxControl) {
	console.log(checkboxControl.checked)
	let timeLimitMinControl = document.getElementById('test_time_limit_min')
	if (checkboxControl.checked) {
		timeLimitMinControl.parentNode.classList.remove('d-none')
	} else {
		timeLimitMinControl.parentNode.classList.add('d-none')
	}
}

 