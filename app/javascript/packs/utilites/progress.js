// Make progress by data-... attributes
document.addEventListener('turbolinks:load', function(){	
	let controls = document.querySelectorAll('.progress')

	for (let progress of controls) {
		progressShow(progress)
	}
})

// Format and show progress
function progressShow(progress) {
	let progressInner = document.createElement('div')

	progressInner.classList.add('progress-bar')
	progressInner.classList.add('progress-bar-striped')
	progressInner.classList.add(progress.dataset.colorClass)
	progressInner.setAttribute("role", "progressbar");
	progressInner.setAttribute("aria-valuemin", "0");
	progressInner.setAttribute("aria-valuemax", "100");
	progressInner.textContent = progress.dataset.percent + '%'
	progressInner.style.cssText = 'width: ' + progress.dataset.percent + '%'

	progress.appendChild(progressInner)
}
