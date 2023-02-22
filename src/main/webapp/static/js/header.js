


const category = document.querySelector(".dep1");
const btn = document.querySelector(".moreView");
const wrap = document.querySelector(".moreViewWrap");



function categoryHover() {
    category.classList.remove("hidden");

}

function categoryLeave() {
    category.classList.add("hidden");
}



wrap.addEventListener("mouseenter", categoryHover);



wrap.addEventListener("mouseleave", categoryLeave);



/*const div = document.querySelector('#content');
div.classList.toggle('visible');*/
