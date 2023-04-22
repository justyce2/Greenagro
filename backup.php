<?php


require_once ("./includes/config.php");
require_once ("./includes/xtemplate.php");
require_once ("./includes/xpage_admin.php");
require_once ("./includes/dumper.php");
require_once ("./includes/utilities.php");
class ZPage extends XPage
{
    //--------------------------------------------------------------------------
    function ZPage ($object)
    {
        XPage::XPage ($object, false);
    }
    
    
 function ocd_list ()
    {

         $appRoot = $this->db->GetSetting ("PathSite");
        $dumper = new Dumper (DbName, $appRoot."data/backups/");
        $file_name = $dumper->backup ();
       // $this->Redirect ($this->pageUrl."?ec=backup_ok&fn=$file_name");
exit();
}
//------------------------------------------------------------------------------
}
$zPage = new ZPage ("backup");

$zPage->RunController ();
?>