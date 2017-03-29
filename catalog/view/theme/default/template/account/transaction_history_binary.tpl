<?php 
   $self -> document -> setTitle('Transaction History'); 
   echo $self -> load -> controller('common/header'); 
  // echo $self -> load -> controller('common/column_left'); 
   ?>
  <div class="content-header row">
  <div class="content-header-left col-md-6 col-xs-12">
    <h2 class="content-header-title mb-0">Pairing bonus</h2>
    <div class="row breadcrumbs-top">
      <div class="breadcrumb-wrapper col-xs-12">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.html">Home</a>
          </li>
          <li class="breadcrumb-item"><a href="#">Pairing bonus</a>
          </li>
          
        </ol>
      </div>
    </div>
  </div>
    <div class="h-main-content">
    <div class="container">
        <div class="row">
        
                            <?php if(count($histotys) > 0){ ?>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                   <th class="text-center"><?php echo $lang['column_no'] ?></th>
                                                          <th><?php echo $lang['column_wallet'] ?></th>
                                                          <th><?php echo $lang['column_date_added'] ?></th>
                                                          <th><?php echo $lang['column_amount'] ?></th>
                                                          <th><?php echo $lang['column_description'] ?></th>
                                                      
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <?php $number = 1; foreach ($histotys as $key => $value) {?>
                                                            <tr>
                                                                 <td data-title="<?php echo $lang['column_no'] ?>." align="center"><?php echo $number ?></td>
                                                                <td data-title="<?php echo $lang['column_wallet'] ?>"><?php echo $value['wallet'] ?></td>
                                                                <td data-title="<?php echo $lang['column_date_added'] ?>"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                                                <td data-title="<?php echo $lang['column_amount'] ?>"><?php echo $value['text_amount'] ?></td>
                                                                <td data-title="<?php echo $lang['column_description'] ?>">
                                                                    <?php echo $value['system_decsription'] ?>
                                                                </td>
                                                                
                                                            </tr>
                                                        <?php $number++; } ?>
                                            </tbody>
                                        </table>
                                  <?php echo $pagination; ?>
                                    </div>
                                </div>
                            </div>
                           <?php } ?>
                        </div>
                    </div>
                    
            </div>
            </div>
   <!-- End row -->
</div>

 <script type="text/javascript">
            $(document).ready(function() {
                $('#datatable').dataTable();
            } );
        </script>
<?php echo $self->load->controller('common/footer') ?>