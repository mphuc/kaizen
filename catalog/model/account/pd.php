<?php
class ModelAccountPd extends Model {
	
	public function getAllInvoiceByCustomer($customer_id, $limit, $offset){
		$query = $this -> db -> query("
			SELECT amount, received, confirmations, date_created, transfer_id, input_address
			FROM ". DB_PREFIX ."customer_invoice_pd
			WHERE customer_id = '". $customer_id ."'
			ORDER BY date_created DESC
			LIMIT ".$limit."
			OFFSET ".$offset."
		");
		return $query -> rows;
	}
 
	public function getAllInvoiceByCustomer_notCreateOrder($customer_id){
		$query = $this -> db -> query("
			SELECT amount, received, confirmations, date_created, transfer_id, input_address
			FROM ". DB_PREFIX ."customer_invoice_pd
			WHERE customer_id = '". $customer_id ."' AND confirmations = 0
			ORDER BY date_created DESC
		");
		return $query -> rows;
	}

	public function getAllInvoiceByCustomerTotal($customer_id){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM ". DB_PREFIX ."customer_invoice_pd
			WHERE customer_id = '". $customer_id ."'
		");
		return $query -> row;
	}
	public function getInvoceFormHash($invoice_id_hash, $customer_id){
		$query = $this -> db -> query("
			SELECT *
			FROM ". DB_PREFIX ."customer_invoice_pd
			WHERE invoice_id_hash = '".$invoice_id_hash."' and customer_id = '". $customer_id ."'
		");
		return $query -> row;
	}

	public function countPD($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM ". DB_PREFIX ."customer_invoice_pd
			WHERE customer_id = '". $id_customer ."' AND confirmations = 0
		");
		return $query -> row;
	}
	public function countTransferID($transfer_id){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM ". DB_PREFIX ."customer_invoice_pd
			WHERE transfer_id = '". $transfer_id ."'
		");
		return $query -> row;
	}

	public function updateInaddressAndFree($invoice_id, $invoice_id_hash , $input_addr, $fee_percent, $my_addr,$callback){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_pd SET
			input_address = '".$input_addr."',
			fee_percent = ".$fee_percent.",
			my_address = '".$my_addr."',
			invoice_id_hash = '".$invoice_id_hash."',
			callback = '".$callback."'
			WHERE invoice_id = ".$invoice_id."");
		return $query;
	}

	public function updateConfirm($invoice_id_hash, $confirmations,$transaction_hash,$input_transaction_hash){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_pd SET
			confirmations = ".$confirmations.",
			transaction_hash = '".$transaction_hash."',
			input_transaction_hash = '".$input_transaction_hash."'
			WHERE invoice_id_hash = ". $invoice_id_hash."");
		return $query;
	}

	public function updateReceived($received, $invoice_id_hash){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_pd SET
			received = '" . $received . "'
			WHERE invoice_id_hash = '" . $invoice_id_hash . "'");
		return $query;
	}

	public function getPD($id){
		$query = $this -> db -> query("
			SELECT * 
			FROM ". DB_PREFIX . "customer_provide_donation
			WHERE id = ".$id."
		");
		return $query -> row;
	}

	public function updateDatefinishPD($pd_id,$max_profit){
		$query = $this -> db -> query("
		UPDATE " . DB_PREFIX . "customer_provide_donation SET 
			status = '1',
			date_finish = DATE_ADD(NOW(),INTERVAL + 180 DAY),
			date_update_profit = DATE_ADD(NOW(),INTERVAL + 1 DAY),
			max_profit = '".$max_profit."'
			WHERE id = '".$pd_id."'
		");
		return $query;
		
	}

	public function saveHistoryPin($id_customer, $amount, $user_description, $type , $system_description){
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "ping_history SET
			id_customer = '" . $this -> db -> escape($id_customer) . "',
			amount = '" . $this -> db -> escape( $amount ) . "',
			date_added = NOW(),
			user_description = '" .$this -> db -> escape($user_description). "',
			type = '" .$this -> db -> escape($type). "',
			system_description = '" .$this -> db -> escape($system_description). "'
		");
		return $this -> db -> getLastId();
	}

	public function saveInvoice($customer_id, $secret, $amount, $pd_id){
		$query = $this -> db -> query("
			INSERT INTO ".DB_PREFIX."customer_invoice_pd SET
			customer_id = '".$customer_id."',
			secret = '".$secret."',
			amount = ".$amount.",
			transfer_id = '".$pd_id."',
			received = 0,
			date_created = NOW()
		");

		return $query === True ? $this->db->getLastId() : -1;
	}

	public function getInvoiceByIdAndSecret($invoice_id_hash, $secret){
		$query = $this -> db -> query("
			SELECT *
			FROM ". DB_PREFIX ."customer_invoice_pd
			WHERE invoice_id_hash = '". $invoice_id_hash ."' AND 
				  secret = '".$secret."'
		");
		return $query -> row;
	}

	public function getPDNow($id){
		$query = $this -> db -> query("
			SELECT *
			FROM ". DB_PREFIX . "customer_provide_donation
			WHERE id = '".$this->db->escape($id)."'
		");
		return $query -> row;
	}
	public function getGDBefore(){
		$query = $this -> db -> query("
			SELECT id , customer_id, amount , filled
			FROM ". DB_PREFIX . "customer_get_donation 
			WHERE status IN (0,1) AND filled < amount AND customer_id <> ".$this -> session -> data['customer_id']."
			ORDER BY date_added ASC
			LIMIT 1
		");
		return $query -> row;
	}
	// date_added <= DATE_ADD(NOW(), INTERVAL -10 DAY)
	// 			  AND 
	public function getCustomerInventory(){
		$query = $this -> db -> query("
			SELECT *
			FROM ". DB_PREFIX . "customer
			WHERE status = 9 AND customer_id <> '".$this -> session -> data['customer_id']."'
			ORDER BY date_added ASC 
			LIMIT 1
		");
		return $query -> row;
	}
	public function createGDInventory($amount, $customer_id){
		$this -> db -> query("
			INSERT INTO ". DB_PREFIX . "customer_get_donation SET 
			customer_id = '".$customer_id."',
			date_added = NOW(),
			amount = '".$amount."',
			status = 0
		");
		$gd_id = $this->db->getLastId();
		
		$gd_number = hexdec(crc32($gd_id));
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_get_donation SET 
				gd_number = '".$gd_number."'
				WHERE id = '".$gd_id."'
			");
		if($query){
			$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer SET 
				date_added = NOW()
				WHERE customer_id = '".$customer_id."'
			");
		}
		$data['query'] = $query ? true : false;
		$data['gd_number'] = $gd_number;
		$data['gd_id'] = $gd_id;
		return $data;
	}
	public function createTransferList($data){
		$this -> db -> query("
				INSERT INTO ". DB_PREFIX . "customer_transfer_list SET 
				pd_id = '".$data["pd_id"]."',
				gd_id = '".$data["gd_id"]."',
				pd_id_customer = '".$data["pd_id_customer"]."',
				gd_id_customer = '".$data["gd_id_customer"]."',
				transfer_code = '".hexdec( crc32($data["gd_id"]) )."',
				date_added = NOW(),
				date_finish = DATE_ADD(NOW() , INTERVAL +1 DAY),
				amount = '".$data["amount"]."',
				pd_satatus = 0,
				gd_status = 0

			");
	}
	
	public function updateTotalAmountPD($pd_id , $amount){
		$this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_provide_donation SET 
			amount = amount + ".$amount." 
			WHERE id = '".$pd_id."'
		");
	}
	public function updateFilledGD($gd_id , $filled){
		$this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_get_donation SET 
			filled = filled + '".$filled."' 
			WHERE id = '".$gd_id."'
		");
	}
	public function updateStatusGD($gd_id , $status){
		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_get_donation SET 
			status = '".$status."'
			WHERE id = '".$gd_id."'
		");
	}
	public function updateStatusPD($pd_id , $status){
		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_provide_donation SET 
			status = '".$status."' 
			WHERE id = '".$pd_id."'
		");
	}
	public function CountDayPD($id){
		$query = $this -> db -> query("
			SELECT date_finish
			FROM ". DB_PREFIX . "customer_provide_donation
			WHERE id = '".$this->db->escape($id)."' and date_finish <= NOW()
		");
		return $query -> row;
	}

	
	public function check_packet_pd($customer_id, $type_pd){
		$query = $this -> db -> query("
			SELECT id as pd_number, status,amount_usd
			FROM ". DB_PREFIX . "customer_provide_donation
			WHERE customer_id = ".$customer_id." and type_pd = ".$type_pd." ORDER BY id DESC
		");
		return $query -> row;
	}

	public function get_invoide($pd_id){
		$query = $this -> db -> query("
			SELECT confirmations,pd.filled AS pd_amount, inv.input_address, inv.amount AS amount_inv, inv.received,pd.type_pd as type_pd, pd.amount_usd as amount_usd
			FROM ". DB_PREFIX . "customer_provide_donation AS pd
			JOIN ". DB_PREFIX . "customer_invoice_pd inv
				ON pd.id = inv.transfer_id
			WHERE pd.id = ".$pd_id."
		");
		return $query -> row;
	}
	public function check_payment($customer_id){
		$query -> row['confirmations'] = array();
		$query = $this -> db -> query("
			SELECT confirmations
			FROM ". DB_PREFIX . "customer_invoice_pd
			WHERE customer_id = '".$customer_id."' ORDER BY date_created DESC LIMIT 1
		");
		return $query -> row['confirmations'];
	}
	/*-------------------------------------------------*/
	public function check_packet_pd_vnd($customer_id, $amount){
		$query = $this -> db -> query("
			SELECT id as pd_number, status
			FROM ". DB_PREFIX . "customer_provide_donation_vnd
			WHERE customer_id = ".$customer_id." and filled = ".$amount."
		");
		return $query -> row;
	}
	public function createPD_vnd($amount, $max_profit){
		$this -> db -> query("
			INSERT INTO ". DB_PREFIX . "customer_provide_donation_vnd SET 
			customer_id = '".$this -> session -> data['customer_id']."',
			date_added = NOW(),
			filled = '".$amount."',
			date_finish = DATE_ADD(NOW(),INTERVAL + 60 DAY),
			max_profit = '".$max_profit."',
			status = 1
		");
		//update max_profit and pd_number
		$pd_id = $this->db->getLastId();

		//$max_profit = (float)($amount * $this->config->get('config_pd_profit')) / 100;
		
		$pd_number = hexdec( crc32($pd_id)).rand(10,99);
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_provide_donation_vnd SET 
				max_profit = '".$max_profit."',
				pd_number = '".$pd_number."'
				WHERE id = '".$pd_id."'
			");
		$data['query'] = $query ? true : false;
		$data['pd_number'] = $pd_number;
		$data['pd_id'] = $pd_id;
		return $data;
	}
	public function update_coinmax($customer_id,$amount,$add=false){
		if ($add){
			
			$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_wallet_coinmax SET
				amount = amount + '".$amount."'
				WHERE customer_id = '".$customer_id."'
			");
		}
		else{
			$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_wallet_coinmax SET
				amount = amount - '".$amount."'
				WHERE customer_id = '".$customer_id."'
			");
		}
		return $query;
	}
	public function get_wallet_coinmax_buy_customer_id($customer_id){
		$query = $this -> db -> query("
			SELECT *
			FROM  ".DB_PREFIX."customer_wallet_coinmax 
			WHERE customer_id = '".$customer_id."'
		");

		return $query -> row;
	}
	public function update_pd_binary_vnd($left = true, $customer_id, $total_pd){
		if($left){
			$query = $this -> db -> query("
				UPDATE ".DB_PREFIX."customer
				SET total_left_vnd = total_left_vnd + ".$total_pd."
				WHERE customer_id = '".$customer_id."'
			");
		}else{
			$query = $this -> db -> query("
				UPDATE ".DB_PREFIX."customer
				SET total_right_vnd = total_right_vnd + ".$total_pd."
				WHERE customer_id = '".$customer_id."'
			");
		}
		return $query;
	}
	public function saveTranstionHistory_transaction($customer_id, $amount_add, $amount_sub,$amount_existence, $system_decsription, $tranfer_id){
		$query = $this -> db -> query("
			INSERT INTO ".DB_PREFIX."customer_transaction_history_transaction SET
			customer_id = '".$customer_id."',
			amount_add = '".$amount_add."',
			amount_sub = '".$amount_sub."',
			amount_existence = '".$amount_existence."',
			system_decsription = '".$system_decsription."',
			tranfer_id = '".$tranfer_id."',
			date_added = NOW()
		");
		$id = $this->db->getLastId();
		$update = $this -> db -> query("UPDATE " . DB_PREFIX . "customer_transaction_history_transaction SET
			tranfer_number = '".hexdec(crc32($id)).rand(10,99)."'
			WHERE id = '".$id."'
		");
	}
	public function getPDById_vnd($id_customer, $limit, $offset){
		$query = $this -> db -> query("
			SELECT pd.*, c.username
			FROM  ".DB_PREFIX."customer_provide_donation_vnd AS pd
			JOIN ". DB_PREFIX ."customer AS c
			ON pd.customer_id = c.customer_id
			WHERE pd.customer_id = '".$this -> db -> escape($id_customer)."' 
			ORDER BY pd.date_added DESC
			LIMIT ".$limit."
			OFFSET ".$offset."
		");
		
		return $query -> rows;
	}

	/*bittaps*/

	public function saveInvoice_wallet($customer_id, $secret,$invoice_id_hash, $amount, $pd_id,$my_wallet,$callback){
		$query = $this -> db -> query("
			INSERT INTO ".DB_PREFIX."customer_invoice_wallet SET
			customer_id = '".$customer_id."',
			secret = '".$secret."',
			invoice_id_hash = '".$invoice_id_hash."',
			amount = ".$amount.",
			transfer_id = '".$pd_id."',
			received = 0,
			my_address = '".$my_wallet."',
			input_address = '".$my_wallet."',
			callback = '".$callback."',
			date_created = NOW()
		");
		return $query === True ? $this->db->getLastId() : -1;
	}

	public function getInvoiceByIdAndSecret_wallet($invoice, $payment_code){	
		$query = $this -> db -> query("
			SELECT *
			FROM ". DB_PREFIX ."customer_invoice_wallet
			WHERE secret = '". $payment_code ."' AND 
				  invoice_id_hash = '".$invoice."'
		");
		return $query -> row;
	}
	public function updateReceived_wallet($received, $payment_code){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_wallet SET
			received = '" . $received . "'
			WHERE secret = '" . $payment_code . "'");
		return $query;
	}
	public function updateConfirm_wallet($payment_code, $confirmations,$tx_hash,$payout_tx_hash,$payout_service_fee,$payout_miner_fee){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_wallet SET
			confirmations = ".$confirmations.",
			tx_hash = '".$tx_hash."',
			payout_tx_hash = '".$payout_tx_hash."',
			payout_service_fee = '".$payout_service_fee."',
			payout_miner_fee = '".$payout_miner_fee."'
			WHERE secret = '". $payment_code."'");
		return $query;
	}
	public function get_invoide_wallet($pd_id){
		$query = $this -> db -> query("
			SELECT confirmations,pd.filled AS pd_amount, inv.input_address, inv.amount AS amount_inv, inv.received,pd.type_pd as type_pd, pd.amount_usd as amount_usd
			FROM ". DB_PREFIX . "customer_provide_donation AS pd
			JOIN ". DB_PREFIX . "customer_invoice_pd inv
				ON pd.id = inv.transfer_id
			WHERE pd.id = ".$pd_id."
		");
		return $query -> row;
	}
}