<!-- BEGIN: MAIN -->
<!-- BEGIN: HEADER -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{HEADER_TITLE}</title>
    <meta name="robots" content="index,follow"/>
    <meta name="keywords" content="{HEADER_KEYWORDS}"/>
    <meta name="description" content="{HEADER_DESCRIPTION}"/>
    <meta name="revisit-after" content="3 days"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Language" content="en"/>

    <!-- Bootstrap core CSS -->
   <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-extend.css" rel="stylesheet">

    <!-- owl carouse 2 -->
  <link href="/css/owl.carousel.css" rel="stylesheet">
    <link href="/css/owl.theme.default.min.css" rel="stylesheet">

    <!-- Font Awesome styles -->
   <link href="/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles -->
<link href="/css/custom.css" rel="stylesheet">

 <link href="/css/C3counter.css" rel="stylesheet"> 

  <!--   <script src="/js/jquery_1.11.2.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>   -->
    
    
  <!-- <link type="text/css" rel="stylesheet" href="/main/assets/css/bootstrap.min.css">-->
    <link type="text/css" rel="stylesheet" href="/main/assets/fonts/font-awesome/css/all.min.css">
    <link type="text/css" rel="stylesheet" href="/main/assets/css/slick.css">
    <link rel="stylesheet" href="/main/assets/css/magnific-popup.css" />
    <link type="text/css" rel="stylesheet" href="/main/assets/css/animate.css">

    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="32x32" href="/images/slogo.png">

    <!-- Custom Stylesheet -->
  <link type="text/css" rel="stylesheet" href="/main/assets/css/style.css"> 


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    {HEADER_JAVASCRIPTS}
</head>
<body>

            <!-- BEGIN: START_TIME_BLOCK-->
            <div class="special" style="float: right;margin-top: 10px;color: #fff;">
                <div id="counter">
                    <div id="shading_">&nbsp;</div>
                </div>
                <div class="name">
                    <span>day</span>
                    <span>hour</span>
                    <span>min</span>
                    <span>sec</span>
                </div>
                <script type="text/javascript" src="/js/C3counter.js"></script>
                <script type="text/javascript">
                    // Default options
                    C3Counter("counter", { startTime :{START_TIME} });
                </script>
            </div>
            <!-- END: START_TIME_BLOCK -->
<!-- Static navbar -->
<nav class="navbar navbar-static-top navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--<a class="navbar-logo" href="/">{SITE_TITLE}</a>-->
            
             <a class="" href="/"><img src="./images/slogo.png" alt="{SITE_TITLE}"  width="60px"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav nav-main">
                <li class="active"><a href='/index.php'>{DICT.Home}</a></li>
               {MENU_ABOUT}
               {MENU_PLAN}
                {MENU_NEWS}
                {REST_MENU}
      
                {MENU_FAQ}
                {MENU_CONTACT}
              <!--  {MENU_SUPPORT}-->
            </ul>
               <ul class="nav navbar-nav btn-login">
             <li class="login-n">{MENU_LOGIN}</a></li>  
            <li class="login-n">{MENU_SIGNUP}</a></li>  
          </ul>

            <!-- BEGIN: START_TIME_BLOCK-->
            <div class="special" style="float: right;margin-top: 10px;color: #fff;">
               

                <div id="counter">
                    <div id="shading_">&nbsp;</div>
                </div>
                <div class="name">
                    <span>day</span>
                    <span>hour</span>
                    <span>min</span>
                    <span>sec</span>
                </div>
                <script type="text/javascript" src="/js/C3counter.js"></script>
                <script type="text/javascript">
                    // Default options
                    C3Counter("counter", { startTime :{START_TIME} });
                </script>
            </div>
            <!-- END: START_TIME_BLOCK -->

        </div><!--/.nav-collapse -->
    </div>
</nav>



