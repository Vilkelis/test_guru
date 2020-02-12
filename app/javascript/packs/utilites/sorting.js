// Sorting table rows by click on table collumn header
//
// header cell must have class 'sort-by-tite'
// and contains indicators  (classes: 'sorted-up' and 'sorted-down')
//
// This methods don't support colspan 

document.addEventListener('turbolinks:load', function(){
	// Switch on sorting by click on table column title (table must be styled by bootstrap)
	let controls = document.querySelectorAll('table>thead>tr>th.sort-by-title')
	for (let control of controls) {
		control.addEventListener('click', sortRowsByTitle) 		
	} 
})

// Column header click handler
function sortRowsByTitle() {	 
	let tableBody = this.parentNode.parentNode.parentNode.querySelector('tbody') 
	let cellSelector = 'td:nth-child(' + (this.cellIndex + 1) + ')'
	
	let arrowUp = this.querySelector('.sorted-up')
	let arrowDown = this.querySelector('.sorted-down')
	console.log(arrowUp)
	// Hide all arrows in the table except arows of current column	
	let arrows = this.parentNode.querySelectorAll('.sorted-up,.sorted-down')
	for (let arrow of arrows) {
		if ([arrowUp, arrowDown].indexOf(arrow) == -1) {
			arrow.classList.add('d-none')
		}
	}

  // Sort rows in the asc or desc order (dependent of arrows visibility)
  let rows = tableBody.querySelectorAll('tr')
	let sortedRows = []
	
	for(let row of rows){
		sortedRows.push(row)
	}

	if (arrowUp.classList.contains('d-none')) {
		sortRows(sortedRows, cellSelector)

	  arrowUp.classList.remove('d-none')
	  arrowDown.classList.add('d-none')
  } else {
  	sortRows(sortedRows, cellSelector, true)

	  arrowDown.classList.remove('d-none')
	  arrowUp.classList.add('d-none')  	
  }

  // Prepare and show sorted rows on tbody
	let sortedTableBody = document.createElement('tbody')

	for (let row of sortedRows) {
		sortedTableBody.appendChild(row)
	}

	tableBody.parentNode.replaceChild(sortedTableBody, tableBody)
}

// Sort rows be cellSelector collumn in asc - default (or desc) order
function sortRows(rows, cellSelector, desc) {

	if (desc) {
	  rows.sort(compareRowsDesc)
	} else {
		rows.sort(compareRowsAsc)
	}

	function compareRowsAsc(row1, row2) {
		let testTitle1 = row1.querySelector(cellSelector).textContent
		let testTitle2 = row2.querySelector(cellSelector).textContent

		if (testTitle1 < testTitle2) { return 1 }
		if (testTitle1 > testTitle2) { return -1 }		
		return 0
	}

	function compareRowsDesc(row1, row2) {
		let testTitle1 = row1.querySelector(cellSelector).textContent
		let testTitle2 = row2.querySelector(cellSelector).textContent

		if (testTitle1 < testTitle2) { return -1 }
		if (testTitle1 > testTitle2) { return 1 }		
		return 0
	}

}







