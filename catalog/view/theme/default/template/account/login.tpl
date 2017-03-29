<!DOCTYPE html>
<html lang="en">
 
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <title>HkBit-Login</title>
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
    <!-- START PRELOADER-->

    <!-- <div id="fakeloader"></div>
    <div id="preloader-wrapper">
      <div id="loader">
        <div class="line-scale-pulse-out-rapid loader-white">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
      <div class="loader-section section-top bg-cyan"></div>
      <div class="loader-section section-bottom bg-cyan"></div>
    </div> -->

    <!-- END PRELOADER-->
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    <div class="robust-content container center-layout mt-2">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body"><section class="flexbox-container">
                        <div class="col-md-4 col-md-offset-4 col-xs-12" style="background: rgba(76, 76, 76, 0.7); padding-top: 20px; padding-bottom: 20px">
                            <div class="text-center" style="position: relative">
                            
                                <img style="width: 220px;height: 100px; margin-bottom: 20px;" src="catalog/view/theme/default/images/logo.png" alt="">
                            </div>
                            <div class="misc-box">   
                                
                                <form action="login.html" method="post" class="form-login">
                                    <div class="form-group">                                      
                                        <label class="text-muted" for="exampleuser1">UserName</label>
                                        <div class="group-icon">
                                        <input  autocomplete="off" type="text" name="email" value="<?php echo $email; ?>" placeholder="Username" id="input-email" class="form-control" />
                                        
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="text-muted" for="exampleInputPassword1">Password</label>
                                        <div class="group-icon">
                                        <input autocomplete="off" type="password" name="password" value="<?php echo $password; ?>" placeholder="Password" id="input-password" class="form-control" />
                                        
                                        </div>
                                    </div>
                                    <?php
                                       $ranStr = md5(microtime());
                                       $ranStr = hexdec( crc32($ranStr));
                                       $ranStr = substr($ranStr, 0, 6);
                                       $_SESSION['cap_code'] = $ranStr;
                                     ?>
                                    <div class="form-group">
                                        <label class="text-muted" for="exampleInputPassword1">Capcha</label>
                                        <div class="group-icon">
                                       <img class="img_capcha" style="float: left; height: 35px;" src="captcha_code.php"/>
                        <input style="width: 65%; float: right" autocomplete="off" type="text" name="capcha" placeholder="Capcha" id="input-password" value="" class="form-control" />
                                        
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                       
                                        <div class="pull-rightsa" style="margin-top: 20px; float: left; width: 100%">
                                            <button style="" type="submit" class="btn btn-block btn-primary">Login</button>
                                        </div>
                                    </div>
                                    <hr>
                                    <?php if ($redirect) { ?>
                                       <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                                       <?php } ?>
                                    
                                    <?php if ($success) { ?>
                                    <div class="text-success"><i class="fa fa-check-circle"></i>
                                       <?php echo $success; ?>
                                    </div>
                                    <?php } ?>
                                    <?php if ($error_warning) { ?>
                                    <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
                                       <?php echo $error_warning; ?>
                                    </div>
                                    <?php } ?>
                                    <div style="" class="remember-text-login forget-password-login remember-register-3"><a href="forgot.html"  class="forgot">Forgot Password?</a>
                                    <?php if (isset($_COOKIE['code_customer'])) {
                                        $code_customer = $_COOKIE['code_customer'];
                                    } 
                                    else{
                                        $code_customer = 146333582723;
                                    }
                                    ?>
                                    <!-- <a href="register.html&token=<?php echo $code_customer ?>"  class="pull-right">Register Account</a>
                                    </div> -->
                                    <div class="clearfix"></div>
                                </form>

                            </div>
                            <div class="text-center misc-footer">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Common plugins-->
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
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue'
                });
            });
        </script>
    </body>

<!-- Mirrored from bootstraplovers.com/themeforest-html/float-v1.2/dark-version/page-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2016 12:18:15 GMT -->
</html>



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
   jQuery(document).ready(function($) {
      jQuery('.cap_code_new').click(function(){
         jQuery('.img_capcha').attr({'src':'<?php echo HTTPS_SERVER;?>captcha_code.php'});

      });
   });
</script>