<div class="container-fluid carousel_main">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4 tab-content">
                <!-- form-login -->
                <div class="tab-pane form-login {TAB_ACTIVE_LOGIN}" role="tabpanel" id="form-login">
                    <div class="form-login-content">
                       <!-- <p>
                           <a class="link-type-1" href="#form-registration" aria-controls="settings" role="tab"
                              data-toggle="tab">{DICT.Left_SignUp}</a> &nbsp; or &nbsp;
                              <strong
                                    class="strong-type-1"> {DICT.Left_Login}</strong></p>
                        <p>&nbsp;</p>-->
                        
                        <p> <strong
                                    class="strong-type-1"> {DICT.Left_Login}</strong></p>
                       
                    </div>
                </div>
                <!-- form-login end -->

                <!-- form-registration -->
               <div class="tab-pane form-login {TAB_ACTIVE_REG}" role="tabpanel" id="form-login-content">
                    <div class="form-login-content">
                        <p><strong class="strong-type-1">{DICT.Left_Login}</strong> &nbsp; </p>
                                    
                                 <!-- <form name='LoginForm' action='{MAIN_ACTION}' method='POST'>-->
                                 <form name='LoginForm' action='/login.php' method='POST'>

                            <div class="form-group">
                                <span class='error'>{LOGIN_ERROR}</span>
                            </div>
                            <div class="form-group">
                                <input name='Username' type="text" class="form-control"
                                       placeholder="{DICT.Left_Username}">
                            </div>
                            <div class="form-group">
                                <input name='Password' type="password" class="form-control"
                                       placeholder="{DICT.Left_Password}">
                            </div>
                            <!-- BEGIN: TURING_ROW -->
                            <div class="form-group">
                                <input class='form-control' type='text' name='turing' value='' maxlength='5'
                                       style='width: 100px;  display: initial;'
                                       autocomplete='off'>&nbsp;{LOGIN_TURING_IMAGE}
                            </div>
                            <!-- END: TURING_ROW -->

                            <p><strong class="strong-type-1">* </strong><a
                                        href='forgot_password.php'>{DICT.Left_ForgotPassword}</a></p>
                            <button type="submit" class="btn btn-form-login">{DICT.Left_LogInBut}</button>
                            <input type='hidden' name='ocd' value='login'/>
                        </form><p>
                            &nbsp;
                        </p>
                       <p> <strong class="strong-type-1 login-n"><i class='fa fa-cog'></i>{MENU_SIGNUP}</strong> </p>
                        
                      <!--   <p>{MAIN_ENROLLER} <a href="" data-toggle="tooltip" data-placement="top"
                                              title="{MAIN_ENROLLER_B}">[?]</a></p>
                        <form name='SignUpForm' action='{MAIN_ACTION}' method='POST'>
                            
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
                                <input type="text" name='email' class="form-control"
                                       placeholder="{DICT.Left_EmailAddress}" value="{MAIN_EMAIL}">
                            </div>
                            <div class="form-group">
                                <span class='error'>{MAIN_USERNAME_ERROR}</span>
                                <input type="text" name='username' class="form-control"
                                       placeholder="{DICT.Left_ChooseUsername}" value="{MAIN_USERNAME}">
                            </div>
                            
                              <div class="form-group">
                                <span class='error'>{MAIN_PASSWORD_ERROR}</span>
                                <input type="password" name='password' class="form-control" placeholder="{DICT.Left_ChoosePassword}" value="{MAIN_PASSWORD}">
                              </div>
                              <div class="form-group">
                                <span class='error'>{MAIN_PASSWORD2_ERROR}</span>
                                <input type="password" name='password2' class="form-control" placeholder="{DICT.Left_RePassword}" value="{MAIN_PASSWORD2}">
                              </div>

                            <!-- BEGIN: TURING -->
                         <!--   <div class="form-group">
                                <span class='error'>{MAIN_TURING_ERROR}</span>
                                <input class='form-control' type='text' name='turing' value='{MAIN_TURING}'
                                       maxlength='12' style='width: 100px;  display: initial;' autocomplete='off'>
                                &nbsp; {MAIN_TURING_IMAGE}<br>
                                <span class='question'>{DICT.Left_TuringText}</span>
                            </div>
                            <!-- END: TURING -->

                      <!--      <div class="checkbox">
                                <span class='error'>{MAIN_AGREE_ERROR}</span>
                                <label>
                                    <input type="checkbox" name='agree' value='1' {MAIN_AGREE}> {DICT.Left_Agree1} <a
                                            href="content.php?p_id=2">{DICT.Left_Terms}</a>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-form-login">{DICT.Left_RegisterMe}</button>
                            <input type='hidden' name='ocd' value='register'/>
                        </form>-->
                    </div>
                </div>  
                <!-- form-registration end -->
            </div>
        </div>
    </div>

    <div class="row">
        <div class="owl-carousel owl-main hidden-xs">
            {SLIDER}
        </div>
    </div>
</div>
<div class="clearfix"></div>
<!-- END: HEADER -->



    <!-- About Section -->
    <section class="about_sec" id="about">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h2 class="sec_heading wow fadeInLeft"><span>About Us</span>Our values and goals</h2>
                    <p class="wow fadeInLeft text-justify">Green Generation Agro Ltd imports and distributes wheat, personal and home care products as well as production and exportation of packaged foods, like cassava flour, rice, semolina and others . Green Generation Agro Ltd distributes products through its online store and physical stores that will be located across the country. </p>
                     <p class="mb-0"> <i>Wholesalers and distributors are key part of Green Generation Agro Ltd’s strategy through its GreenAgro Network.</i></p>
                      
                </div>
                <div class="col-md-6">
                    <div class="about_right wow fadeInRight">
                        <img src="/main/assets/images/template-two/about-img.png" alt="about">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 wow slideInUp" data-wow-duration=".5s" data-wow-delay="0s">
                    <div class="what-we-do-item text-center mt-30">
                        <i class="fa fa-star"></i>
                        <h5 class="title">Distributor Network</h5>
                        <p class="text-justify"> We are building  a solid distributor network to distribute our products across  Nigeria and beyond, this brings us to the reach of the consumers we serve. We support and fund  distributors through the Green  Agro Networking Program
                            
                            .</p>
                  
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 wow slideInUp" data-wow-duration="1s" data-wow-delay="0s">
                    <div class="what-we-do-item text-center mt-30">
                        <i class="fa fa-star"></i>
                        <h5 class="title">Financial Freedom</h5>
                        <p class="text-justify" >The Green Agro Distributor Network is created with  hope to setup businesses for its members. We support and fund members to establish distribution ventures across the nation, a way to directly fight poverty and encourage financial freedom.</p>
                     
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 wow slideInUp" data-wow-duration="1.5s" data-wow-delay="0s">
                    <div class="what-we-do-item text-center mt-30">
                        <i class="fa fa-star
