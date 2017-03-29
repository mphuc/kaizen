<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
   <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      
      
      <title>Register User</title>
  
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="icon" href="catalog/view/theme/default/img/logo_favi.png">
      <link href="catalog/view/theme/default/css/bootstrap.min.css" rel="stylesheet">
        <!--  Icon CSS -->
  <link rel="stylesheet" href="catalog/view/theme/default/robust-assets/css/vendors.min.css"/>
 
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/robust-assets/fonts/icomoon.css">
 
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/robust-assets/css/plugins/sliders/slick/slick.css">
 
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/robust-assets/css/plugins/charts/jquery-jvectormap-2.0.3.css">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/robust-assets/css/plugins/charts/morris.css">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/robust-assets/css/plugins/extensions/unslider.css">
 
  <link rel="stylesheet" href="catalog/view/theme/default/robust-assets/css/app.min.css"/>
 
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/robust-assets/css/components/weather-icons/climacons.min.css">
 
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/customer.css">

    </head>
    <body data-open="hover" data-menu="horizontal-menu" data-col="1-column" class="horizontal-layout horizontal-menu  1-column  blank-page blank-page background_img">
   <div id="fakeloader">
     <div class="line-scale-pulse-out-rapid loader-white">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
      </div>
   </div>
    <div class="">
      <div class="">
        
        <div class="content-body"><section class="flexbox-container">
    
 
<div class="login-form page-login-image col-md-4 col-md-push-4" style="margin-top: 80px;">
   <div class="main-login-form register-page">
         <div class="content-login">
            <div class="login-page">
               <div class="logo-title text-center">
                  <!-- Template Logo -->
                  <img src="catalog/view/theme/default/img/logo.png" alt="logo" style=" width:280px;">
               </div>
               <p class="sign-login" style="color: #fff; font-size: 18px; text-align: center;">Create an Account.</p>
               <!-- Start Register Form -->
               <form id="register-account" action="<?php echo $self -> url -> link('account/registers/confirmSubmit', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
       
         
            <div class="input-box">
               
               <div class="textbox-login">
                  <label>Username</label>
                  <input type="hidden" name="node" value="<?php echo $self->request->get['token']; ?>">
                  <input class="form-control" placeholder="Your Username" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>">
                  <span id="user-error" class="field-validation-error" style="display: none;">
                     <span>Please enter user name</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                 <label>Email Address</label>
                  <input class="form-control" placeholder="Email Address" name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                  <span id="email-error" class="field-validation-error" style="display: none;">
                     <span id="Email-error">Please enter Email Address</span>
                  </span>
               </div>
            </div>

          
            <div class="input-box">
              
               <div class="textbox-login">
                <label>Password For Login</label>
                  <input class="form-control" placeholder="Password For Login" id="password" name="password" type="password">
                  <span id="password-error" class="field-validation-error" style="display: none;">
                     <span>Please enter password for login</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                <label>Repeat Password For Login</label>
                  <input class="form-control valid" placeholder="Repeat Password For Login" id="confirmpassword" type="password">
                  <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                     <span>Repeat Password For Login not correct</span>
                  </span>
               </div>
            </div>
   
            <div class="input-box">
               
               <div class="textbox-login">
                <label>Transaction Password</label>
                  <input class="form-control" id="password2" placeholder="Transaction Password" name="transaction_password" type="password">
                  <span id="password2-error" class="field-validation-error" style="display: none;">
                     <span>Please enter transaction password</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
              
               <div class="textbox-login">
                <label>Repeat Transaction Password</label>
                  <input class="form-control valid" placeholder="Repeat Transaction Password" id="confirmpasswordtransaction" type="password">
                  <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                     <span>Repeat Transaction Password is not correct</span>
                  </span>
               </div>
            </div>
              
            <div class="input-box">
               
               <div class="textbox-login">
                <label>Bitcoin Wallet</label>
                  <input class="form-control" id="BitcoinWalletAddress" placeholder="Bitcoin Wallet" data-link="<?php echo $self -> url -> link('account/personal/checkwallet', '', 'SSL'); ?>" name="wallet" type="text"/>
                  <span id="BitcoinWalletAddress-error" style="display: none;" class="field-validation-error">
                     <span></span>
                  </span>
               </div>
            </div>               
           <!--  <div class="bottom-login">
               <div class="remember-text-login">
                  <span class="checkbox-custom checkbox-primary">
                  <input id="agreeTerm" type="checkbox" value="true">
                  <label for="requiredCheckbox">I agree to the <a href="javascript:void(0)">Terms and Conditions</a> and <a href="javascript:void(0)">Privacy Policy. </a></label>
                  </span>
               </div>
            </div> -->
            <div class="bottom-login" style="margin-top: 20px;">
              <button style="margin: 0 auto" type="submit" class="btn btn-info mobile-btn-login btn-sign waves-effect waves-dark">Register</button>
            </div>
            
            </div>
                  
        
      </form>
               
               <!-- End Register Form -->
              
            </div>
         </div>
      </div>
</div>

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/robust-assets/js/app.min.js"></script>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery.easyui.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery.quick.pagination.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/loading.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap.min.js"></script>
<script src="catalog/view/javascript/jquery.nicescroll.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.app.js"></script> 
<script src="catalog/view/javascript/register/register.js" type="text/javascript"></script>
<script type="text/javascript">
  
        window.funLazyLoad = {
            start: function() {
                $("#fakeloader").show();
            },
            reset: function() {
                $("#fakeloader").hide();
            },
            show: function() {
                $("#fakeloader").show();
            }
        };
        (function($) {
            $(function() {
                $("#scroller").simplyScroll({
                    frameRate: '20'
                });
            });
        })(jQuery)
    </script>
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   
</script>
<?php //echo $footer; ?>