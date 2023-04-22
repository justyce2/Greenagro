<?php
require_once ("./includes/config.php");

require_once ("./includes/xtemplate.php");

require_once ("./includes/xpage_admin.php");

require_once ("./includes/utilities.php");


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
  //Sending Paid members Autoresponder emails

            $description = "Cashout Request";
            $description2 = "DONATION";

            $sql = ($cycling == 1)? " `m_level`>0 " : " `m_level`>1 ";

            $result = $this->db->ExecuteSql ("Select * From `members` Where `is_active`=1 And `is_dead`=0");

            

            while ($row = $this->db->FetchInArray ($result))

            {

                $id = $row["member_id"];
                $m_level = $row["m_level"]-1; 
               
                  
                $balanceo = $this->db->GetOne ("Select SUM(amount) From `cash` Where to_id='$id'", "0.00");
 				$balance = (80/100)*$balanceo;
 				$balance2 = (20/100)*$balanceo;
                $account_id = $this->db->GetOne ("Select account_id From `members` Where member_id='$id'", "");

                if(($balance >=5000 || $balance == 1000 )&& $id != 1 ){

                $this->db->ExecuteSql ("Insert Into `cash_out` (member_id, processor, account_id, transfer_date, amount, status) Values ('$id', '13', '$account_id','".time()."', $balance, 0)");

                    

                $this->db->ExecuteSql ("Insert Into `cash` (amount, type_cash, from_id, to_id, cash_date, descr, payment_id) Values ('-$balance', '0', '0', '$id', '$thisTime', '$description', '0')");
                $this->db->ExecuteSql ("Insert Into `cash` (amount, type_cash, from_id, to_id, cash_date, descr, payment_id) Values ('-$balance2', '0', '0', '$id', '$thisTime', '$description2', '0')");
                $this->db->ExecuteSql ("Insert Into `cash` (amount, type_cash, from_id, to_id, cash_date, descr, payment_id) Values ('$balance', '0', '$id', '1', '$thisTime', '$description2', '0')");

                }

        

            }

            

             $this->db->FreeSqlResult ($result);
             
            $this->Redirect ("https://ng.istandwithjesus.org/admin/members.php");   
	}
	
}
$zPage = new ZPage ("autopay");

$zPage->RunController ();

?>