"></i>
                        <h5 class="title">Food</h5>
                        <p class="text-justify"> 
                            At Green Generation Agro Ltd we join the fight against hunger through production and distribution of packaged food like parboiled rice, Semolina, flour, wheat and etc. Our Distributor network ensures that our product get to the reach of the masses. </p>
                        
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 wow slideInUp" data-wow-duration="2s" data-wow-delay="0s">
                    <div class="what-we-do-item text-center mt-30">
                        <i class="fa fa-star"></i>
                        <h5 class="title">Partner Network</h5>
                        <p class="text-justify">	At Green Agro Network we partner with  Companies  to expand products distributed through our network. Our members are able to access packaged/processed food, personal and home care products as well as products in other categories. </p>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /. About Section -->



    <!-- portfolio Section -->
    <section class="portfolio_sec" id="portfolio">
        <div class="prtfolioTop bg_blue">
            <div class="container">
                <div class="sec_header c_white">
                    <h2 class="sec_heading wow fadeInLeft">
                        Green Agro Portal
                    </h2>
                    <p class="wow fadeInLeft">
GreenAgro  Portal is a networking platform through which we distribute products by Green Generation Agro Ltd and its partners.
Wholesalers and distributors are key part of Green Generation Agro Ltd’s strategy through its GreenAgro Network.



                    </p>
                    <h3 class="sec_heading wow fadeInLeft">MEMBERSHIP FEE: NGN10500 Only</h3>
                </div>
            </div>
        </div>
        
        <!--   <div class="row portfolio_bottom text-center">
            <div class="container">
                <div class="porfloio_slider">
                    <div class="p_slide">
                        <div class="col-lg-3 col-md-6 col-sm-6 card offset-sm-4" style="width: 32rem;">
                            <img src="/images/hospital.jpg" class="card-img-top" alt="Medical Centre">
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <p class="card-text text-justify">
                                   
                                </p>
                            </div>
                            <!-- <a href="case-details.html"><i class="fa fa-arrow-right"></i></a> 
                        </div>
                    </div>
                    <div class="p_slide">
                        <div class="col-lg-3 col-md-6 col-sm-6 card offset-sm-4" style="width: 32rem;">
                            <img src="/images/baby.jpg" class="card-img-top" alt="Baby, held my its father">
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <p class="card-text text-justify">
                                
                                </p>
                            </div>
                            <!-- <a href="case-details.html"><i class="fa fa-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="p_slide">
                        <div class="col-lg-3 col-md-6 col-sm-6 card offset-sm-4" style="width: 32rem;">
                            <img src="/images/airline.jpg" class="card-img-top" alt="Baby, held my its father">
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <p class="card-text text-justify">
                                   
                                </p>
                            </div>
                            <!-- <a href="case-details.html"><i class="fa fa-arrow-right"></i></a> 
                        </div>
                    </div>
                 <!--   <div class="p_slide">
                        <div class="col-lg-3 col-md-6 col-sm-6 card offset-sm-4" style="width: 32rem;">
                            <img src="/images/team.jpg" class="card-img-top" alt="Baby, held my its father">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Raising Thousands of Wealthy Christians
                                </h5>
                                <p class="card-text text-justify">
                                    Raising over 500,000 members as Ambassadors of Christ to access all benefits associated with AMBASSADORIAL stage. 
                                </p>
                            </div>
                            <!-- <a href="case-details.html"><i class="fa fa-arrow-right"></i></a> 
                        </div>
                    </div>
                    
                    <!-- <div class="p_slide text-center"><img src="/main/assets/images/template-two/potfolio2.png" alt="portfolio"></div>
                    <div class="p_slide text-center"><img src="/main/assets/images/template-two/potfolio.png" alt="portfolio"></div> -->
                </div>
            </div>
        </div>
    </section>
    <!-- /. portfolio Section -->


