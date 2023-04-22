<?php
require_once ("../includes/config.php");
require_once ("../includes/xpage_member.php");
require_once ("../includes/utilities.php");

//------------------------------------------------------------------------------

class ZPage extends XPage
{
    //--------------------------------------------------------------------------
    function ZPage ($object)
    {
        XPage::XPage ($object, false);
    }

    //--------------------------------------------------------------------------
    function ocd_list ()
    {
		  $adminEmail = $this->db->GetOne ("Select value From settings Where keyname='ContactEmail'");
		
		 $txn_id = $this->GetGP ("transaction_id", "") ;
		 $status1 = $this->GetGP ("status", "") ;
		 //demo secret key alway update to live
		 $secretkey =   'FLWSECK_TEST-4a324f73b647288feab926f41c148295-X';
		 
		 
		 if(!empty($txn_id) && $status1 =='successful' )
		 {
		
		$curl = curl_init();
  
curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.flutterwave.com/v3/transactions/".$txn_id."/verify",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Content-Type: application/json",
    "Authorization: Bearer FLWSECK_TEST-4a324f73b647288feab926f41c148295-X"
  ),
));


$response = curl_exec($curl);#



curl_close($curl);
    
    
   // echo($response);
  //  echo($response['status']);
    $response = json_decode($response);
    $status  = $response->status ;
   $data =    $response->data;
   $tran_id =    $data->id;
  $member_id = $data->meta->member_id;
  $item_level = $data->meta->level_id;
    $currency = $data->currency;
            $amount = $data->charged_amount;
            $product_type = $data->tx_ref;

   
            $sum = $this->db->GetOne ("Select entrance_fee From `matrixes` Where matrix_id=2");
									$processor_fee = $this->db->GetOne ("Select fee From `processors` Where code='flutterwave'", "0.00");
									$sum = $sum + $sum / 100 * $processor_fee;
									$sum = sprintf ("%01.2f", $sum);
									$count = $this->db->GetOne ("Select Count(*) From members Where member_id='$member_id'", 0);
									//$count2 = $this->db->GetOne ("Select Count(*) From payins Where transaction_id='$txn_id'", 0);
            
            if($product_type == 'Membership Fee' && $currency=='NGN'  && $amount ==$sum  && $count == 1 && $status == 'success'  ){
				
				$enroller_id = $this->db->GetOne ("Select enroller_id From `members` Where member_id='$member_id'");
										$enr_level = $this->db->GetOne ("Select m_level From `members` Where member_id='$enroller_id'");
										if ($enr_level == 0)
										{
											$new_enroller_id = $this->db->GetOne ("Select member_id From `members` Where is_active=1 And m_level>0 Order By RAND() Limit 1", 1);
											$this->db->ExecuteSql ("Update `members` Set enroller_id='$new_enroller_id' Where member_id='$member_id'");
										}

										$thisTime = time ();
										payUpline ($member_id, $tran_id, $item_level, '12');
										$subject = "Member payment report";
										$message = "Member ID=$member_id made a Flutterwave payment service";
										sendMail ($adminEmail, $subject, $message, $this->emailHeader);
				
				
			}else{
				echo 'transaction was faild';
			}
            
            
            
		}		
	}
}

//------------------------------------------------------------------------------

$zPage = new ZPage ("EgoPay");

$zPage->RunController ();

?>
