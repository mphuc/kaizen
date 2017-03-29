<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   //echo $self -> load -> controller('common/column_left'); 
   ?>
   <div class="content-header row">
  <div class="content-header-left col-md-6 col-xs-12">
    <h2 class="content-header-title mb-0">Setting password</h2>
    <div class="row breadcrumbs-top">
      <div class="breadcrumb-wrapper col-xs-12">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.html">Home</a>
          </li>
          <li class="breadcrumb-item"><a href="#">Setting password</a>
          </li>
          
        </ol>
      </div>
    </div>
  </div>

    <div class="h-main-content" style="margin-top: 30px;float: left;">
    <div class="container">
        <div class="row">
      <div class="col-md-12">
    
         <div class="panel panel-default">
            <div class="panel-body">
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                     <div class="tabs">
                          <!-- Nav tabs -->
                          <ul class="list-inline tabs-nav" role="tablist">
                              <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" aria-expanded="true">Password for login</a></li>
                              <li role="presentation" class=""><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" aria-expanded="false">Password transaction</a></li>
                          </ul>
                          <!-- Tab panes -->
                          <div class="tab-content">
                              <div role="tabpanel" class="tab-pane active" id="home">
                                 <form id="frmChangePassword" action="<?php echo $self -> url -> link('account/setting/editpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                                    <div class="form-group">
                                       <label class="col-md-3 control-label"><?php echo $lang['text_old_password'] ?>:</label>
                                       <div class="col-md-6">
                                          <div class="input-group">
                                    
                                             <input class="form-control" id="OldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswd', '', 'SSL'); ?>" />
                                             <div class="clearfix"></div>
                                             <span id="OldPassword-error" class="field-validation-error">
                                             <span></span>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-md-3 control-label"><?php echo $lang['text_new_password'] ?>:</label>
                                       <div class="col-md-6">
                                          <div class="input-group">
                     
                                             <input class="form-control" id="Password" name="password" type="password"/>
                                             <span id="Password-error" class="field-validation-error">
                                             <span></span>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-md-3 control-label"><?php echo $lang['text_confirm_password'] ?>:</label>
                                       <div class="col-md-6">
                                          <div class="input-group">

                                             <input class="form-control" id="ConfirmPassword"  type="password"/>
                                             <span id="ConfirmPassword-error" class="field-validation-error">
                                             <span></span>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-md-3 control-label"></label>
                                       <div class="col-md-6">
                                          <button type="submit" class="btn btn-primary password-submit"><?php echo $lang['text_button_password'] ?></button>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                              <div class="clearfix"></div>
                              <div role="tabpanel" class="tab-pane" id="profile">
                                  <form id="changePasswdTransaction" action="<?php echo $self -> url -> link('account/setting/edittransactionpasswd', '', 'SSL'); ?>" class="" method="post" novalidate="novalidate">
                         <div class="col-lg-12">
                             <div class="">

                                 <div class="">
                                     <div class="form-group">
                                         
                                             <label class="control-label col-md-3 text-right" for="TranoldPassword"><?php echo $lang['text_old_password'] ?></label>
                                             <div class="col-md-6">
                                                 <input class="form-control" id="TranoldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswdtransaction', '', 'SSL'); ?>" />
                                                 
                                                 <span id="TranoldPassword-error" class="field-validation-error">
                                                     <span></span>
                                                 </span>
                                             </div>
                                         
                                     </div>
                                     <div class="clearfix" ></div>
                                     <div class="control-group form-group">
                                         <div class="controls">
                                             <label class="control-label col-md-3 text-right" for="Tranpassword"><?php echo $lang['text_new_password'] ?></label>
                                             <div class="col-md-6">
                                                 <input class="form-control" id="Tranpassword_New" name="transaction_password" type="password"/>
                                                 <span id="Tranpassword_New-error" class="field-validation-error">
                                                     <span></span>
                                                 </span>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="clearfix" style="margin-bottom: 20px; float: left; width: 100%"></div>
                                     <div class="control-group form-group">
                                         <div class="controls">
                                             <label class="control-label col-md-3 text-right" for="TranConfirmPassword"><?php echo $lang['text_confirm_password'] ?></label>
                                             <div class="col-md-6">
                                                 <input class="form-control" id="TranConfirmPassword" type="password"/>
                                                 <span id="TranConfirmPassword-error" class="field-validation-error" style="display:none">
                                                     <span></span>
                                                 </span>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="clearfix" style="margin-bottom: 20px; float: left; width: 100%"></div>
                                      <div class="control-group form-group">
                                         <div class="controls col-md-6 col-md-push-3">
                                              <button type="submit" class="btn btn-primary"><?php echo $lang['text_button_password'] ?></button>
                                              <a class="pull-right" data-link="<?php echo $self -> url -> link('account/forgotten/resetPasswdTran', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" id="reset_passwdTran" href="javascript:;" >Forgot Password Transaction</a>
                                         </div>
                                     </div>

                                 </div>
                             </div>
                         </div>
                         <div class="clearfix"></div>
                     </form>
                      <div class="clearfix"></div>
                              </div>
                              
                          </div>
                      </div>


                     
                  </div>
               </div>
            </div>
         </div>
       </div>
       </div>
       </div>
       </div>


</div>
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Update profile successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>