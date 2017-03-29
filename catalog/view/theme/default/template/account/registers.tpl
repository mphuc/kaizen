<?php
$self -> document -> setTitle('Register User');
 echo $header; ?>
 <style type="text/css" media="screen">
    .main-header{
      display: none;
    }
 </style>
 
<div class="login-form page-login-image register_login">
   <div class="main-login-form register-page">
         <div class="content-login">
            <div class="login-page col-md-4 col-md-push-4">
               <div class="logo-title text-center">
                  <!-- Template Logo -->
                  <img src="catalog/view/theme/default/img/logo.png" alt="logo" style=" width:280px; margin-bottom: 20px;">
               </div>
               
               <!-- Start Register Form -->
               <?php if(!$p_binary) { ?>
      <form id="register-account " action="<?php echo $self -> url -> link('account/register', '', 'SSL'); ?>" class="form-horizontal form-login" method="post" novalidate="novalidate">
         <?php  } else { ?>
      <form id="register-account" action="<?php echo $self -> url -> link('account/personal/register_submit', '', 'SSL'); ?>" class="form-horizontal form-login" method="post" novalidate="novalidate">
         <?php }?>
         <?php if($p_binary) { ?>
         <input type="hidden" name="p_binary" value="<?php echo $p_binary ?>"/>
         <input type="hidden" name="postion" value="<?php echo $postion ?>">
         <?php } ?>
         <?php 
            $token = explode("_", $self -> request -> get['token']);
            if(intval($self -> checkBinaryLeft($token[0], $token[1])) === 1) { ?>
            <div class="input-box">
               
               <div class="textbox-login">
                  <input type="hidden" name="node" value="<?php echo $token[2]; ?>">
                  <input class="form-control" placeholder="Your Username" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>">
                  <span id="user-error" class="field-validation-error" style="display: none;">
                     <span>Please enter user name</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                  <input type="hidden" name="node" value="<?php echo $token[2]; ?>">
                  <input class="form-control" placeholder="Email Address" name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                  <span id="email-error" class="field-validation-error" style="display: none;">
                     <span id="Email-error">Please enter Email Address</span>
                  </span>
               </div>
            </div>

            
            <div class="input-box">
               
               <div class="textbox-login">
                  <input class="form-control" placeholder="Password For Login" id="password" name="password" type="password">
                  <span id="password-error" class="field-validation-error" style="display: none;">
                     <span>Please enter password for login</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                  <input class="form-control valid" placeholder="Repeat Password For Login" id="confirmpassword" type="password">
                  <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                     <span>Repeat Password For Login not correct</span>
                  </span>
               </div>
            </div>
   
            <div class="input-box">
               
               <div class="textbox-login">
                  <input class="form-control" id="password2" placeholder="Transaction Password" name="transaction_password" type="password">
                  <span id="password2-error" class="field-validation-error" style="display: none;">
                     <span>Please enter transaction password</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                  <input  class="form-control valid" placeholder="Repeat Transaction Password" id="confirmpasswordtransaction" type="password">
                  <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                     <span>Repeat Transaction Password is not correct</span>
                  </span>
               </div>
            </div>
              
            <div class="input-box">
               
               <div class="textbox-login">
                  <input class="form-control" id="BitcoinWalletAddress" placeholder="Bitcoin Wallet" data-link="<?php echo $actionWallet; ?>" name="wallet" type="text"/>
                  <span id="BitcoinWalletAddress-error" style="display: none;" class="field-validation-error">
                     <span></span>
                  </span>
               </div>
            </div>               
            <div class="bottom-login">
               <div class="remember-text-login">
                  <span class="checkbox-custom checkbox-primary">
                  <input id="agreeTerm" type="checkbox" value="true">
                  <label for="requiredCheckbox">I agree to the <a href="javascript:void(0)">Terms and Conditions</a> and <a href="javascript:void(0)">Privacy Policy. </a></label>
                  </span>
               </div>
            </div>
            <div class="bottom-login">
              <button style="margin: 0 auto" type="submit" class="btn btn-info mobile-btn-login btn-sign waves-effect waves-dark">Register</button>
            </div>
            
                
            </div>
                  
         <?php } else { ?>
         <div class="alert alert-danger" style="margin-top:100px;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>Warning!</strong> This branch has had! Please choose another branch!
         </div>
         <?php } ?>
      </form>
               
               <!-- End Register Form -->
              
            </div>
         </div>
      </div>
</div>

<style type="text/css">
   footer, .header-logo{display: none !important;}
   .container{padding-top: 10px;}
</style>


<?php echo $footer; ?>
<script type="text/javascript">
   if (location.hash === '#success') {
      $.toast({
            heading: 'Account registration successful',
            text: 'Thank you for using our services',
            position: 'top-right',
            loaderBg: '#fff',
            icon: 'success',
            hideAfter: 10000,
            stack: 1
        });
   }
   
</script>