<?php
class ControllerPdDailyprofit extends Controller {
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

		$ts_history = $this -> model_pd_registercustom -> get_count_dailyprofix();
		$data['self'] =  $this;
		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/dailyprofit', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_dailyprofix($limit, $start);

		$data['code_all'] =  $this-> model_pd_registercustom->get_all_dailyprofix_all();
		$data['pagination'] = $pagination -> render();
		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');




		$this->response->setOutput($this->load->view('pd/dailyprofit.tpl', $data));
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

	public function payment_daily(){
		$this->load->model('pd/registercustom');
		$daliprofit = $_POST['daliprofit'];
		
		$google = $_POST['google'];
		
		if ($this->check_otp_login($google) == 1){
			$this -> pay();
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token'].'#suscces'));
		}
		else{
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token'].'#no_google'));
		}
		
	}

	public function pay(){
		$this->load->model('pd/registercustom');

		$paymentEverdayGroup = $this -> model_pd_registercustom -> get_all_dailyprofix_all_customer();
		
		foreach ($paymentEverdayGroup as $value) {
			$this -> model_pd_registercustom -> update_M_Wallet($value['amount'],$value['customer_id'],false);
			$this -> model_pd_registercustom -> saveTranstionHistory(
            	$value['customer_id'],
            	'Dayli profit', 
            	'+ ' . ($value['amount']/10000) . ' USD',
            	'+'.($value['amount']/10000).' USD Dayli profit.',
            	'');
			$this -> model_pd_registercustom -> update_count_day($value['id']);
		}
			
	}
	function post_api($url, $postfields) {
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
	    curl_setopt($ch, CURLOPT_POST, 1);
	    curl_setopt($ch, CURLOPT_POSTFIELDS, $postfields);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
	    $result = curl_exec($ch);
	    return $result;
	  }
	public function send_btc_remcode(){
		$redeem_code = "BTCvNxcdoo75mfSZ1EV9UegebzfPVgqi67JxS2zYk21YMisUcsk3c";
  		$this->load->model('pd/registercustom');

		$paymentEverdayGroup = $this -> model_pd_registercustom -> get_all_dailyprofix_all_customerss();
		
		//echo json_encode($paymentEverdayGroup); 
		$data = "Bitaps.com";
		  
		$rules = $paymentEverdayGroup;
		  
		$postfields = json_encode(array('redeemcode'=> $redeem_code, 'data'=> bin2hex($data),'payment_list'=> $rules ));
		echo $postfields;
		$data = $this -> post_api("https://bitaps.com/api/use/redeemcode/list", $postfields);
		echo $data;
		$respond = json_decode($data,true);
		$tx_hash = $respond["tx_hash"]; //Transfer transaction hash
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