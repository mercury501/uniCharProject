var searchIcon = document.querySelector('.fa-search');

var closeIcon = document.querySelector('.fa-times');

var search = document.getElementById('search');


searchIcon.onclick = () =>{
    search.classList.add('expand');
}

closeIcon.onclick = () =>{
    search.classList.remove('expand');
}


var button = document.querySelector('button');
var menu = document.querySelector('.menu');
button.onclick = () =>{
    menu.classList.toggle('expand-mobile');
    button.classList.toggle('expand-icon');
}