<section class="testimonials_sec" id="testimonials">
    
        <div class="container">
            <div class="sec_header">
                     <h2 class="sec_heading wow fadeInUp">
                       OUR BENEFITS
                        <!-- <span>Our goals and values</span> -->
                    </h2>
                               </div>
            
            <div class="testimonials_inner">
                
                <div class="portfolio_sec">
                <div class="col-md-4 col-sm-12 wow slideInUp" data-wow-duration="1s" data-wow-delay="0s">
                    <div class="what-we-do-item text-center mt-30">
                        <i class="fa fa-star"></i>
                        <h4 class="title">Own a Wholesale/Distribution Business</h4>
                        <h5 style='color:blue;'>Up to 30% rebate</h5>
                        <p> Become part of the fast-growing network of entrepreneurs in the country.	All members are opportune to become wholesalers and distributors in the network of which they will be supported to own stores and receive supplies
                        </p>
                        <!-- <a href="case-details.html"><i class="fa fa-arrow-right"></i></a> -->
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 wow slideInUp" data-wow-duration=".5s" data-wow-delay="0s">
                    <div class="what-we-do-item text-center mt-30">
                        <i class="fa fa-star"></i>
                        <h5 class="title">Get Funded and Grow</h5>
                        <h5 style='color:blue;'>Access up to 3 million Naira Funding and Value</h5>
                        <p>
                           	Through the fast Growing network, members can access funding to start or grow their  business. Members will enjoy upto 30% rebate on all products.
                        </p>
                        <!-- <a href="case-details.html"><i class="fa fa-arrow-right"></i></a> -->
                    </div>
                </div>
                  <div class="col-md-4 col-sm-12 wow slideInUp" data-wow-duration=".5s" data-wow-delay="0s">
                    <div class="what-we-do-item text-center mt-30">
                        <i class="fa fa-star"></i>
                        <h5 class="title">Life Long Support</h5>
                        <h5 style='color:blue;'>Up to 5% Commission on purchase made by your downline</h5>
                        <p>
                            Members are trained and placed under mentors to ensure that they succeed. Earn money for life as a member. Get paid when a downline make a purchase
                        </p>
                        <!-- <a href="case-details.html"><i class="fa fa-arrow-right"></i></a> -->
                    </div>
                </div>
                </div>
            </div>
        </div>
        
    </section>
    <!-- /. About Section -->

    <!-- Service Section -->
    <section class="service_sec" id="plan">
        <div class="container">
            <div class="sec_header text-center">
                <h3 class="sec_heading wow fadeInLeft">
                    Our Compensation Plan
                </h3>
                <p class="wow fadeInLeft text-justify">
                    
                </p>
            </div>
            <div class="servics_list">
                <div class="row">
                    <div class="col-sm-12 col-md-6 wow slideInUp" data-wow-duration=".25s" data-wow-delay="0s">
                        <div class="service_item">
                            <div class="service_thumb">
                                
                                <img src="/images/mlm2.png" class="card-img-top" alt="Baby, held my its father">
                                </div>
                            <div class="service_content text-justify">
                                <h3>
                                    Stage 1: BECOME A MEMBER
                                </h3>
                                
                                <p>
                                   This stage confirms you as a member whereby you qualify to partake in benefit meant for members.
