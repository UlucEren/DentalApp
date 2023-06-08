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
const oral_treatment_list = document.querySelector('.oral-treatment-list');

getFromLocalStorage();
calculateTotal();

container.addEventListener('click', function (e) {
    //console.log(e);
    if (e.target.classList.contains('teets')) {
       //e.target.classList.toggle('selected');
        /*calculateTotal() */
        const selected_oral_treatment_list = oral_treatment_list.querySelectorAll('.selected');
        if (selected_oral_treatment_list.length==0) {
            alert("Tedavi Seçiniz.");
            return;
        }
        //console.log(selected_oral_treatment_list);
        //console.log(selected_oral_treatment_list[0].dataset);
        //console.log(selected_oral_treatment_list[0].dataset.tedaviId);
        //console.log(selected_oral_treatment_list[0].dataset.tedaviKod);
        //console.log(selected_oral_treatment_list[0].dataset.tedaviAdi);
        //console.log(selected_oral_treatment_list[0].dataset.tedaviMasraf);
        //console.log(selected_oral_treatment_list[0].dataset.tedaviFiyat);
        /*console.log(e.target.classList[1]);*/
        //console.log($('#treatments-table-body'));
        //console.log($('#treatments-table-body tr').length);
        
        var ThisMonth = new Date().getMonth() + 1;
        var ThisDay = new Date().getDate();
        var ThisYear = new Date().getFullYear(); ThisMonth.toString()
        var ThisDate = ThisDay.toString() + "." + ThisMonth.toString() + "." + ThisYear.toString();
        /*console.log(ThisDate);*/
        
        let teet = e.target.classList[1];
        let result_teet = teet.substring(teet.indexOf("-") + 1);
        if (document.getElementById('treatments-table-body').rows[0].cells.item(1).innerHTML == "Sistemde Kayitli Veri Bulunamadi") {
            document.getElementById('treatments-table-body').deleteRow(0);
        }
        $('#treatments-table-body').append('<tr data-tedavi-id="' + selected_oral_treatment_list[0].dataset.tedaviId + '"><td>' + ThisDate + '</td><td>' + result_teet + '</td><td>' + selected_oral_treatment_list[0].dataset.tedaviAdi + '</td><td>Doktor</td><td>' + selected_oral_treatment_list[0].dataset.tedaviFiyat + '</td></tr>'); 
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
    
    if (this.classList.contains('process-treatment')) {
        $(this).toggleClass('selected').siblings().removeClass('selected');
    }
        
});




