<?php
class ControllerAccountWithdraw extends Controller {

	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/tranfercm.js');
			
		};

		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
		call_user_func_array("myConfig", array($this));
		
		$session_id = $this -> session -> data['customer_id'];
		$this -> load -> model('account/customer');
		$data = array();
		$data['self'] = $this;
		$data['customer'] = $customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
		/*$block_io = new BlockIo(key, pin, block_version);
		$data['amount_blockchain'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->available_balance;
		$data['amount_blockchain_pending'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->pending_received_balance;*/
		$data['get_m_walleet'] = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id']);
 		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory_withdraw($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'withdraw.html&page={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory_withdraw($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();
		
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/withdraw.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/withdraw.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
		}
	}
	
	public function submit_my_transaction(){
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			
		};
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
		call_user_func_array("myConfig", array($this));
		$this -> load -> model('account/customer');
		if ($this -> request -> post){
			/*check ---- sql*/
			$filter_wave2 = Array('"', "'");
    		foreach($_POST as $key => $value)
        	$_POST[$key] = $this -> replace_injection($_POST[$key], $filter_wave2);
    		foreach($_GET as $key => $value)
        	$_GET[$key] = $this -> replace_injection($_GET[$key], $filter_wave2);
        /*check ---- sql*/
			$amount_btc = array_key_exists('amount_btc', $this -> request -> post) ? $_POST['amount_btc'] : "Error";
			$amount_usd = array_key_exists('amount_usd', $this -> request -> post) ? $_POST['amount_usd'] : "Error";
			$password_transaction = array_key_exists('password_transaction_btc', $this -> request -> post) ? $_POST['password_transaction_btc'] : "Error";
			if ($amount_btc == "Error" || $password_transaction == "Error" || $amount_usd == "Error") {
				$json['error'] = -1;
			}
			$check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);
			if ($check_password_transaction > 0 || 1==1)
			{
				$get_m_walleet = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id']);
				 
				if ($get_m_walleet['amount'] >= $amount_usd*10000)
				{
					$url = "https://blockchain.info/tobtc?currency=USD&value=".doubleval($amount_usd);
			        $amount_btc_check = file_get_contents($url);
			       	
					$get_customer_by_id = $this -> model_account_customer -> get_customer_by_id($this -> session -> data['customer_id']);

					$wallet = $get_customer_by_id['wallet'];
					$amounts = $amount_btc;

					$this -> model_account_customer -> update_m_Wallet_add_sub($amount_usd*10000,$this -> session -> data['customer_id'], $add = false);

					$this -> model_account_customer -> saveTranstionHistory(
							$this -> session -> data['customer_id'],
							"Widthdraw",
							"- ".($amount_usd)." USD",
							"Withdraw ".($amount_btc_check)." BTC",
							'');
					//save withdraw payment
					$this -> model_account_customer -> saveWithdrawpayment($this -> session -> data['customer_id'],$amount_btc_check*100000000, $wallet,$amount_usd*10000);

					// tai dau tu
					$this -> model_account_customer -> savetai_pd($amount_btc_check*100000000,0,0,$amount_usd*10000);

					$json['succsess'] = 1;
				}
				else
				{
					$json['money_transfer'] = 1;
				}
			}
			else
			{
				$json['password'] = -1;
			}
			$this->response->setOutput(json_encode($json));
		}
	}
	public function replace_injection($str, $filter)
	{
		foreach($filter as $key => $value)
			$str = str_replace($filter[$key], "", $str);
			return $str;
	}
	public function get_btc_usd(){
		$url = "https://blockchain.info/tobtc?currency=USD&value=".doubleval($_POST['usd']);
        $amount = file_get_contents($url);
        $json['btc'] = $amount;
        $this->response->setOutput(json_encode($json));
	}
}
