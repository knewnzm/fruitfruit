

// tabs.forEach(tab => {
//   tab.addEventListener("click", ()=> {
//     const contentId = this.dataset.content;
//     console.log(contentId);
//     const content = document.getElementById(contentId);

//     var location = content.offsetTop;
//     window.scrollTo({top: location, behavior: 'smooth'});

//       // // Smoothly scroll to the content
//       // content.scrollIntoView({ behavior: 'smooth' });
//   });
// });



// function test(contentId){
//     const contentId = ;
//     console.log(contentId);
//     const content = document.getElementById(contentId);

//     var location = content.offsetTop;
//     window.scrollTo({top: location, behavior: 'smooth'});

//       // // Smoothly scroll to the content
//       // content.scrollIntoView({ behavior: 'smooth' });
//   });
// }

// console.log("aa");



$(document).ready(function () {    
    
    /* 모달 */
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.modal_btn');
      const btnClose = document.querySelector('.modal_close_btn');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');
        

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      btnClose.addEventListener('click', () => {
        modal.classList.remove('show');
        body.style.overflow = 'auto';
      });
    ////


    const tabs = document.querySelectorAll(".tab");

    tabs.forEach((tab) => {
      console.log(this.dataset.content);
      tab.addEventListener("click", test(this.dataset.content));
    });
    
    function goToScroll(name) {
      var location = document.querySelector("#" + name).offsetTop;
      window.scrollTo({top: location, behavior: 'smooth'});
    }
});
