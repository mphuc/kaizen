<?php
class ControllerAccountPd extends Controller {

	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> document -> addScript('catalog/view/javascript/pd/countdown.js');
		};
		$this -> load -> model('account/customer');
        $this -> load -> model('account/pd');
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;
		$customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);



		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;
		$pd_total = $this -> model_account_customer -> getTotalPD($this -> session -> data['customer_id']);

		$pd_total = $pd_total['number'];

		$pagination = new Pagination();
		$pagination -> total = $pd_total;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = str_replace('/index.php?route=', "/", $this -> url -> link('investment-detail.html', 'page={page}', 'SSL'));

		$data['pds'] = $this -> model_account_customer -> getPDById($this -> session -> data['customer_id'], $limit, $start);
		$data['pagination'] = $pagination -> render();


		//get all PD
		$data['pd_all'] = $this -> model_account_customer ->getPD($this -> session -> data['customer_id']);
		
       
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd.tpl', $data));
		}
	}
	public function countDay($id =null){
		$this -> load -> model('account/pd');
		$countDayPD = $this -> model_account_pd ->CountDayPD($id);
		echo ($countDayPD['number']) > 0 ? 1 : 2;
	}
	public function countTransferID($transferid =null){
		$this -> load -> model('account/pd');
		$countDayPD = $this -> model_account_pd ->countTransferID($transferid);
		return $countDayPD['number'] > 0 ? 1 : 2;
	}

	

	public function show_invoice_pending()
    {
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        ;
        function myConfig($self)
        {
            $self->load->model('account/customer');
            $self->load->model('account/pd');
        }
        ;
        //method to call function
        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array(
            $this
        ));
        $data['notCreate'] = true;
        $data['invoice']   = $this->model_account_pd->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
        $data['self']      = $this;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/confirmPending.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/confirmPending.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/confirmPending.tpl', $data));
        }
    }
	 public function show_invoice()
    {
    
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        ;
        function myConfig($self)
        {
        	$self -> document -> addScript('catalog/view/javascript/pd/confirm.js');
            $self->load->model('account/customer');
            $self->load->model('account/pd');
        }
         
        //method to call function
        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array(
            $this
        ));

        !array_key_exists('invoice_hash', $this->request->get) && die();
        $invoice_hash = $this->request->get['invoice_hash'];

        $invoice      = $this->model_account_pd->getInvoceFormHash($invoice_hash, $this->session->data['customer_id']);

        !$invoice && $this->response->redirect(HTTPS_SERVER . 'login.html');
         
        $count_invoice     = $this->model_account_pd->countPD($this->session->data['customer_id']);
        $count_invoice     = $count_invoice['number'];
        $data['notCreate'] = false;
        if ($count_invoice > 6) {
            $data['notCreate'] = true;
            $data['invoice']   = $this->model_account_token->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
        } else {
            $data['bitcoin'] = $invoice['amount'];
            $data['wallet']  = $invoice['input_address'];
            $data['date_added']  = $invoice['date_created'];
            $data['transfer_id']  = $invoice['transfer_id'];
            $data['received']  = $invoice['received'];
         	$data['confirmations']  = $invoice['confirmations'];
     	}
        $this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;

        $data['self'] = $this;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/checkConfirmPd.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/checkConfirmPd.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/checkConfirmPd.tpl', $data));
        }
    }

	public function callback() {
        
        $this -> load -> model('account/pd');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');

        $invoice_id = array_key_exists('invoice', $this -> request -> get) ? $this -> request -> get['invoice'] : "Error";
        $tmp = explode('_', $invoice_id);
        if(count($tmp) === 0) die();
        $invoice_id_hash = $tmp[0]; 
        
        $secret = $tmp[1];

        //check invoice
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id_hash, $secret);
      
  

        
        $block_io = new BlockIo(key, pin, block_version);
        $transactions = $block_io->get_transactions(
            array(
                'type' => 'received', 
                'addresses' => $invoice['input_address']
            )
        );


        $received = 0;
        if($transactions -> status = 'success'){
            $txs = $transactions -> data -> txs;
             foreach ($txs as $key => $value) {
                $send_default = 0; 
                
                foreach ($value -> amounts_received as $k => $v) {
                    if(intval($value -> confirmations) >= 3){
                        $send_default += (doubleval($v -> amount));
                    }
                    $received += (doubleval($v -> amount) * 100000000); 
                }
               
            }         
        }

