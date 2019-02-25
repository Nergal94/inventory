const first = element => document.querySelector(element);

const allDataBase = document.querySelectorAll('.database');
const tableLine = document.querySelectorAll('.table-line');
const firstLine = document.querySelectorAll('.table-line-first .table-colum');
const searchInput = first('.search input');
const searchIco = first('.search-ico');
const searchParent = first('.search');
const currentDataBase = first('.current-database');

const id = first('#id');
const name = first('#name');
const quantity = first('#quantity');
const price = first('#price');
const state = first('#state');
const comment = first('#comment');

const url = window.location.href;
const currentID = id.value;

const isLastUpdate = () => {
    firstLine[0].innerHTML = 'Date';
    firstLine[1].innerHTML = 'ID';
    firstLine[2].innerHTML = 'Name';
    firstLine[3].innerHTML = 'Changed';
    
    for(let i = 0; i < tableLine.length; i++) {
        tableLine[i].classList.add('history-grid');
    }
};


const selectTableLine = event => {
    if(url.indexOf('LastUpdate') > 0) {
        return false;
    }
    
    if (!event.target.classList.contains('table-colum') || event.target.parentElement.classList.contains('table-line-first')) {
        return false;
    }
    
     event.stopPropagation();
    
    const selectedLine = event.target.parentElement;
    id.value = selectedLine.childNodes[0].innerHTML;
    name.value = selectedLine.childNodes[1].innerHTML;
    quantity.value = selectedLine.childNodes[2].innerHTML;
    price.value = selectedLine.childNodes[3].innerHTML;
    comment.value = selectedLine.childNodes[5].innerHTML;
    
    (selectedLine.childNodes[4].innerHTML === 'В работе') && (state.value = 0);
    (selectedLine.childNodes[4].innerHTML === 'Необходим ремонт') && (state.value = 1);
    (selectedLine.childNodes[4].innerHTML === 'Ремонту не подлежит') && (state.value = 2);
    
    
};


const clearControlLine = () => {
    id.value = currentID;
    name.value = '';
    quantity.value = 1;
    price.value = '';
    state.value = 0;
    comment.value = '';
};

const searchInCurrentDatabase = () => {
    const searchValues = (currentLine, searchValue) => {
        const currentLineToString = currentLine.innerHTML.toLowerCase();
    
        if(searchValue != '') {
            searchIco.classList.add('ico-close');
            searchParent.classList.add('search-focus');
        } else {
            searchIco.classList.remove('ico-close');
            searchParent.classList.remove('search-focus');
        }
        
        if(currentLineToString.indexOf(searchValue) === -1) {
            currentLine.style.display = 'none';
        } else {
            currentLine.style.display = 'grid';
        }
    };
    
    const {value : currentValue} = searchInput;
    
    for(let i = 0; i < tableLine.length; i++) {
        searchValues(tableLine[i], currentValue.toLowerCase());
    }
    
};

const clearSearchInput = () => {
    if(!searchIco.classList.contains('ico-close')) {
        return false;
    }
    
    searchInput.value = '';
    searchInCurrentDatabase();
};


(url.indexOf('LastUpdate') > 0) && ((allDataBase[0].classList.add('active')), isLastUpdate());
(url.indexOf('Computer')  > 0) && (allDataBase[1].classList.add('active'));
(url.indexOf('Video') > 0) && (allDataBase[2].classList.add('active'));
(url.indexOf('Audio')  > 0) && (allDataBase[3].classList.add('active'));
(url.indexOf('Commutation')  > 0) && (allDataBase[4].classList.add('active'));
(url.indexOf('Others')  > 0) && (allDataBase[5].classList.add('active'));

//id.addEventListener('keyup', searchForId, false);
searchInput.addEventListener('keyup', searchInCurrentDatabase, false);
searchIco.addEventListener('click', clearSearchInput, false);
currentDataBase.addEventListener('click', selectTableLine, false);
window.addEventListener('click', clearControlLine, false);
