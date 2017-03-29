<?php 
   $self -> document -> setTitle("Withdraw Your Wallet"); 
   echo $self -> load -> controller('common/header'); 
  // echo $self -> load -> controller('common/column_left'); 
   ?>
  <div class="content-header row">
  <div class="content-header-left col-md-6 col-xs-12">
    <h2 class="content-header-title mb-0">Withdraw Your Wallet</h2>
    <div class="row breadcrumbs-top">
      <div class="breadcrumb-wrapper col-xs-12">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.html">Home</a>
          </li>
          <li class="breadcrumb-item"><a href="#">Withdraw Your Wallet</a>
          </li>
          
        </ol>
      </div>
    </div>
  </div>
    <div class="h-main-content">
    <div class="container">
        <div class="row">
            
      <div class="col-md-12">
         <div class="panel panel-default">

          <div class="col-md-4 col-md-push-2 text-center">
              <div class="item_wallet">
                  <h5>Your USD HKBIT</h5>
                  <div class="box box-block bg-white tile tile-1 mb-2">
                      <div class="t-icon right"><span class="bg-danger"></span>
                      <img src="catalog/view/theme/default/img/logo.png" style="height: 50px;margin-top: 10px;" alt=""></div>
                      <div class="t-content">
                          
                          <h1 class="mb-1"><?php echo $get_m_walleet['amount']/10000 ?> USD<p></p></h1>
                      </div>
                  </div>
              </div>
           </div>     
           <div class="col-md-4 col-md-push-2 text-center">
              <div class="item_wallet">
                  <h5>Your Wallet</h5>
                  <div class="wallet wallet_blockcio">
                      <img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=<?php echo $customer['wallet'] ?>" alt="">
                  </div>
                  <p><?php echo $customer['wallet'] ?></p>
                  
              </div>
           </div>   
           <div class="clearfix"></div> 
           
            <form id="tranfer_cm_btc" style="margin-top: 30px;" action="index.php?route=account/withdraw/submit_my_transaction" method="POST" >
              <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                <input autocomplete="off" class="form-control" placeholder="Amount USD" type="text" name="amount_usd" id="amount_usd" data-maxamount_usd="<?php echo ($get_m_walleet['amount']/10000) ?>">
                 <p class="error error_amount_usd">Please enter a amount USD</p>
                <p class="error error_amount_max_usd">You can withdraw max <?php echo ($get_m_walleet['amount']/10000) ?> USD</p>
              </div>
              <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                <input autocomplete="off" data-link="<?php echo $self->url->link('account/withdraw/get_btc_usd'); ?>" class="form-control" readonly="true" placeholder="Amount BTC" type="text" name="amount_btc" id="amount_btc">
              </div>
              <div class="col-md-3 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
                <input readonly="true" autocomplete="off" class="form-control" placeholder="Password Transaction" type="password" name="password_transaction_btc" id="password_transaction_btc">
                 <p class="error error_password_transaction_btc">Please enter a Secret answer</p>
                <p class="error error_password_transaction_deal_btc">Password do not macth</p>
              </div>
              <div class="col-md-2 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
               <input class="form-control btn btn-warning btn-block"  id="" type="submit" value="OK">
              </div>
               
             </form>
             <div class="clearfix" style="margin-top: 20px;"></div>
             
             <div class="clearfix"></div>
             <?php if(count($histotys) > 0){ ?>
              <h3 class="text-center" style="margin-top: 50px;">History Withdraw</h3>
              <div class="panel-body">
                  <div class="row">
                      <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                          <table id="datatable" class="table table-striped table-bordered">
                              <thead>
                                  <tr>
                                     <th class="text-center">No.</th>
                                      <th>Item</th>
                                      <th>Date</th>

                                      <th>Amount</th>
                                      <th>Detail</th>
                                      
                                  </tr>
                              </thead>
                              <tbody>
                                 <?php $number = 1; foreach ($histotys as $key => $value) {?>
                                    <tr>
                                         <td data-title="No." align="center"><?php echo $number ?></td>
                                        <td data-title="Item"><?php echo $value['wallet'] ?></td>
                                        <td data-title="Date"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                        <td data-title="Amount"><?php echo $value['text_amount'] ?></td>
                                        <td data-title="Detail">
                                            <?php echo $value['system_decsription'] ?>
                                        </td>
                                        
                                    </tr>
                                <?php $number++; } ?>
                              </tbody>
                          </table>
                          <div class="col-md-12 text-center">
                            <?php echo $pagination; ?>
                          </div>
                      </div>
                  </div>
              </div>
             <?php } ?>

      

     </div>
     <div class="clearfix"></div>
</div>
</div>
</div>
<div class="clearfix" style="height: 50px;"></div>

<?php echo $self->load->controller('common/footer') ?>
<script type="text/javascript">
    $(document).ready(function() {
        $('#datatable').dataTable();
    } );
</script>