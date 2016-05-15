$(function(){
    $('#loginForm').on('submit', function(e){
        $.ajax({
            type: "post",
            url: "src/code/login.jsp",
            data: {
                nomeUsuario: this.nomeUsuario.value,
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