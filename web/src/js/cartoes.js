/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {

    var delcartao = function () {
        var $container = $(this).parent().parent();
        var _idcartao = $container.attr('data-idcartao');
        $.ajax({
            url: 'src/code/cartaoWS.jsp',
            type: 'post',
            data: {
                funcao: 'APAGAR',
                idcartao: _idcartao
            },
            success: function (retorno) {
                var r = JSON.parse(retorno);

                if (r.idStatus == 0) {
                    alert(r.dsStatus);
                } else if (r.idStatus == 1) {
                    $container.remove();
                    console.log(r.dsStatus, r.idcartao);
                }
            }
        });
    };
    $('.delcartao_bt').on('click', delcartao);

    $('#newcartao_form').on('submit', function (e) {
        var _idbandeira = this.idbandeira.value;
        var _nomecartao = this.nomecartao.value;
        
        var _nomecartao = this.nomecartao.value;
        if (!_nomecartao) {
            alert('escolha um nome');
            return false;
        }
        $.ajax({
            url: 'src/code/cartaoWS.jsp',
            type: 'post',
            data: {
                funcao: 'CADASTRAR',
                idbandeira: _idbandeira,
                nomecartao: _nomecartao
            },
            success: function (retorno) {
                var r = JSON.parse(retorno);

                if (r.idStatus == 0) {
                    alert(r.dsStatus);
                } else if (r.idStatus == 1) {
                    var newcartao = '<li><img class="bandeira-logo" title="'+r.bandeiraNome+'" src="'+r.urlBandeiraLogo+'"/><span class="control-label">'+_nomecartao+'</span><div class="tools"><i class="fa fa-times delcartao_bt"></i></div></li>'
                    $('#customCartao-list').prepend(newcartao);
                    //o novo registro de categoria vem com um botao de deletar categoria, mas precisa ser adicionado o evento de deletar categoria somente a ele
                    $('#customCartao-list li[data-idcartao=' + r.idcartao + '] .delcartao_bt').on('click', delcartao);
                    $('#newcartao_form')[0].reset();
                }
            }
        });
      
        e.preventDefault();
    });
});
