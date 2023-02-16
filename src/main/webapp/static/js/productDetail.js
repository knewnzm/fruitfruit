

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

const tabs = document.querySelectorAll(".tab");

    tabs.forEach((tab) => {
      console.log(this.dataset.content);
      tab.addEventListener("click", test(this.dataset.content));
    });
    
    function goToScroll(name) {
      var location = document.querySelector("#" + name).offsetTop;
      window.scrollTo({top: location, behavior: 'smooth'});
    }


