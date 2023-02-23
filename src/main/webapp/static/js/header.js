document.addEventListener("DOMContentLoaded", function(event) { //DOM이 로드된 이후에 실행되도록 하는 코드
 const category = document.querySelector(".dep1");
const btn = document.querySelector(".moreView");
const wrap = document.querySelector(".moreViewWrap");



function categoryHover() {
    category.classList.remove("hidden");

}

function categoryLeave() {
    category.classList.add("hidden");
}



btn.addEventListener("mouseenter", categoryHover);



wrap.addEventListener("mouseleave", categoryLeave);
});






/*const div = document.querySelector('#content');
div.classList.toggle('visible');*/
