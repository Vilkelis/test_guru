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
	let viewType =  selectedItem ? selectedItem.dataset.viewType : 'none'
	let categorySelect = document.getElementById('badge_category_id')
	let testSelect = document.getElementById('badge_test_id')

	if (viewType == 'test'){
		categorySelect.parentNode.classList.add('d-none')
		testSelect.parentNode.classList.remove('d-none')
	}	else if (viewType == 'category'){
		categorySelect.parentNode.classList.remove('d-none')
		testSelect.parentNode.classList.add('d-none')
	}	else {
		categorySelect.parentNode.classList.add('d-none')
		testSelect.parentNode.classList.add('d-none')
	}
}

function selectImageChangeLinkHandler() {
	selectImageChangeHandler(this)
}

//Preview for selected badge image
function selectImageChangeHandler(selectImageControl) {
	let previewImageControl = document.getElementById('badge_image_file_preview')
	let imageFileName = selectImageControl.value
	previewImageControl.setAttribute("src", previewImageControl.dataset.baseUrl + imageFileName);
}
