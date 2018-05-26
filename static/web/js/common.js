$(function(){
    
    $.pjax.defaults.timeout = 5000;
    $.pjax.defaults.maxCacheLength = 0;
    $(document).pjax('a:not(a[target="_blank"])', {container:'#pjax-container', fragment:'#pjax-container'});
    
    $(document).ajaxStart(function(){NProgress.start();}).ajaxStop(function(){NProgress.done();});
    
    /* 移动端导航 */
    $('body').off('click', '.top-nav-toggle');
    $('body').on("click", '.top-nav-toggle', function(event){
        event.preventDefault();
        $('body').toggleClass("offcanvas");
        $('.top-nav-toggle').toggleClass("active");
    });
    $(window).resize(function() {
        $('body').removeClass("offcanvas");
        $('.top-nav-toggle').removeClass("active");
    });
    $(window).scroll(function() {
        $('body').removeClass("offcanvas");
        $('.top-nav-toggle').removeClass("active");
    });
    $('body').off('click', '.scr-c');
    $('body').on("click", '.scr-c', function(event){
        $('body').removeClass("offcanvas");
        $('.top-nav-toggle').removeClass("active");
        //event.stopPropagation();   //该死的阻止事件冒泡
    });
    /* 移动端导航 */
    
    
    $('body').off('click', '.navs ul li a');
    $('body').on("click", '.navs ul li a', function(event){
        var _this = $(this);
        $('.navs ul li a').removeClass("active");
        _this.addClass("active");
        $('body').removeClass("offcanvas");
        $('.top-nav-toggle').removeClass("active");
    });
})