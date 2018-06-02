/**
 * common
 */
$(function(){
    
    $.pjax.defaults.timeout = 5000;
    $.pjax.defaults.maxCacheLength = 0;
    $(document).pjax('a:not(a[target="_blank"])', {container:'#pjax-container', fragment:'#pjax-container'});
    
    /*
    $(document).on('submit', 'form[pjax-container]', function(event) {
        $.pjax.submit(event, '#pjax-container', {fragment:'#pjax-container'})
    });
    */
    
    //提交
    $('body').off('click', '.submits');
    $('body').on("click", '.submits', function(event){
        var _this = $(this);
        _this.button('loading');
        var form = _this.closest('form');
        if(form.length){
            var ajax_option={
                dataType:'json',
                success:function(data){
                    if(data.code == 200){
                        $.amaran({'message':data.info});
                        var url = data.url;
                        $.pjax({url: url, container: '#pjax-container', fragment:'#pjax-container'})
                    }else{
                        _this.button('reset');
                        $.amaran({'message':data.info});
                    }
                }
            }
            form.ajaxSubmit(ajax_option);
        }
    });
    
    //搜索
    $(document).on('submit', 'form[pjax-search]', function(event) {
        $.pjax.submit(event, {container:'#pjax-container', fragment:'#pjax-container'})
    })
    
    //授权用户
    $('body').off('click', '.submitss');
    $('body').on("click", '.submitss', function(event){
        $("#search_to option").each(function (){
            $(this).prop('selected', 'selected');
        });
        $("#search option").each(function (){
            $(this).prop('selected', 'selected');
        });
        var _this = $(this);
        _this.button('loading');
        var form = _this.closest('form');
        if(form.length){
            var ajax_option={
                dataType:'json',
                success:function(data){
                    if(data.code == 200){
                        $.amaran({'message':data.info});
                        var url = data.url;
                        $.pjax({url: url, container: '#pjax-container', fragment:'#pjax-container'})
                    }else{
                        _this.button('reset');
                        $.amaran({'message':data.info});
                    }
                }
            }
            form.ajaxSubmit(ajax_option);
        }
    });
    
    //单条删除-批量删除
    $('body').off('click', '.delete-one,.delete-all');
    $('body').on("click", '.delete-one,.delete-all', function(event){
        event.preventDefault();
        var _this = $(this);
        var title = _this.data('title')?_this.data('title'):'删除';
        var url_del = _this.data('url')||'';
        var message = _this.data('message')?_this.data('message'):'确认操作？';
        if(_this.hasClass('delete-all')){   //批量删除
            var id = '';
            var str = '';
            var table_box = _this.closest('.box-header').next('.box-body').find(".table tr td input[type='checkbox']");
            $(table_box).each(function(){
                if(true == $(this).is(':checked')){
                    str += $(this).val() + ",";
                }
            });
            if(str.substr(str.length-1)== ','){
                id = str.substr(0, str.length-1);
            }
        }else{                              //单条删除
            var id = _this.data('id')||'';
        }
        if(id && url_del){
            BootstrapDialog.confirm({
                onshow:function(obj){
                    var cssConf = {};
                    cssConf['width']=300;
                    if(cssConf){
                        obj.getModal().find('div.modal-dialog').css(cssConf);
                    }
                },
                title: title,
                message: message,
                btnCancelLabel: '取消',
                btnOKLabel: '确定',
                callback: function(resultDel) {
                    if(resultDel === true) {
                        $.ajax({
                            type : "post",
                            url : url_del,
                            dataType : 'json',
                            data : { id:id, },
                            success : function(data) {
                                if(data.code == 200){
                                    $.amaran({'message':data.info});
                                    var url = data.url;
                                    $.pjax({url: url, container: '#pjax-container', fragment:'#pjax-container'})
                                }else{
                                    $.amaran({'message':data.info});
                                }
                            }
                        });
                    }
                }
            });
        }
    });
    
    //上传
    $('body').off('click', '.up-btn');
    $('body').on("click", '.up-btn', function(event){
        var _this_up_btn = $(this);   //当前上传按钮
        var up_url = _this_up_btn.data('url');   //上传地址
        //var $('.modal-dialog .Uploads').val();
        
        BootstrapDialog.confirm({
            title: "上传 - Upload",
            message: '<form method="POST" action="'+up_url+'" enctype="multipart/form-data" ><input type="file" name="imgFile" class="Uploads" /></form>',
            btnCancelLabel: '取消',
            btnOKLabel: '确定',
            callback: function(result) {
                if(result) {
                    var form = $('.modal-dialog').find('form');
                    var ajax_option={
                        dataType:'json',
                        success:function(data){
                            if(data.code == 200){
                                _this_up_btn.prev().attr("href", data.url);
                                _this_up_btn.prev().find('img').attr("src", data.url);
                                _this_up_btn.closest('.input-group').find('input').val(data.url);
                                $.amaran({'message':'上传成功'});
                            }else{
                                $.amaran({'message':data.info});
                            }
                        }
                    }
                    form.ajaxSubmit(ajax_option);
                }
            }
        });
        
    });
    
    //状态status列表修改（只能进行0和1值的切换）
    $('body').off('click', 'td a.editimg.state');
    $('body').on('click', 'td a.editimg.state', function(event){
        var addclass;
        var removeclass;
        var pvalue;   //提交值
        var _this = $(this);
        var field = _this.data('field');
        var id = _this.data('id');
        var value = _this.data('value');
        var url = _this.data('url');
        if ( value == 1){
            pvalue = 0;
            addclass = "fa-check-circle text-green";
            removeclass = "fa-times-circle text-red";
        }else{
            pvalue = 1;
            addclass = "fa-times-circle text-red";
            removeclass = "fa-check-circle text-green";
        }
        var dataStr = jQuery.parseJSON( '{"id":"'+id+'","'+field+'":"'+pvalue+'"}' );   //字符串转json
        $.ajax({
            type : "post",
            url : url,
            dataType : 'json',
            data : dataStr,
            success : function(data) {
                if(data.code == 200){
                    _this.data('value', pvalue);
                    _this.removeClass(addclass);
                    _this.addClass(removeclass);
                }else{
                    $.amaran({'message':data.info+'或检查验证类'});
                }
            }
        });
    });
    //性别
    $('body').off('click', 'td a.editimg.sex');
    $('body').on('click', 'td a.editimg.sex', function(event){
        var addclass;
        var removeclass;
        var pvalue;   //提交值
        var _this = $(this);
        var field = _this.data('field');
        var id = _this.data('id');
        var value = _this.data('value');
        var url = _this.data('url');
        if ( value == 1){
            pvalue = 0;
            addclass = "fa-male text-green";
            removeclass = "fa-female text-red";
        }else{
            pvalue = 1;
            addclass = "fa-female text-red";
            removeclass = "fa-male text-green";
        }
        var dataStr = jQuery.parseJSON( '{"id":"'+id+'","'+field+'":"'+pvalue+'"}' );   //字符串转json
        $.ajax({
            type : "post",
            url : url,
            dataType : 'json',
            data : dataStr,
            success : function(data) {
                if(data.code == 200){
                    _this.data('value', pvalue);
                    _this.removeClass(addclass);
                    _this.addClass(removeclass);
                }else{
                    $.amaran({'message':data.info+'或检查验证类'});
                }
            }
        });
    });
    
    /*
    $(document).on('pjax:send', function(xhr) {
        if(xhr.relatedTarget && xhr.relatedTarget.tagName && xhr.relatedTarget.tagName.toLowerCase() === 'form') {
            $submit_btn = $('form[pjax-container] :submit');
            if($submit_btn) {
                $submit_btn.button('loading');
            }
        }
    })
    */
    /*
    $(document).on('pjax:complete', function(xhr) {
        if(xhr.relatedTarget && xhr.relatedTarget.tagName && xhr.relatedTarget.tagName.toLowerCase() === 'form') {
            $submit_btn = $('form[pjax-container] :submit');
            if($submit_btn) {
                $submit_btn.button('reset')
            }
        }
    })
    */
    
    //$(document).pjax('a[target!=_blank]', '#pjax-container', {fragment:'#pjax-container', timeout:8000});
    $(document).ajaxStart(function(){NProgress.start();}).ajaxStop(function(){NProgress.done();});
    
    /*
    $('.sidebar-menu li:not(.treeview) > a').on('click', function(){
        var $parent = $(this).parent().addClass('active');
        $parent.siblings('.treeview.active').find('> a').trigger('click');
        $parent.siblings().removeClass('active').find('li').removeClass('active');
    });
    */
})

/*
 * 输入框只能输入  1111.11【数字和小数点后两位】
 */
function clearNoNum(obj){
    obj.value = obj.value.replace(/[^\d.]/g,"");        //清除“数字”和“.”以外的字符  
    obj.value = obj.value.replace(/\.{2,}/g,".");       //只保留第一个. 清除多余的  
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');          //只能输入两个小数  
    if(obj.value.indexOf(".")< 0 && obj.value !=""){    //以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
        obj.value= parseFloat(obj.value); 
    } 
}