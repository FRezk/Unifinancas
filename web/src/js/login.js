$(function(){
    $('#loginForm').on('submit', function(e){
        $.ajax({
            type: "get",
            url: "src/code/login.jsp",
            data: {
                emailUsuario: this.emailUsuario.value,
                senhaUsuario: this.senhaUsuario.value
            },
            beforeSend: function(){
              $('.loading').fadeIn('fast');  
            },
            success: function(retorno){
                var r = JSON.parse(retorno);
                $('.loading').fadeOut('fast');
                
                if(r.idStatus){
                    location.href = "home.jsp";
                } else{
                    alert(r.dsStatus);
                }
            }
            
            
        });
        e.preventDefault();
    });
    
    
    
    
    
});