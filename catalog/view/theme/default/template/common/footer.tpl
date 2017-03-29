</div>
</div>
</div>

        <footer class="footer">
            <div class="container text-center">
                <span>Copyright &copy; 2016. </span>
            </div>
        </footer>
       
   </body>

   <script type="text/javascript">
   
   	$('.packet-invest').on('submit', function(){

   		
   		var self = $(this);
   		/*alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">You make sure your choice !</p>',
		  function(){*/
		  	$('.payment_append').hide();
		    window.funLazyLoad.start();
	   		setTimeout(function(){
				self.ajaxSubmit({
					success : function(result) {
						result = $.parseJSON(result);
						console.log(result);
						
						var package = result.package;
						var package_btc = result.package_btc / 100000000;
						var xhtml = '<div class="col-md-12 text-center"><h3>Please send '+package_btc+' BTC to this address.</h3></div><div class="col-md-12 text-center"><img style="margin-left:-10px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+package_btc+'"/><p>'+result.input_address+'</p></div><div class="col-md-12 text-center"><p>Your Packet: '+package+' USD</p><p>Amount BTC: '+package_btc+' BTC</p>Total: '+ package_btc +' BTC</p></div>';
						$('.payment_append').html(xhtml);
						$('.payment_append').show();
						$('html, body').animate({
					        scrollTop: $(".payment_append").offset().top
					    }, 500);
					    window.funLazyLoad.reset();
						/*alertify.alert(xhtml, function(){
						    window.funLazyLoad.reset();
						    
							    location.reload(true);
						  });*/
					}
				});
				check_payment();
			}, 200);
		  /*},
		  function(){
		});*/
   		return false;
   	});
   	$('.packet-invoide').on('submit', function(){
   		
   		var self = $(this);
   		$('.payment_append').hide();
	    window.funLazyLoad.start();
   		setTimeout(function(){
			self.ajaxSubmit({
				success : function(result) {
					result = $.parseJSON(result);
					console.log(result);
					if(_.has(result, 'success') && result['success'] === 1){
						var xhtml = '<div class="col-md-12 text-center"><h3>You have to activate this package! please select another package!</h3></div>'
					}else{
						var amount = result.amount / 100000000;
						
						var package = result.package / 100000000
						var total = package;
						var received = result.received / 100000000;
						var xhtml = '<div class="col-md-12 text-center"><h3>Please send '+amount+' BTC to this address.</h3></div><div class="col-md-12 text-center"><img style="margin-left:-10px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+amount+'"/><p>'+result.input_address+'</p></div><div class="col-md-12 text-center"><p>Your Packet: '+(result.amount_usd/10000)+' USD</p><p>Total: '+ total +' BTC</p><p></p>Paid amount: '+received+' BTC</div>'
					}
					$('.payment_append').html(xhtml);
					$('.payment_append').show();
					$('html, body').animate({
				        scrollTop: $(".payment_append").offset().top
				    }, 500);
				    window.funLazyLoad.reset();
				    //toastr.success('Are you the 6 fingered man?');
						/*alertify.alert(xhtml, function(){
							window.funLazyLoad.reset();
					    	location.reload(true);
					  });*/
				}
			});
			//check_payment();
		}, 200);
   		return false;
   	});
	 function check_payment(){
	 	$.ajax({
	        url : "<?php echo $check_payment ?>",
	        type : "post",
	        dataType:"text",
	        data : {
	           
	        },
	        success : function (result){
	        	result = $.parseJSON(result);
	            if (result.confirmations == "3"){
	            	$.toast({
				        heading: 'Active successful package',
				        text: 'Thank you for trusting our services',
				        position: 'top-right',
				        loaderBg: '#fff',
				        icon: 'success',
				        hideAfter: 10000,
				        stack: 1
				    });
	            }
	            if (result.confirmations == "0")
	            {
	            	setTimeout(function(){ check_payment(); }, 1500);
	            }

	        }
	    });

	 }

   </script>
 
	<!-- <script src="catalog/view/theme/default/robust-assets/js/vendors.min.js"></script>
    
    <script type="text/javascript" src="catalog/view/theme/default/robust-assets/js/plugins/ui/jquery.sticky.js"></script> -->
    <!-- <script src="catalog/view/theme/default/robust-assets/js/plugins/charts/raphael-min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/charts/morris.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/charts/chart.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/charts/jvector/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/charts/jvector/jquery-jvectormap-world-mill.js" type="text/javascript"></script> -->
    <!-- <script src="catalog/view/theme/default/robust-assets/js/plugins/extensions/moment.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/extensions/underscore-min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/extensions/clndr.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/charts/echarts/echarts.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/robust-assets/js/plugins/extensions/unslider-min.js" type="text/javascript"></script> -->
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN ROBUST JS-->
   <!--  <script src="catalog/view/theme/default/robust-assets/js/app.min.js"></script> -->
    <!-- END ROBUST JS-->
    <!-- BEGIN PAGE LEVEL JS-->
   <!--  <script src="catalog/view/theme/default/robust-assets/js/components/pages/dashboard-ecommerce.js" type="text/javascript"></script> -->
</html>