


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



const div = document.querySelector('#content');
div.classList.toggle('visible');


        ///////////////////////////////////
        function makeBtn2(data, cate_type = 2) { //하나의 행 element를 data라 부르기로 하자
            let html = ` 
            	<li>
                <a href="/product/csearch?frfr_category2=${"${data.cate_num}"}" class="on title">
                    <span>${"${data.cate_name}"}</span>
                </a>
            </li>
            `;
            return html; //그렇게 만든 하나의 html을 makeBtnList함수의 html값에 합쳐준다
        }
        /////////////////////////////////////////
        function makeBtn(data, cate_type = 1) { //하나의 행 element를 data라 부르기로 하자
        	/* 
        	<div> id=c"${cate_type}"+"${cate_num}" ex)c1+1
        	<input> name=c"${cate_type}" , id=c"${cate_type}"-"${cate_num}" ex) name=c1 ,id=c1-1
        	<label> 
            for=c"${cate_type}"-"${cate_num}" ex) c1-1 
            */
            
          //class가 menuArea인 li태그를 만들고
          //Mapping의 value가 /product/csearch이고 @RequestPram값으로 키값frfr_category1,밸류가 data의 cate_num값인
          //컨트롤러로 가는 링크를 생성한다
          //span 태그에 data의 cate_name값을 넣어준다
            let html = ` 
            	<li class="menuArea"> 
                <a href="/product/csearch?frfr_category1=${"${data.cate_num}"}" class="title on"> 
                    <span id="c${'${cate_type}'}-${'${data.cate_num}'}" class="text">${"${data.cate_name}"}</span>
                </a>
                <ul id="c${'${cate_type}'}_${'${data.cate_num}'}" class="category-wrap">
                </ul>
                </li>
            `;
            return html; //그렇게 만든 하나의 html을 makeBtnList함수의 html값에 합쳐준다
        }
        ///////////////////////////////
        function makeBtnList(array, cate_type = 1) {
            let html = "";
            for (let i = 0; i < array.length; i++) {
                const element = array[i]; //array에 들어있는 각각의 행 element를 순서대로 꺼낸다 [object Object]
                
                if(cate_type==1){
                html += makeBtn(element, cate_type); //makeBtn함수에 element값을 순서대로 넣는다
                                                                          //그 결과를 빈 html변수에 순서대로 합친다
                }else if(cate_type==2){
                	html += makeBtn2(element, cate_type);
                }
            }
            return html; //합쳐진 html값을 getCategoryList함수로 다시 보내준다
        }
        /////////////////////////////////
        function getCategoryList(cate_type, cate_parent_num = -1) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/category/getCategory",
                data: { cate_type, cate_parent_num },
                success: function (response) { //카테고리 대분류 전체 리스트가 들어있는 GSON값을 받는다
                   const arr = $.parseJSON(response); //받아온 GSON값을 parseJSON하여 arr이라는 변수에 담는다
                    let html = makeBtnList(arr, cate_type); //makeBtnList함수에 arr과 cate_type을 보내고,
                                                                                 //보낸 결과값을 html이라는 변수에 담는다
                                                                                 
                                                                                 if(cate_type==1){
                    $("#c" + cate_type + "-list").html(html);//아이디가 c1-list꼴인 form의 내용을 html로 교체한다
                                                                                 }else if(cate_type==2){
                                                                                	 
                    $("#c1_"+ cate_parent_num).html(html);//아이디가 c1-list꼴인 form의 내용을 html로 교체한다
                                                                                 }
                    
                }
            });
        }
        ////////////////////
         function categoryBtnHandler(e) {
        	 const data = $(e.target).attr("id").split("-");// $(e.target)은 <a>태그, a태그의 id에서 "-"를 기준으로 값을 나눠 data에 담는다 ex)c1,2
             const cate_type = parseInt(data[0].substr(1)); //그중 맨앞의 값인 data[0]값의 맨 앞의 하나를 뺀다 .substr(1) c1-> 1
             const cate_num = data[1]; //그 다음값인 data[1]값을 cate_num변수에 담는다 ex)2 
             getCategoryList(cate_type + 1, cate_num);
            }
        //////////////////////
        $(document).ready(function(){
        	getCategoryList(1);
        	
        	$(document).on("mouseover", "span.text", function (e) { //class가 menuArea인 li태그에 마우스를 올렸을때 
        		categoryBtnHandler(e); //categoryBtnHandler함수를 실행한다
        	});
        	
        });