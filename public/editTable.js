let bookTable = document.getElementById('bookTable')
let addRowBtn = document.getElementById('addButton')

let bookId = document.querySelector('#id')
let bookTitleInp = document.querySelector('#bookTitle')
let authorInp = document.querySelector('#author')
let genreInp = document.querySelector('#genre')
let isbnInp = document.querySelector('#isbn')
let quantityInp = document.querySelector('#quantity')

addRowBtn.addEventListener('click', () => {

    let bookTitle = bookTitleInp.value
    let author = authorInp.value
    let genre = genreInp.value
    let isbn = isbnInp.value
    let quantity = quantityInp.value

    if (validateForm() === true) {
        bookId = bookId + 1
        formClear()

        let template = `
                        <tr>
                        <td id="row${bookId}">${bookId}</td>
                        <td>${bookTitle}</td>
                        <td>${author}</td>
                        <td>${genre}</td>
                        <td>${isbn}</td>
                        <td>${quantity}</td>
                        <td>
                    <button class="btn btn-sm btn-outline-secondary" id="editBtn" onClick="onEdit(this)" data-toggle="modal" data-target="#editModal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                    </button>
                    <button class="btn btn-sm btn-outline-danger" id="deleteBtn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                        </svg>
                    </button>
                </td>
                        </tr>`
        bookTable.innerHTML += template
    } else {
        window.alert("Please fill out all information accurately!")
    }


})

function validateForm() {
    if (bookTitleInp.value === "" || authorInp.value === "" || genreInp.value === "" || isbnInp.value === "" || quantityInp.value === "") {
        return false
    } else {
    return true
    }
}

function formClear() {

    bookTitleInp.value = ""
    authorInp.value = ""
    genreInp.value = ""
    isbnInp.value = ""
    quantityInp.value = ""
    $('#bookModal').modal("hide")

}

$(document).on('click', '#deleteBtn', function(e) {
    let r = $(this).closest('tr').remove();
})

let selectedRow = null
function onEdit(td) {
    selectedRow = null
    selectedRow = td.parentElement.parentElement
    document.getElementById('editBook_title').value = selectedRow.cells[1].innerHTML
    document.getElementById('editAuthor_name').value = selectedRow.cells[2].innerHTML
    document.getElementById('editGenre').value = selectedRow.cells[3].innerHTML
    document.getElementById('editIsbn').value = selectedRow.cells[4].innerHTML
    document.getElementById('editBooks_available').value = selectedRow.cells[5].innerHTML
    
}
$(document).on('click', '#saveModalButton', function updateRecord() {
    selectedRow.cells[1].innerHTML = document.getElementById('editBook_title').value
    selectedRow.cells[2].innerHTML = document.getElementById('editAuthor_name').value
    selectedRow.cells[3].innerHTML = document.getElementById('editGenre').value
    selectedRow.cells[4].innerHTML = document.getElementById('editIsbn').value
    selectedRow.cells[5].innerHTML = document.getElementById('editBooks_available').value
})
