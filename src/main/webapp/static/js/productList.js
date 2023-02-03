
/** 글 등록하기 버튼 **/
window.onscroll = function() {
    const btn = document.getElementById("write-btn");
    btn.style.position = "fixed";
    btn.style.bottom = "20px";
    btn.style.right = "20px";
}

/** 페이징  **/
const card_per_page = 20;

function create_card()  {
    const cards = document.querySelectorAll('.product-card');
    if (cards.length < card_per_page){
        const card = document.querySelector('.product-card');
        const newNode = card.cloneNode(true);
        card.after(newNode);
    }   
}

const pageNation = document.querySelector('.page_nation');

pageNation.addEventListener("click", (event) => {
const target = event.target;
    if(target.classList.contains("page")) {
        const pages = pageNation.querySelectorAll(".page");
        pages.forEach(page => page.classList.remove("active"));
        target.classList.add("active");
    }
});

