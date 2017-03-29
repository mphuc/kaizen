<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>All Refferal</h1>

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
            <th>Date</th>
            <th>Link transfer</th>
            
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
