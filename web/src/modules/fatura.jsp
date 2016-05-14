<%@ page pageEncoding="UTF-8"%>
<div class="modal fade" id="novaListaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <i class="fa fa-edit"></i><input class="modal-title" type="text" placeholder="Digite aqui o nome da lista...">
      </div>
      <div class="modal-body">
          
      <div class="row">
        
          <!-- <div class="box-header"> -->
            <!-- <h3 class="box-title">I</h3> -->
          <!-- </div>/.box-header -->
          
            <table class="table table-striped">
              <tbody><tr>
                <th style="width: 10px">#</th>
                <th>Item</th>
                <th>Quantidade</th>
                <td></td>
              </tr>
              <tr>
                <td>1.</td>
                <td>FeijÃ£o</td>
                <td>
                  <span>1x</span>
                </td>
                <td><i class="fa fa-trash"></i></td>
                
              </tr>
            </tbody></table>
         
      

      </div>



        <div class="row">
            <div class="col-lg-6 col-md-6 col-xs-6">
                <input type="text" class="form-control" placeholder="Nome do item">
            </div>
            <div class="col-lg-2 col-md-6 col-xs-6">
                <div class="input-group spinner">
                    <input type="text" class="form-control" value="1">
                    <div class="input-group-btn-vertical">
                      <button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>
                      <button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-xs-4">
              <button type="button" class="btn btn-default"><i class="fa fa-check"></i></button>
            </div>
        </div>


        
        




      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Criar lista</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Lista de compras
    <small></small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-shopping-cart"></i> Home</a></li>
    <li class="active">Lista de Compras</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
	
  <div class="row">
    <div class="col-lg-2">
    <div class="box box-default">

        <button class="btn btn-block btn-default btn-lg"  data-toggle="modal" data-target="#novaListaModal">Nova Lista<i class="fa fa-plus"></i></button>

    </div>
    </div>

  </div>

  <div class="box box-default collapsed-box">
      <div class="box-header with-border">
        <h3 class="box-title">Compras do mÃªs</h3>
        <div class="box-tools pull-right">
          <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
        </div><!-- /.box-tools -->
      </div><!-- /.box-header -->
      <div class="box-body">
        

        <table class="table table-striped">
          <tbody><tr>
            <th style="width: 10px">#</th>
            <th>Item</th>
            <th>Quantidade</th>
            <td></td>
          </tr>

          <tr>
            <td>1.</td>
            <td>FeijÃ£o</td>
            <td>
              <span>20x</span>
            </td>
            <td><i class="fa fa-trash"></i></td>
          </tr>

          <tr>
            <td>2.</td>
            <td>Arroz</td>
            <td>
              <span>2x</span>
            </td>
            <td><i class="fa fa-trash"></i></td>
          </tr>

          <tr>
          <td>3.</td>
          <td>Caixa de bombom</td>
          <td>
            <span>20x</span>
          </td>
          <td><i class="fa fa-trash"></i></td>
          </tr>

          <tr>
          <td>4.</td>
          <td>Sorvete</td>
          <td>
            <span>10x</span>
          </td>
          <td><i class="fa fa-trash"></i></td>
          </tr>

          <tr>
          <td>5.</td>
          <td>Balas</td>
          <td>
            <span>50x</span>
          </td>
          <td><i class="fa fa-trash"></i></td>
          </tr>

        </tbody></table>


      </div><!-- /.box-body -->
    </div>


    <div class="box box-default collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Padaria</h3>
          <div class="box-tools pull-right">
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
          </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body">
          

          <table class="table table-striped">
            <tbody><tr>
              <th style="width: 10px">#</th>
              <th>Item</th>
              <th>Quantidade</th>
              <td></td>
            </tr>

            <tr>
              <td>1.</td>
              <td>PÃ£o frances</td>
              <td>
                <span>10x</span>
              </td>
              <td><i class="fa fa-trash"></i></td>
            </tr>

            <tr>
              <td>2.</td>
              <td>Mortadela</td>
              <td>
                <span>1x</span>
              </td>
              <td><i class="fa fa-trash"></i></td>
            </tr>

            <tr>
            <td>3.</td>
            <td>Queijo</td>
            <td>
              <span>1x</span>
            </td>
            <td><i class="fa fa-trash"></i></td>
            </tr>


          </tbody></table>


        </div><!-- /.box-body -->
      </div>

</section><!-- /.content -->


