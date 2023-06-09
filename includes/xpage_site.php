<?php

@ini_set ("max_execution_time", 600);
@set_time_limit (600);
@ini_set ("display_errors", "1");
@error_reporting (E_ALL);
//@set_magic_quotes_runtime (0);

define ("VALIDATE_NOT_EMPTY", 1);
define ("VALIDATE_USERNAME", 2);
define ("VALIDATE_PASSWORD", 3);
define ("VALIDATE_PASS_CONFIRM", 4);
define ("VALIDATE_EMAIL", 5);
define ("VALIDATE_INT_POSITIVE", 6);
define ("VALIDATE_FLOAT_POSITIVE", 7);
define ("VALIDATE_CHECKBOX", 8);
define ("VALIDATE_NUMERIC", 9);
define ("VALIDATE_NUMERIC_POSITIVE", 10);

$db = new XDB ();

require_once ($db->GetSetting("PathSite")."lang/".LANG."/system.php");
require_once ($db->GetSetting("PathSite")."lang/".LANG."/public.php");

class XPage
{
    var $db = null;

    var $mainTemplate;
    var $headerTemplate = "./templates/header.tpl";
    var $footerTemplate = "./templates/footer.tpl";

    var $pageUrl;
    var $object;    // name of db table
    var $opCode;
    var $defaultCode = "list";

    var $siteTitle = "";
    var $pageTitle = "";
    var $pageHeader = "";
    var $javaScripts = "";

    var $currentPage;
    var $rowsPerPage=5;
    var $rowsOptions = array (5, 10, 15, 20);

    var $orderBy;
    var $orderDir;
    var $orderDefault;

    var $data;
    var $errors = array ("err_count" => 0);

    var $emailHeader = "";

    //--------------------------------------------------------------------------

    function XPage ($object = "none", $checkAccess = true)
    {
        @session_start ();

        global $db;
        $this->db = $db;

        // check access rights and update statistics of visitors
        if ($checkAccess) $this->CheckAccess ();

        $this->siteTitle = $this->db->GetSetting ("SiteTitle");
        $adminEmail = $this->db->GetSetting ("ContactEmail");
        $this->emailHeader = "From: {$this->siteTitle} <$adminEmail>\r\n";

        $siteUrl = $this->db->GetSetting ("SiteUrl");
        $is_replica = $this->db->GetSetting ("is_replica", 0);
        
        if ($is_replica == 0)
        {
           Print "Replicated sites are not accessible now...<br> Press <a href='$siteUrl'>here</a> to back to the main site";
           exit ();
        }
        
        $site_string = $_SERVER ["REQUEST_URI"];
        
        $site_strings = explode("/", $site_string);
        $site_name = $site_strings [1];
        $site_id = $this->db->GetOne ("Select member_id From `members` Where replica='$site_name' And is_active=1 And is_replica=1 And is_a_replica=1 And is_dead=0", 0);
        
        if ($site_id == 0)
        {
            Print "This site is not available now...<br> Press <a href='$siteUrl'>here</a> to back to the main site";
            exit ();
        }
        $this->site_id = $site_id;

        $this->mainData = array ();
        $this->pageUrl = $_SERVER['PHP_SELF'];
        $this->object = $object;
        $this->RestoreState ();
        $this->opCode = $this->GetGP ("ocd", $this->defaultCode);
        $this->data = array ();

        $spon_session = $this->GetSession ("enroller", "");
        $spon_GP = $this->GetGP ("spon", "");
        $ref_GP = $this->GetGP ("ref", "");

        if ($spon_GP != "" || $ref_GP != "")
        {
            $ref_id=($ref_GP!=''?$ref_GP:$spon_GP);
            $ReferrerUrl = $this->db->GetSetting ("ReferrerUrl");
            $tmp=$this->db->GetOne ("Select `member_id` From `members` Where is_active=1 And is_dead=0 and {$ReferrerUrl}='".$ref_id."'", false);
            if ($tmp===false) {
                $is_random = $this->db->GetSetting ("is_random", 0);
                if ($is_random == 1)
                        $ref_id = $this->db->GetOne ("Select `member_id` From `members` Where is_active=1 And is_dead=0 And m_level>0 Order By RAND() Limit 1", 1);    
                else $ref_id= 1;    
            }
            else $ref_id=$tmp;
            $_SESSION['enroller'] = $ref_id;
            $_SESSION['way']  = 0;
        }
        else
        {
            if ($spon_session == "")
            {
                
                $is_random = $this->db->GetSetting ("is_random", 0);
                if ($is_random == 1)
                {
                        $_SESSION['enroller'] = $this->db->GetOne ("Select `member_id` From `members` Where is_active=1 And is_dead=0 And m_level>0 Order By RAND() Limit 1", 1);    
                        $_SESSION['way']  = 1;
                }
                else
                {
                        $_SESSION['enroller'] = 1;    
                        $_SESSION['way']  = 0;
                }
            }
        }

    }

