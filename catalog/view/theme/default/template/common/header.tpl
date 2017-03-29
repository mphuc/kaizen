<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
   <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title><?php echo $title; ?> </title>
      <meta http-equiv="cache-control" content="no-cache"/>
      <base href="<?php echo $base; ?>"/>
      <?php if ($description){ ?>
      <meta name="description" content="<?php echo $description; ?>"/>
      <?php } ?><?php if ($keywords){ ?>
      <meta name="keywords" content="<?php echo $keywords; ?>"/>
      <?php } ?>
      
  
  
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="icon" href="catalog/view/theme/default/img/logo_favi.png">
      <script src="catalog/view/javascript/jquery/underscorejs/underscorejs.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery.easyui.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery.quick.pagination.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/loading.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/bootstrap.min.js"></script>
      <script src="catalog/view/javascript/jquery.nicescroll.js" type="text/javascript"></script>
      <!-- <script src="catalog/view/javascript/jquery.app.js"></script>  -->
      <!--- ###################  -->

      <script src="catalog/view/theme/default/toastr/toastr.min.js"></script> 
      <link href="catalog/view/theme/default/toastr/toastr.min.css" rel="stylesheet">
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
      
      
      <!--- ###################  -->  
    
      <!-- <link href="catalog/view/theme/default/css/style.css" rel="stylesheet"> -->
     <link href="catalog/view/theme/default/css/customer.css" rel="stylesheet">
      <?php foreach ($styles as $style) { ?>
      <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
      <?php } ?>
      <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
      <script type="text/javascript" src="catalog/view/javascript/jquery.simplyscroll.js"></script>
      <?php foreach ($scripts as $script) { ?>
      <script src="<?php echo $script; ?>" type="text/javascript"></script>
      <?php } ?>
      <?php echo $google_analytics; ?>

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

      <script src="catalog/view/javascript/jquery.form.min.js" type="text/javascript"></script><script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
      <link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
      <script src="catalog/view/javascript/changeLang.js" type="text/javascript"></script><script type="text/javascript" src="catalog/view/javascript/bxslider/jquery.bxslider.js"></script>
      <!--  <script type="text/javascript"> $(function(){$("html").niceScroll({cursorwidth:"15px",cursorcolor:"blue"})}); </script> -->
      
   </head>
   <body data-open="hover" data-menu="horizontal-menu" data-col="2-columns" class="horizontal-layout horizontal-menu  2-columns ">
   <div id="fakeloader">
     <div class="line-scale-pulse-out-rapid loader-white">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
      </div>
   </div>
    <!-- <div id="preloader-wrapper">
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
    </div>  -->


    <nav class="header-navbar navbar navbar-with-menu navbar-light navbar-border navbar-brand-center">
      <div class="navbar-wrapper">
        <div class="navbar-header">
          <ul class="nav navbar-nav">
            <li class="nav-item mobile-menu hidden-md-up float-xs-left"><a class="nav-link nav-menu-main menu-toggle hidden-xs"><i class="icon-menu5 font-large-1"></i></a></li>
            <li class="nav-item"><a href="home.html" class="navbar-brand nav-link"><img alt="branding logo" src="robust-assets/images/logo/robust-logo-dark.png" data-expand="robust-assets/images/logo/robust-logo-dark.png" data-collapse="robust-assets/images/logo/robust-logo-small.png" class="brand-logo"></a></li>
            <li class="nav-item hidden-md-up float-xs-right"><a data-toggle="collapse" data-target="#navbar-mobile" class="nav-link open-navbar-container"><i class="icon-ellipsis pe-2x icon-icon-rotate-right-right"></i></a></li>
          </ul>
        </div>
        <div class="navbar-container container center-layout">
          <div id="navbar-mobile" class="collapse navbar-toggleable-sm">
            <ul class="nav navbar-nav">
              <!-- <li class="nav-item hidden-sm-down"><a class="nav-link nav-menu-main menu-toggle hidden-xs"><i class="icon-menu5"></i></a></li>
              
              <li class="nav-item hidden-sm-down"><a href="#" class="nav-link nav-link-expand"><i class="ficon icon-expand2"></i></a></li> -->
              
            </ul>
            <ul class="nav navbar-nav float-xs-right">
              
              <li class="dropdown dropdown-notification nav-item"><a href="#" data-toggle="dropdown" class="nav-link nav-link-label"><i class="ficon icon-bell4"></i><span class="tag tag-pill tag-default tag-danger tag-default tag-up">0</span></a>
                <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                  <li class="dropdown-menu-header">
                    <h6 class="dropdown-header m-0"><span class="grey darken-2">Notifications</span><span class="notification-tag tag tag-default tag-danger float-xs-right m-0">0 New</span></h6>
                  </li>
                  <li class="list-group scrollable-container"><a href="javascript:void(0)" class="list-group-item">
              
                  <li class="dropdown-menu-footer"><a href="javascript:void(0)" class="dropdown-item text-muted text-xs-center">Read all notifications</a></li>
                </ul>
              </li>
            
              <li class="dropdown dropdown-user nav-item"><a href="#" data-toggle="dropdown" class="dropdown-toggle nav-link dropdown-user-link"><span class="avatar avatar-online"><img src="catalog/view/theme/default/robust-assets/images/portrait/small/avatar-s-1.png" alt="avatar"><i></i></span><span class="user-name"><?php print_r($customer['username']); ?></span></a>
                <div class="dropdown-menu dropdown-menu-right"><a href="#" class="dropdown-item"><i class="icon-head"></i> Edit Profile</a><a href="#" class="dropdown-item"><i class="icon-mail6"></i> My Inbox</a><a href="#" class="dropdown-item"><i class="icon-clipboard2"></i> Task</a><a href="#" class="dropdown-item"><i class="icon-calendar5"></i> Calender</a>
                  <div class="dropdown-divider"></div><a href="#" class="dropdown-item"><i class="icon-power3"></i> Logout</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
    <div class="fullscreen-search-overlay"></div>
    <div role="navigation" data-menu="menu-wrapper" class="header-navbar navbar navbar-horizontal navbar-light navbar-shadow navbar-without-dd-arrow navbar-fixed">
      <div data-menu="menu-container" class="navbar-container main-menu-content container center-layout">
        <ul id="main-menu-navigation" data-menu="menu-navigation" class="nav navbar-nav">
          <?php $route=$self -> request -> get['route']; ?>
          <li class="nav-item">
              <a href="home.html" class="nav-link">
                <i class="icon-home3">   </i>
                <span data-i18n="nav.dash.main">Dashboard</span>
              </a>
          </li>
          <li class="nav-item"><a href="investment.html" class="dropdown-toggle nav-link"><i class="icon-rocket"></i><span data-i18n="nav.dash.main">Investment</span></a>
          </li>
          <li class="nav-item"><a href="refferal.html" class="nav-link"><i class="icon-bar-chart"></i><span data-i18n="nav.dash.main">Refferals</span></a>
          </li>
          <li class="nav-item"><a href="downline-tree.html" class="nav-link"><i class="icon-arrow-up"></i><span data-i18n="nav.dash.main">System Tree</span></a>
          </li>
          <li class="nav-item"><a href="registerss&token=<?php echo $customer['customer_code'] ?>" class="dropdown-toggle nav-link"><i class="icon-podcast">  </i><span data-i18n="nav.dash.main">Regsister User</span></a>
          </li>
          <li class="nav-item"><a href="withdraw.html" class="dropdown-toggle nav-link"><i class="icon-podcast">  </i><span data-i18n="nav.dash.main">Withdraw</span></a>
          </li>
           
          <li data-menu="dropdown" class="dropdown nav-item"><a href="" data-toggle="dropdown" class="dropdown-toggle nav-link"><i class="icon-keyboard2"></i><span data-i18n="nav.dash.main">Profit History</span></a>
            <ul class="dropdown-menu">
              <li data-menu="" class=""><a href="refferal-profit.html" class="dropdown-item">Daily profit</a>
              <li data-menu="" class=""><a href="refferal-profit.html" class="dropdown-item">Refferal Commistion</a>
              </li>
              <li data-menu="" class=""><a href="binary-profit.html" class="dropdown-item">System Commision</a>
              </li>
              
            </ul>
          </li>
          <li data-menu="dropdown" class="dropdown nav-item"><a href="" data-toggle="dropdown" class="dropdown-toggle nav-link"><i class="icon-user4"></i><span data-i18n="nav.dash.main">Account</span></a>
            <ul class="dropdown-menu">
              <li data-menu="" class=""><a href="your-profile.html" class="dropdown-item">Your Profiles</a>
              </li>
              <li data-menu="" class=""><a href="change-login-password.html" class="dropdown-item">Change Password</a>
              </li>
             
              
            </ul>
          </li>
          <li class="nav-item"><a href="logout.html" class="dropdown-toggle nav-link"><i class="icon-power-off"></i><span data-i18n="nav.dash.main">Logout</span></a>
          </li>
        </ul>
      </div>
    </div>

<!--  -->
 <div class="robust-content container center-layout mt-2">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
   