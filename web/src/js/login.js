$(function(){
    $('#loginForm').on('submit', function(e){
        $.ajax({
            type: "get",
            url: "src/code/login.jsp",
            data: {
                emailUsuario: this.emailUsuario.value,
                senhaUsuario: this.senhaUsuario.value
            },
            success: function(retorno){
                var r = JSON.parse(retorno);
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