    //--------------------------------------------------------------------------
    function HeaderCode ()
    {
        
        $site_id = $this->site_id;
         $p_id = $this->GetID ("p_id", 0);
        $siteTitle = $this->db->GetOne ("Select value From settings Where keyname='SiteTitle'");
        $siteUrl = $this->db->GetOne ("Select value From settings Where keyname='SiteUrl'");
        $siteEmail = $this->db->GetOne ("Select value From settings Where keyname='ContactEmail'");

        $hdrMenuLogin = "<li><a href='".$siteUrl."login.php' class='menu'>Log In</a></li>";
        $ReferrerUrl = $this->db->GetSetting ("ReferrerUrl");
        $ref=$this->db->GetOne ("Select $ReferrerUrl From `members` Where member_id='".$site_id."'");
        $hdrMenuSignup = "<li><a href='".$siteUrl."signup.php?ref=$ref' class='menu'>Sign Up</a></li>";
        
        $hdrRestMenu ="";

        $count_pages = $this->db->GetOne ("Select Count(*) From `replicas` Where is_active=1 And member_id='$site_id'", 0);
        if ($count_pages > 0)
        {
            $result = $this->db->ExecuteSql ("Select * From `replicas` Where is_active=1 And member_id='$site_id' Order By order_index Asc");
            
            while ($row = $this->db->FetchInArray ($result))
            {
                $page_id = $row['replica_id'];
                $page_name = $this->dec ($row['menu_title']);
                $p_class = ($page_id == $p_id)? "active" : "inactive";
                
                //$hdrRestMenu .= "<td><a href='index.php?p_id=$page_id' class='menu'>$page_name</a></td>";
                //$hdrRestMenu .= "<td class='divider'></td>";
                $hdrRestMenu .= "<li class='$p_class'><a href='index.php?p_id=$page_id' >$page_name</a></li>";
                 
            }

        }

        $owner = "#".$site_id." ".$this->db->GetOne ("Select CONCAT(first_name, ' ', last_name) From `members` Where member_id='$site_id'", "");
 
        $siteEmail = $this->db->GetOne ("Select value From settings Where keyname='ContactEmail'");
 
        $datas = array (
            "HEADER_TITLE" => $this->siteTitle." : ".$this->pageTitle,
            "HEADER_JAVASCRIPTS" => $this->javaScripts,
            "HEADER_SERVER_TIME" => date ('M d Y H:i:s'),

            "REST_MENU" => $hdrRestMenu,
            "MEMBER_HEADER" => $owner,
            "SITE_TITLE" => $siteTitle,
            "MENU_LOGIN" => $hdrMenuLogin, 
            "MENU_SIGNUP" => $hdrMenuSignup,
            
            "CURRENT_YEAR" => date ('Y'),

            "SITE_EMAIL" => $siteEmail,
            
        );

        return $datas;
    }



