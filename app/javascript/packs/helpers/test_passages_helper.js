// Help methods for test passage
document.addEventListener('turbolinks:load', function(){	
  // Timer for check time limit for test
  let timeLimitIndicator = document.getElementById('time_limit_indicator')
  if (timeLimitIndicator) {
  	refreshTimeLimitIndicator() 

		function refreshTimeLimitIndicator () {	  
			let timeInfoElementOld = timeLimitIndicator.querySelector('span')
		  let timeLimitedTo = +timeLimitIndicator.dataset.timeLimitedTo
		   			
		  let timeLeftSeconds = timeLimitedTo - Math.round(Date.now()/1000)

		  let timeInfoElement = document.createElement('span')
		  timeInfoElement.classList.add('badge')
		  timeInfoElement.classList.add(timeIndicatorClass(timeLeftSeconds))

		  timeInfoElement.textContent = timeIndicatorText(timeLeftSeconds)
		  if (timeInfoElementOld) {
		    timeLimitIndicator.replaceChild(timeInfoElement, timeInfoElementOld) 
			} else {
				timeLimitIndicator.appendChild(timeInfoElement) 
			}
		    	 		 	
		 	if (timeLeftSeconds > 0) {	
		    setupTimeLimitIndicatorTimer()
		  } else {
        let form = document.getElementById('test_passage_form')
		  	form.submit()
		  }

		}

		// Reset timer
		function setupTimeLimitIndicatorTimer() {
			 setTimeout(refreshTimeLimitIndicator, 1000);
		}		

		// Returns class for indicator element
		function timeIndicatorClass(timeLeftSeconds) {
			let indicatorClass = 'badge-info'
      if (timeLeftSeconds < 30) {
      	if (timeLeftSeconds < 15) {
      		indicatorClass = 'badge-danger'
      	} else {
      		indicatorClass = 'badge-warning'
      	}
      } 
      return indicatorClass	 			
		}

		// Returns text for indicator element
		function timeIndicatorText(timeLeftSeconds) {
			let timeLimitedText = timeLimitIndicator.dataset.timeText

			let seconds = Math.floor( timeLeftSeconds % 60 )
		  let minutes = Math.floor( (timeLeftSeconds/60) % 60 )
		  let hours = Math.floor( timeLeftSeconds/(60*60) )	

		 	if (timeLeftSeconds > 0) {
		 		return timeLimitedText +' ' + String(hours).padStart(2,'0') + 
		    									 ':' + String(minutes).padStart(2,'0') + 
		    									 ':' + String(seconds).padStart(2,'0')   				
		  } else {
		  	return timeLimitedText + ' 00:00:00'			  	
		  }		  
		}
	
  }  
})
