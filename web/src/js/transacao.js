/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
   $('#receitaForm').on('submit', function(e){
        $.ajax({
            type: "post",
            url: "src/code/registrarTransacao.jsp",
            data: {
                transacao: this.transacao.value,
                descricao: this.descricao.value? this.descricao.value : "Outros",
                valor: this.valor.value? this.valor.value : 0.00,
                dtcadastro: this.dtcadastro.value? this.dtcadastro.value : Date(),
                categoria: this.categoria.value
            },
            beforeSend: function () {
                $('.loading').fadeIn('fast');
            },
            success: function (retorno) {
                $('.loading').fadeOut('fast');
                var r = JSON.parse(retorno);
                
                if(r.idStatus == 1){
                    if(confirm(r.dsStatus + "\n Deseja cadastrar uma nova Receita?")){
                        limparFormulario('#receitaForm');
                    }else{
                        $('#ReceitaModal').modal('hide');
                        limparFormulario('#receitaForm');
                    }
                }else if(r.idStatus == 0){
                    alert(r.dsStatus);
                }
            }
        });
       e.preventDefault();
   }); 
   
    $('#despesaForm').on('submit', function (e) {
        $.ajax({
            type: "post",
            url: "src/code/registrarTransacao.jsp",
            data: {
                transacao: this.transacao.value,
                descricao: this.descricao.value? this.descricao.value : "Outros",
                valor: this.valor.value? this.valor.value : 0.00,
                especie: this.especie.value,
                cartao: this.cartao? this.cartao.value : null,
                dtcadastro: this.dtcadastro.value? this.dtcadastro.value : Date(),
                categoria: this.categoria.value
            },
            beforeSend: function () {
                $('.loading').fadeIn('fast');
            },
            success: function (retorno) {
                $('.loading').fadeOut('fast');
                var r = JSON.parse(retorno);
                if (r.idStatus == 1) {
                    if (confirm(r.dsStatus + "\n Deseja cadastrar uma nova Despesa?")) {
                        limparFormulario('#despesaForm');
                    } else {
                        $('#DespesaModal').modal('hide');
                        limparFormulario('#despesaForm');
                    }
                } else if (r.idStatus == 0) {
                    alert(r.dsStatus);
                }
            }


        });
        e.preventDefault();
    });
    
    function limparFormulario(form){
        $(form)[0].reset();
        //POG mesmo
        $('#cartao-input').css('display', 'none');
        $('#cartao-input select').attr('name', '');
    }
});