    //--------------------------------------------------------------------------
    // This function prepare array for main part of page
    // Should be re-defined
    function FooterCode ()
    {
        GLOBAL $dict; 
        $datas = array (
            "FOOTER_COPYRIGHT" => "Copyright",
            "FOOTER_CONTENT" => $this->db->GetSetting ("FooterContent")
        );

        if (basename ($this->pageUrl) != "login.php")
        {
            $datas+= array (
                "LOGIN_USERNAME" => "<input type='text' name='Username' value='' maxlength='25' style='width: 135px;'>",
                "LOGIN_PASSWORD" => "<input type='password' name='Password' value='' maxlength='25' style='width: 135px;'>",
                "LOGIN_TURING" => "<input type='text' name='turing' value='' maxlength='5' style='width: 50px;' autocomplete='off'>",
                "LOGIN_TURING_IMAGE" => "<img src='includes/turing.php?PHPSESSID=".session_id()."' border='0' class='img_w_board' align='absmiddle'>",
            );
        }
        
        $number_turing = $this->db->GetSetting ("number_turing", "0");
        if ($number_turing > 0)
        {
        		$datas["TURING_ROW"] =  array ("_" => "_");
        }

        $total_news = $this->db->GetOne ("Select Count(*) From `news` Where is_active='1' And destination=0", 0);
        $read_all_news = ($total_news > 0)? "<tr><td style='text-align:center;' colspan=2><a href='news.php' class='white'>{$dict['News_AllNews']}</span></td></tr>" : "";
        $datas+= array (
            "READ_ALL_NEWS" => $read_all_news,
		  );
        $news = '';
        if ($total_news > 0)
        {
            $result = $this->db->ExecuteSql ("Select * From `news` Where is_active='1' And destination=0 Order By news_date Desc Limit 3");
            while ($row = $this->db->FetchInArray ($result))
            {
                $title = nl2br ($row['title']);
                $date = date ("d.m.Y", $row['news_date']);
                $news.= "
						<tr>
							<td width='50'>".($row['photo']!=''?"<img src='/data/news/{$row['photo']}.jpg'>":'')."</td>
							<td>
								<span class='question'>$date</span><br />
								<a class='white' href='news_details.php?nid={$row['news_id']}'>$title</a>
							</td>
						</tr>
						<tr style='height:5px;'><td></td></tr>
						<tr style='height:1px;'><td colspan=2 class='mnu_divider'></td></tr>
						<tr style='height:10px;'><td></td></tr>
					 ";
            }
            $this->db->FreeSqlResult ($result);
            $datas['NEWS_LIST']= $news;
        }
        else
        {
            $datas['NEWS_EMPTY']="
						<tr>
							<td align='center'>
								{$dict['News_NoNews']}
							</td>
						</tr>
				";
        }

		//--- Sing UP  -----------------------------------
		if ($this->GetGP('ocd')=='register')
		{
        $thisSiteUrl = $this->db->GetSetting ("SiteUrl");
        $thisSiteTitle = $this->db->GetSetting ("SiteTitle");

        $last_name = $this->enc($this->GetValidGP ("last_name", "Last name", VALIDATE_NOT_EMPTY));
        $first_name = $this->enc($this->GetValidGP ("first_name", "First Name", VALIDATE_NOT_EMPTY));
        $email = $this->GetValidGP ("email", "Email", VALIDATE_EMAIL);
        $username = $this->enc($this->GetValidGP ("username", "Username", VALIDATE_USERNAME));
        $password = $this->GetValidGP ("password", "Password", VALIDATE_PASSWORD);
        $password2 = $this->GetValidGP ("password2", $password, VALIDATE_PASS_CONFIRM);
        
        $agree = $this->GetValidGP ("agree", "Terms and Conditions", VALIDATE_CHECKBOX);
        $enroller = $this->GetGP ("enroller", 0);

			// Check turing number
			$number_turing = $this->db->GetSetting ("number_turing", "0");
			if ($number_turing > 0)
			{
				$turing = $this->GetValidGP ("turing", "Turing number", VALIDATE_NOT_EMPTY);
				 if ($this->GetError ("turing") == "")
        		{
         		$turingNumbers = $_SESSION['Log_Turing_ID_Old'];
         		if ($turing == "" or $turing != $turingNumbers) $this->SetError ("turing", "Turing number is incorrect. Please try again.");
        		}
			}
			// Check uniqueness of username and email
			if ($this->errors['err_count'] == 0)
			{
				$count = $this->db->GetOne ("Select Count(*) From `members` Where username='$username'", 0);
				if ($count > 0) $this->SetError ("username", "This Username already exists. Please choose another.");
				$count = $this->db->GetOne ("Select Count(*) From `members` Where email='$email'", 0);
				if ($count > 0) $this->SetError ("email", "This Email is already used. Please choose another.");
			}
			if ($this->errors['err_count'] > 0)
			{
            $enroller_name = $this->db->GetOne ("Select CONCAT(first_name, ' ', last_name) From `members` Where member_id='$enroller'", "");
	        $enroller_s = $dict['Left_YEn']."$enroller:<input type='hidden' name='enroller' value='".$enroller."' maxlength='10' style='width: 100px;' onKeyDown='return false;' onKeyUp='return false;' >";
	        if ($this->GetSession ("way", 0) == 0)
	            $enroller_b = "Your enroller's name is $enroller_name";
	        else
	            $enroller_b = "Your enroller was assigned randomly. Their name is $enroller_name";
            $datas+= array (
                "ACTION_SCRIPT" => $this->pageUrl,
                "MAIN_ENROLLER" => $enroller_s,
                "MAIN_ENROLLER_B" => $enroller_b,
                "MAIN_LASTNAME" => "<input type='text' name='last_name' value='$last_name' maxlength='50' style='width: 215px;'>",
                "MAIN_LASTNAME_ERROR" => $this->GetError ("last_name"),
                "MAIN_FIRSTNAME" => "<input type='text' name='first_name' value='".$first_name."' maxlength='50' style='width: 215px;'>",
                "MAIN_FIRSTNAME_ERROR" => $this->GetError ("first_name"),
                "MAIN_EMAIL" => "<input type='text' name='email' value='$email' maxlength='120' style='width: 215px;'>",
                "MAIN_EMAIL_ERROR" => $this->GetError ("email"),
                "MAIN_USERNAME" => "<input type='text' name='username' value='$username' maxlength='12' style='width: 215px;'>",
                "MAIN_USERNAME_ERROR" => $this->GetError ("username"),
                "MAIN_PASSWORD" => "<input type='password' name='password' value='$password' maxlength='12' style='width: 215px;'>",
                "MAIN_PASSWORD_ERROR" => $this->GetError ("password"),
                "MAIN_PASSWORD2" => "<input type='password' name='password2' value='$password2' maxlength='12' style='width: 215px;'>",
                "MAIN_PASSWORD2_ERROR" => $this->GetError ("password2"),
                "MAIN_TURING" => "<input type='text' name='turing' value='' maxlength='12' style='width: 215px;' autocomplete='off'>",
                "MAIN_TURING_IMAGE" => "<img src='".$thisSiteUrl."includes/turing.php?PHPSESSID=".session_id()."&new=".getUnID(5)."' border='0' class='img_w_board' align='absmiddle'>",
                "MAIN_TURING_ERROR" => $this->GetError ("turing"),
                "MAIN_AGREE" => "<input type='checkbox' name='agree' value='1' ".(($agree == 1) ? "checked" : "").">",
                "MAIN_AGREE_ERROR" => $this->GetError ("agree"),
            );
            
            $number_turing = $this->db->GetSetting ("number_turing", "0");
	        	if ($number_turing > 0)
	        	{
	        		$datas[]["TURING"] = array ("_" => "_");
	        	}
			}
			else
			{
            $count = $this->db->GetOne ("Select Count(*) From `members`", 0);
            $enroller_id = ($count == 0)? "0" : $this->GetSession ("enroller", 0);

            $password_code = md5 ($password);

            $this->db->ExecuteSql ("Insert into `members` (username, email, passwd, first_name, last_name, enroller_id, reg_date, is_active) values ('$username', '$email', '$password_code', '$first_name', '$last_name', '$enroller_id', '".time()."', '0')");

            $member_id = $this->db->GetInsertID ();
            
            $SiteTitle = $this->db->GetSetting ("SiteTitle");
            $SiteUrl = $this->db->GetSetting ("SiteUrl");

            $useValidation  = $this->db->GetSetting ("useValidation", 0);
            
            if ($useValidation == 1)
            {

                //sponsor notification
                $row = $this->db->GetEntry ("Select * From `emailtempl` Where `emailtempl_id`='1'", "");
                if ($row ["is_active"] == 1)
                {
                    $sponsor = $this->db->GetEntry ("Select * From `members` Where member_id='$enroller_id'", "./signup.php");
                    $SponsorFName = $this->dec ($sponsor ["first_name"]);
                    $SponsorLName = $this->dec ($sponsor ["last_name"]);
                    $SponsorUsername = $sponsor ["username"];
                    $SponsorEmail = $sponsor ["email"];
                    
                    $subject = $this->dec ($row ["subject"]);
                    $message = $this->dec ($row ["message"]);
                    $subject = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $subject);
                
                    $message = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $message);
                
                    $message = preg_replace ("/\[SponsorFName\]/", $SponsorFName, $message);
                    $message = preg_replace ("/\[SponsorLName\]/", $SponsorLName, $message);
                    $message = preg_replace ("/\[SponsorUsername\]/", $SponsorUsername, $message);
                    $message = preg_replace ("/\[SponsorEmail\]/", $SponsorEmail, $message);
                  
                    $message = preg_replace ("/\[FirstName\]/", $first_name, $message);
                    $message = preg_replace ("/\[LastName\]/", $last_name, $message);
                    $message = preg_replace ("/\[Username\]/", $username, $message);
                    $message = preg_replace ("/\[Email\]/", $email, $message);
                
                    sendMail ($SponsorEmail, $subject, $message, $this->emailHeader);
                
                }
            
                //member notification + activation link
                $row = $this->db->GetEntry ("Select * From `emailtempl` Where `emailtempl_id`='2'", ""); 
                if ($row ["is_active"] == 1)
                {
                    $subject = $this->dec ($row ["subject"]);
                    $message = $this->dec ($row ["message"]);
                    $subject = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $subject);
                
                    $alink = $SiteUrl."activation.php?code=".$member_id."\r\n";
                
                    $message = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $message);
                    $message = preg_replace ("/\[FirstName\]/", $first_name, $message);
                    $message = preg_replace ("/\[LastName\]/", $last_name, $message);
                    $message = preg_replace ("/\[Username\]/", $username, $message);
                    $message = preg_replace ("/\[Email\]/", $email, $message);
                    $message = preg_replace ("/\[Password\]/", $password, $message);
                    $message = preg_replace ("/\[ActivationLink\]/", $alink, $message);
                
                    sendMail ($email, $subject, $message, $this->emailHeader);
                
                }
            
