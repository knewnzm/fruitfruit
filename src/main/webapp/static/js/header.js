


const category = document.querySelector(".dep1");
const btn = document.querySelector(".moreView");
const wrap = document.querySelector(".moreViewWrap");


<<<<<<< HEAD
=======

>>>>>>> origin/jeongmin
function categoryHover() {
    category.classList.remove("hidden");

}

function categoryLeave() {
    category.classList.add("hidden");
}



btn.addEventListener("mouseenter", categoryHover);



wrap.addEventListener("mouseleave", categoryLeave);



const div = document.querySelector('#content');
div.classList.toggle('visible');
