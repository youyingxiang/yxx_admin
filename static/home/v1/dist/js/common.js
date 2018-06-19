/**
 * common
 */
$(function() {
    $.pjax.defaults.timeout = 5000;
    $.pjax.defaults.maxCacheLength = 0;
    $(document).pjax('a:not(a[target="_blank"])', {container: '#pjax-container', fragment: '#pjax-container'});
    $(document).ajaxStart(function(){NProgress.start();}).ajaxStop(function(){NProgress.done();});

    $(".search-btn-menu ").on('click',function () {
        var data_value = $("#search-btn-value").val().trim()
        $('.menu_check').each(function () {
            var obj = $(this)
            var search_content = obj.html()
            if (search_content.indexOf(data_value) >= 0) {
                if (obj.parent().parent().hasClass('treeview-menu')) {
                    if (obj.parent().parent().parent().hasClass('active') == false) {
                        obj.parent().parent().prev().trigger('click')
                        obj.trigger('click')
                    } else {
                        obj.trigger('click')
                    }
                } else {
                    obj.trigger('click');
                }
                return false
            }
        })
    })
})