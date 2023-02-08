
/** 글 등록하기 버튼 **/
window.onscroll = function() {
    const btn = document.getElementById("write-btn");
    btn.style.position = "fixed";
    btn.style.bottom = "20px";
    btn.style.right = "20px";
}

/** 이미지 슬라이드 **/

$('.slider-2 .page-nav > div').click(function() {
    
    const $this = $(this);
    const $pagenav = $this.parent()
    const $current = $pagenav.find('.active');
    
    $current.removeClass('active');
    $this.addClass('active');

    const index = $this.index();
    const $slider = $this.closest('.slider-2');
    
    $slider.find('.slides > div.active').removeClass('active');
    $slider.find('.slides > div').eq(index).addClass('active');
    
    
});

$('.slider-2 > .side-btns > div:first-child').click(function() {
    const $this = $(this);
    const $slider = $this.closest('.slider-2');
    
    const $current = $slider.find('.page-nav > div.active');
    let $post = $current.prev();
    
    if ( $post.length == 0 ) {
        $post = $slider.find('.page-nav > div:last-child');
    }
    
    $post.click();
});

$('.slider-2 > .side-btns > div:last-child').click(function() {
    const $this = $(this);
    const $slider = $this.closest('.slider-2');
    
    const $current = $slider.find('.page-nav > div.active');
    let $post = $current.next();
    
    if ( $post.length == 0 ) {
        $post = $slider.find('.page-nav > div:first-child');
    }
    
    $post.click();
});