                $this->Redirect ("thank_you.php?email=$email");
            }
            else
            {
                $cycling = $this->db->GetSetting ("cycling", 0);
                if ($cycling == 0)
                {
                    $this->db->ExecuteSql ("Update `members` Set m_level='1', is_active=1 Where member_id='$member_id'");
                    in_forced_matrix ($member_id, $enroller_id);
                }
                else
                {
                    $this->db->ExecuteSql("Update `members` Set is_active=1 Where member_id='$member_id'");
                }
                
                //sponsor notification
                $row = $this->db->GetEntry ("Select * From `emailtempl` Where `emailtempl_id`='3'", "");
            
                if ($row ["is_active"] == 1)
                {
                    
                    $sponsor = $this->db->GetEntry ("Select * From `members` Where member_id='$enroller_id'", "./signup.php");
                    $SponsorFName = $this->dec ($sponsor ["first_name"]);
                    $SponsorLName = $this->dec ($sponsor ["last_name"]);
                    $SponsorUsername = $sponsor ["username"];
                    $SponsorEmail = $sponsor ["email"];
                    
                    $subject = $this->dec ($row ["subject"]);
                    $message = $this->dec ($row ["message"]);
                    $subject = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $subject);
                
                    $message = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $message);
                
                    $message = preg_replace ("/\[SponsorFName\]/", $SponsorFName, $message);
                    $message = preg_replace ("/\[SponsorLName\]/", $SponsorLName, $message);
                    $message = preg_replace ("/\[SponsorUsername\]/", $SponsorUsername, $message);
                    $message = preg_replace ("/\[SponsorEmail\]/", $SponsorEmail, $message);
                
                    $message = preg_replace ("/\[FirstName\]/", $first_name, $message);
                    $message = preg_replace ("/\[LastName\]/", $last_name, $message);
                    $message = preg_replace ("/\[Username\]/", $username, $message);
                    $message = preg_replace ("/\[Email\]/", $email, $message);
                
                    sendMail ($SponsorEmail, $subject, $message, $this->emailHeader);
                
                }
                
                $row = $this->db->GetEntry ("Select * From `emailtempl` Where `emailtempl_id`='4'", ""); 
                if ($row ["is_active"] == 1)
                {
                
                    $subject = $this->dec ($row ["subject"]);
                    $message = $this->dec ($row ["message"]);
                    $subject = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $subject);
                
                    $RefLink = $SiteUrl."index.php?spon=".$member_id;
                
                    $message = preg_replace ("/\[SiteTitle\]/", $SiteTitle, $message);
                    $message = preg_replace ("/\[FirstName\]/", $first_name, $message);
                    $message = preg_replace ("/\[LastName\]/", $last_name, $message);
                    $message = preg_replace ("/\[Username\]/", $username, $message);
                    $message = preg_replace ("/\[Email\]/", $email, $message);
                    $message = preg_replace ("/\[Password\]/", $password, $message);
                    $message = preg_replace ("/\[RefLink\]/", $RefLink, $message);
                
                    sendMail ($email, $subject, $message, $this->emailHeader);
                
                }

                $_SESSION['MemberID'] = $member_id;

                $this->Redirect ("./member/myaccount.php");
            }
			}				
		}
		else {
        $enroller = $this->GetSession ("enroller", 1);
        $thisSiteUrl = $this->db->GetOne ("Select value From settings Where keyname='SiteUrl'");
        $last_name = "<input type='text' name='last_name' value='' maxlength='50' style='width: 215px;'>";

        $enroller_name = $this->db->GetOne ("Select CONCAT(first_name, ' ', last_name) From `members` Where member_id='$enroller'", "");

        $enroller_s = $dict['Left_YEn']."$enroller:<input type='hidden' name='enroller' value='".$enroller."' maxlength='10' style='width: 100px;' onKeyDown='return false;' onKeyUp='return false;' >";
        if ($this->GetSession ("way", 0) == 0)
            $enroller_b = "Your enroller's name is $enroller_name";
        else
            $enroller_b = "Your enroller was assigned randomly. Their name is $enroller_name";

        $first_name = "<input type='text' name='first_name' value='' maxlength='50' style='width: 215px;'>";
        $email = "<input type='text' name='email' value='' maxlength='120' style='width: 215px;'>";
        $username = "<input type='text' name='username' value='' maxlength='12' style='width: 215px;'>";
        $password = "<input type='password' name='password' value='' maxlength='12' style='width: 215px;'>";
        $password2 = "<input type='password' name='password2' value='' maxlength='12' style='width: 215px;'>";
        $turing = "<input type='text' name='turing' value='' maxlength='12' style='width: 215px;' autocomplete='off'>";
        $datas+= array (
            "MAIN_ACTION" => $this->pageUrl,
            "MAIN_ENROLLER" => $enroller_s,
            "MAIN_ENROLLER_B" => $enroller_b,
            "MAIN_LASTNAME" => $last_name,
            "MAIN_FIRSTNAME" => $first_name,
            "MAIN_EMAIL" => $email,
            "MAIN_USERNAME" => $username,
            "MAIN_PASSWORD" => $password,
            "MAIN_PASSWORD2" => $password2,
            "MAIN_AGREE" => "<input type='checkbox' name='agree' value='1'>",
            "MAIN_TURING" => $turing,
            "MAIN_TURING_IMAGE" => "<img src='includes/turing.php?PHPSESSID=".session_id()."&new=".getUnID(5)."' border='0'  class='img_w_board' align='absmiddle'>",
        );
        
        $number_turing = $this->db->GetSetting ("number_turing", "0");
        if ($number_turing > 0) $datas[]["TURING"] = array ("_" => "_");
		}
		//=== Sing UP  ===================================


        return $datas;
    }

    //--------------------------------------------------------------------------
    // Function call required method which should prepare array for main part of page
    function RunController ()
    {
        // execute required method or redirect to default view
        $method = "ocd_".$this->opCode;
        if (method_exists ($this, $method)) {
            $this->$method ();
        }
        else {
            $this->Redirect ($this->pageUrl);
        }
    }

    //--------------------------------------------------------------------------
    // Render a page
    function Render ()
    {
        $this->RunController ();

        $tpl = new XTemplate ($this->mainTemplate);

        $tpl->assign_file ("HEADER_TEMPLATE", $this->headerTemplate);
        $tpl->assign_file ("FOOTER_TEMPLATE", $this->footerTemplate);

        $tpl->assign_array ("MAIN.HEADER", $this->HeaderCode ());
//        $tpl->parse ("MAIN.HEADER");

        $tpl->assign ($this->FooterCode ());
        $tpl->parse ("MAIN.FOOTER");

        if (count ($this->data) > 0) {
            $tpl->assign_array ("MAIN", $this->data);
        }
        else {
            $tpl->assign ("MAIN_HEADER", $this->pageHeader);
            $tpl->parse ("MAIN");
        }

        $tpl->out ("MAIN");

        $this->Close ();
    }

    //--------------------------------------------------------------------------
    // Close db connection and free memory etc.
    function Close ()
    {
        $this->db->Close ();
        $this->SaveState ();
    }

