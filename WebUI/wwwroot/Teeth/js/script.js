const container = document.querySelector('.container');
/*console.log(container);*/
const count = document.getElementById('count');
/*console.log(count);*/
const amount = document.getElementById('amount');
/*console.log(amount);*/
const select = document.getElementById('movie');
/*console.log(select);*/
const teets = document.querySelectorAll('.teets:not(.reserved)');
/*console.log(teets);*/

getFromLocalStorage();
calculateTotal();

container.addEventListener('click', function (e) {
    /*console.log(e);*/
    if (e.target.classList.contains('teets') && !e.target.classList.contains('reserved')) {
       e.target.classList.toggle('selected');
       calculateTotal()      
    }
});

//select.addEventListener('change', function(e) {
//    calculateTotal();  
//});

function calculateTotal() {
    const selectedteets = container.querySelectorAll('.teets.selected');

    const selectedteetsArr = [];
    const teetsArr = [];

    selectedteets.forEach(function (teets) {
        selectedteetsArr.push(teets);
    });

    teets.forEach(function (teets) {
        teetsArr.push(teets);
    });

    // [1,3,5]
    let selectedteetsIndexs = selectedteetsArr.map(function (teets) {
        return teetsArr.indexOf(teets);
    });

    let selectedteetsCount = selectedteets.length;
    /*count.innerText = selectedteetsCount;*/
    /*amount.innerText = selectedteetsCount * select.value;*/

    saveToLocalStorage(selectedteetsIndexs);
}

function getFromLocalStorage() {
    const selectedteets = JSON.parse(localStorage.getItem('selectedteets'));

    if (selectedteets != null && selectedteets.length > 0) {
        teets.forEach(function (teets, index) {
            if (selectedteets.indexOf(index) > -1) {
                teets.classList.add('selected');
            }
        });
    }



    //const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');

    //if (selectedMovieIndex != null) {
    //    select.selectedIndex = selectedMovieIndex;
    //}
}

function saveToLocalStorage(indexs) {
    localStorage.setItem('selectedteets', JSON.stringify(indexs));
    /*localStorage.setItem('selectedMovieIndex', select.selectedIndex);*/
}

$("#oral-treatment-list tr").click(function () {
    $(this).addClass('selected').siblings().removeClass('selected');    
});