You must complete this stage to become a member. To complete the member stage.
Make a payment of the amount below, enrol 2 persons, encourage your referral to enrol 2 persons

                                </p>
                                <h4>
                                    REWARD
                                </h4>
                                <p>
                                  <ul>
                                     <!--<li>Cash reward of 10,000 Naira  Plus</li>-->
                                      <li>5kg Bag of RICE, Semoline and Branded Oil (Food Item value at NGN8,000).</li>
                                      <li>You  earn a sponsor bonus of N1000 for every 1 member you introduce</li>
                                      <li>Get up to 5% commission on all online purchase made by your referrals.</li>
                                  </ul>  
                                   	

                                </p>
                                
                                {MENU_SIGNUP}
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 wow slideInUp" data-wow-duration=".25s" data-wow-delay="0s">
                        <div class="service_item">
                           <div class="service_thumb">
                                
                               
                                </div>
                            <div class="service_content text-justify">
                                <h3>
                                    Stage 2: BECOME A Group LEADER 
                                </h3>
                                
                                <p>
                                  To Become a Group Leader, You must complete a 2X3 Matrix  by encouraging your downline   to complete the member stage.

                                </p>
                                <h4>
                                    REWARD
                                </h4>
                                <p>
                                  <ul>
                                      <li>A cash reward of NGN20,000</li>
                                      <li>Food Items worth N20,000</li>
                                      <li>You  earn a sponsor bonus of N1000 for every 1 member you introduce</li>
                                      <li>Get up to 5% commission on all online purchase made by your referrals.</li>
                                  </ul>  
                                   	

                                </p>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 wow slideInUp" data-wow-duration=".25s" data-wow-delay="0s">
                         <div class="service_item">
                         <div class="service_thumb">
                                
                                
                                </div>
                            <div class="service_content text-justify">
                                <h3>
                                    Stage 3: BECOME A WHOLESELER 
                                </h3>
                                
                                <p>
                                   To Become a WHOLESELER, You must complete a 2X3 Matrix  by encouraging your downline   to complete   to complete the Group LEADER Stage.

                                </p>
                                <h4>
                                    REWARD
                                </h4>
                                <p>
                                  <ul>
                                      <li>N200,000 cash support (for Shop rent or logistics)</li>
                                      <li>Food Items worth N200,000</li>
                                      <li>Subsequent purchase attracts upto 15% rebate</li>
                                      <li>You  earn a sponsor bonus of N1000 for every 1 member you introduce</li>
                                      <li>Get up to 5% commission on all online purchase made by your referrals.</li>
                                  </ul>  
                                   	

                                </p>
                            
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="col-sm-12 col-md-12 wow slideInUp" data-wow-duration=".25s" data-wow-delay="0s">
                        <div class="service_item">
                           <div class="service_thumb">
                                

                                </div>
                            <div class="service_content text-justify">
                                <h3>
                                    Stage 4: BECOME A DISTRIBUTOR 
                                </h3>
                                
                                <p>
                                   To Become a DISTRIBUTOR, You must complete a 2X2 Matrix  by encouraging  6 of your downlines to complete the WHOLESALER Stage.

                                </p>
                                <h4>
                                    REWARD
                                </h4>
                                <p>
                                  <ul>
                                      <li>N1,000,000 cash support (for Shop rent or logistics)</li>
                                      <li>5kg,10kg,25kg Bags of Rice, Semolina and other food items worth N1,500,000</li>
                                      <li>Subsequent purchase attracts upto 15% rebate</li>
                                      <li>You  earn a sponsor bonus of N1000 for every 1 member you introduce</li>
                                      <li>Get up to 5% commission on all online purchase made by your referrals.</li>
                                      <li>
                                          Recycle to Member stage and rebuild
                                      </li>
                                  </ul>  
                                   	

                                </p>
                           
                            </div>
                        </div>
                    </div>
                 <!--   <div class="col-sm-12 col-md-6 wow slideInUp" data-wow-duration=".25s" data-wow-delay="0s">
                        <div class="service_item">
                            <div class="service_thumb">
                                
                                
                                </div>
                            <div class="service_content text-justify">
                                <h3>
                                    Stage 5: BECOME A MENTOR 
                                </h3>
                                
                                <p>
                                   To Become a MENTOR, encourage 6 of your downlines to complete the DISTRIBUTOR Stage.

                                </p>
                                <h4>
                                    REWARD
                                </h4>
                                <p>
                                  <ul>
                                      <li>Become an earn for life member.</li>
                                      <li>Get up to 5% commission on all online purchase made by your referrals.</li>
                                      
                                      
                                  </ul>  
                                   	

                                </p>
                               
                            </div>
                        </div>
                    </div> -->
                <!-- <a href="#" class="btn br-50 browse_btn wow slideInUp" data-wow-duration="1.75s"
                    data-wow-delay="0s">browse More</a> -->
            </div>
        </div>
    </section><!-- /. Service Section -->


    <!-- Teams Section -->
    <!-- <section class="team_sec" id="team">
        <div class="container">
            <div class="sec_header text-center">
                <h2 class="sec_heading wow fadeInLeft"><span>OUR Team</span>MEET OUR LEADERS</h2>
                <p class="wow fadeInLeft">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet, consectetur
                    adipiscing elits</p>
            </div>
            <div class="team_list">
                <div class="team_member">
                    <div class="team_member_inner">
                        <img src="/main/assets/images/template-two/team-member.jpg" alt="team Member">
                        <div class="team_member_overlay">
                            <h5>David Jhon</h5>
                            <div class="memeber_role">IT CONSULTANT</div>
                        </div>
                    </div>
                </div>
                <div class="team_member">
                    <div class="team_member_inner">
                        <img src="/main/assets/images/template-two/team-member2.jpg" alt="team Member">
                        <div class="team_member_overlay">
                            <h5>David Jhon</h5>
                            <div class="memeber_role">IT CONSULTANT</div>
                        </div>
                    </div>
                </div>
                <div class="team_member">
                    <div class="team_member_inner">
                        <img src="/main/assets/images/template-two/team-member3.jpg" alt="team Member">
                        <div class="team_member_overlay">
                            <h5>David Jhon</h5>
                            <div class="memeber_role">IT CONSULTANT</div>
                        </div>
                    </div>
                </div>
                <div class="team_member">
                    <div class="team_member_inner">
                        <img src="/main/assets/images/template-two/team-member4.jpg" alt="team Member">
                        <div class="team_member_overlay">
                            <h5>David Jhon</h5>
                            <div class="memeber_role">IT CONSULTANT</div>
                        </div>
                    </div>
                </div>
                <div class="team_member">
                    <div class="team_member_inner">
                        <img src="/main/assets/images/template-two/team-member5.jpg" alt="team Member">
                        <div class="team_member_overlay">
                            <h5>David Jhon</h5>
                            <div class="memeber_role">IT CONSULTANT</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- /. Teams Section -->

    <!-- Counter Section -->
    <!-- <div class="counter_sec love_counter">
        <div class="container">

            <div class="counter_area mt-30 text-center">
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-3">
                        <div class="counter wow slideInUp" data-wow-duration=".5s" data-wow-delay="0s">
                            <sub><span class="love_count">569</span> <sup>+</sup></sub>
                            <span>Projct Complate</span>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptsantium doloremque
                                laudantium</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3">
                        <div class="counter wow slideInUp mt-55" data-wow-duration="1s" data-wow-delay="0s">
                            <sub><span class="love_count">783</span> <sup>+</sup></sub>
                            <span>Business Partners</span>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptsantium doloremque
                                laudantium</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3">
                        <div class="counter wow slideInUp" data-wow-duration="1.5s" data-wow-delay="0s">
                            <sub><span class="love_count">356</span> <sup>+</sup></sub>
                            <span>Happy Clients</span>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptsantium doloremque
                                laudantium</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3">
                        <div class="counter wow slideInUp mt-55" data-wow-duration="2s" data-wow-delay="0s">
                            <sub><span class="love_count">894</span> <sup>+</sup></sub>
                            <span>IT Consultant</span>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptsantium doloremque
                                laudantium</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Counter Section -->


    <!-- Testimonials Section
    <section class="testimonials_sec" id="testimonials">
        <div class="container">
            <div class="testimonials_inner">
                <div class="sec_header">
                    <h2 class="sec_heading wow fadeInLeft">
                        Testimonials
                        <span>Our Members Feedback</span>
                    </h2>
                    <p class="wow fadeInLeft">
                        Our work is in accordance with the word; as such testimonies abound.
                        You don't have to take our word for it. Take a look at some of members 
                        testimonies.
                    </p>
                </div>
                <div class="testi_wrap">
                    <div class="testi_slider dots_bottom">
                        <div class="testi_item">
                            <div class="testi_content">
                                <ul class="star_rating">
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                </ul>
                                <p>
                                    Ever since becoming a member, I have had so much benefits I'm short of word!
                                    May God continue to bless the team and leadership!
                                </p>
                            </div>
                            <div class="testi_author">
                                <div class="testi_name">Chiamaka Eze</div>
                                <div class="testi_designation">Trader</div>
                            </div>
                        </div>
                        <div class="testi_item">
                            <div class="testi_content">
                                <ul class="star_rating">
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                </ul>
                                <p>
                                    Apart from the financial benefits, there also so spiritual benefits. 
                                    I feel myself growing everyday since becoming a member. 
                                    It truly is a place to be.
                                </p>
                            </div>
                            <div class="testi_author">
                                <div class="testi_name">John Ode</div>
                                <div class="testi_designation">Tailor</div>
                            </div>
                        </div>
                        <div class="testi_item">
                            <div class="testi_content">
                                <ul class="star_rating">
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                    <li><i class="fa fa-star fill"></i></li>
                                </ul>
                                <p>
                                    I was sceptical at first, but I'm glad to say that they've cleared my doubts!
                                    I would refer anyone to this community of believers anytime, anyday.
                                </p>
                            </div>
                            <div class="testi_author">
                                <div class="testi_name">Ayo Babatunde</div>
                                <div class="testi_designation">Graphics Designer</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>   -->
    <!-- /. Testimonials Section -->


    <!-- /. News section -->
    <!-- <section class="news_sec" id="blog">
        <div class="container">
            <div class="sec_header">
                <h2 class="sec_heading wow fadeInLeft"><span>OUR Latest Blogs</span>Read Our Latest News & Blog</h2>
                <p class="wow fadeInLeft">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet, consectetur
                    adipiscing elits</p>
            </div>
            <div class="blogs_list">
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-4 wow slideInUp" data-wow-duration="0.25s" data-wow-delay="0s">
                        <div class="blog_item">
                            <div class="blog_thumb">
                                <a href="single-blog.html"><img src="/main/assets/images/template-two/blog-img2.jpg" alt="team Member"></a>
                            </div>
                            <div class="blog_item_content">
                                <a href="single-blog.html">
                                    <h4>Lorem ipsum dolor sit amet</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet,
                                    consectetur
                                    adipiscing elits</p>
                                <a href="single-blog.html" class="btn br-50">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-4 wow slideInUp" data-wow-duration="0.50s" data-wow-delay="0s">
                        <div class="blog_item">
                            <div class="blog_thumb">
                                <a href="single-blog.html"><img src="/main/assets/images/template-two/blog-img3.jpg" alt="team Member"></a>
                            </div>
                            <div class="blog_item_content">
                                <a href="single-blog.html">
                                    <h4>Lorem ipsum dolor sit amet</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet,
                                    consectetur
                                    adipiscing elits</p>
                                <a href="single-blog.html" class="btn br-50">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-4 wow slideInUp" data-wow-duration="0.75s" data-wow-delay="0s">
                        <div class="blog_item">
                            <div class="blog_thumb">
                                <a href="single-blog.html"><img src="/main/assets/images/template-two/blog-img4.jpg" alt="team Member"></a>
                            </div>
                            <div class="blog_item_content">
                                <a href="single-blog.html">
                                    <h4>Lorem ipsum dolor sit amet</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet,
                                    consectetur
                                    adipiscing elits</p>
                                <a href="single-blog.html" class="btn br-50">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-4 wow slideInUp" data-wow-duration="1.00s" data-wow-delay="0s">
                        <div class="blog_item">
                            <div class="blog_thumb">
                                <a href="single-blog.html"><img src="/main/assets/images/template-two/blog-img5.jpg" alt="team Member"></a>
                            </div>
                            <div class="blog_item_content">
                                <a href="single-blog.html">
                                    <h4>Lorem ipsum dolor sit amet</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet,
                                    consectetur
                                    adipiscing elits</p>
                                <a href="single-blog.html" class="btn br-50">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-4 wow slideInUp" data-wow-duration="1.25s" data-wow-delay="0s">
                        <div class="blog_item">
                            <div class="blog_thumb">
                                <a href="single-blog.html"><img src="/main/assets/images/template-two/blog-img6.jpg" alt="team Member"></a>
                            </div>
                            <div class="blog_item_content">
                                <a href="single-blog.html">
                                    <h4>Lorem ipsum dolor sit amet</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet,
                                    consectetur
                                    adipiscing elits</p>
                                <a href="single-blog.html" class="btn br-50">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-4 wow slideInUp" data-wow-duration="1.50s" data-wow-delay="0s">
                        <div class="blog_item">
                            <div class="blog_thumb">
                                <a href="single-blog.html"><img src="/main/assets/images/template-two/blog-img7.jpg" alt="team Member"></a>
                            </div>
                            <div class="blog_item_content">
                                <a href="single-blog.html">
                                    <h4>Lorem ipsum dolor sit amet</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet,
                                    consectetur
                                    adipiscing elits</p>
                                <a href="single-blog.html" class="btn br-50">Read More</a>
                            </div>
                        </div>
                    </div>

                </div>
                <a href="blog-list.html" class="btn br-50 browse_btn wow slideInUp" data-wow-duration="1.75s" data-wow-delay="0s"
                    style="visibility: visible; animation-duration: 1.75s; animation-delay: 0s; animation-name: slideInUp;">browse
                    More</a>
            </div>
        </div>
    </section> -->
    <!-- /. News section -->

     <!-- Pricing Section -->
    <!-- <section class="pricing_sec">
        <div class="pricing_list">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="pricing_item">
                            <div class="pricing_value">
                                <div class="p_v_per_month"><span>$</span>25<em>/mo</em></div>
                                <div class="perYear">$250/year</div>
                            </div>
                            <div class="p_i_middle">
                                <h3>Basic</h3>
                                <ul class="pricing_info_list">
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-times"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-times"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-times"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-times"></i>Lorem ipsum dolor sit amet</li>
                                </ul>
                                <a href="#" class="btn br-50">Buy Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="pricing_item">
                            <div class="pricing_value">
                                <div class="p_v_per_month"><span>$</span>35<em>/mo</em></div>
                                <div class="perYear">$400/year</div>
                            </div>
                            <div class="p_i_middle">
                                <h3>Premium</h3>
                                <ul class="pricing_info_list">
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-times"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-times"></i>Lorem ipsum dolor sit amet</li>
                                </ul>
                                <a href="#" class="btn br-50">Buy Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="pricing_item">
                            <div class="pricing_value">
                                <div class="p_v_per_month"><span>$</span>45<em>/mo</em></div>
                                <div class="perYear">$510/year</div>
                            </div>
                            <div class="p_i_middle">
                                <h3>Ultimate</h3>
                                <ul class="pricing_info_list">
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                    <li><i class="fa fa-check"></i>Lorem ipsum dolor sit amet</li>
                                </ul>
                                <a href="#" class="btn br-50">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- /. Pricing Section -->

