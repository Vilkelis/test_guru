// in-line list edit functionallity
document.addEventListener('turbolinks:load', function(){	
	//Edit buttons 
	let editButtons = document.querySelectorAll('.form-inline-link')
	for (let control of editButtons) {
		control.addEventListener('click', formInlineEditLinkHandler) 		
	} 

  //Cancel buttons  
	cancelButtons = document.querySelectorAll('.form-inline-cancel-btn')
	for (let control of cancelButtons) {
		control.addEventListener('click', formInlineCancelLinkHandler) 		
	} 

	//Show form with errors
	let errors = document.querySelector('.resource-errors')
	if (errors) {
		formInlineEditHandler(errors.dataset.resourceId)
	}
})

function formInlineEditLinkHandler(event) {
	event.preventDefault()

	let testId = this.dataset.testId
  formInlineEditHandler(testId)
}


function formInlineEditHandler(testId) {
	let formInline = document.querySelector('.form-inline[data-test-id="'+ testId +'"]')
	if (!formInline) { return }
		
	let formInlineInput = formInline.querySelector('.form-inline-input')
	let link = document.querySelector('.form-inline-link[data-test-id="'+ testId +'"]')
	let testTitle = document.querySelector('.test-title[data-test-id="'+ testId +'"]')
	
	//Cancel all of the inline forms
  formsInlineCancelAll()

	// Show form for the testId
	formInline.classList.remove('d-none')
	link.classList.add('d-none')
	testTitle.classList.add('d-none')
	formInlineInput.focus()
}


function formInlineCancelLinkHandler(event) {
	event.preventDefault()
  
  let testId = this.dataset.testId
  formInlineCancelHandler(testId)
}
  
 
function formInlineCancelHandler(testId) {
  let link = document.querySelector('.form-inline-link[data-test-id="'+ testId +'"]')
	let testTitle = document.querySelector('.test-title[data-test-id="'+ testId +'"]')
	let formInline = document.querySelector('.form-inline[data-test-id="'+ testId +'"]')
  let formInlineInput = formInline.querySelector('.form-inline-input')

  // Restore old value
  formInlineInput.value = testTitle.textContent
  formInlineInput.classList.remove('is-invalid')

  // Hide inline form and Show title
  formInline.classList.add('d-none')
	link.classList.remove('d-none')
	testTitle.classList.remove('d-none')

  // Hide errors if exist
  let errors = document.querySelector('.resource-errors')
	if (errors) { errors.classList.add('d-none') }
}


// Make standard view: cancel all active forms
function formsInlineCancelAll(){
	let formsInline = document.querySelectorAll('.form-inline')

	// Cancel active inline form 
  for (let obj of formsInline) {
  	if ( !obj.classList.contains('d-none') ) { formInlineCancelHandler(obj.dataset.testId) }  	   
	} 

}

