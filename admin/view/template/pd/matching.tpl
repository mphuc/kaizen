<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>All Matching</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">      
    
    </div>
    <div class="panel-body row">
        <div class="clearfix" style="margin-top:10px;"></div>
     	<table class="table table-bordered table-hover">
     		<thead>
     			<tr>
     				<th>TT</th>
     				<th>Username</th>
            <th>Wallet</th>
            <th>Amount</th>
            <th>Amount Payment</th>
            <th>Amount Cumulative</th>
            
     			</tr>
     		</thead>
     		<tbody>
        <?php 
          $i = 0;
          //print_r($_SESSION); die;
          foreach ($code as $value) {
            $i++;
        ?>
          <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $value['username'] ?></td>
            <td><?php echo $value['text_amount'] ?></td>
            <td><?php echo $value['system_decsription'] ?></td>
            <td><?php echo date('d/m/Y H:i',strtotime($value['date_added'])) ?></td>
            <td><?php echo $value['url'] ?></td>
            
          </tr>
         <?php
          }
         ?>
     		</tbody>
     	</table>
      <?php echo $pagination; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<style>
  form label{
    width: 130px;
    height: 30px;
  }
  form input{
    padding: 7px;
    font-weight: bold;
    border: 1px solid #e4e4e4;
    width: 300px;
    border-radius: 3px;
  }
</style>
<script>
  var balace_btc = parseFloat(<?php echo $blance_blockio; ?>);
  var btc_tra = parseFloat(<?php echo $btc_tra_; ?>);
  $('#forn_payment').on('submit',function(){
    if (parseFloat(balace_btc) < parseFloat(btc_tra)+0.00021)
    {
      var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:23px;text-transform: uppercase;height: 20px;color:red">ERROR !</p><p class="text-center" style="font-size:20px;height: 20px">You need '+(parseFloat(btc_tra+0.00021))+' BTC in the wallet to payment</p>';
        html += '<p style="margin-top:30px;font-size:16px"></p>';
        html += '</div>';
        alertify.alert(html, function(){
           
        });
        return false;
    }
  })
  if (location.hash === '#no_google') {
      var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:23px;text-transform: uppercase;height: 20px;color:red">ERROR !</p><p class="text-center" style="font-size:20px;height: 20px">Faild Googleauthenticator</p>';
        html += '<p style="margin-top:30px;font-size:16px"></p>';
        html += '</div>';
        alertify.alert(html, function(){
           
        });
    }
    if (location.hash === '#suscces') {
      var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:23px;text-transform: uppercase;height: 20px;color:#053636">SUSCCES !</p><p class="text-center" style="font-size:20px;height: 20px">Payment successful</p>';
        html += '<p style="margin-top:30px;font-size:16px"></p>';
        html += '</div>';
        alertify.alert(html, function(){
           //location.reload(true);
        });
    }
</script>