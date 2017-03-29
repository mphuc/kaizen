<?php $self -> document -> setTitle("Invesment Detail"); echo $self -> load -> controller('common/header'); //echo $self -> load -> controller('common/column_left'); ?>
<div class="content-header row">
  <div class="content-header-left col-md-6 col-xs-12">
    <h2 class="content-header-title mb-0">Investment</h2>
    <div class="row breadcrumbs-top">
      <div class="breadcrumb-wrapper col-xs-12">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.html">Home</a>
          </li>
          <li class="breadcrumb-item"><a href="#">Investment</a>
          </li>
          
        </ol>
      </div>
    </div>
  </div>
  
  <div class="content-header-lead col-xs-12 mt-2">
    <p class="lead"></p>
  </div>
</div>

<div class="h-main-content">
    <div class="container panel panel-default">
        <div class="row">
   
      <div class="">
      <?php if(count($pds) > 0){?> 
       
               <div class="">
                  <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
 							   <th>ID</th>
                              <th>Date Created</th>
                              <th>Package</th>
                              <th>Daily profit</th>
                              <th>Date Finish</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php foreach ($pds as $value=> $key){?> 
                           <tr>
        					<td data-title="ID">#<?php echo $key['pd_number'] ?></td>

                           
                            <td data-title="Date Created"><?php echo date("Y-m-d H:i:A", strtotime($key['date_added'])); ?></td>
                            
                            <td data-title="Package">
                              	<?php echo (doubleval($key['amount_usd'])/10000) ?> USD
                            </td>
                            <td data-title="Daily profit"> <?php echo (doubleval($key['max_profit'])/10000) ?> USD</td>
                            <?php if($key['date_finish'] == '0000-00-00 00:00:00') { ?>
                            <td data-title="Date Finish" style="color:; font-size:15px;" class="text-warning">Forever </td>
                            <?php } else { ?>
                            <td data-title="Date Finish"> <span style="color:; font-size:15px;" class="text-warning countdown" data-countdown="<?php echo  $key['date_finish'] ?>"> </span> </td>
                            <?php } ?>
                            
                           </tr>
                           <?php }?> 
                        </tbody>
                     </table>
                  </div>
               </div>
              
               
           
         <?php } ?>

         </div>
        <div class="">
           
            <div class="clearfix"></div>
            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 ">
                <?php $packet = $self -> check_packet_pd (1) ;?>
                <div class="bg-white widget widgett-shadow <?php if (count($packet) > 0) if (intval($packet['status']) === 0) echo "border_no_active" ?> ">
                    <div class="white padding-30 padding-bottom-20">
                        <div class="card-action background bg1">
                            <span class="sparkline-bar2">5 USD</span>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <p>300 Days</p>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <p>0.5% Daily</p>
                        </div>     
                        <div class="widget-font-20 clearfix text-center">
                            <i style="color: #3f444a">Refferal Commistion</i>
                            <p>F1 5 %, F2 - 3%, F3 -> F6: 2%</p>
                        </div>  
                           
                    </div>
                    <div class="widgets-top-padding padding-30 padding-bottom-10">
                        <div class="row no-space">
                            
                            <div class="card-action">
                                <?php if(count($packet) > 0) { ?> 
                                    <?php if (intval($packet['status']) === 0) {?>   
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <span class="label label-danger">Not Active</span>
                                            <button class="btn btn-warning btn-block">Payment</button>
                                        </form>
                                    <?php } else { ?>
                                        
                                        <form method="GET" class="packet-invest" data-id="1" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="5">
                                            <button class="btn btn-info btn-block">Upgrade Now</button>
                                        </form>
                                        
                                    <?php }?>
                                <?php } else { ?>
                                <form method="GET" class="packet-invest" data-id="1" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="5">
                                    <button class="btn btn-info btn-block">Upgrade Now</button>
                                </form>
                               <?php } ?>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 ">
                 <?php $packet = $self -> check_packet_pd (2) ;?>
                <div class="bg-white widget widgett-shadow <?php if (count($packet) > 0) if (intval($packet['status']) === 0) echo "border_no_active" ?>">
                    <div class="white padding-30 padding-bottom-20">
                        <div class="card-action background bg2">
                            <span class="sparkline-bar2">50 USD</span>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <p>300 Days</p>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <p>0.5% Daily</p>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <i style="color: #3f444a">Refferal Commistion</i>
                            <p>F1 5 %, F2 - 3%, F3 -> F6: 2%</p>
                        </div>  
                        <div class="widget-font-20 clearfix text-center">
                            <i style="color: #3f444a">System Commision</i>
                            <p>F1 -> F5: 0.5%</p>
                        </div>    
                    </div>
                    <div class="widgets-top-padding padding-30 padding-bottom-10">
                        <div class="row no-space">
                            
                            <div class="card-action">
                                <?php if(count($packet) > 0) { ?> 
                                    <?php if (intval($packet['status']) === 0) {?>   
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <span class="label label-danger">Not Active</span>
                                            <button class="btn btn-warning btn-block">Payment</button>
                                        </form>
                                    <?php } else { ?>
                                        
                                        <form method="GET" class="packet-invest" data-id="2" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="50">
                                            <button class="btn btn-info btn-block">Upgrade Now</button>
                                        </form>
                                    <?php }?>
                                <?php } else { ?>
                                <form method="GET" class="packet-invest" data-id="2" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="50">
                                    <button class="btn btn-info btn-block">Upgrade Now</button>
                                </form>
                               <?php } ?>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                    
                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 ">
                <?php $packet = $self -> check_packet_pd (3) ;?>
                <div class="bg-white widget widgett-shadow <?php if (count($packet) > 0) if (intval($packet['status']) === 0) echo "border_no_active" ?>">
                   <div class="white padding-30 padding-bottom-20">
                        <div class="card-action background bg3">
                            <span class="sparkline-bar2">100 USD</span>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <p>180 Days</p>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <p>0.5% Daily</p>
                        </div>
                        <div class="widget-font-20 clearfix text-center">
                            <i style="color: #3f444a">Refferal Commistion</i>
                            <p>F1 5 %, F2 - 3%, F3 -> F6: 2%</p>
                        </div>  
                        <div class="widget-font-20 clearfix text-center">
                            <i style="color: #3f444a">System Commision</i>
                            <p>F1 -> F10: 0.5%</p>
                        </div>   
                    </div>
                    <div class="widgets-top-padding padding-30 padding-bottom-10">
                        <div class="row no-space">
                            
                            <div class="card-action">
                                <?php if(count($packet) > 0) { ?> 
                                    <?php if (intval($packet['status']) === 0) {?>   
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <span class="label label-danger">Not Active</span>
                                            <button class="btn btn-warning btn-block">Payment</button>
                                        </form>
                                    <?php } else { ?>
                                        
                                        <form method="GET" class="packet-invest" data-id="3" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="100">
                                            <button class="btn btn-info btn-block">Upgrade Now</button>
                                        </form>
                                        
                                    <?php }?>
                                <?php } else { ?>
                                <form method="GET" class="packet-invest" data-id="3" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="100">
                                    <button class="btn btn-info btn-block">Upgrade Now</button>
                                </form>
                               <?php } ?>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
                <div class="payment_append col-md-6 col-md-push-3"></div>
        </div>    

</div></div>
</div><?php echo $self->load->controller('common/footer') ?>