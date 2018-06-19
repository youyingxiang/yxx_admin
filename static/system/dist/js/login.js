/**
 * login
 */
$(function(){
    //登陆
    $('body').off('click', '.login');
    $('body').on("click", '.login', function(event){
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
                        window.location.href=url; 
                    }else{
                        $.amaran({ 'message':data.info, 'clearAll':true });
                        $('#code').click();
                        _this.button('reset');
                    }
                }
            }
            form.ajaxSubmit(ajax_option);
        }
    });
})