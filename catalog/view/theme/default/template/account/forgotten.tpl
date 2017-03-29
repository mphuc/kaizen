<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from bootstraplovers.com/themeforest-html/float-v1.2/dark-version/page-forget-password.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2016 12:18:15 GMT -->
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>HkBit - Forgot Password</title>

        <!-- Common plugins -->
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
                        <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4" style="background: rgba(76, 76, 76, 0.7); padding-top: 20px; padding-bottom: 20px;">
                            <div class="misc-box">

                                <p class="text-center text-uppercase pad-v" style="color: #fff">Reset password.</p>
                                <div class="alert alert-info">
                                    <p class="">Enter your username below and we will send you reset instructions!</p>
                                </div>
                                <form action="/forgot.html" method="post" class="forgot-form">
                                    <div class="form-group group-icon">
                                        <input type="text" name="email" value="" id="input-email" placeholder="Your Username" id="input-password" class="form-control" />
                                        
                                    </div>
                                     <?php
                                        $ranStr = md5(microtime());
                                        $ranStr = hexdec( crc32($ranStr));
                                        $ranStr = substr($ranStr, 0, 6);
                                        $_SESSION['cap_code'] = $ranStr;
                                      ?>
                                      <div class="form-group group-icon" style="margin-top: 15px;">
                                       <img class="img_capcha" style="float: left; height: 35px;" src="captcha_code.php"/>
                                    <input style="width: 65%; margin-left: px; float: right" autocomplete="off" type="text" name="capcha" placeholder="Capcha" id="input-password" value="" class="form-control" />
                                       
                                    </div>
                                    <div class="clearfix">
                                        
                                        <button style="height: 40px; margin-top: 20px; float: left;width: 100%" class="btn btn-sm btn-block btn-primary" type="submit">RESET</button>
                                    </div>
                                </form>
                                 <?php if ($error_warning) { ?>
               <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
                  <?php echo $error_warning; ?>
               </div>
               <?php } ?>
                                <a class="btn" href="<?php echo $back; ?>.html">GO BACK</a>


                                
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
    </body>

</html>


<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   jQuery(document).ready(function($) {
      jQuery('.cap_code_new').click(function(){
         jQuery('.img_capcha').attr({'src':'<?php echo HTTPS_SERVER;?>captcha_code.php'});

      });
   });
</script>