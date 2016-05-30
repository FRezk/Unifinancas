$(function(){
    
    var rootpathname = '/Unifinancas/';
    var pathname = window.location.pathname; // Returns path only
    var file = pathname.substring(rootpathname.length, pathname.length);
    //console.log(pathname, file);
    
    
    var $sidebarMenuLI = $('.sidebar-menu li');
    
    for(var i = 0; i < $sidebarMenuLI.length; i++){
       var $link = $($sidebarMenuLI[i]).find('a');
       
       if($link.attr('href') === file){
           if($link.parent().parent().parent().hasClass('treeview')){
              $link.parent().parent().parent().addClass('active');
              $link.parent().addClass('active');
           }else{
               $link.parent().addClass('active');
           }
           
       }
    }
    
    atualizarSaldo();
    
    
    
    
    
    //var $activeSidebarMenu = $('.sidebar-menu li a[href=\"'+file+'\"]');
    //$activeSidebarMenu.parent().addClass('active');
    //console.log($activeSidebarMenu);
    
});

//saldo conta
function atualizarSaldo() {
    $.ajax({
        type: 'GET',
        url: 'src/code/getSaldo.jsp',
        success: function (retorno) {
            var r = JSON.parse(retorno);
            $('#saldo-header').text("Saldo: $"+r.saldo);
        }
    })
}

