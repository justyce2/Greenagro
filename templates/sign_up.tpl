<!-- BEGIN: MAIN -->

{FILE {HEADER_TEMPLATE}}
    <div class="container-fluid Title">
        <span class="fa-stack fa-1">
            <i class="fa fa-circle-thin fa-stack-2x"></i>
<i class="fa fa-align-justify fa-stack-1x"></i>
        </span>
        {MAIN_HEADER}
    </div>
    
      
    <div class="container faq-content">
        <div class="row" align="center">
<div class="col-xs-12 col-sm-6 col-md-4" style="float: none;">

                         <!--   <p>{MAIN_ENROLLER} <a href="" data-toggle="tooltip" data-placement="top" title="{MAIN_ENROLLER_B}">[?]</a></p>-->
                            
                            <form name='changeref' action='{MAIN_ACTION}' method='POST' style=" text-align: left;"> 
<p>{MAIN_ENROLLER} <a href="" data-toggle="tooltip" data-placement="top" title="{MAIN_ENROLLER_B}">[?]</a>
<input type="submit" name="changeref" value="Change" /></p><p>{MAIN_ENROLLER_B}</p>
                          </form>
                            
                            <form name='SignUpForm' action='{MAIN_ACTION}' method='POST' style=" text-align: left;"> 
                            
                              <div class="form-group">

                              
                              
                              <div class="form-group">
                                <span class='error'>{MAIN_FIRSTNAME_ERROR}</span>
                                <input type="text" name='first_name' class="form-control" placeholder="{DICT.Left_FirstName}" value="{MAIN_FIRSTNAME}">
                              </div>  
                              <div class="form-group">
                                <span class='error'>{MAIN_LASTNAME_ERROR}</span>
                                <input type="text" name='last_name' class="form-control" placeholder="{DICT.Left_LastName}" value="{MAIN_LASTNAME}">
                              </div>
                              <div class="form-group">
                                <span class='error'>{MAIN_EMAIL_ERROR}</span>
                                <input type="text" name='email' class="form-control" placeholder="{DICT.Left_EmailAddress}" value="{MAIN_EMAIL}">
                              </div>
                              <div class="form-group">
                                <span class='error'>{MAIN_PHONE_ERROR}</span>
                                <input type="text" name='phone' class="form-control" placeholder="Phone Number" value="{MAIN_PHONE}">
                              </div>
                              <div class="form-group">
                                <span class='error'>{MAIN_USERNAME_ERROR}</span>
                                <input type="text" name='username' class="form-control" placeholder="{DICT.Left_ChooseUsername}" value="{MAIN_USERNAME}">
                              </div>

                              <div class="form-group">
                                <span class='error'>{MAIN_PASSWORD_ERROR}</span>
                                <input type="password" name='password' class="form-control" placeholder="{DICT.Left_ChoosePassword}" value="{MAIN_PASSWORD}">
                              </div>
                              <div class="form-group">
                                <span class='error'>{MAIN_PASSWORD2_ERROR}</span>
                                <input type="password" name='password2' class="form-control" placeholder="{DICT.Left_RePassword}" value="{MAIN_PASSWORD2}">
                              </div>
                              
                                <div class="form-group">
                                <span class='error'>{MAIN_STREET_ERROR}</span>
                                <input type="text" name='street' class="form-control" placeholder="Address" value="{MAIN_STREET}">
                              </div>
                              <div class="form-group">
                                <span class='error'>{MAIN_CITY_ERROR}</span>
                                <input type="text" name='city' class="form-control" placeholder="city" value="{MAIN_CITY}">
                              </div>
                              <div class="form-group">
                                <span class='error'>{MAIN_STATE_ERROR}</span>
                                <input type="text" name='state' class="form-control" placeholder="State" value="{MAIN_STATE}">
                              </div>
                               <div class="form-group">
                                <span class='error'>{MAIN_COUNTRY_ERROR}</span>
                                <input type="text" name='country' class="form-control" placeholder="{DICT.Left_ChooseCountry}" value="Nigeria" readonly="true">
                              </div>
                              
                              
                              
                              
                              <!---  continue --->
                              
                              
                               <div class="form-group">
                                <span class='error'>{MAIN_BANKNAME_ERROR}</span>
                                <input type="text" name='bankname' class="form-control" placeholder="Bank Name" value="{MAIN_BANKNAME}">
                              </div>
                               <div class="form-group">
                                <span class='error'>{MAIN_BANKACCNAME_ERROR}</span>
                                <input type="text" name='bankaccname' class="form-control" placeholder="Bank Account Name" value="{MAIN_BANKACCNAME}">
                              </div>
                               <div class="form-group">
                                <span class='error'>{MAIN_BANKACCNO_ERROR}</span>
                                <input type="text" name='bankaccno' class="form-control" placeholder="Bank Account Number" value="{MAIN_BANKACCNO}">
                              </div>

                <!-- BEGIN: TURING -->
                              <div class="form-group">
                                <span class='error'>{MAIN_TURING_ERROR}</span>
                                <input class='form-control' type='text' name='turing' value='{MAIN_TURING}' maxlength='12' style='width: 100px;  display: initial;' autocomplete='off'> &nbsp; {MAIN_TURING_IMAGE}<br>
                                <span class='question'>{DICT.Left_TuringText}</span>
                              </div>
                <!-- END: TURING -->

                              <div class="checkbox">
                                <span class='error'>{MAIN_AGREE_ERROR}</span>
                                <label>
                                  <input type="checkbox" name='agree' value='1' {MAIN_AGREE}> {DICT.Left_Agree1} <a href="content.php?p_id=2">{DICT.Left_Terms}</a>
                                </label>
                              </div>
                              <button type="submit" class="btn btn-form-login">{DICT.Left_RegisterMe}</button>
                              <input type='hidden' name='ocd' value='register' />
                            </form>
</div>
        </div>
    </div>



{FILE {FOOTER_TEMPLATE}}

<!-- END: MAIN -->