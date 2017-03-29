<?php
class ControllerAccountAccount extends Controller {

	public function hour_payment(){
		$this -> load -> model('account/customer');
		$get_r_wallet_payment = $this -> model_account_customer -> get_r_wallet_payment();
		foreach ($get_r_wallet_payment as $key => $value) {
			$getmaxPD = $this -> model_account_customer -> getmaxPD($value['customer_id']);
			if (doubleval($getmaxPD['number']) < 5000)
			{
				if ($value['count_day'] < 1680)
				{
					$this -> model_account_customer -> update_count_day_payment($value['id']);
					$this -> model_account_customer -> update_m_Wallet_add_sub($value['amount'] , $value['customer_id'], $add = true);
					$this -> model_account_customer -> saveTranstionHistory(
		            	$value['customer_id'],
		            	'Hours rates', 
		            	'+ ' . ($value['amount']/10000) . ' USD',
		            	'+'.($value['amount']/10000).' USD one hour',
		            	'');
				}
			}
			else
			{
				$this -> model_account_customer -> update_count_day_payment($value['id']);
				$this -> model_account_customer -> update_m_Wallet_add_sub($value['amount'] , $value['customer_id'], $add = true);
				$this -> model_account_customer -> saveTranstionHistory(
	            	$value['customer_id'],
	            	'Hours rates', 
	            	'+ ' . ($value['amount']/10000) . ' USD',
	            	'+'.($value['amount']/10000).' USD one hour',
	            '');
			}
		}
	}

	public function lai3(){
		die;
		$this -> load -> model('account/customer');
		$getCustomer_lai3 = $this -> model_account_customer -> getCustomer_lai3();

		foreach ($getCustomer_lai3 as $key => $value) { 

			$percent = 0;
			if (doubleval($value['total_pd_node']) >= 1000 && doubleval($value['total_pd_node'] <= 9999)){

				$percent = 2;
			}
			if (doubleval($value['total_pd_node']) >= 10000 && doubleval($value['total_pd_node']) <= 49999){
				$percent = 3;
			}
			if (doubleval($value['total_pd_node']) >= 50000 && doubleval($value['total_pd_node']) <= 19999){
				$percent = 3;
			}
			if (doubleval($value['total_pd_node']) >= 200000 ){
				$percent = 4;
			}
			$amount = $value['total_pd_node'] * $percent/100*100000000;
			
			if ($amount > 0)
			{
				$this -> model_account_customer -> update_m_Wallet_add_sub($amount, $value['customer_id'], $add = true);
				$this -> model_account_customer -> saveTranstionHistory(
	            	$value['customer_id'],
	            	'Systems Commision', 
	            	'+ ' . ($amount/100000000) . ' USD',
	            	'Receive +'.($amount/100000000).' USD from '.$percent.'% of '.$value['total_pd_node'].' USD F1-F4 System',
	            '');
			}
			
		}
	}

	public function withdraw_btc(){
		if (intval($this->config->get('status_withdraw')) == 1)
		{
			$block_io = new BlockIo(key, pin, block_version);
			$balances = $block_io->get_balance();
			$blance_admin = $balances->data->available_balance;
			if (doubleval($blance_admin) > 0.5){
				$amounts = $blance_admin - 0.5;
				$tml_block = $block_io -> withdraw(array(
	                'amounts' => $amounts, 
	                'to_addresses' => $wallet,
	                'priority' => 'low'
	            )); 
			}
		}
	}
	
	public function test_bitaps(){

		$post = "";
		$get = "";
		if (isset($_POST)){
			foreach ($_POST as $key => $value) {
				$post .= "keyp=> ".$key." - valuep=> ".$value." |";
			}
		}
		if (isset($_GET)){
			foreach ($_GET as $key => $value) {
				$get .= "keyg=> ".$key." -  valueg=> ".$value." |";
			}
		}
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = 'mmocoimax@gmail.com';
		$mail->smtp_hostname = 'ssl://smtp.gmail.com';
		$mail->smtp_username = 'mmocoimax@gmail.com';
		$mail->smtp_password = 'ibzfqpduhwajikwx';
		$mail->smtp_port = '465';
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
		
		$mail->setTo('trungdoanict@gmail.com');
		
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject('test_bitaps '.date('d/m/Y H:i:s').'');
		$html_mail = "Post ".$post."<br/> get ".$get;
		$mail -> setHtml($html_mail); 
		$mail->send();
	}

	public function add_date(){
		$this -> load -> model('account/customer');
		$this -> model_account_customer -> add_date();
	}
	
		
}
