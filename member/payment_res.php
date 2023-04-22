<?php

require_once ("../includes/config.php");
require_once ("../includes/xtemplate.php");
require_once ("../includes/xpage_member.php");
require_once ("../includes/utilities.php");

//------------------------------------------------------------------------------

class ZPage extends XPage
{
    //--------------------------------------------------------------------------
    function ZPage ($object)
    {
        GLOBAL $dict;
		  $this->mainTemplate = "./templates/payment_res.tpl";
        $this->pageTitle = $dict['PM_pageTitle2'];
        $this->pageHeader = $dict['PM_pageTitle2'];
        XPage::XPage ($object);
    }

    //--------------------------------------------------------------------------
    function ocd_list ()
    {
        GLOBAL $dict;
        $message = "";
        $res = $this->GetGP ("res", "");
         $SiteUrl = $this->db->GetOne("Select value From settings Where keyname='SiteUrl'");

        if ($res == "ok") $message = $dict['PM_mess5'];
        if ($res == "no") $message = $dict['PM_mess6'];
        if ($this->GetGP ("status", "") == "cancelled")  $message = $dict['PM_mess6'];
        if ($this->GetGP ("status", "") == "successful")  $message = $dict['PM_mess5'];
        $status = $this->GetGP ("status", "");
        	$tranid = $this->GetGP ("transaction_id");
        if($status == "successful"  && !empty($tranid)){
        	
        	
			$httval = $SiteUrl.'notify/flutterwave.php?status='.$status.'&transaction_id='.$tranid;
			
	file_get_contents($httval);
			
		}
        $this->data = array (
            "MAIN_HEADER" => $this->pageHeader,
            "PAYMENT_RESULT" => $message,
       );
    }
}
//------------------------------------------------------------------------------

$zPage = new ZPage ("result");

$zPage->Render ();

?>