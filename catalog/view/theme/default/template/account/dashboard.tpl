<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header'); //echo $self->load->controller('common/column_left'); ?>
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
        <div class="card " style="margin-top: 40px;">
            <div class="card-body">
                <div class="card-blocks">
                    <div class="row">
                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0 ">
                            <div class="media px-1 ">
                                <div class="media-left media-middle">
                                    <i class="icon-box font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 info"><?php echo $countPD/10000; ?> USD</span>
                                </div>
                                <p class="text-muted">Total Investment</p>
                                
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0">
                            <div class="media px-1">
                                <div class="media-left media-middle">
                                    <i class="icon-tag3 font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 deep-orange"><?php echo $getR_Wallet_payment/10000; ?> USD</span>
                                </div>
                                <p class="text-muted">Every Days profit <span class="deep-orange float-xs-right"></span></p>
                                
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0">
                            <div class="media px-1">
                                <div class="media-left media-middle">
                                    <i class="icon-shuffle3 font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 danger"><?php echo $get_p_node; ?></span>
                                </div>
                                <p class="text-muted">Sponser<span class="danger float-xs-right"></span></p>
                                
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0">
                            <div class="media px-1">
                                <div class="media-left media-middle">
                                    <i class="icon-dollar font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 success"><?php echo $getCWallet/10000; ?> USD</span>
                                </div>
                                <p class="text-muted">Refferal bonus<span class="success float-xs-right"></span></p>
                                
                            </div>
                        </div>

                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0">
                            <div class="media px-1">
                                <div class="media-left media-middle">
                                    <i class="icon-dollar font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 success"><?php echo $my_wallet/10000; ?> USD</span>
                                </div>
                                <p class="text-muted">My Wallet<span class="success float-xs-right"></span></p>
                                
                            </div>
                        </div>



                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0">
                            <div class="media px-1">
                                <div class="media-left media-middle">
                                    <i class="icon-dollar font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 success"> USD</span>
                                </div>
                                <p class="text-muted">Paring bonus<span class="success float-xs-right"></span></p>
                                
                            </div>
                        </div> 

                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0">
                            <div class="media px-1">
                                <div class="media-left media-middle">
                                    <i class="icon-dollar font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 success"> USD</span>
                                </div>
                                <p class="text-muted">Total Left<span class="success float-xs-right"></span></p>
                                
                            </div>
                        </div>

                        <div class="col-xl-3 col-lg-6 col-sm-12 padding-right-0">
                            <div class="media px-1">
                                <div class="media-left media-middle">
                                    <i class="icon-box font-large-1 blue-grey"></i>
                                </div>
                                <div class="media-body text-xs-right">
                                    <span class="font-large-2 text-bold-300 info"> USD</span>
                                </div>
                                <p class="text-muted">Total Right</p>
                                
                            </div>
                        </div> 

                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
           
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

    </div>
</div>
</div>     

        
<script type="text/javascript">
    if (location.hash === '#success') {
        alertify.set('notifier', 'delay', 100000000);
        alertify.set('notifier', 'position', 'top-right');
        alertify.success('Create user successfull !!!');
    }
</script>
<?php echo $self->load->controller('common/footer') ?>