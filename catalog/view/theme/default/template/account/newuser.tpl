<?php 
   $self -> document -> setTitle('New User'); 
   echo $self -> load -> controller('common/header'); 
   //echo $self -> load -> controller('common/column_left'); 
   ?>
 <div class="content-header row">
  <div class="content-header-left col-md-6 col-xs-12">
    <h2 class="content-header-title mb-0">New User</h2>
    <div class="row breadcrumbs-top">
      <div class="breadcrumb-wrapper col-xs-12">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.html">Home</a>
          </li>
          <li class="breadcrumb-item"><a href="#">New User</a>
          </li>
          
        </ol>
      </div>
    </div>
  </div>
<div class="h-main-content">
    <div class="container">
        <div class="row">
    
      <div class="col-md-12">

                <?php if(count($user) > 0){ ?>
         <div class="card">
            <div class="card-body table-responsive" id="no-more-tables">
                  <table id="datatable" class="table table-striped table-bordered">
                     <thead>
                        <tr>
                          <th class="text-center">No</th>
                          <th>Username</th>
                        
                          <th>Email</th>
                          
                          <th>Wallet</th>
                           <th>Date Join</th>
                          <th>Action</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php $number = 1; foreach ($user as $key => $value) {?>
                            <tr>
                                 <td data-title="NO" align="center"><?php echo $number ?></td>
                                <td data-title="Username"><?php echo $value['username'] ?></td>
                              
                                 <td data-title="Email"><?php echo $value['email'] ?></td>
                                 
                                <td data-title="Wallet"><?php echo $value['wallet'] ?></td>
                                <td data-title="Date Join"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                
                                <td data-title="Action">
                                    <a href="user-edit?id=<?php echo $value['customer_code'] ?>" class="btn btn-info ">Edit</a>
                                </td>
                            </tr>
                        <?php $number++; } ?>
                     </tbody>
                  </table>
               </div>
         </div>
         <?php } ?>
               </div>
            </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>


</div>

<?php echo $self->load->controller('common/footer') ?>