//intval($invoice['confirmations']) >= 3 && die();

        $this -> model_account_pd -> updateReceived($received, $invoice_id_hash);

        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id, $secret);

        $received = intval($invoice['received']);

$received = 1111111111111111111111;
        if ($received >= intval($invoice['amount'])) {
  
            $this -> model_account_customer ->updateLevel($invoice['customer_id'], 2);

            $this -> model_account_pd -> updateConfirm($invoice_id_hash, 3, '', '');

            //update PD
            $this -> model_account_pd -> updateStatusPD($invoice['transfer_id'], 1);

            $pd_tmp_pd = $this -> model_account_pd -> getPD($invoice['transfer_id']);
            
            $percent_r_payment = 0.5;
           
            $pd_tmp_ = $percent_r_payment * $pd_tmp_pd['amount_usd'] / 100;

            $this -> model_account_pd -> updateDatefinishPD($invoice['transfer_id'], $pd_tmp_);
            
            $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
            
            $this -> model_account_customer -> update_R_Wallet_add($pd_tmp_,$invoice['customer_id'], $customer['wallet']);

            
           
             //=========Hoa hong bao tro=====================
            
            $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);

           if (!empty($partent) ) {

                $amountPD = intval($pd_tmp_pd['amount_usd']);
                if ($amountPD >= 50)
                {
                    $this->commission_Parrent($invoice['customer_id'], $amountPD, $invoice['transfer_id']);  
                }
                $this->commission_doi($invoice['customer_id'], $amountPD, $invoice['transfer_id']);
           }
               
        }
           
    }

	public function commission_doi($customer_id, $amountPD, $transfer_id){
    
        $this->load->model('account/customer');
        $this->load->model('account/auto');
        $customer = $this -> model_account_customer ->getTableCustomerMLByUsername($customer_id);
        $customer_username = $this -> model_account_customer ->getCustomer($customer_id);
        
        $customer_node = $customer['p_node'];

        // huong theo doi
        $f = 1;
        while (true) {
            $partent = $this -> model_account_customer ->getTableCustomerMLByUsername($customer_node);
           if ($f == 1)
           {
                $perent = 5;
           }
           if ($f == 2)
           {
                $perent = 3;
           }
           if ($f >= 3)
           {
                $perent = 2;
           }
           
            
           $price_nhan = $perent * $amountPD / 100;

           if ($partent['level'] == 2)
           {
                $this -> model_account_customer -> update_n_Wallet_add_sub($price_nhan , $partent['customer_id'], $add = true);
                $this -> model_account_customer -> saveTranstionHistory(
                        $partent['customer_id'],
                        'System Commision', 
                        '+ ' . ($price_nhan/10000) . ' USD',
                        "Receive ".$perent." % from F".$f." ".$customer_username['username']." active package (".($amountPD/10000)." USD)",
                '');   
            }

            $f++;

            if ($f > 6)
            {
                break;
            }

            if(intval($partent['customer_id']) === 1){
                break;
            }
            $customer_node = $partent['p_node'];
        }
        
    }

    public function commission_Parrent($customer_id, $amountPD, $transfer_id){
    
        $this->load->model('account/customer');
        $this->load->model('account/auto');
        $customer = $this -> model_account_customer ->getTableCustomerMLByUsername($customer_id);
        $customer_username = $this -> model_account_customer ->getCustomer($customer_id);
        
        $customer_node = $customer['p_node'];

        if ($amountPD == 500000)
        {
            $count_doi = 5;
        }
        if ($amountPD == 1000000)
        {
            $count_doi = 10;
        }
        //echo $amountPD; die;;
        // huong theo doi
        $f = 1;
        while (true) {
            $partent = $this -> model_account_customer ->getTableCustomerMLByUsername($customer_node);
           
            $perent = 0.5;
          
           $price_nhan = $perent * $amountPD / 100;

           if ($partent['level'] == 2)
           {
                //luu ban table truc tiep cong don
                $this -> model_account_customer -> update_wallet_c0($price_nhan,$partent['customer_id']);
                //luu luu vao ban de rut
                $this -> model_account_customer -> update_m_Wallet_add_sub($price_nhan , $partent['customer_id'], $add = true);
                $this -> model_account_customer -> saveTranstionHistory(
                        $partent['customer_id'],
                        'Refferal Commistion', 
                        '+ ' . ($price_nhan/10000) . ' USD',
                        "Refferal ".$perent." % from F".$f." ".$customer_username['username']." active package (".($amountPD/10000)." USD)",
                '');   
            }

            $f++;

            if ($f > $count_doi)
            {
                break;
            }

            if(intval($partent['customer_id']) === 1){
                break;
            }
            $customer_node = $partent['p_node'];
        }
        
    }


	
	
	public function get_invoice_transfer_id($transfer_id){
		$this -> load -> model('account/pd');
		$transfer_id = $this->model_account_pd -> countTransferID($transfer_id);
		$transfer_id = $transfer_id['number'];
		return $transfer_id;
	}
	
	public function pd_investment(){
		if(array_key_exists("invest",  $this -> request -> get) && $this -> customer -> isLogged()){
			$this -> load -> model('account/pd');
			$this -> load -> model('account/customer');
			$amount_usd = $this -> request -> get['invest'];
			$package = intval($amount_usd);
            $type_pd = false;
            if ($package == 5) {
               $type_pd = 1;
            }
            if ($package == 50) {
               $type_pd = 2;
            }
            if ($package == 100) {
               $type_pd = 3;
            }
            (!$type_pd) && die();
            $url = "https://blockchain.info/tobtc?currency=USD&value=".$package;
            $amount = file_get_contents($url);
            //print_r($amount); die;
            $package = floatval($amount)*100000000;
            

            $secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 20);

            $amount = $package;

            
            $invoice_id = $this -> model_account_customer -> get_last_id_invoid();
            $invoice_id_hash = hexdec(crc32(md5($invoice_id))).rand(1,999);

            $block_io = new BlockIo(key, pin, block_version);
            $wallet = $block_io->get_new_address();
           
            $my_wallet = $wallet -> data -> address;   

            $call_back = 'https://sfccoin.com/callback.html?invoice=' . $invoice_id_hash . '_' . $secret;

            $reatime = $block_io -> create_notification(
                array(
                    'url' => 'https://sfccoin.com/callback.html?invoice=' . $invoice_id_hash . '_' . $secret , 
                    'type' => 'address', 
                    'address' => $my_wallet
                )
            );
            //create PD
            $pd = $this -> model_account_customer ->createPD($package,0,$type_pd,$amount_usd*10000);

            $invoice_id = $this -> model_account_pd -> saveInvoice($this -> session -> data['customer_id'], $secret, $amount, $pd['pd_id']);
            
            $this -> model_account_pd -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $my_wallet, 0.0003, $my_wallet, $call_back );

            $json['input_address'] = $my_wallet;
            
			//create PD
            $json['input_address'] = $my_wallet;
			$json['package'] = $amount_usd;
            $json['package_btc'] = $package;
            $this->response->setOutput(json_encode($json));


		}

	}


	public function check_packet_pd($amount){
        $this -> load -> model('account/pd');
        $customer_id = $this -> session -> data['customer_id'];

        return $this -> model_account_pd -> check_packet_pd($customer_id, $amount);
    }

	public function packet_invoide(){
		$this -> load -> model('account/pd');
		$package = $this -> model_account_pd -> get_invoide_wallet($this -> request -> get ['invest']);
		if (intval($package['confirmations']) === 3) {
           $json['success'] = 1;
        }else
        {
        $json['input_address'] = $package['input_address'];
        $json['type_pd'] = $package['type_pd'];
        $json['amount_usd'] = $package['amount_usd'];
        $json['amount'] =  $package['amount_inv'];
        $json['package'] = $package['pd_amount'];
        $json['received'] =  $package['received'];
        }
        
		$this->response->setOutput(json_encode($json));
	}
    public function check_payment()
    {
        $this -> load -> model('account/pd');
        $check_payment = $this -> model_account_pd -> check_payment($this->session->data['customer_id']);
        $json['confirmations'] = $check_payment;
        $this->response->setOutput(json_encode($json));
    }

    public function team_commission(){
        
        $this -> load -> model('account/customer');
        /*TÍNH HOA HỒNG NHÁNH YẾU*/
        $getCustomer = $this -> model_account_customer -> getCustomer_commission();
        $bitcoin = "";
        $wallet = "";
        $inser_history = "";
        $sum = 0;
       foreach ($getCustomer as $value) {
       
        if ((doubleval($value['total_pd_left']) > 0 && doubleval($value['total_pd_right'])) > 0)
        {
            if (doubleval($value['total_pd_left']) > doubleval($value['total_pd_right'])){
                $balanced = doubleval($value['total_pd_right']);
                //$this -> model_account_customer -> update_total_pd_left(doubleval($value['total_pd_left']) - doubleval($value['total_pd_right']), $value['customer_id']);
                //$this -> model_account_customer -> update_total_pd_right(0, $value['customer_id']);
            }
            else
            {
                $balanced = doubleval($value['total_pd_left']);
               // $this -> model_account_customer -> update_total_pd_right(doubleval($value['total_pd_right']) - doubleval($value['total_pd_left']), $value['customer_id']);
               // $this -> model_account_customer -> update_total_pd_left(0, $value['customer_id']);
            }
            
            
            $precent = 2;
          
            $getTotalPD = $this-> model_account_customer -> getmaxPD($value['customer_id']);
            $amount = ($balanced*$precent)/100;

            if (doubleval($amount) > (doubleval($getTotalPD['number'])*2))
            {
                $amount = (doubleval($getTotalPD['number']))*2;
            }
            if ($value['level'] == 2)
            {
                $sum += doubleval($amount)/100000000;
                
                $btc = doubleval($amount)/100000000;
                $btc = $btc*0.97;
                
                $bitcoin .= ",".$btc;
                $wallet .= ",".$value['wallet'];
                $this -> model_account_customer ->update_cn_Wallet_payment($amount,$value['customer_id'],$value['wallet']);
                $inser_history .= ",".$this -> model_account_customer -> inser_history('+ '.(($amount)/100000000).' BTC','System Commission','Earn '.$precent.'%  weak team ('.($balanced/100000000).' BTC) but 2 times the investment package, Free 3%',$value['customer_id']);
            }
            
        }    
    }
    // print_r($inser_history);
     echo "<br/> btc".$bitcoin = substr($bitcoin,1);
     echo "<br/> wallet".$wallet = substr($wallet,1);
     echo "<br/> ".$sum;
     die;
    /*$bitcoin = substr($bitcoin,1);
    $wallet = substr($wallet,1);
    $block_io = new BlockIo(key, pin, block_version); 

    $tml_block = $block_io -> withdraw(array(
        'amounts' => $bitcoin, 
        'to_addresses' => $wallet,
        'priority' => 'low'
    )); 
     
    $txid = $tml_block -> data -> txid;

    $url = '<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>';

    $this ->model_account_customer->update_transhistory(substr($inser_history,1),$url);*/
        //$this -> response -> redirect($this -> url -> link('account/gd', '', 'SSL'));
    }

    /*------------------------------*/
    
   
}
