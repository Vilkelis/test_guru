// Helpers for Badge form
document.addEventListener('turbolinks:load', function(){	
  // Show/Hide controls according selected Budge Rule
	let selectRuleControl = document.getElementById('badge_rule')
	if (selectRuleControl) {
		selectRuleControl.addEventListener('change', selectRuleChangeLinkHandler) 		
		selectRuleChangeHandler(selectRuleControl) //Init view according current Rule value
	}

	//Preview for selected badge image
	let selectImageControl = document.getElementById('badge_image_file_name')
	if (selectImageControl) {
		selectImageControl.addEventListener('change', selectImageChangeLinkHandler) 		
		selectImageChangeHandler(selectImageControl) //Init preview control for selected image
	}	
})

function selectRuleChangeLinkHandler() {
	selectRuleChangeHandler(this)
}

// Show/Hide controls according selected Budge Rule
function selectRuleChangeHandler(selectRuleControl) {
	let selectedItem = selectRuleControl.querySelector('option[value="' + selectRuleControl.value + '"]')
	let helpControl = document.getElementById('rule_parameter_help')
	helpControl.textContent = selectedItem.dataset.help
}

function selectImageChangeLinkHandler() {
	selectImageChangeHandler(this)
}

//Preview for selected badge image
function selectImageChangeHandler(selectImageControl) {
	let previewImageControl = document.getElementById('badge_image_file_preview')
	let imageFileName = selectImageControl.value
	if (imageFileName == '') { 
		imageFileName = selectImageControl.dataset.emptyImage
	}
	previewImageControl.setAttribute("src", previewImageControl.dataset.baseUrl + imageFileName);
}
