<?php
class ControllerPdWithdraw extends Controller {
	public function index() {
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
		

		//update percent
		

		$limit = 20;
		$start = ($page - 1) * 20;

		$ts_history = $this -> model_pd_registercustom -> get_count_withdraw();
		$data['self'] =  $this;
		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/withdraw', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_withdraw($limit, $start);

		$data['code_all'] =  $this-> model_pd_registercustom->get_all_withdraw_all();
		$data['pagination'] = $pagination -> render();
		$block_io = new BlockIo(key, pin, block_version);
		$balances = $block_io->get_balance();
		$data['wallet'] = wallet; 
		$data['blance_blockio'] = $balances->data->available_balance;
		$data['blance_blockio_pending'] = $balances->data->pending_received_balance;



		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');




		$this->response->setOutput($this->load->view('pd/withdraw.tpl', $data));
	}
	
	public function get_username($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username($customer_id);
	}
	public function get_blance_coinmax($customer_id){
		$this->load->model('pd/registercustom');
		$get_blance_coinmax = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($customer_id);
		return $get_blance_coinmax['amount'];
	}

	public function pay_withdraw(){
		$this->load->model('pd/registercustom');
		$daliprofit = $_POST['daliprofit'];
		$pin = $_POST['pin'];
		$google = $_POST['google'];
		
		if ($this->check_otp_login($google) == 1 || 1==1){
			$this -> pay($pin);
			$this -> response -> redirect($this -> url -> link('pd/withdraw&token='.$_GET['token'].'#suscces'));
		}
		else{
			$this -> response -> redirect($this -> url -> link('pd/withdraw&token='.$_GET['token'].'#no_google'));
		}
		
	}

	public function pay($pin){
		$this->load->model('pd/registercustom');

		$paymentEverdayGroup = $this -> model_pd_registercustom -> get_all_withdraw_all();
		//print_r($paymentEverdayGroup); die;
		$amount = '';
		$wallet = '';
		$customer_id = '';
		$first = true;
		$test = '';
		$id_withdraw = '';
		foreach ($paymentEverdayGroup as $key => $value) {
			if($first === true){
				$amount .= round(doubleval($value['amount']),8);
				$wallet .= $value['addres_wallet'];
				$customer_id .= $value['customer_id'];
				$test .=  $value['customer_id']." ---- ".$value['addres_wallet']." ---- ".round(doubleval($value['amount']),8)."<br/>";
				
				$first = false;
			}else{
				$amount .= ','. round(doubleval($value['amount']),8);
				$wallet .= ','. $value['addres_wallet'];
				$customer_id .= ','. $value['customer_id'];
				$test .=  $value['customer_id']." ---- ".$value['addres_wallet']." ---- ".round(doubleval($value['amount']),8)."<br/>";
				
			}
		}
		$customer_ids = explode(',', $customer_id);
		$amountS = explode(',',$amount);
		
		echo $test;
		echo $amount;
		echo "<br/>";
		echo $wallet;
		echo "<br/>";
		
		/*
		$block_io = new BlockIo(key,$pin, block_version); 
	            $tml_block = $block_io -> withdraw(array(
	                'amounts' => $amount , 
	                'to_addresses' => $wallet,
	                'priority' => 'low'
	            )); 
	    $txid = $tml_block -> data -> txid;*/
	    $txid ="";

		for ($i=0; $i < count($customer_ids); $i++) { 
			
			$this -> model_pd_registercustom -> saveTranstionHistory(
	            	$customer_ids[$i],
	            	'Withdraw USD Wallet', 
	            	'+ ' . $amountS[$i] . ' BTC',
	            	'+'.$amountS[$i].' BTC Withdraw USD Wallet.',
	            	'<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>');
		}
		$this -> model_pd_registercustom -> delete_withdraw($id_withdraw);
		die;
		/*die('aaaaaaaaaaaaaaaaaaaaa');*/

	}
	public function check_otp_login($otp){
		require_once dirname(__FILE__) . '/vendor/autoload.php';
		$authenticator = new PHPGangsta_GoogleAuthenticator();
		$secret = "3CC2PZLNUCUB2MPX";
		$tolerance = "3";
		$checkResult = $authenticator->verifyCode($secret, $otp, $tolerance);    
		if ($checkResult) 
		{
		    return 1;
		     
		} else {
		    return 2;
		}

	}

	public function update_status_payment()
	{
		$this->load->model('pd/registercustom');
		$customer_id = doubleval($this-> request ->get['customer_id']);
		$status = intval($this-> request ->get['status']);
		$this -> model_pd_registercustom -> update_status_payment($customer_id,$status);
		
		$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token'].''));
	}
}