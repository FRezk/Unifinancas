$(function(){
    
    $('#cadastroForm').on('submit', function(e){
        if(!this.emailUsuario.value) {
            alert("Por favor, informar um e-mail.");
            return false;
        }
        if(!this.nomeUsuario.value) {
            alert("Por favor, informar um nome completo.");
            return false;
        }
        if(!this.senhaUsuario.value){
            alert("Por favor, informar uma senha.");
            return false;
        }
        if(this.senhaUsuario.value == this.confirmaSenhaUsuario.value){
            $.ajax({
                type: "post",
                url: "src/code/cadastro.jsp",
                data: {
                    emailUsuario: this.emailUsuario.value,
                    nomeUsuario: this.nomeUsuario.value,
                    senhaUsuario: this.senhaUsuario.value,
                    confirmaSenhaUsuario: this.confirmaSenhaUsuario.value
                },
                beforeSend: function(){
                  $('.loading').fadeIn('fast');
                },
                success: function(retorno){
                    var r = JSON.parse(retorno);
                    $('.loading').fadeOut('fast');
                    
                    if(r.idStatus == 0){
                        alert(r.dsStatus);
                    } else if(r.idStatus == 1){
                        alert(r.dsStatus);
                        login(r.email, r.senha);
                    } else if(r.idStatus == 2){
                        alert(r.dsStatus);
                        this.senhaUsuario.value = "";
                        this.confirmaSenhaUsuario.value = "";
                    } else if(r.dsStatus == 3){
                        alert(r.dsStatus);
                    } else if(r.dsStatus == 4){
                        alert(r.dsStatus);
                    } else if(r.dsStatus == 5){
                        alert(r.dsStatus);
                    }
                }
            });
        }else{
            alert("Senhas divergente. Por favor, digite novamente.");
            this.senhaUsuario.value = "";
            this.confirmaSenhaUsuario.value = "";
        }
        e.preventDefault();
    });
    
    function login(_emailUsuario, _senhaUsuario){
        $.ajax({
            type: "get",
            url: "src/code/login.jsp",
            data: {
                emailUsuario: _emailUsuario,
                senhaUsuario: _senhaUsuario
            },
            beforeSend: function () {
                $('.loading').fadeIn('fast');
            },
            success: function (retorno) {
                var r = JSON.parse(retorno);
                $('.loading').fadeOut('fast');

                if (r.idStatus) {
                    location.href = "home.jsp";
                } else {
                    alert(r.dsStatus);
                }
            }
        });
    }
});