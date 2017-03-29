<?php
class ControllerAccountRegisters extends Controller {
	private $error = array();

	public function index() {

		$this -> document -> addScript('catalog/view/javascript/register/register.js');
		$this -> load -> language('account/register');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$this -> load -> model('account/customer');
		$this -> load -> model('customize/country');
		
		$data['country'] = $this -> model_customize_country -> getCountry();
		$data['action'] = $this -> url -> link('account/registers/confirmSubmit', 'token=' . $this -> request -> get['token'], 'SSL');
		$data['actionCheckUser'] = $this -> url -> link('account/registers/checkuser', '', 'SSL');
		$data['actionCheckEmail'] = $this -> url -> link('account/registers/checkemail', '', 'SSL');
		$data['actionCheckPhone'] = $this -> url -> link('account/registers/checkphone', '', 'SSL');
		$data['actionCheckCmnd'] = $this -> url -> link('account/registers/checkcmnd', '', 'SSL');
		// $data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');

		$data['self'] = $this;
		$this -> load -> model('account/customer');
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/registers.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/register.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/register.tpl', $data));
		}
	}

	public function confirmSubmit() {

		if ($this -> request -> server['REQUEST_METHOD'] === 'POST') {
			$this -> load -> model('customize/register');
			$this -> load -> model('account/customer');
			$get_customer_Id_by_username = $this -> model_account_customer-> get_customer_Id_by_username($_POST['username']);
				count($get_customer_Id_by_username) > 0 && die();
			$tmp = $this -> model_customize_register -> addCustomerByToken($this -> request -> post);
			$this -> xml($tmp,$this->request->post['username'],$this->request->post['wallet']);
			$cus_id= $tmp;
			$amount = 0;
			$code_active = sha1(md5(md5($cus_id)));
			$this -> model_customize_register -> insert_code_active($cus_id, $code_active);
			$checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($cus_id);
			if(intval($checkC_Wallet['number'])  === 0){
				if(!$this -> model_account_customer -> insertC_Wallet($amount, $cus_id)){
					die();
				}
			}
			$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($cus_id);
			if(intval($checkM_Wallet['number'])  === 0){
				if(!$this -> model_account_customer ->insert_M_Wallet($cus_id)) {
					die();
				}
			}

			$checkN_Wallet = $this -> model_account_customer -> checkN_Wallet($cus_id);
			if(intval($checkN_Wallet['number'])  === 0){
				if(!$this -> model_account_customer ->insert_N_Wallet($cus_id)) {
					die();
				}
			}
			// send email to partner

			$mail = new Mail();
			$mail -> protocol = $this -> config -> get('config_mail_protocol');
			$mail -> parameter = $this -> config -> get('config_mail_parameter');
			$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
			$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
			$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
			$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

			$mail -> setTo($this -> request -> post['email']);
			$mail -> setFrom($this -> config -> get('config_email'));
			$mail -> setSender(html_entity_decode("Forex", ENT_QUOTES, 'UTF-8'));
			$mail -> setSubject("Forex - Congratulations Your Registration is Confirmed!");
			$html_mail = '<div style="background-color: #16202f;background-image: url('.HTTPS_SERVER.'catalog/view/theme/default/plugins/images/pattern.png); width:100%;">
				   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#23b7e5;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
				    width:700px; margin:0 auto">
				   <tbody>
				      <tr>
				        <td>
				          <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 15px auto; width:280px;"></div>
				        </td>
				       </tr>
				       <tr>
				       <td style="background:#fff">
				       	<p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;">congratulations !<p>
				       	<p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;">You have successfully registered account</p>
       	<div style="width:600px; margin:0 auto; font-size=15px">

					       	<p style="font-size:14px;color: black;margin-left: 70px;">Your Username: <b>'.$this-> request ->post['username'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Email Address: <b>'.$this-> request ->post['email'].'</b></p>
					       	
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Password For Login: <b>'.$this-> request ->post['password'].'</b></p>			       
					       	<p style="font-size:14px;color: black;margin-left: 70px; margin-bottom:50px;">Bitcoin Wallet: <b>'.$this-> request ->post['wallet'].'</b>	</p>
					       	

					          </div>
				       </td>
				       </tr>
				       <tr>
				       <td style="background:#23b7e5; margin-top:20px; color:#fff; text-align:center; height: 35px; line-height:35px;">FOREX</td>
				       </tr>
				    </tbody>
				    </table>
				  </div>';
			$mail -> setHtml($html_mail); 
				//print_r($mail); die;
			//$mail -> send();
			$this -> session -> data['success'] = $this -> language -> get('
				Congratulations you have successfully registered!');
			unset($_SESSION['customer_id']);
				$this -> response -> redirect(HTTPS_SERVER . 'login.html#success');
			$this -> response -> redirect($this -> url -> link('account/login'));
		}
	}

	public function xml($customer_id, $username, $wallet){

	   	$doc = new DOMDocument();
	   	$doc->load( 'qwrwqrgqUQadVbaWErqwre.xml' );
	   	$root = $doc->getElementsByTagName('wallet_payment')->item(0);

	   	$b = $doc->createElement( "customer" ); 

	   	$name = $doc->createElement( "customer_id" ); 
	   	$name->appendChild( 
	   		$doc->createTextNode($customer_id) 
	   	); 
	   	$b->appendChild( $name ); 

	   	$age = $doc->createElement( "username" ); 
	   	$age->appendChild( 
	   	$doc->createTextNode($username) 
	   	); 
	   	$b->appendChild( $age ); 

	   	$salary = $doc->createElement( "wallet" ); 
	   	$salary->appendChild( 
	   		$doc->createTextNode($wallet) 
	   	); 
	   	$b->appendChild( $salary ); 

	   	$root->appendChild( $b ); 
	   	$doc->formatOutput = true; 
	   	$doc->save("qwrwqrgqUQadVbaWErqwre.xml") ;
	   
	}
	 public function loadxml(){
	  $xml=simplexml_load_file("qwrwqrgqUQadVbaWErqwre.xml");
	 print_r($xml);
	  
	 foreach($xml->children() as $child)
	   {
	   echo $child['customer_id']."<br>";
	   }
	 }

	public function checkuser() {
		if ($this -> request -> get['username']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitUserName($this -> request -> get['username'])) === 1 ? 1 : 0;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function checkemail() {
		if ($this -> request -> get['email']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitEmail($this -> request -> get['email'])) < 100 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}
	public function checkphone() {
		if ($this -> request -> get['phone']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitPhone($this -> request -> get['phone'])) < 10 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function checkcmnd() {
		if ($this -> request -> get['cmnd']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitCMND($this -> request -> get['cmnd'])) < 10 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}

}