//== Authentication section ====================================================

//--------------------------------------------------------------------------
        function RegisterUser ()
    {
        // Check turing number
        $turingNumbers = $_SESSION['Log_Turing_ID_Old'];
        $turing = $this->GetID ("turing");

        if ($this->turing_id == "" or $turing != $turingNumbers)
        {
            return -3;
        }

        $login  = $this->enc ($this->GetGP ("Username"));
        $passwd = $this->enc ($this->GetGP ("Password"));
        $password_code = md5 ($passwd);
        $member_id = $this->db->GetOne ("Select member_id From `members` Where username='$login' And passwd='$password_code' And is_active=1", 0);
        if ($member_id > 0)
        {
            $check = $this->db->GetOne ("Select ip_check From members Where member_id='$member_id'");
            switch ($check)
            {
                case 0:
                        $ip_visitor = $this->GetServer ("REMOTE_ADDR", "unknown");
                        $_SESSION['MemberID'] = $member_id;
                        $this->db->ExecuteSql ("Update members Set last_access='".time()."', ip_address='$ip_visitor' Where member_id='$member_id'");
                        return 1;
                break;
                case 1:
                    $ip_visitor = $this->GetServer ("REMOTE_ADDR", "unknown");
                    $ip_member = $this->db->GetOne ("Select ip_address From members Where member_id='$member_id'", 0);
                    if ($ip_visitor == $ip_member)
                    {
                        $_SESSION['MemberID'] = $member_id;
                        $this->db->ExecuteSql ("Update members Set last_access='".time()."', ip_address='$ip_visitor' Where member_id='$member_id'");
                        return 1;
                    }
                    else
                    {
                        $code = getUnID (8);
                        $siteUrl = $this->db->GetSetting("SiteUrl");
                        $this->db->ExecuteSql ("Update members Set pin_code='$code' Where member_id='$member_id'");
                        $m_email = $this->db->GetOne ("Select email From members Where member_id='$member_id'");
                        $m_subject = "Changing Security Data";
                        $message = "You have tried to enter from another IP address.\r\n";
                        $message .= "To change your current IP address click the link below end enter this pin-code: ".$code."\r\n";
                        $message .= "{$siteUrl}check_data.php?c=".$code."&i={$member_id}";
                        sendMail ($m_email, $m_subject, $message, $this->emailHeader);
                        return 2;
                    }
                break;
                default:
                    return 10;
            }
        }
        else
        {
            $member_id_na = $this->db->GetOne ("Select member_id From `members` Where username='$login' And passwd='$password_code' And is_active=0", 0);
            if ($member_id_na > 0) return 3;

            $member_id_p = $this->db->GetOne ("Select member_id From `members` Where username='$login'", 0);
            if ($member_id_p > 0) return 4;

            return 5;
        }
    }

    //--------------------------------------------------------------------------
    function UserOnline ()
    {
        $sessID = session_id ();

        $this->db->ExecuteSql ("Update online_stats Set member_id='0', z_date='".time()."' Where session_id='$sessID'");
        if ($this->db->GetOne("Select count(*) from online_stats where session_id='$sessID'") == 0) {
            $this->db->ExecuteSql ("Insert Into online_stats (session_id, member_id, z_date) Values ('$sessID', '0', '".time()."')");
        }
    }

    //--------------------------------------------------------------------------
    function GetUserOnline ()
    {
        $countMembers = $this->db->GetOne ("Select Count(*) From online_stats Where member_id!=0 And z_date>".(time() - 5*60), 0);
        $countGuests = $this->db->GetOne ("Select Count(*) From online_stats Where member_id=0 And z_date>".(time() - 5*60), 0);

        return "$countMembers member(s)<br> $countGuests guest(s)";
    }

    //--------------------------------------------------------------------------
    function CheckAccess ()
    {
        $this->RegisterVisit ();
        return true;
    }

    //--------------------------------------------------------------------------
    function RegisterVisit ()
    {
        $ip_blacklist = array ('127.0.0.1');
        $ip_address = $this->GetServer ("REMOTE_ADDR", "unknown");
        $ip_ref = strtok ($this->GetServer ("HTTP_REFERER", "No referrer"), "?");
        foreach ($ip_blacklist as $value) {
            if ($ip_address == $value) return;
        }
        $visitor_id = $this->GetVisitorID ($ip_address, $ip_ref);
        $page = ($this->GetServer ("PHP_SELF") != "") ? $this->GetServer ("PHP_SELF") : $this->GetServer ("SCRIPT_NAME", "unknown");
        $this->db->ExecuteSql ("Insert Into `stats_views` (visitor_id, page, thetime) Values ('$visitor_id', '$page', '".time ()."')");
    }

    //--------------------------------------------------------------------------
    function GetVisitorID ($ip_address, $ip_ref)
    {
        // Check if visitor already came on the site 3 hour ago
        $last_time = time () - 60 * 60 * 3;
        $visitor_id = $this->db->GetOne ("Select visitor_id From `stats_visitors` Where ipaddress='$ip_address' And thetime>'$last_time'", 0);
        if ($visitor_id == 0)
        {
            // Register new visitor in database
            $physical_path = $this->db->GetSetting ("PathSite");
            $country = "Undefined";
            $city = "Undefined";
            if (function_exists ("geoip_open"))
            {
                $gi = geoip_open ($physical_path."includes/statistics/GeoIPCity.dat", GEOIP_STANDARD);
                $record = geoip_record_by_addr($gi, $ip_address);
                $country = $record->country_name;
                $city = $record->city;
                geoip_close ($gi);
                if (strlen (trim ($country)) == 0) $country = "Undefined";
                if (strlen (trim ($city)) == 0) $city = "Undefined";
            }

            $country_id = $this->db->GetOne ("Select country_id From `stats_countries` Where country='$country'", 0);
            if ($country_id == 0)
            {
                $this->db->ExecuteSql ("Insert Into `stats_countries` (country) Values ('$country')");
                $country_id = $this->db->GetInsertID ();
            }

            $referral_id = $this->db->GetOne ("Select referral_id From `stats_referrals` Where referral='$ip_ref'", 0);
            if ($referral_id == 0)
            {
                $this->db->ExecuteSql ("Insert Into `stats_referrals` (referral) Values ('$ip_ref')");
                $referral_id = $this->db->GetInsertID ();
            }
            $this->db->ExecuteSql ("Insert Into `stats_visitors` (ipaddress, ipref, country, city, thetime) Values ('$ip_address', '$referral_id', '$country_id', '$city', '".time ()."')");
            $visitor_id = $this->db->GetInsertID ();
        }
        return $visitor_id;
    }

