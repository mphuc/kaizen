<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
  // echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="content-header row">
  <div class="content-header-left col-md-6 col-xs-12">
    <h2 class="content-header-title mb-0">Refferals</h2>
    <div class="row breadcrumbs-top">
      <div class="breadcrumb-wrapper col-xs-12">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.html">Home</a>
          </li>
          <li class="breadcrumb-item"><a href="#">Refferals</a>
          </li>
          
        </ol>
      </div>
    </div>
  </div>
  
  <div class="content-header-lead col-xs-12 mt-2">
    <p class="lead"></p>
  </div>
</div>

    <div class="container">
        <div class="row">
            
      <div class="">
        <div class="panel panel-info">
          <div class="panel-heading" style="background: none">
            <h3 class="panel-title" style="background: none">Refferals Link</h3>
          </div>
          <div class="panel-body">
           <input style="width:100%;border:none;margin-top:15px;color: #202E44;font-size: 15px; padding-left: 20px;" readonly class="js-copytextarea"value="<?php echo HTTPS_SERVER.'registerss&token='.$customer['customer_code']; ?>" title="<?php echo HTTPS_SERVER.'registerss&token='.$customer['customer_code']; ?>">
                <br>
                <br>
             <button style="float: left; width: 200px;" class="btn btn-warning btn-block js-textareacopybtn">COPY Referral Link</button>
          </div>
        
       
                  <div id="no-more-tables" style="margin-top: 50px;">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
                              <th class="text-center">No.</th>
                              <th>Username</th>
                              <!-- <th>Level</th> -->
                              <th>QR Code</th>
                              
                              <th>Total Invesment</th>
                             
                              <th>Email</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php $count = 1; foreach ($refferals as $key => $value) { ?>
                           <tr>
                              <td data-title="<?php echo $lang['NO'] ?>." align="center"><?php echo $count ?></td>
                              <td data-title="<?php echo $lang['USERNAME'] ?>"><?php echo $value['username'] ?></td>
                              <!-- <td data-title="LEVEL">
                                 <?php echo "L".(intval($value['level']) - 1) ?>
                              </td> -->
                              <td class="text-center" data-title="<?php echo $lang['WALLET'] ?>" >
                                 
                                 <img src="https://chart.googleapis.com/chart?chs=75x75&chld=L|0&cht=qr&chl=bitcoin:<?php echo $value['wallet']; ?>">
                                 
                              </td>
                              <td data-title="Total Invesment" >
                                 <?php echo ($self -> countPD($value['customer_id'])/10000); ?> USD
                              </td>
                              
                              <td data-title="Email" >
                                 <?php echo $value['email']?> 
                              </td>
                           </tr>
                           <?php $count++; } ?>
                        </tbody>
                     </table>
                     <?php echo $pagination; ?>
                  </div>
               </div>
            </div>
            <div class="clearfix" style="height: 50px;"></div>
     
</div>
</div>
<?php echo $self->load->controller('common/footer') ?>
<script type="text/javascript">

        var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

        copyTextareaBtn.addEventListener('click', function(event) {
          var copyTextarea = document.querySelector('.js-copytextarea');
          copyTextarea.select();

          try {
            var successful = document.execCommand('copy');
            var msg = successful ? 'successful' : 'unsuccessful';
            console.log('Copying text command was ' + msg);
          } catch (err) {
            console.log('Oops, unable to copy');
          }
        });
        </script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#datatable').dataTable();
    } );
</script>