<div class="container-fluid welcome-block">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                {MAIN_CONTENT}
            </div>
        </div>
    </div>
</div>

    <!-- Contact Section -->
    <section class="contact_sec" id="contact">
        <div class="sec_header text-center">
            <div class="container">
                <h2 class="sec_heading wow fadeInUp">Contact Us</h2>
                <!-- <p class="wow fadeInUp">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis
                    pulvinar vestibulum. Doneceleifend, sem sed dictum. Lorem ipsum dolor sit amet, consectetur
                    adipiscing elits
                </p> -->
            </div>
        </div>

        <div class="container">
            <div class="contact-details d-flex">
                <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="contact_info wow fadeInLeft">
                            <!-- <h3>contact us</h3> -->
                            <p>
                                Feel free to contact us.
                            </p>
                            <hr>
                            <h5><i class="fa fa-map-marker"></i> Suite A18, POWA Internatioal Market, Nyanya, Abuja - Nigeria
                            </h5>
                            <h5><i class="fa fa-envelope"></i> support@ greenagroportal.com
                            </h5>
                            <h5><i class="fa fa-phone"></i> (+234)8095215100
                            </h5>
                        </div>
                    </div>
                   <!-- <div class="col-sm-12 col-md-7">
                        <div class="contact-form-area wow fadeInRight">
                            <form action="#">
                                <!-- <div class="input-title">
                                    <h3 class="title">Don't Hesitate To Contact With Us, Say Hello......</h3>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <input class="form-control" type="text" placeholder="Full Name Here">
                                            <i class="fa fa-user"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <input class="form-control" type="email" placeholder="Email Here">
                                            <i class="fa fa-envelope-open"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <input class="form-control" type="text" placeholder="Phone No">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <input class="form-control" type="text" placeholder="Subject">
                                            <i class="fa fa-edit"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="input-box">
                                            <textarea class="form-control" name="#" id="#" cols="30" rows="10"
                                                placeholder="Message Us"></textarea>
                                    <i class="fa fa-pencil"></i>
                                    <button class="btn br-50 wow slideInUp" data-wow-duration="1.5s" data-wow-delay="0s"
                                        type="submit">Send Message</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div> -->
                    
            </div>
        </div>
        </div>
        </div>
    </section>  <!-- /. Contact Section -->

    <!-- Partners Section -->
    <!-- <div class="partners_sec">
        <div class="container">
            <div class="partners_slider">
                <div class="partner_item">
                    <img src="/main/assets/images/partner-1.png" alt="partner">
                </div>
                <div class="partner_item">
                    <img src="/main/assets/images/partner-2.png" alt="partner">
                </div>
                <div class="partner_item">
                    <img src="/main/assets/images/partner-3.png" alt="partner">
                </div>
                <div class="partner_item">
                    <img src="/main/assets/images/partner-4.png" alt="partner">
                </div>
                <div class="partner_item">
                    <img src="/main/assets/images/partner-5.png" alt="partner">
                </div>
                <div class="partner_item">
                    <img src="/main/assets/images/partner-6.png" alt="partner">
                </div>
                <div class="partner_item">
                    <img src="/main/assets/images/partner-7.png" alt="partner">
                </div>
            </div>
        </div>
    </div> -->

    <!-- Footer Section -->
    <footer Class="main_footer wow fadeInUp">
        <div class="container">
            <div class="footer_top  text-center">
                <div class="footer_top_logo">
                    <a href="#" class="footer-logo"><img src="./images/slogo2.png" alt="logo-icon"></a>
                </div>
                <!-- <p>

                </p> -->
            </div>
            <div class="row text-center">
                <div class="col-sm-4">
                    <div class="footer_sec">
                        <i class="fa fa-phone-alt"></i>
                        <h3>Call Us On</h3>
                        <a href="#">(+234)8095215100</a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="footer_sec">
                        <i class="fa fa-envelope"></i>
                        <h3>Mail us on</h3>
                        <a href="mailto:support@greenagroportal.com">support@ greenagroportal.com</a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="footer_sec">
                        <i class="fas fa-building"></i>
                        <h3>Visit Us</h3>
                        <a href="#">
                           Suite A18, POWA Internatioal Market, Nyanya, Abuja - Nigeria
                        </a>
                    </div>
                </div>
            </div>
          <!--  <div class="copyrigt_text d-flex justify-content-between">
                <span>© Copyright 2019 Green Generation Agro Ltd. All rights reserved.</span>
                <!-- social icons -->
               <!-- <div class="social_div">
                    <ul class="social_list">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                        <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                    </ul>
                </div><!-- /. social icons -->
          <!--  </div>  --->
        </div>
    </footer><!-- /. Footer Section -->

    <a href="javascript:void(0);" class="scrollUp"><i class="fas fa-chevron-up"></i></a>






<!-- BEGIN: NEWS -->
<div class="container-fluid news">
    <div class="row">
        <div class="container-fluid news-head text-center">
                <span class="fa-stack fa-1">
                  <i class="fa fa-circle-thin fa-stack-2x"></i>
                  <i class="fa fa-align-justify fa-stack-1x"></i>
                </span>
            Latest News
        </div>
        <div class="container-fluid news-content">
            <div class="container">
                <div class="row">
                    {NEWS_LIST}
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END: NEWS -->




{FILE {FOOTER_TEMPLATE}}
<!-- END: NEWS  {FILE {FOOTER_TEMPLATE}}-->

<script src="/main/assets/js/jquery.min.js"></script>
<script src="/main/assets/js/popper.min.js"></script>
<script src="/main/assets/js/bootstrap.min.js"></script>
<script src="/main/assets/js/slick.min.js"></script>
<script src="/main/assets/js/wow.min.js"></script>
<script src="/main/assets/js/jquery.mixitup.min.js"></script>
<script src="/main/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/main/assets/js/custom.js"></script>
<!-- END: MAIN -->