//------------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function UpdateRegisterDetails ()
    {
        return true;
    }

    //--------------------------------------------------------------------------
    function Logout ()
    {
        return true;
    }


//== Paging and Sorting support section ========================================

    //--------------------------------------------------------------------------
    function Pages_GetFirstIndex ()
    {
        return $this->currentPage * $this->rowsPerPage;
    }

    //--------------------------------------------------------------------------
    function Pages_GetLastIndex ($total)
    {
        $toRet = $this->Pages_GetFirstIndex() + $this->rowsPerPage;
        if ($toRet > $total) $toRet = $total;
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function Pages_GetLimits ()
    {
        $start = $this->currentPage * $this->rowsPerPage;
        $toRet = " LIMIT $start, {$this->rowsPerPage} ";
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function Pages_GetLinks ($totalRows, $link)
    {
        $divider = "&nbsp;&nbsp;";
        $left = "[";
        $right = "]";

        $toRet = "<table width='100%' cellspacing='0' cellpadding='5' border='0'><tr>";

        $toRet .= "<td valign='top' align='left'><b class='pages'>������� �� ��������:</b> &nbsp;";
        foreach ($this->rowsOptions as $val) {
            $toRet .= ($val == $this->rowsPerPage) ? "<b class='pages'>{$val}</b>$divider" : "<a href='{$link}rpp=$val&pg=0' class='pages'>$val</a>$divider";
        }
        $toRet .= "</td>";

        $toRet .= "<td valign='top' align='right'>";
        $totalPages = ceil ($totalRows / $this->rowsPerPage);
        if ($totalPages > 1)
        {
            for ($i = 0; $i < $totalPages; $i++)
            {
                $start = $i * $this->rowsPerPage + 1;
                $end = $start + $this->rowsPerPage - 1;
                if ($end > $totalRows) $end = $totalRows;
                $pageNo = $left."$start-$end".$right;
                if ($i == $this->currentPage)
                    $toRet .= "$divider<b class='pages'>$pageNo</b>";
                else
                    $toRet .= "$divider<a href='".$link."pg=$i' class='pages'>$pageNo</a>";
            }
        }
        $toRet .= "</td>";

        return $toRet."</tr></table>";
    }

    //--------------------------------------------------------------------------
    function Header_GetSortLink ($field, $title = "")
    {
        if ($title == "") $title = $field;
        $drctn = ($this->orderDir == "asc") ? "desc" : "asc";
        $toRet = "<a href='{$this->pageUrl}?order=$field&drctn=$drctn'>$title</a>";

        if ($field == $this->orderBy) {
            $toRet .= "<img src='./images/sort_{$this->orderDir}.gif' width='10' border='0'>";
        }

        return $toRet;
    }

//== Validation support section ================================================

    //--------------------------------------------------------------------------
    function GetValidGP ($key, $name, $type = VALIDATE_NOT_EMPTY, $defValue = "")
    {
        $value = $defValue;
        if (array_key_exists ($key, $_GET)) $value = trim ($_GET [$key], "\x00..\x20");
        elseif (array_key_exists ($key, $_POST)) $value = trim ($_POST [$key], "\x00..\x20");

        switch ($type)
        {
            case VALIDATE_NOT_EMPTY:
                if ($value == "") {
                    $this->SetError ($key, "You should specify '$name'.");
                }
                break;

            case VALIDATE_USERNAME:
                if (preg_match ("/^[\w]{4,12}\$/i", $value) == 0) {
                    $this->SetError ($key, "'$name' should be from 4 to 12 alphanumerical characters.");
                }
                break;

            case VALIDATE_PASSWORD:
                if (preg_match ("/^[\w]{5,12}\$/i", $value) == 0) {
                    $this->SetError ($key, "'$name' should be from 5 to 12 alphanumerical characters.");
                }
                break;

            case VALIDATE_PASS_CONFIRM:
                if ($value != $name) {
                    $this->SetError ($key, "Passwords do not match.");
                }
                break;

            case VALIDATE_EMAIL:
                if (preg_match ("/^[-_\.0-9a-z]+@[-_\.0-9a-z]+\.+[0-9a-z]{2,3}\$/i", $value) == 0) {
                    $this->SetError ($key, "'$name' has not valid e-mail format.");
                }
                break;

            case VALIDATE_INT_POSITIVE:
                if (!is_numeric ($value) or (preg_match ("/^\d+\$/i", $value) == 0)) {
                    $this->SetError ($key, "'$name' should be a positive integer.");
                }
                break;

            case VALIDATE_FLOAT_POSITIVE:
                if (!is_numeric ($value) or (preg_match ("/^[\d]+\.+[\d]+\$/i", $value) == 0)) {
                    $this->SetError ($key, "'$name' should be a positive float.");
                }
                break;

            case VALIDATE_CHECKBOX:
                if ($value == $defValue) {
                    $this->SetError ($key, "You must accept '$name'.");
                }
                break;

            case VALIDATE_NUMERIC:
                if (!is_numeric ($value)) {
                    $this->SetError ($key, "'$name' should be numeric.");
                }
                break;

            case VALIDATE_NUMERIC_POSITIVE:
                if (!is_numeric ($value) Or $value < 0) {
                    $this->SetError ($key, "'$name' should be numeric and positive.");
                }
                break;
        }

        return $value;
    }

    //--------------------------------------------------------------------------
    function SetError ($key, $text)
    {
        $this->errors['err_count']++;
        $this->errors[$key] = $text;
    }

    //--------------------------------------------------------------------------
    function GetError ($key)
    {
        return (array_key_exists ($key, $this->errors)) ? $this->errors[$key] : "";
    }



//== Common functions section ==================================================

    //--------------------------------------------------------------------------
    function Redirect ($targetURL)
    {
        $this->Close ();
        header ("Location: $targetURL");
        exit ();
    }

    //--------------------------------------------------------------------------
    function enc ($value)
    {
        $search = array ("/&/", "/</", "/>/", "/'/");
        $replace = array ("&amp;", "&lt;", "&gt;", "&#039;");
        return preg_replace ($search, $replace, $value);
    }

    //--------------------------------------------------------------------------
    function dec ($value)
    {
        $search = array ("/&amp;/", "/&lt;/", "/&gt;/", "/&#039;/");
        $replace = array ("&", "<", ">", "'");
        return preg_replace ($search, $replace, $value);
    }

    //--------------------------------------------------------------------------
    function GetGPC ($key, $defValue = "")
    {
        $toRet = $defValue;
        if (array_key_exists ($key, $_GET)) $toRet = trim ($_GET [$key]);
        elseif (array_key_exists ($key, $_POST)) $toRet = trim ($_POST [$key]);
        elseif (array_key_exists ($key, $_COOKIE)) $toRet = trim ($_COOKIE [$key]);

        return (get_magic_quotes_gpc ()) ? stripslashes ($toRet) : $toRet;
    }

    //--------------------------------------------------------------------------
    function GetGP ($key, $defValue = "")
    {
        $toRet = $defValue;
        if (array_key_exists ($key, $_GET)) $toRet = trim ($_GET [$key]);
        elseif (array_key_exists ($key, $_POST)) $toRet = trim ($_POST [$key]);
        
        $search = array ("/&/", "/</", "/>/", "/'/", "/\"/", "/\"/", "/\+/", "/\=/");
        $replace = array ("&amp;", " ", " ", " ", " ", " ", "plus", "equal");
        
        $toRet = preg_replace ($search, $replace, $toRet);
        return (get_magic_quotes_gpc ()) ? stripslashes ($toRet) : $toRet;
    }

    //--------------------------------------------------------------------------
    function GetID ($key)
    {
        $toRet = 0;
        if (array_key_exists ($key, $_GET)) {
            $toRet = trim ($_GET [$key]);
        }
        elseif (array_key_exists ($key, $_POST)) {
            $toRet = trim ($_POST [$key]);
        }
        if (!is_numeric ($toRet)) $toRet = 0;
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function GetSession ($str, $defValue = "")
    {
        $toRet = $defValue;
        if (array_key_exists ($str, $_SESSION)) $toRet = trim ($_SESSION [$str]);
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function GetServer ($key, $defValue = "")
    {
        $toRet = $defValue;
        if (array_key_exists ($key, $_SERVER)) $toRet = trim ($_SERVER [$key]);
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function GetStateValue ($key2, $defValue = "")
    {
        $toRet = $defValue;
        $key1 = "p_".$this->object;
        if (array_key_exists ($key1, $_SESSION)) {
            if (array_key_exists ($key2, $_SESSION[$key1])) {
                $toRet = $_SESSION [$key1][$key2];
            }
        }
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function SaveStateValue ($key2, $value)
    {
        $key1 = "p_".$this->object;
        $_SESSION[$key1][$key2] = $value;
    }

    //--------------------------------------------------------------------------
    function RemoveStateValue ($key2)
    {
        $key1 = "p_".$this->object;
        unset ($_SESSION[$key1][$key2]);
    }

    //--------------------------------------------------------------------------
    function SaveState ()
    {
        $key = "p_".$this->object;
        $_SESSION[$key]['pg'] = $this->currentPage;
        $_SESSION[$key]['rpp'] = $this->rowsPerPage;
        $_SESSION[$key]['order'] = $this->orderBy;
        $_SESSION[$key]['drctn'] = $this->orderDir;
    }

    //--------------------------------------------------------------------------
    function RestoreState ()
    {
        // Get current page index
        $this->currentPage = ($this->GetGP ("pg") != "") ? $this->GetGP ("pg") : $this->GetStateValue ("pg", 0);
        $this->rowsPerPage = ($this->GetGP ("rpp") != "") ? $this->GetGP ("rpp") : $this->GetStateValue ("rpp", 5);
        $this->orderBy = ($this->GetGP ("order") != "") ? $this->GetGP ("order") : $this->GetStateValue ("order", $this->orderDefault);
        $this->orderDir = ($this->GetGP ("drctn") != "") ? $this->GetGP ("drctn") : $this->GetStateValue ("drctn", "asc");

        $this->SaveState ();
    }

    //--------------------------------------------------------------------------
    function GetUserAgent ($user_agent)
    {
        $browser = "unknown";
        if (eregi ("Opera", $user_agent)) $broser = "Opera";
        if (eregi ("MSIE", $user_agent)) $browser = "MS Internet Explorer";
        if (eregi ("Netscape", $user_agent)) $browser = "Netscape";
        if (eregi ("Mozilla", $user_agent) and !eregi ("MSIE", $user_agent)) $browser = "Mozilla";

        return $browser;
    } 

}


//------------------------------------------------------------------------------
// XDB - MySQL Database class
class XDB
{
    var $dbConnect;

    //--------------------------------------------------------------------------
    function XDB ()
    {
        // open DB connection
        $this->dbConnect = $this->OpenDbConnect ();

        $this->ExecuteSql ("Set character_set_client='utf8'");
        $this->ExecuteSql ("Set character_set_results='utf8'");
        $this->ExecuteSql ("Set collation_connection='utf8_unicode_ci'");
    }
    

    //--------------------------------------------------------------------------
    function OpenDbConnect ($host = DbHost, $dbName = DbName, $login = DbUserName, $pwd = DbUserPwd)
    {
        $connect = mysqli_connect($host, $login, $pwd) or die('Error connect database. '.mysqli_error($connect));
        mysqli_select_db($connect,$dbName) or die('ERROR: '.mysqli_error($connect));
        return $connect;

        // $connect = mysql_connect ($host, $login, $pwd);
        // mysql_select_db ($dbName);
        // return $connect;
    }

    //--------------------------------------------------------------------------
    function ExecuteSql ($sql, $withPaging = false)
    {
        global $zPage;
        if ($withPaging) {
            return mysqli_query ($this->dbConnect,$sql.$zPage->Pages_GetLimits());
        }
        else {
            return mysqli_query ($this->dbConnect,$sql);
        }
    }

    //--------------------------------------------------------------------------
    function GetOne ($sql, $defVal = "")
    {
        $toRet = $defVal;
        $result = $this->ExecuteSql ($sql);
        if ($result != false) {
            $line = mysqli_fetch_row ($result);
            $toRet = $line[0];
            $this->FreeSqlResult ($result);
        }
        if ($toRet == NULL) $toRet = $defVal;
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function GetEntry ($sql, $redir_url = "")
    {
        $result = $this->ExecuteSql ($sql);
        if ($row = $this->FetchInArray ($result))
        {
            $this->FreeSqlResult ($result);
            return $row;
        }
        else
        {
            if (strlen ($redir_url) > 0) {
                $this->Close ();
                header ("Location: $redir_url");
                exit ();
            }
            else {
                return false;
            }
        }
    }

    //--------------------------------------------------------------------------
    function FetchInArray ($result)
    {
        return mysqli_fetch_array ($result);
    }

    //--------------------------------------------------------------------------
    function FreeSqlResult ($result)
    {
        mysqli_free_result ($result);
    }

    //--------------------------------------------------------------------------
    function GetInsertID ()
    {
        return mysqli_insert_id ($this->dbConnect);
    }

    //--------------------------------------------------------------------------
    function GetSetting ($keyname, $defVal = "")
    {
        $toRet = $defVal;
        $result = $this->ExecuteSql ("Select value From settings Where keyname='$keyname'");
        if ($result != false) {
            $line = mysqli_fetch_row ($result);
            $toRet = $line[0];
            mysqli_free_result ($result);
        }
        if ($toRet == NULL) $toRet = $defVal;
        return $toRet;
    }

    //--------------------------------------------------------------------------
    function SetSetting ($keyname, $value)
    {
        $this->ExecuteSql ("Update `settings` Set value='$value' Where keyname='$keyname'");
    }

    //--------------------------------------------------------------------------
    function Close ()
    {
        mysqli_close ($this->dbConnect);
    }

}

?>