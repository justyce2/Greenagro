-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2023 at 03:53 PM
-- Server version: 5.7.36
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumticetra_greenagro`
--

-- --------------------------------------------------------

--
-- Table structure for table `aemailtempl`
--

CREATE TABLE `aemailtempl` (
  `emailtempl_id` int(11) NOT NULL,
  `subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `tag_descr` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aemailtempl`
--

INSERT INTO `aemailtempl` (`emailtempl_id`, `subject`, `message`, `tag_descr`, `is_active`) VALUES
(1, 'Welcome to [SiteTitle]', '&lt;p&gt;Dear [FirstName] [LastName],&lt;/p&gt;\r\n&lt;p&gt;Some message with tags.&lt;/p&gt;\r\n&lt;p&gt;Regards, [SiteTitle]&lt;/p&gt;', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteUrl]\');\">SiteUrl</a>] - Url of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[RefLink]\');\">RefLink</a>] - Referral Link<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[ID]\');\">ID</a>] - Member&#039;s ID<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s First Name<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s Last Name<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s Username<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s Email<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorID]\');\">SponsorID</a>] - Sponsor&#039;s ID<br>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aptools`
--

CREATE TABLE `aptools` (
  `aptool_id` int(11) NOT NULL,
  `photo` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponders`
--

CREATE TABLE `autoresponders` (
  `email_id` int(11) NOT NULL,
  `subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `z_day` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_free` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `autoresponders`
--

INSERT INTO `autoresponders` (`email_id`, `subject`, `message`, `z_day`, `is_active`, `is_free`) VALUES
(1, 'test', 'test', 1, 0, 1),
(2, 'test', 'test', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cash`
--

CREATE TABLE `cash` (
  `cash_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `from_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `type_cash` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `descr` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cash_date` int(11) NOT NULL DEFAULT '0',
  `payment_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cash`
--

INSERT INTO `cash` (`cash_id`, `amount`, `from_id`, `to_id`, `type_cash`, `descr`, `cash_date`, `payment_id`) VALUES
(1, 500.00, 2, 1, '2', 'Sponsor Bonus', 1638258835, 0),
(2, 500.00, 3, 1, '2', 'Sponsor Bonus', 1638258840, 0),
(3, 500.00, 10, 1, '2', 'Sponsor Bonus', 1638258847, 0),
(4, 500.00, 11, 1, '2', 'Sponsor Bonus', 1638258854, 0),
(5, 500.00, 12, 1, '2', 'Sponsor Bonus', 1638258865, 0),
(6, 500.00, 13, 1, '2', 'Sponsor Bonus', 1638258870, 0),
(7, 8000.00, 1, 1, '1', 'For completed matrix', 1638258871, 0),
(8, 500.00, 4, 2, '2', 'Sponsor Bonus', 1638258886, 0),
(9, 500.00, 5, 3, '2', 'Sponsor Bonus', 1638258902, 0),
(10, 500.00, 6, 2, '2', 'Sponsor Bonus', 1638258908, 0),
(11, 500.00, 7, 3, '2', 'Sponsor Bonus', 1638258915, 0),
(12, 500.00, 8, 6, '2', 'Sponsor Bonus', 1638258932, 0),
(13, 500.00, 9, 1, '2', 'Sponsor Bonus', 1638258966, 0),
(14, 500.00, 17, 2, '2', 'Sponsor Bonus', 1638432757, 0),
(15, 8000.00, 1, 2, '1', 'For completed matrix', 1638432757, 0),
(16, 500.00, 18, 4, '2', 'Sponsor Bonus', 1638630186, 0),
(17, 500.00, 19, 17, '2', 'Sponsor Bonus', 1638630211, 0),
(18, 500.00, 20, 3, '2', 'Sponsor Bonus', 1638784491, 0),
(19, 500.00, 21, 4, '2', 'Sponsor Bonus', 1638875815, 0),
(20, 500.00, 22, 17, '2', 'Sponsor Bonus', 1638966221, 0),
(21, 500.00, 23, 17, '2', 'Sponsor Bonus', 1640291918, 0),
(22, 1500.00, 0, 17, '0', 'Referral bonus', 1640292788, 0),
(23, 1000.00, 24, 2, '2', 'Sponsor Bonus', 1641146764, 0),
(24, 1000.00, 25, 2, '2', 'Sponsor Bonus', 1641375305, 0),
(25, 8000.00, 1, 10, '1', 'For completed matrix', 1641375306, 0),
(26, 1000.00, 26, 17, '2', 'Sponsor Bonus', 1641990006, 0),
(27, 1000.00, 27, 3, '2', 'Sponsor Bonus', 1642066692, 0),
(28, 8000.00, 1, 3, '1', 'For completed matrix', 1642066692, 0),
(29, 1000.00, 28, 27, '2', 'Sponsor Bonus', 1642676249, 0),
(30, 1000.00, 29, 27, '2', 'Sponsor Bonus', 1643019297, 0),
(31, 1000.00, 30, 29, '2', 'Sponsor Bonus', 1643033229, 0),
(32, 1000.00, 31, 25, '2', 'Sponsor Bonus', 1643205132, 0),
(33, 1000.00, 33, 20, '2', 'Sponsor Bonus', 1644242175, 0),
(34, 1000.00, 35, 2, '2', 'Sponsor Bonus', 1646136646, 0),
(35, 8000.00, 1, 12, '1', 'For completed matrix', 1646136646, 0),
(36, 1000.00, 36, 25, '2', 'Sponsor Bonus', 1646817756, 0),
(37, 1000.00, 37, 27, '2', 'Sponsor Bonus', 1646916246, 0),
(38, 1000.00, 39, 25, '2', 'Sponsor Bonus', 1648031742, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cash_out`
--

CREATE TABLE `cash_out` (
  `cash_out_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `processor` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transfer_date` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `m_level` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `title`, `description`, `m_level`, `is_active`) VALUES
(2, 'Packaged Food', '&lt;p&gt;&nbsp;Food&lt;/p&gt;', '', 0),
(3, 'Perboiled Rice', '&lt;p&gt;Perboiled Rice By Green Generation Agro Ltd. Rice Comes in different Sizes, 1kg,5kg,10kg and 25kg.&lt;/p&gt;\r\n&lt;p&gt;Once you purchase, ensure you notify us&nbsp; so we can deliver within your prefered location&lt;/p&gt;', '1;2;3;4;5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `symbol` varchar(8) DEFAULT NULL,
  `name` varchar(8) DEFAULT '',
  `active` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `symbol`, `name`, `active`) VALUES
(1, '$', 'USD', 1),
(2, '€', 'EUR', 1),
(3, 'Mex$', 'MXN', 1),
(4, '₦', 'NGN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emailtempl`
--

CREATE TABLE `emailtempl` (
  `emailtempl_id` int(11) NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `tag_descr` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emailtempl`
--

INSERT INTO `emailtempl` (`emailtempl_id`, `description`, `subject`, `message`, `tag_descr`, `is_active`) VALUES
(1, 'Sponsor notification about new sign up', 'From [SiteTitle]: New referrer signup up', 'Dear [SponsorFName] [SponsorLName], \r\n\r\nYou referral activated account. Their email is [Email], name is [FirstName] [LastName]. Contact them and make sure they are able to verify their email address.\r\nIf they don&#039;t do this within 24 hours they will be removed.\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorFName]\');\">SponsorFName</a>] - Sponsor&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorLName]\');\">SponsorLName</a>] - Sponsor&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorUsername]\');\">SponsorUsername</a>] - Sponsor&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorEmail]\');\">SponsorEmail</a>] - Sponsor&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n', 0),
(2, 'Welcome email sent to member after successful registration with activation link', 'Activate your new account in [SiteTitle]', 'Welcome and thank you for signing up to be a Member of [SiteTitle].\r\n\r\nYour login is: [Username]\r\nYour password is: [Password]\r\n\r\nTo activate your account (active within 24 hours) follow this Activation Membership link:\r\n[ActivationLink]\r\n\r\nWe look forward to helping you grow your business.\r\n\r\nWith best regards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Password]\');\">Password</a>] - Member&#039;s password<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[ActivationLink]\');\">ActivationLink</a>] - Member&#039;s activation link<br>\r\n', 0),
(3, 'Sponsor notification about a new activated referral', 'From [SiteTitle]: New personal referral is verified', 'Dear [SponsorFName] [SponsorLName], \r\n\r\nYour new enrollee has just become verified.\r\nTheir email address is [Email], name is [FirstName] [LastName].\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorFName]\');\">SponsorFName</a>] - Sponsor&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorLName]\');\">SponsorLName</a>] - Sponsor&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorUsername]\');\">SponsorUsername</a>] - Sponsor&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SponsorEmail]\');\">SponsorEmail</a>] - Sponsor&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n', 0),
(4, 'Welcome email sent to member after successful registration', 'Welcome to [SiteTitle]', 'Welcome and thank you for signing up to be a Member of [SiteTitle].\r\n\r\nYour login is: [Username]\r\nYour password is: [Password]\r\n\r\nWe look forward to helping you grow your business.\r\n\r\nWith best regards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Password]\');\">Password</a>] - Member&#039;s password<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[RefLink]\');\">RefLink</a>] - Member&#039;s Referral Link<br>\r\n', 1),
(5, 'Forgot password email content with new access details', 'From [SiteTitle]: Your new access details', '&lt;p&gt;Dear [FirstName] [LastName],   You received this email because you have requested to remind you login details for [SiteTitle].  Your login is: [Username]  Your password is: [Password]  Your referral link is: &lt;a href=\"https://greenagroportal.com/index.php?spon=2\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://greenagroportal.com/index.php?spon%3D2&amp;source=gmail&amp;ust=1639210274152000&amp;usg=AOvVaw3dPJs9YfAAvLrFqFJVl7_L\"&gt;https://greenagroportal.com/&lt;wbr&gt;&lt;/wbr&gt;index.php?spon=[&lt;/a&gt;&lt;a title=\"click to paste\"&gt;Username&lt;/a&gt;] Regards, [SiteTitle]&lt;/p&gt;', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Password]\');\">Password</a>] - Member&#039;s password<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[RefLink]\');\">RefLink</a>] - Member&#039;s Referral Link<br>\r\n', 1),
(6, 'Pin code email after unsuccessfull log in attempt from wrong IP address', 'From [SiteTitle]: Changing Security Data', 'Dear [FirstName] [LastName], \r\n\r\nYou have tried to enter  [SiteTitle] from another IP address.\r\n\r\nTo change your current IP address click the link below end enter this pin-code: [PinCode]\r\n\r\n\r\n[CheckLink]\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[PinCode]\');\">PinCode</a>] - Member&#039;s pin code<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[CheckLink]\');\">CheckLink</a>] - Member&#039;s check link<br>\r\n', 1),
(7, 'Guest notification about a new ticket registration at the public support center', 'From [SiteTitle]: Your new ticket has been successfully registered', 'Dear [FirstName] [LastName], \r\n\r\nYour ticket was successfully sent to support center of [SiteTitle]. It will be soon answered.\r\n\r\n\r\nSubject of ticket: [TicketSubject]\r\n\r\nPlease use this direct link to view ticket status: \r\n\r\n[TicketLink] \r\n\r\n\r\nAlso you can view your ticket status using another way and following details:\r\n\r\nURL: [TicketShortLink] \r\n\r\nE-mail: [Email] \r\n\r\nTicket code: [TicketCode] \r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketSubject]\');\">TicketSubject</a>] - Subject of the ticket<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketCode]\');\">TicketCode</a>] - Ticket code<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketLink]\');\">TicketLink</a>] - Full ticket link<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketShortLink]\');\">TicketShortLink</a>] - Short ticket link<br>\r\n', 0),
(8, 'Guest notification about answer from the public support center', 'From [SiteTitle]: New answer from public support center', 'Dear [FirstName] [LastName], \r\n\r\nYou have just received an answer on your ticket.\r\n\r\nPlease use this direct link to view ticket status: \r\n\r\n[TicketLink] \r\n\r\n\r\nAlso you can view your ticket status using another way and following details:\r\n\r\nURL: [TicketShortLink] \r\n\r\nE-mail: [Email] \r\n\r\nTicket code: [TicketCode]\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Email]\');\">Email</a>] - Member&#039;s email<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketSubject]\');\">TicketSubject</a>] - Subject of the ticket<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketCode]\');\">TicketCode</a>] - Ticket code<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketLink]\');\">TicketLink</a>] - Full ticket link<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[TicketShortLink]\');\">TicketShortLink</a>] - Short ticket link<br>\r\n', 0),
(9, 'Email template for members contact page', '[SiteTitle]: A message from [SenderFirstName] [SenderLastName] ([SenderID])!', 'Hello [FirstName] [LastName], \r\n\r\nSome message\r\n\r\n\r\n\r\n\r\nRegards,\r\n[SenderFirstName] [SenderLastName]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[ID]\');\">ID</a>] - Member&#039;s ID<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SenderFirstName]\');\">SenderFirstName</a>] - Sender&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SenderLastName]\');\">SenderLastName</a>] - Sender&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SenderID]\');\">SenderID</a>] - Sender&#039;s ID<br>\r\n', 0),
(10, 'Email template for members Tell Friend page', 'From [SiteTitle]: Hi [FirstName] [LastName]!', 'Hello [FirstName] [LastName], \r\n\r\nI just had to tell you about this great site I just found.\r\n\r\nCheck it out for yourself at [RefLink]\r\n\r\n\r\n\r\nRegards,\r\n[SenderFirstName] [SenderLastName]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SenderFirstName]\');\">SenderFirstName</a>] - Sender&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SenderLastName]\');\">SenderLastName</a>] - Sender&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[RefLink]\');\">RefLink</a>] - Sender&#039;s Referral Link<br>\r\n', 0),
(11, 'Successfull payment notification', 'From [SiteTitle]: Successful payment', 'Hello [FirstName] [LastName], \r\n\r\nYou have made a successful [Processor] payment.\r\n\r\nAmount: $[Amount]\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Amount]\');\">Amount</a>] - Amount<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Processor]\');\">Processor</a>] - Payment Processor<br>\r\n', 1),
(12, 'Getting commissions / forced matrix mode', 'From [SiteTitle]: Your membership earned commissions', 'Congratulations [FirstName] [LastName], \r\n\r\nYour [SiteTitle] membership earned you $[Amount].\r\n\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Amount]\');\">Amount</a>] - Amount<br>\r\n', 0),
(13, 'Matrix completion and getting commissions / cycling matrix mode', 'From [SiteTitle]: Your membership earned commissions', 'Congratulations [FirstName] [LastName], \r\n\r\nYou just completed [Matrix] matrix on [SiteTitle] and earned $[Amount].\r\n\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Matrix]\');\">Matrix</a>] - Title of completed matrix<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Amount]\');\">Amount</a>] - Amount<br>\r\n', 0),
(14, 'Matrix completion and getting commissions by sponsor/ cycling mode', 'From [SiteTitle]: Your membership earned commissions', 'Congratulations [FirstName] [LastName], \r\n\r\nYour referral #[RefID] just completed [Matrix] matrix on [SiteTitle] and earned you $[Amount].\r\n\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Matrix]\');\">Matrix</a>] - Title of completed matrix<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Amount]\');\">Amount</a>] - Amount<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[RefID]\');\">RefID</a>] - Referral ID<br>\r\n', 0),
(15, 'Sponsor bonus notification for personally enrolled', 'From [SiteTitle]: You earned sponsor bonus', 'Congratulations [FirstName] [LastName], \r\n\r\nYou earned [SiteTitle] sponsor bonus : $[Amount].\r\n\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Amount]\');\">Amount</a>] - Amount<br>\r\n', 0),
(16, 'Successfull withdrawal request completion notification', 'From [SiteTitle]: your withdrawal request is completed', 'Hello [FirstName] [LastName], \r\n\r\nYour withdrawal request was successfully completed.\r\n\r\n$[Amount] was paid to your account.\r\n\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Amount]\');\">Amount</a>] - Amount<br>\r\n', 0),
(17, 'End of active period notification/ forced mode', 'From [SiteTitle]: active period expired', 'Hello [FirstName] [LastName], \r\n\r\nYour Account has expired. \r\n\r\nYou should log in to your member area now to make a payment, ensuring that you retain active status in the pay plan and do not lose any benefits. \r\n\r\n\r\n\r\nRegards,\r\n[SiteTitle]', '[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[SiteTitle]\');\">SiteTitle</a>] - Title of the site<br />\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[FirstName]\');\">FirstName</a>] - Member&#039;s first name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[LastName]\');\">LastName</a>] - Member&#039;s last name<br>\r\n\r\n[<a href=\"javascript:void(0);\" title=\"click to paste\" onClick=\"insertText (\'[Username]\');\">Username</a>] - Member&#039;s username<br>\r\n', 0),
(18, 'Pre Launch notification', '[SiteTitle] is launched', 'Hello [FirstName] [LastName],\r\n\r\nWe are glad to inform you that starting from now you can Upgrade your account in <a href=\'[SiteUrl]\'>[SiteTitle]</a>.\r\n\r\nPlease login using your credentials. \r\n\r\nWith best regards,\r\n[SiteTitle] Team\r\n', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `faq_id` int(11) NOT NULL,
  `question` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fee_id` int(11) NOT NULL,
  `to_order_index` int(11) NOT NULL DEFAULT '0',
  `plevel` int(3) NOT NULL DEFAULT '0',
  `fee_member` decimal(12,2) NOT NULL DEFAULT '0.00',
  `fee_sponsor` decimal(12,2) NOT NULL DEFAULT '0.00',
  `from_order_index` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lands`
--

CREATE TABLE `lands` (
  `land_id` int(11) NOT NULL,
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `z_date` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `z_date` int(11) NOT NULL DEFAULT '0',
  `ip_addr` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `descr` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `z_date`, `ip_addr`, `descr`) VALUES
(1, 1638258601, '197.210.76.125', 'Logged in succesfully.'),
(2, 1638432619, '197.210.77.212', 'Logged in succesfully.'),
(3, 1638440335, '197.210.53.44', 'Logged in succesfully.'),
(4, 1638444403, '197.210.53.44', 'Logged in succesfully.'),
(5, 1638461647, '197.210.76.145', 'Logged in succesfully.'),
(6, 1638597079, '197.210.76.121', 'Logged in succesfully.'),
(7, 1638610856, '197.210.52.67', 'Logged in succesfully.'),
(8, 1638626209, '197.210.76.248', 'Logged in succesfully.'),
(9, 1638630032, '197.210.52.77', 'Logged in succesfully.'),
(10, 1638633112, '197.210.76.248', 'Logged in succesfully.'),
(11, 1638711563, '197.210.71.108', 'Logged in succesfully.'),
(12, 1638728757, '197.210.76.120', 'Logged in succesfully.'),
(13, 1638740281, '102.91.4.42', 'Logged in succesfully.'),
(14, 1638771147, '102.91.4.219', 'Logged in succesfully.'),
(15, 1638784330, '197.210.71.129', 'Logged in succesfully.'),
(16, 1638875759, '105.112.100.232', 'Logged in succesfully.'),
(17, 1638878892, '105.112.123.213', 'Logged in succesfully.'),
(18, 1638890340, '197.210.70.191', 'Logged in succesfully.'),
(19, 1638955152, '197.210.76.36', 'Logged in succesfully.'),
(20, 1638966202, '197.210.76.28', 'Logged in succesfully.'),
(21, 1639068109, '102.91.5.68', 'Logged in succesfully.'),
(22, 1639123260, '197.210.71.79', 'Logged in succesfully.'),
(23, 1639124071, '102.91.5.81', 'Logged in succesfully.'),
(24, 1639305497, '197.210.77.233', 'Logged in succesfully.'),
(25, 1639768712, '105.112.27.111', 'Logged in succesfully.'),
(26, 1640287805, '197.210.77.236', 'Logged in succesfully.'),
(27, 1640291900, '197.210.70.82', 'Logged in succesfully.'),
(28, 1641146135, '197.210.70.144', 'Logged in succesfully.'),
(29, 1641146751, '102.91.5.184', 'Logged in succesfully.'),
(30, 1641302723, '105.112.76.205', 'Logged in succesfully.'),
(31, 1641305101, '105.112.121.9', 'Logged in succesfully.'),
(32, 1641309148, '105.112.121.9', 'Logged in succesfully.'),
(33, 1641309328, '105.112.121.9', 'Logged in succesfully.'),
(34, 1641310306, '105.112.112.241', 'Logged in succesfully.'),
(35, 1641375267, '105.112.112.241', 'Logged in succesfully.'),
(36, 1641553287, '105.112.50.84', 'Logged in succesfully.'),
(37, 1641798555, '197.210.8.110', 'Logged in succesfully.'),
(38, 1641813261, '197.210.8.110', 'Logged in succesfully.'),
(39, 1641984570, '197.210.77.221', 'Logged in succesfully.'),
(40, 1641989973, '197.210.52.91', 'Logged in succesfully.'),
(41, 1642066681, '197.210.76.248', 'Logged in succesfully.'),
(42, 1642676235, '105.112.104.180', 'Logged in succesfully.'),
(43, 1643018992, '105.112.114.130', 'Logged in succesfully.'),
(44, 1643033189, '197.210.77.36', 'Logged in succesfully.'),
(45, 1643098590, '105.112.51.248', 'Logged in succesfully.'),
(46, 1643205122, '197.210.52.171', 'Logged in succesfully.'),
(47, 1643446588, '197.210.53.12', 'Logged in succesfully.'),
(48, 1643455386, '197.210.85.165', 'Logged in succesfully.'),
(49, 1643472063, '197.210.85.159', 'Logged in succesfully.'),
(50, 1644242148, '197.210.78.174', 'Logged in succesfully.'),
(51, 1646133572, '102.91.4.145', 'Logged in succesfully.'),
(52, 1646134318, '197.210.71.101', 'Logged in succesfully.'),
(53, 1646135681, '102.91.4.145', 'Logged in succesfully.'),
(54, 1646148316, '197.210.71.103', 'Logged in succesfully.'),
(55, 1646817733, '197.210.70.237', 'Logged in succesfully.'),
(56, 1646916141, '197.210.71.151', 'Logged in succesfully.'),
(57, 1646917964, '102.91.4.211', 'Logged in succesfully.'),
(58, 1648031707, '197.210.53.49', 'Logged in succesfully.'),
(59, 1658696605, '105.112.227.125', 'Logged in succesfully.'),
(60, 1658696701, '105.112.227.125', 'Logged in succesfully.'),
(61, 1658828490, '105.112.176.193', 'Logged in succesfully.');

-- --------------------------------------------------------

--
-- Table structure for table `matrices_completed`
--

CREATE TABLE `matrices_completed` (
  `matrix_id` int(11) NOT NULL,
  `place_id` int(11) DEFAULT '0',
  `z_date` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrices_completed`
--

INSERT INTO `matrices_completed` (`matrix_id`, `place_id`, `z_date`) VALUES
(1, 1, 1638258871),
(2, 2, 1638432757),
(3, 4, 1641375306),
(4, 3, 1642066692),
(5, 6, 1646136646);

-- --------------------------------------------------------

--
-- Table structure for table `matrix`
--

CREATE TABLE `matrix` (
  `matrix_id` int(11) NOT NULL,
  `m_level` int(11) DEFAULT '0',
  `host_id` int(11) DEFAULT '0',
  `host_matrix` int(11) DEFAULT '0',
  `referrer_id` int(11) DEFAULT '0',
  `referrer_matrix` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `member_matrix` int(11) DEFAULT '0',
  `z_date` int(11) DEFAULT '0',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrix`
--

INSERT INTO `matrix` (`matrix_id`, `m_level`, `host_id`, `host_matrix`, `referrer_id`, `referrer_matrix`, `member_id`, `member_matrix`, `z_date`, `is_completed`) VALUES
(1, 0, 16, 1, 0, 0, 0, 0, 0, 0),
(2, 1, 17, 1, 0, 0, 0, 0, 0, 0),
(3, 0, 19, 1, 0, 0, 0, 0, 0, 0),
(4, 0, 19, 1, 0, 0, 0, 0, 0, 0),
(5, 1, 22, 1, 0, 0, 0, 0, 0, 0),
(6, 0, 25, 1, 0, 0, 0, 0, 0, 0),
(7, 1, 26, 1, 0, 0, 0, 0, 0, 0),
(8, 1, 25, 1, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `matrixes`
--

CREATE TABLE `matrixes` (
  `matrix_id` int(11) NOT NULL,
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(3) DEFAULT '0',
  `depth` int(3) DEFAULT '0',
  `entrance_fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_mode` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixes`
--

INSERT INTO `matrixes` (`matrix_id`, `title`, `width`, `depth`, `entrance_fee`, `is_mode`, `is_active`) VALUES
(1, 'Forced Matrix', 2, 1, 10.00, 1, 1),
(2, 'Cycling Matrix', 2, 2, 10500.00, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `replica` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_replica` tinyint(1) NOT NULL DEFAULT '0',
  `is_a_replica` tinyint(1) NOT NULL DEFAULT '0',
  `enroller_id` int(11) NOT NULL DEFAULT '0',
  `passwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `street` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `postal` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reg_date` int(11) NOT NULL DEFAULT '0',
  `last_access` int(11) NOT NULL DEFAULT '0',
  `m_level` int(3) NOT NULL DEFAULT '0',
  `processor` int(11) NOT NULL DEFAULT '0',
  `account_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `bank_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `quant_pay` int(5) NOT NULL DEFAULT '0',
  `ip_check` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pin_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_dead` tinyint(1) NOT NULL DEFAULT '0',
  `date_active` int(11) DEFAULT '0',
  `b1` int(11) DEFAULT '0',
  `b3` int(11) DEFAULT '0',
  `b5` int(11) DEFAULT '0',
  `prelaunch_norif` int(1) DEFAULT '0',
  `alert_data` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `username`, `replica`, `is_replica`, `is_a_replica`, `enroller_id`, `passwd`, `email`, `first_name`, `last_name`, `street`, `city`, `state`, `country`, `postal`, `phone`, `reg_date`, `last_access`, `m_level`, `processor`, `account_id`, `account_name`, `bank_name`, `quant_pay`, `ip_check`, `ip_address`, `pin_code`, `is_active`, `is_dead`, `date_active`, `b1`, `b3`, `b5`, `prelaunch_norif`, `alert_data`) VALUES
(1, 'admin', 'justyce', 1, 1, 0, '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 'Admin', 'Admin', '', '', '', '', '', '', 1636261229, 1656759374, 2, 0, '', '', '', 0, 0, '185.177.190.216', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(2, 'justyce', '', 0, 0, 1, 'd386618ecf5864d411ac5fad1dbecda4', 'justicechinemelum@gmail.com', 'Justice', 'Chinemelum', '', '', '', '', '', '07062487290', 1637137514, 1637257394, 2, 0, '1234', 'xxx', 'xxx', 0, 0, '102.91.5.30', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(3, 'lolojustice', '', 0, 0, 1, 'f9b2415293861be6aa2be41413a7add9', 'nwannekajustice@gmail.com', 'Lawrencia', 'Clement', '', '', '', '', '', '08137242004', 1637253013, 1637257585, 2, 0, '1234', 'xxxx', 'xxxx', 0, 0, '197.210.71.101', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(4, 'Glory192', '', 0, 0, 2, '05feab3cdc08ba8ab9210416031980ac', 'gloryokoro092@gmail.com', 'Glory', 'Okoro', '', '', '', '', '', '08083105333', 1637264738, 1637266825, 1, 0, '3034965389', 'Glory Okoro Chidinma', 'Firstbank', 0, 0, '105.112.50.100', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(5, 'Esther2000', '', 0, 0, 3, '546a7edb7d717e4bca588dacffa9482b', 'affiaesther32@gmail.com', 'Esther', 'Affia', '', '', '', '', '', '08121647635', 1637265139, 1637266862, 1, 0, '3115616979', 'Affia Esther Chioma', 'Firstbank', 0, 0, '105.112.50.100', '', 0, 0, 0, 0, 0, 0, 0, NULL),
(6, 'Ekum', '', 0, 0, 2, '06aa4449f425c9205f7529e394ccb469', 'ehiadole@gmail.com', 'Ehi', 'Blessing', '', '', '', '', '', '08059682923', 1637313377, 1641581106, 1, 0, '3036830542', 'Ehi Blessing Adole', 'First bank', 0, 0, '197.210.76.75', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(7, 'Godwin', '', 0, 0, 3, 'b866e790bb1a47b5765d1dae06ade181', 'godwinbuhari020@gmail.com', 'Godwin', 'Buhari', '', '', '', '', '', '07052777253', 1637323555, 1637324138, 1, 0, '2083764109', 'Godwin Buhari', 'Zenith Bank', 0, 0, '197.210.76.192', '', 0, 0, 0, 0, 0, 0, 0, NULL),
(8, 'ogabuchi', '', 0, 0, 6, '06aa4449f425c9205f7529e394ccb469', 'Onyebuchialifi@gmail.com', 'Onyebuchi', 'Alifi', '', '', '', '', '', '08069065706', 1637440194, 1637447808, 1, 0, '0211514410', 'Onyebuchi Alifi', 'Gtbank', 0, 0, '197.210.70.204', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(9, 'zainab', '', 0, 0, 1, '872e309263b3061b9e6960271c04548b', 'zainabmuhammad2373@gmail.com', 'Zainab', 'Muhammad', '', '', '', '', '', '08033221011', 1637748311, 1637748521, 1, 0, 'Zainab Muhammad', '2050156412', 'Zenith', 0, 0, '197.210.71.125', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(10, 'rosemary', '', 0, 0, 1, 'e10adc3949ba59abbe56e057f20f883e', 'maryrosengoziokafor@yahoo.com', 'Rosemary', 'Okafor', '', '', '', '', '', '08063162505', 1638256228, 0, 2, 0, '123456', 'xxx', 'xxx', 0, 0, '', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(11, 'admin2', '', 0, 0, 1, 'f0a7766c9d882b2737c8d8892a70560e', 'greengenerationagroltd@gmail.com', 'admin2', 'admin2', '', '', '', '', '', '00000000', 1638256333, 1641303711, 1, 0, '123456', 'xxx', 'xxx', 0, 0, '105.112.101.149', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(12, 'admin3', '', 0, 0, 1, 'e10adc3949ba59abbe56e057f20f883e', 'admin3@greenagroportal.com', 'admin3', 'admin3', '', '', '', '', '', '123456', 1638256426, 0, 2, 0, '123456', 'xxxx', 'xxxx', 0, 0, '', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(13, 'admin4', '', 0, 0, 1, 'e10adc3949ba59abbe56e057f20f883e', 'admin4@greenagroportal.com', 'admin4', 'admin4', '', '', '', '', '', '07062487290', 1638256494, 0, 1, 0, '123456', 'xxx', 'xxx', 0, 0, '', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(14, 'Flamoro', '', 0, 0, 1, 'e316cac6a80bb7b8adaf7b6fde6d4c08', 'olofamajo1@gmail.com', 'Abdulhakeem', 'Mustapha', '', '', '', '', '', '07030842239', 1638298345, 1638298363, 0, 0, '0154000715', 'Abdulhakeem Mustapha', 'GTBank', 0, 0, '102.91.4.234', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(15, 'admin5', '', 0, 0, 1, 'e10adc3949ba59abbe56e057f20f883e', 'admin5@greenagroportal.com', 'admin5', 'admin5', 'address1', 'Nyanya', 'abuja', 'Nigeria', '', '7087985010', 1638362279, 1638362296, 0, 0, 'xxxxx', 'xxx', 'xx', 0, 0, '105.112.50.13', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(16, 'Olivokoro', '', 0, 0, 2, 'a0f1e8055c831f4d5a2e7f02c7abbceb', 'okorojiolive2@gmail.com', 'Olive', 'Okoroji', '74, Abidjan Street.  Wuse Zone 3.', 'Federal Teritory Capital, FCT.', 'Abuja', 'Nigeria', '', '07060724708', 1638431099, 0, 0, 0, '0169808133', 'Olive Ijeoma Okoroji', 'GTB', 0, 0, '', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(17, 'Livyjay02', '', 0, 0, 2, '1dadd621f19bf9ffe075b6aa91936f54', 'okorojiolive@gmail.com', 'Olive', 'Okoroji', '74, Abidjan Street.  Wuse Zone 3.', 'Federal Teritory Capital, FCT.', 'Abuja', 'Nigeria', '', '07060724708', 1638431422, 1638611013, 1, 0, '0169808133', 'Olive Ijeoma Okoroji', 'GTB', 0, 0, '197.210.70.177', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(18, 'hapbas', '', 0, 0, 4, 'e10adc3949ba59abbe56e057f20f883e', 'hapbas@greenagroportal.com', 'HAPPINESS', 'BASSY', '053NAF CAMP', 'ABUJA', 'ABUJA', 'Nigeria', '', '08065352033', 1638628130, 1638628460, 1, 0, '2064403052', 'ISAH SABDAT', 'UBA', 0, 0, '105.112.123.12', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(19, 'judith001', '', 0, 0, 17, '4a75bfcad51e0d46d758daa93a5149cb', 'JV041741@gmail.com', 'JUDITH VICTOR', 'BAWA BAGAI', 'ABUJA', 'ABUJA', 'KADUNA', 'Nigeria', '', '08064346087', 1638629647, 1638629668, 1, 0, '0030011421', 'ACCESS', 'JUDITH VICTOR BAWA', 0, 0, '105.112.123.12', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(20, 'Folamax', '', 0, 0, 3, 'c4d057c8ad61e180a0766244861fc4d2', 'yomdek4real@yahoo.com', 'ADEWALE TITILAYO.A', 'ABOSEDE', 'JIKOYI PHASE 3SLONDON', 'ABUJA', 'OGUN', 'Nigeria', '', '08060736613', 1638784336, 1638784428, 1, 0, '3035078181', 'Ogundeko Titilayo.Abosede', 'FIRST BANK', 0, 0, '105.112.51.192', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(21, 'Chidon', '', 0, 0, 4, 'e10adc3949ba59abbe56e057f20f883e', 'donohanekwu@gmail.com', 'DONATUS', 'OHANEKWU', 'ZONE7 NEW NYANYA BEHIND SECRETARIAT', 'ABUJA', 'IMO', 'Nigeria', '', '09122436648', 1638865466, 1638865497, 1, 0, '0061170842', 'DONATUS OHANEKWU', 'ACCESS BANK', 0, 0, '105.112.105.185', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(22, 'Tedet', '', 0, 0, 17, '0acf03f408f90ea0dcba786d300620db', 'tonyedetbagai@gmail.com', 'VICTOR', 'EDET-BAGAI', '10 EKPO EYO LANE', 'ABUJA', 'CALABAR', 'Nigeria', '', '08063407392', 1638960002, 1639509157, 1, 0, '3053437281', 'VICTOR ANTHONY EDET-BAGAI', 'FBN', 0, 0, '105.112.229.195', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(23, 'Amido', '', 0, 0, 17, '14c7eca07aae3fc68903321ffdbea120', 'ebohamido@gmail.com', 'Amido', 'Eboh', 'Jedo Estate airport road Lugbe', 'Federal Teritory Capital, FCT.', 'Abuja', 'Nigeria', '', '0802177138', 1640288709, 1640292341, 1, 0, '3004110360', 'Amido Eboh', 'FBN', 0, 0, '197.210.71.99', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(24, 'MBLOVE', '', 0, 0, 2, '8714cb114dcf3ab05825b33f1daa84f6', 'igwecjay@gmail.com', 'Mabel', 'John', 'Jikwoyi by sada Cruz', 'Jikwoyi', 'Abuja', 'Nigeria', '', '07031608107', 1641146734, 0, 1, 0, '0133533098', 'Mabel John', 'Union bank', 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, NULL),
(25, 'Love', '', 0, 0, 2, 'e10adc3949ba59abbe56e057f20f883e', 'Preciouspeace3006@gmail.com', 'John', 'Precious', 'Mararaba', 'Abuja', 'Enugu', 'Nigeria', '', '07017309695', 1641310526, 1657325582, 1, 0, '0531668323', 'John Adaku', 'G.T.B', 0, 0, '105.112.181.181', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(26, 'tata01', '', 0, 0, 17, '8084c67b1cc1af8ff9ed18d488fd214f', 'Josephineanene016@gmail.com', 'Anene', 'Josephine', 'Abuja', 'Abuja', 'Abuja', 'Nigeria', '', '08060930644', 1641989871, 1641989881, 1, 0, '0053110234', 'Josephine Anene', 'G.T.B', 0, 0, '105.112.125.91', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(27, 'AGNES', '', 0, 0, 3, '827ccb0eea8a706c4c34a16891f84e7b', 'Agnes@gmail.com', 'AMODU', 'AGNES', 'ABUJA', 'ABUJA', 'KOGI', 'Nigeria', '', '08101295547', 1642062136, 1646936796, 1, 0, '2058486452', 'AGNES JUMNI AMODU', 'UBA', 0, 0, '105.112.114.124', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(28, 'Owoi', '', 0, 0, 27, 'e10adc3949ba59abbe56e057f20f883e', 'owoichofriday10@gmail.com', 'OWOICHO', 'FRIDAY', 'ABUJA', 'ABUJA', 'BENUE', 'Nigeria', '', '07014690239', 1642514881, 1643018814, 1, 0, '3092970468', 'OWOICHO FRIDAY', 'FIRST BANK', 0, 0, '105.112.114.130', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(29, 'Memu', '', 0, 0, 27, 'ee25f924b7df4d4fb93b3da96ee342b1', 'Memunatu@greenagroportal.com', 'ABUKEREM', 'MEMUNATU', 'ABUJA', 'ABUJA', 'KOGI', 'Nigeria', '', '08132662553', 1643019234, 1643867409, 1, 0, '12344', 'ABUKEREM MEMUNATU', 'G.T.B', 0, 0, '102.23.96.12', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(30, 'Ruka', '', 0, 0, 29, '8a13dab3f5ec9e22d0d1495c8c85e436', 'Rukayata@greenagroportal.com', 'HASSAN', 'RUKAYATA', 'ABUJA', 'ABUJA', 'KOGI', 'Nigeria', '', '08132662553', 1643020349, 1643867746, 1, 0, '123', 'HASSAN RUKAYATA', 'G.T.B', 0, 0, '102.23.96.11', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(33, 'Ebuno', '', 0, 0, 20, 'e10adc3949ba59abbe56e057f20f883e', 'Simidele@greenagroportal.com', 'SIMIDELE', 'OLUBUNMI', 'ABUJA', 'ABUJA', 'EKITI', 'Nigeria', '', '07036634810', 1644241733, 1644241767, 1, 0, '30268928888', 'SIMIDELE OLUBUNM EBUNOLUWA', 'FIRST BANK', 0, 0, '105.112.114.5', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(31, 'Anna', '', 0, 0, 25, '55d491cf951b1b920900684d71419282', 'anabel@greenagroportal.com', 'KELECHI', 'ANABEL', 'ABUJA', 'ABUJA', 'NSUKA', 'Nigeria', '', '08058552226', 1643104747, 1662119255, 1, 0, '6002392536', 'KELECHI KENNETH MAMA', 'KEYSTONE', 0, 0, '105.112.122.218', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(35, 'yehemia', '', 0, 0, 2, '8b7bff1433cc105ed0eb75410c19a51a', 'chidinmamary03@gmail.com', 'Chidinma', 'Yeheshua', 'wunba', 'apo', 'Abuja', 'Nigeria', '', '08146063049', 1646136626, 1646142867, 1, 0, '2130003838', 'eneh yeheshua chidinma', 'zenitbank', 0, 0, '129.205.124.17', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(36, 'Rach', '', 0, 0, 25, 'd91c61df35ce96bb72ca321a0fe967f3', 'Ali@greenagroportal.com', 'Ali', 'Ochigbi', 'Maraba', 'Abuja', 'kogi', 'Nigeria', '', '0701309695', 1646813400, 1646813600, 1, 0, '2040618261', 'Ali Ochigbo', 'U.B.A', 0, 0, '105.112.96.214', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(37, 'Jose', '', 0, 0, 27, 'e10adc3949ba59abbe56e057f20f883e', 'Fridayjoseph2020@gmail.com', 'Joseph', 'friday', 'Nyanya', 'Abuja', 'Kaduna', 'Nigeria', '', '07087204164', 1646915950, 1646936682, 1, 0, '0247525111', 'Abuchi Joseph Friday', 'wama', 0, 0, '105.112.114.124', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(38, 'Josephfriday', '', 0, 0, 1, 'ae970186862939f23ec5ab7ffaaf0d2c', 'Josephfriday411@gmail.com', 'Friday', 'Joseph', 'Nyanya gwagwalape phase 1', 'Abuja', 'Kaduna state', 'Nigeria', '', '07087204164', 1647095568, 0, 0, 0, '0247525111', 'Abuchi Friday Joseph', 'Wema bank', 0, 0, '', '', 1, 0, 0, 0, 0, 0, 0, NULL),
(39, 'Denn', '', 0, 0, 25, '149787a6b7986f31b3dcc0e4e857cd2a', 'Dennis@greenagroportal.com', 'Makwe', 'Dennis', 'Abuja', 'Abuja', 'Enugu', 'Nigeria', '', '08167641859', 1647982917, 1647983315, 1, 0, '0027846358', 'Makwe Dennis', 'stanbic ibtc', 0, 0, '41.190.14.5', '', 1, 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `txid` varchar(64) DEFAULT NULL,
  `member_id` int(11) DEFAULT '0',
  `name_member_id` int(11) DEFAULT '0',
  `to_member_id` int(11) DEFAULT '0',
  `subject` varchar(512) DEFAULT '',
  `body` text,
  `date` int(11) DEFAULT '0',
  `attach` varchar(1024) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `txid`, `member_id`, `name_member_id`, `to_member_id`, `subject`, `body`, `date`, `attach`, `is_read`, `is_deleted`) VALUES
(63, '2ae67f3b83cac9772b8f90ec83090d9b', 1, 3, 3, 'My message', '', 1484636813, NULL, 0, 0),
(55, '702641fc024fb873c69e6c4ef465f37f', 1, 2, 2, 'RE: 1&amp;gt;2', '', 1484393922, NULL, 0, 0),
(56, '226786203465ecfa01815f44508bf620', 2, 1, 2, 'RE: 1&amp;gt;2', '', 1484393922, NULL, 1, 0),
(61, 'dbac849aee88d6d73722aca3e628a5e0', 1, 2, 2, '1&amp;gt;2', '', 1484394819, '34351071.jpg', 1, 0),
(62, '86a2fe69475e04648680e657a9b90230', 2, 1, 2, '1&amp;gt;2', '', 1484394819, '34351071.jpg', 1, 0),
(58, '161b4820f922a8e6d24b60aa6beade52', 1, 2, 1, 'RE: 1&amp;gt;2', '', 1484394226, NULL, 1, 0),
(53, '557547181d19b91977a666dd7dc66ece', 1, 2, 2, '1&amp;gt;2', '', 1484393874, NULL, 1, 0),
(54, '0024c94a13756ba0d009676f718b1c95', 2, 1, 2, '1&amp;gt;2', '', 1484393874, NULL, 1, 0),
(60, 'd2a8890edd87d09153813cb3dfede0f6', 1, 2, 1, 'RE: RE: 1&amp;gt;2', '', 1484394237, NULL, 1, 0),
(93, '309fda9c60b55fa77413a7b2cebccd49', 1, 3, 3, 'RE: hi Attach', 'Glad to hear you', 1484739922, '34351071.jpg', 0, 0),
(92, 'ee52c6c5f0632bce6871b5101680edcd', 3, 1, 3, 'RE: hi', 'Very nice picture', 1484739880, NULL, 1, 0),
(66, '20d003dd105af52a3663b6e1074b3fd0', 1, 3, 1, 'RE: My message', 'cool', 1484636887, NULL, 1, 0),
(68, 'e158a0c11918988030fd922d176db73b', 1, 3, 1, 'RE: My message', '', 1484733819, NULL, 1, 0),
(91, '771866731bcc6272b50c9ef146643492', 1, 3, 3, 'RE: hi', 'Very nice picture', 1484739880, NULL, 0, 0),
(70, '0b21805b1430fd673b40885d4451378c', 1, 3, 1, 'RE: My message', '', 1484733852, NULL, 1, 0),
(90, 'ad6b204b25effcc5861dc68844820f78', 1, 3, 1, 'hi', 'Glad to hear you', 1484739762, 'test.jpg', 1, 0),
(72, '7efe24f0528ab1bfe00ad786b370a486', 2, 3, 2, 'hi', 'ge', 1484734300, NULL, 1, 0),
(73, '88e71544bda053f7ee04dfed8b8f4be0', 2, 3, 3, 'RE: hi', 'hi there', 1484734332, NULL, 1, 0),
(89, '2d753264a84106a023d6ea04cdb507f4', 3, 1, 1, 'hi', 'Glad to hear you', 1484739762, 'test.jpg', 0, 0),
(76, '46afefb7c81d8b17bbd8e9899dcec645', 2, 3, 2, 'RE: RE: hi', 'gfg', 1484734364, NULL, 0, 0),
(88, '96381b1697c37a8fbc22ce740ef5ed80', 3, 1, 3, 'RE: Hi admin', 'Hi test1!\r\n\r\n\r\nhere is the text', 1484739732, NULL, 1, 0),
(78, 'e3fe578f8090f3d8c19ca89d31278fd5', 2, 3, 2, 'RE: RE: RE: hi', 'gfg', 1484734375, 'Customer-support-girl-wearing-headsets.jpg', 1, 0),
(79, 'd3523b72cea372b0f714b08d330c1129', 2, 3, 3, 'RE: RE: RE: RE: hi', 'cool', 1484734425, NULL, 1, 0),
(87, 'b91c06674dec97604360c56a518d7c32', 1, 3, 3, 'RE: Hi admin', 'Hi test1!\r\n\r\n\r\nhere is the text', 1484739732, NULL, 0, 0),
(81, '6b4c6bd48cac3a0b3084a997ba4c6f04', 2, 3, 3, 'RE: RE: RE: RE: hi', 'gfg', 1484734445, NULL, 0, 0),
(86, '7ecec086abcf18ca40b0de83d975cdd3', 1, 3, 1, 'Hi admin', 'here is the text', 1484739706, NULL, 1, 0),
(84, '4cec0832e9c93a2dcae15f05395de8c1', 2, 3, 2, 'RE: RE: RE: RE: RE: hi', 'gfg', 1484734473, NULL, 0, 0),
(85, 'ec3fd10387bb3384833872accf616547', 3, 1, 1, 'Hi admin', 'here is the text', 1484739706, NULL, 0, 0),
(94, 'b913cd81c94887855edad883075459a3', 3, 1, 3, 'RE: hi Attach', 'Glad to hear you', 1484739922, '34351071.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_date` int(11) NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `article` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `destination` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_stats`
--

CREATE TABLE `online_stats` (
  `online_stat_id` int(11) NOT NULL,
  `session_id` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `z_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `online_stats`
--

INSERT INTO `online_stats` (`online_stat_id`, `session_id`, `member_id`, `z_date`) VALUES
(88031, '', 0, 1667887026);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `order_index` int(5) NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `in_menu` tinyint(1) NOT NULL DEFAULT '0',
  `is_member` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `level1` tinyint(1) NOT NULL DEFAULT '0',
  `level2` tinyint(1) NOT NULL DEFAULT '0',
  `level3` tinyint(1) NOT NULL DEFAULT '0',
  `level4` tinyint(1) NOT NULL DEFAULT '0',
  `level5` tinyint(1) NOT NULL DEFAULT '0',
  `level6` tinyint(1) NOT NULL DEFAULT '0',
  `level7` tinyint(1) NOT NULL DEFAULT '0',
  `level8` tinyint(1) NOT NULL DEFAULT '0',
  `level9` tinyint(1) NOT NULL DEFAULT '0',
  `level10` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `order_index`, `title`, `menu_title`, `content`, `keywords`, `description`, `in_menu`, `is_member`, `is_active`, `level1`, `level2`, `level3`, `level4`, `level5`, `level6`, `level7`, `level8`, `level9`, `level10`) VALUES
(1, 1, 'Start Page', 'Home', '', '', '', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 1, 'Terms and Conditions', 'Terms and Conditions', '&lt;p&gt;Green Genertion Agro Ltd Terms and Conditions Policy&lt;/p&gt;\r\n&lt;p&gt;Welcome to Green Genertion Agro Ltd These terms and conditions outline the rules and regulations for the use ofGreen Genertion Agro Ltd&rsquo;s Website.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Green Genertion Agro Ltd is located at: , Suite A 18 Powa International Market Nyanya Abuja.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;By  accessing this website we assume you accept these terms and conditions  in full. Do not continue to use Green Genertion Agro Ltd&rsquo;s website if you do not  accept all of the terms and conditions stated on this page.&lt;/p&gt;\r\n&lt;p&gt;The  following terminology applies to these Terms and Conditions, Privacy  Statement and Disclaimer Notice and any or all Agreements: &lt;strong&gt;Client&lt;/strong&gt;, &lt;strong&gt;You&lt;/strong&gt; and &lt;strong&gt;Your&lt;/strong&gt; refers to you, the person accessing this website and accepting the Company&rsquo;s terms and conditions. &lt;strong&gt;The Company&lt;/strong&gt;, &lt;strong&gt;Ourselves&lt;/strong&gt;, &lt;strong&gt;We&lt;/strong&gt;, &lt;strong&gt;Our&lt;/strong&gt; and &lt;strong&gt;Us&lt;/strong&gt;, refers to our Company. &lt;strong&gt;Party&lt;/strong&gt;, &lt;strong&gt;Parties&lt;/strong&gt;, or &lt;strong&gt;Us&lt;/strong&gt;, refers to both the Client and ourselves, or either the Client or ourselves.&lt;/p&gt;\r\n&lt;p&gt;All  terms refer to the offer, acceptance and consideration of payment  necessary to undertake the process of our assistance to the Client in  the most appropriate manner, whether by formal meetings of a fixed  duration, or any other means, for the express purpose of meeting the  Client&rsquo;s needs in respect of provision of the Company&rsquo;s stated  services/products, in accordance with and subject to, prevailing law of  (Address).&lt;/p&gt;\r\n&lt;p&gt;Any use of the above terminology or other words in the  singular, plural, capitalisation and/or he/she or they, are taken as  interchangeable and therefore as referring to same.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Cookies&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;We  employ the use of cookies. By using Green Genertion Agro Ltd&rsquo;s website you consent  to the use of cookies in accordance with (Store Name)&rsquo;s privacy policy.  Most of the modern day interactive websites use cookies to enable us to  retrieve user details for each visit.&lt;/p&gt;\r\n&lt;p&gt;Cookies are used in some  areas of our site to enable the functionality of this area and ease of  use for those people visiting. Some of our affiliate / advertising  partners may also use cookies.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;License&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Unless  otherwise stated, Green Genertion Agro Ltd and/or its licensors own the  intellectual property rights for all material on Green Genertion Agro Ltd.&lt;/p&gt;\r\n&lt;p&gt;All  intellectual property rights are reserved. You may view and/or print  pages from https://greenagroportal.com/ for your own personal use subject to restrictions  set in these terms and conditions.&lt;/p&gt;\r\n&lt;p&gt;You must not:&lt;/p&gt;\r\n&lt;ul&gt;\r\n    &lt;li&gt;Republish material from https://greenagroportal.com/.&lt;/li&gt;\r\n    &lt;li&gt;Sell, rent or sub-license material from https://greenagroportal.com/.&lt;/li&gt;\r\n    &lt;li&gt;Reproduce, duplicate or copy material from https://greenagroportal.com/.&lt;/li&gt;\r\n    &lt;li&gt;Redistribute content from Green Genertion Agro Ltd (unless content is specifically made for redistribution).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;strong&gt;Disclaimer&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;To  the maximum extent permitted by applicable law, we exclude all  representations, warranties and conditions relating to our website and  the use of this website (including, without limitation, any warranties  implied by law in respect of satisfactory quality, fitness for purpose  and/or the use of reasonable care and skill).&lt;/p&gt;\r\n&lt;p&gt;Nothing in this disclaimer will:&lt;/p&gt;\r\n&lt;ul&gt;\r\n    &lt;li&gt;Limit or exclude our or your liability for death or personal injury resulting from negligence.&lt;/li&gt;\r\n    &lt;li&gt;Limit or exclude our or your liability for fraud or fraudulent misrepresentation.&lt;/li&gt;\r\n    &lt;li&gt;Limit any of our or your liabilities in any way that is not permitted under applicable law.&lt;/li&gt;\r\n    &lt;li&gt;Or exclude any of our or your liabilities that may not be excluded under applicable law.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;The limitations and exclusions of liability set out in this Section and elsewhere in this disclaimer:&lt;/p&gt;\r\n&lt;ol&gt;\r\n    &lt;li&gt;are subject to the preceding paragraph; and &lt;/li&gt;\r\n    &lt;li&gt;govern  all liabilities arising under the disclaimer or in relation to the  subject matter of this disclaimer, including liabilities that arise in  contract, tort (including negligence) and for breach of statutory duty.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;p&gt;To  the extent that the website and the information and services on the  website are provided free of charge, we will not be liable for any loss  or damage of any nature.&lt;/p&gt;', '', '', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(10, 3, 'Privacy Policy', 'privacy', '&lt;p&gt;&lt;h1&gt;Privacy Policy&lt;/h1&gt;&lt;br /&gt;\r\n&lt;p&gt;Last updated: November 22, 2021&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the &lt;a href=&quot;https://www.freeprivacypolicy.com/free-privacy-policy-generator/&quot; target=&quot;_blank&quot;&gt;Privacy Policy Generator&lt;/a&gt;.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h1&gt;Interpretation and Definitions&lt;/h1&gt;&lt;br /&gt;\r\n&lt;h2&gt;Interpretation&lt;/h2&gt;&lt;br /&gt;\r\n&lt;p&gt;The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h2&gt;Definitions&lt;/h2&gt;&lt;br /&gt;\r\n&lt;p&gt;For the purposes of this Privacy Policy:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Account&lt;/strong&gt; means a unique account created for You to access our Service or parts of our Service.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Company&lt;/strong&gt; (referred to as either &amp;quot;the Company&amp;quot;, &amp;quot;We&amp;quot;, &amp;quot;Us&amp;quot; or &amp;quot;Our&amp;quot; in this Agreement) refers to Green Generation Agro Limited, Suite A18 Powa Plaza Nyanya, Abuja.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Cookies&lt;/strong&gt; are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Country&lt;/strong&gt; refers to:&nbsp; Nigeria&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Device&lt;/strong&gt; means any device that can access the Service such as a computer, a cellphone or a digital tablet.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Personal Data&lt;/strong&gt; is any information that relates to an identified or identifiable individual.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Service&lt;/strong&gt; refers to the Website.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Service Provider&lt;/strong&gt; means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Usage Data&lt;/strong&gt; refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Website&lt;/strong&gt; refers to Green Agro Portal, accessible from &lt;a href=&quot;https://greenagroportal.com&quot; rel=&quot;external nofollow noopener&quot; target=&quot;_blank&quot;&gt;https://greenagroportal.com&lt;/a&gt;&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;You&lt;/strong&gt; means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;br /&gt;\r\n&lt;h1&gt;Collecting and Using Your Personal Data&lt;/h1&gt;&lt;br /&gt;\r\n&lt;h2&gt;Types of Data Collected&lt;/h2&gt;&lt;br /&gt;\r\n&lt;h3&gt;Personal Data&lt;/h3&gt;&lt;br /&gt;\r\n&lt;p&gt;While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;Email address&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;First name and last name&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;Phone number&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;Address, State, Province, ZIP/Postal code, City&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;Usage Data&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;br /&gt;\r\n&lt;h3&gt;Usage Data&lt;/h3&gt;&lt;br /&gt;\r\n&lt;p&gt;Usage Data is collected automatically when using the Service.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Usage Data may include information such as Your Device&#039;s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h3&gt;Tracking Technologies and Cookies&lt;/h3&gt;&lt;br /&gt;\r\n&lt;p&gt;We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;Cookies or Browser Cookies.&lt;/strong&gt; A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;Flash Cookies.&lt;/strong&gt; Certain features of our Service may use local stored objects (or Flash Cookies) to collect and store information about Your preferences or Your activity on our Service. Flash Cookies are not managed by the same browser settings as those used for Browser Cookies. For more information on how You can delete Flash Cookies, please read &amp;quot;Where can I change the settings for disabling, or deleting local shared objects?&amp;quot; available at &lt;a href=&quot;https://helpx.adobe.com/flash-player/kb/disable-local-shared-objects-flash.html#main_Where_can_I_change_the_settings_for_disabling__or_deleting_local_shared_objects_&quot; rel=&quot;external nofollow noopener&quot; target=&quot;_blank&quot;&gt;https://helpx.adobe.com/flash-player/kb/disable-local-shared-objects-flash.html#main_Where_can_I_change_the_settings_for_disabling__or_deleting_local_shared_objects_&lt;/a&gt;&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;Web Beacons.&lt;/strong&gt; Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;br /&gt;\r\n&lt;p&gt;Cookies can be &amp;quot;Persistent&amp;quot; or &amp;quot;Session&amp;quot; Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies: &lt;a href=&quot;https://www.freeprivacypolicy.com/blog/sample-privacy-policy-template/#Use_Of_Cookies_And_Tracking&quot; target=&quot;_blank&quot;&gt;Use of Cookies by Free Privacy Policy&lt;/a&gt;.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;We use both Session and Persistent Cookies for the purposes set out below:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Necessary / Essential Cookies&lt;/strong&gt;&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Type: Session Cookies&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Administered by: Us&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Cookies Policy / Notice Acceptance Cookies&lt;/strong&gt;&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Type: Persistent Cookies&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Administered by: Us&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Purpose: These Cookies identify if users have accepted the use of cookies on the Website.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;Functionality Cookies&lt;/strong&gt;&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Type: Persistent Cookies&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Administered by: Us&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;br /&gt;\r\n&lt;p&gt;For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h2&gt;Use of Your Personal Data&lt;/h2&gt;&lt;br /&gt;\r\n&lt;p&gt;The Company may use Personal Data for the following purposes:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;To provide and maintain our Service&lt;/strong&gt;, including to monitor the usage of our Service.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;To manage Your Account:&lt;/strong&gt; to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;For the performance of a contract:&lt;/strong&gt; the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;To contact You:&lt;/strong&gt; To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application&#039;s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;To provide You&lt;/strong&gt; with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;To manage Your requests:&lt;/strong&gt; To attend and manage Your requests to Us.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;For business transfers:&lt;/strong&gt; We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;br /&gt;\r\n&lt;p&gt;&lt;strong&gt;For other purposes&lt;/strong&gt;: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.&lt;/p&gt;&lt;br /&gt;\r\n&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;br /&gt;\r\n&lt;p&gt;We may share Your personal information in the following situations:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;With Service Providers:&lt;/strong&gt; We may share Your personal information with Service Providers to monitor and analyze the use of our Service,&nbsp; to contact You.&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;For business transfers:&lt;/strong&gt; We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;With Affiliates:&lt;/strong&gt; We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;With business partners:&lt;/strong&gt; We may share Your information with Our business partners to offer You certain products, services or promotions.&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;With other users:&lt;/strong&gt; when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;&lt;strong&gt;With Your consent&lt;/strong&gt;: We may disclose Your personal information for any other purpose with Your consent.&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;br /&gt;\r\n&lt;h2&gt;Retention of Your Personal Data&lt;/h2&gt;&lt;br /&gt;\r\n&lt;p&gt;The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h2&gt;Transfer of Your Personal Data&lt;/h2&gt;&lt;br /&gt;\r\n&lt;p&gt;Your information, including Personal Data, is processed at the Company&#039;s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to &mdash; and maintained on &mdash; computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h2&gt;Disclosure of Your Personal Data&lt;/h2&gt;&lt;br /&gt;\r\n&lt;h3&gt;Business Transactions&lt;/h3&gt;&lt;br /&gt;\r\n&lt;p&gt;If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h3&gt;Law enforcement&lt;/h3&gt;&lt;br /&gt;\r\n&lt;p&gt;Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).&lt;/p&gt;&lt;br /&gt;\r\n&lt;h3&gt;Other legal requirements&lt;/h3&gt;&lt;br /&gt;\r\n&lt;p&gt;The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;Comply with a legal obligation&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;Protect and defend the rights or property of the Company&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;Prevent or investigate possible wrongdoing in connection with the Service&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;Protect the personal safety of Users of the Service or the public&lt;/li&gt;&lt;br /&gt;\r\n&lt;li&gt;Protect against legal liability&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;br /&gt;\r\n&lt;h2&gt;Security of Your Personal Data&lt;/h2&gt;&lt;br /&gt;\r\n&lt;p&gt;The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h1&gt;Children&#039;s Privacy&lt;/h1&gt;&lt;br /&gt;\r\n&lt;p&gt;Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent&#039;s consent before We collect and use that information.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h1&gt;Links to Other Websites&lt;/h1&gt;&lt;br /&gt;\r\n&lt;p&gt;Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party&#039;s site. We strongly advise You to review the Privacy Policy of every site You visit.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h1&gt;Changes to this Privacy Policy&lt;/h1&gt;&lt;br /&gt;\r\n&lt;p&gt;We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the &amp;quot;Last updated&amp;quot; date at the top of this Privacy Policy.&lt;/p&gt;&lt;br /&gt;\r\n&lt;p&gt;You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.&lt;/p&gt;&lt;br /&gt;\r\n&lt;h1&gt;Contact Us&lt;/h1&gt;&lt;br /&gt;\r\n&lt;p&gt;If you have any questions about this Privacy Policy, You can contact us:&lt;/p&gt;&lt;br /&gt;\r\n&lt;ul&gt;&lt;br /&gt;\r\n&lt;li&gt;By email: support@greenagroportal.com&lt;/li&gt;&lt;br /&gt;\r\n&lt;/ul&gt;&lt;/p&gt;', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payins`
--

CREATE TABLE `payins` (
  `payins_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `transaction_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `processor` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `z_date` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payins`
--

INSERT INTO `payins` (`payins_id`, `member_id`, `transaction_id`, `amount`, `processor`, `description`, `z_date`, `product_id`) VALUES
(1, 2, '1638258835', 10500.00, '-1', 'Member payment', 1638258835, 0),
(2, 3, '1638258840', 10500.00, '-1', 'Member payment', 1638258840, 0),
(3, 10, '1638258847', 10500.00, '-1', 'Member payment', 1638258847, 0),
(4, 11, '1638258854', 10500.00, '-1', 'Member payment', 1638258854, 0),
(5, 12, '1638258865', 10500.00, '-1', 'Member payment', 1638258865, 0),
(6, 13, '1638258870', 10500.00, '-1', 'Member payment', 1638258870, 0),
(7, 4, '1638258886', 10500.00, '-1', 'Member payment', 1638258886, 0),
(8, 5, '1638258902', 10500.00, '-1', 'Member payment', 1638258902, 0),
(9, 6, '1638258908', 10500.00, '-1', 'Member payment', 1638258908, 0),
(10, 7, '1638258915', 10500.00, '-1', 'Member payment', 1638258915, 0),
(11, 8, '1638258932', 10500.00, '-1', 'Member payment', 1638258932, 0),
(12, 9, '1638258966', 10500.00, '-1', 'Member payment', 1638258966, 0),
(13, 17, '1638432757', 10500.00, '-1', 'Member payment', 1638432757, 0),
(14, 18, '1638630186', 10500.00, '-1', 'Member payment', 1638630186, 0),
(15, 19, '1638630211', 10500.00, '-1', 'Member payment', 1638630211, 0),
(16, 20, '1638784491', 10500.00, '-1', 'Member payment', 1638784491, 0),
(17, 21, '1638875815', 10500.00, '-1', 'Member payment', 1638875815, 0),
(18, 22, '1638966221', 10500.00, '-1', 'Member payment', 1638966221, 0),
(19, 23, '1640291918', 10500.00, '-1', 'Member payment', 1640291918, 0),
(20, 24, '1641146764', 10500.00, '-1', 'Member payment', 1641146764, 0),
(21, 25, '1641375305', 10500.00, '-1', 'Member payment', 1641375305, 0),
(22, 26, '1641990006', 10500.00, '-1', 'Member payment', 1641990006, 0),
(23, 27, '1642066692', 10500.00, '-1', 'Member payment', 1642066692, 0),
(24, 28, '1642676249', 10500.00, '-1', 'Member payment', 1642676249, 0),
(25, 29, '1643019297', 10500.00, '-1', 'Member payment', 1643019297, 0),
(26, 30, '1643033229', 10500.00, '-1', 'Member payment', 1643033229, 0),
(27, 31, '1643205132', 10500.00, '-1', 'Member payment', 1643205132, 0),
(28, 33, '1644242175', 10500.00, '-1', 'Member payment', 1644242175, 0),
(29, 35, '1646136646', 10500.00, '-1', 'Member payment', 1646136646, 0),
(30, 36, '1646817756', 10500.00, '-1', 'Member payment', 1646817756, 0),
(31, 37, '1646916246', 10500.00, '-1', 'Member payment', 1646916246, 0),
(32, 39, '1648031742', 10500.00, '-1', 'Member payment', 1648031742, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payins_log`
--

CREATE TABLE `payins_log` (
  `id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `processor` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `z_date` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `place_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT '0',
  `referrer_place_id` int(11) DEFAULT '0',
  `m_level` int(11) DEFAULT '0',
  `reentry` int(5) NOT NULL DEFAULT '0',
  `z_date` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`place_id`, `member_id`, `referrer_place_id`, `m_level`, `reentry`, `z_date`) VALUES
(1, 1, 0, 1, 1, 1638258788),
(2, 2, 1, 1, 1, 1638258835),
(3, 3, 1, 1, 1, 1638258840),
(4, 10, 2, 1, 1, 1638258847),
(5, 11, 3, 1, 1, 1638258854),
(6, 12, 2, 1, 1, 1638258865),
(7, 13, 3, 1, 1, 1638258871),
(8, 1, 0, 2, 1, 1638258871),
(9, 4, 4, 1, 1, 1638258886),
(10, 5, 5, 1, 1, 1638258902),
(11, 6, 6, 1, 1, 1638258908),
(12, 7, 7, 1, 1, 1638258915),
(13, 8, 11, 1, 1, 1638258932),
(14, 9, 4, 1, 1, 1638258966),
(15, 17, 6, 1, 1, 1638432757),
(16, 2, 8, 2, 1, 1638432757),
(17, 18, 9, 1, 1, 1638630186),
(18, 19, 15, 1, 1, 1638630211),
(19, 20, 5, 1, 1, 1638784491),
(20, 21, 9, 1, 1, 1638875815),
(21, 22, 15, 1, 1, 1638966221),
(22, 23, 18, 1, 1, 1640291918),
(23, 24, 14, 1, 1, 1641146764),
(24, 25, 14, 1, 1, 1641375306),
(25, 10, 8, 2, 1, 1641375306),
(26, 26, 21, 1, 1, 1641990006),
(27, 27, 7, 1, 1, 1642066692),
(28, 3, 16, 2, 1, 1642066692),
(29, 28, 27, 1, 1, 1642676249),
(30, 29, 27, 1, 1, 1643019297),
(31, 30, 30, 1, 1, 1643033229),
(32, 31, 24, 1, 1, 1643205132),
(33, 33, 19, 1, 1, 1644242175),
(34, 35, 11, 1, 1, 1646136646),
(35, 12, 25, 2, 1, 1646136646),
(36, 36, 24, 1, 1, 1646817756),
(37, 37, 29, 1, 1, 1646916247),
(38, 39, 32, 1, 1, 1648031742);

-- --------------------------------------------------------

--
-- Table structure for table `processors`
--

CREATE TABLE `processors` (
  `processor_id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_id` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `routine_url` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extra_field` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `processors`
--

INSERT INTO `processors` (`processor_id`, `code`, `name`, `account_id`, `routine_url`, `extra_field`, `fee`, `is_active`) VALUES
(3, 'alertpay', 'Payza', '', 'https://secure.payza.com/checkout', '', 0.00, 0),
(5, 'solidtrustpay', 'Solid Trust Pay', '', 'https://solidtrustpay.com/handle.php', '', 0.00, 0),
(8, 'paypal', 'PayPal', '', 'https://www.paypal.com/cgi-bin/webscr', '', 0.00, 0),
(9, 'perfectmoney', 'PerfectMoney', '', 'https://perfectmoney.is/api/step1.asp', '', 0.00, 0),
(10, 'egopay', 'EgoPay', '', 'https://www.egopay.com/payments/pay/form', '', 0.00, 0),
(7, 'okpay', 'OkPay', '', 'https://www.okpay.com/process.html', '', 0.00, 0),
(12, 'flutterwave', 'Debit Cards, Bank, USSD', 'FLWPUBK-043b3b7a187a18bd299a998065b7cfc2-X', 'https://checkout.flutterwave.com/v3/hosted/pay', '', 1.40, 1),
(13, 'bank', 'Bank', '000000', '#', '', 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `file` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `photo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `title`, `description`, `price`, `file`, `photo`, `is_active`) VALUES
(2, 3, '5kg Perboiled Rice', '&lt;p&gt;Perboiled Rice By Green Generation Agro Ltd is Stone free, once you place an order, do notify us with your order details for delivery&lt;/p&gt;', 8500.00, '', '2_xwivz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ptools`
--

CREATE TABLE `ptools` (
  `ptool_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `photo` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pub_tickets`
--

CREATE TABLE `pub_tickets` (
  `pub_ticket_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ticket_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_create` int(11) NOT NULL DEFAULT '0',
  `last_update` int(11) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pub_tickets`
--

INSERT INTO `pub_tickets` (`pub_ticket_id`, `first_name`, `last_name`, `email`, `ticket_code`, `subject`, `date_create`, `last_update`, `is_read`, `is_active`) VALUES
(5, 'Fleta', 'Ibbott', 'onlineb2bconsulting@gmail.com', 'olb9ge18', 'Contact Form Marketing', 1655849755, 1655849755, 0, 1),
(6, 'Ralph', 'Pfeifer', 'ralph@makemysitemobile.com', 'nj1bm6ms', 'Convert greenagroportal.com to an app.', 1657052980, 1657052980, 0, 1),
(7, 'Taylor', 'Sligo', 'marketing@leadstree.org', 'k5vtm7ss', 'Last Chance', 1663640584, 1663640584, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pub_ticket_messages`
--

CREATE TABLE `pub_ticket_messages` (
  `pub_ticket_message_id` int(11) NOT NULL,
  `pub_ticket_id` int(11) NOT NULL DEFAULT '0',
  `support_message` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date_post` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pub_ticket_messages`
--

INSERT INTO `pub_ticket_messages` (`pub_ticket_message_id`, `pub_ticket_id`, `support_message`, `message`, `date_post`) VALUES
(7, 5, 0, 'Would you like to send targeted messages to website owners, just like this one?\r\n\r\nContact Page Marketing..  \r\n\r\nWe will deliver your message to website owners, excellent for B2B products.\r\n\r\nhttps://cutt.ly/ChatToUs', 1655849755),
(8, 6, 0, 'Convert greenagroportal.com to an app with one click!\r\n\r\n80% of users browse websites from their phones. \r\n\r\nHave the App send out push notifications without any extra marketing costs!\r\n\r\nMakeMySiteMobile.com', 1657052980),
(9, 7, 0, 'Hello.\r\n\r\nIt is with sad regret to inform you LeadsTree.org is shutting down this week.\r\n\r\nWe have made all our dataabses available at a one-time fee.\r\n\r\nLeadsTree.org', 1663640584);

-- --------------------------------------------------------

--
-- Table structure for table `replicas`
--

CREATE TABLE `replicas` (
  `replica_id` int(11) NOT NULL,
  `order_index` int(11) NOT NULL DEFAULT '0',
  `member_id` int(5) NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `replicas`
--

INSERT INTO `replicas` (`replica_id`, `order_index`, `member_id`, `title`, `menu_title`, `content`, `is_active`) VALUES
(8, 1, 1, 'Home', 'my page', '&lt;p&gt;&amp;nbsp;Join me&lt;/p&gt;', 1);

-- --------------------------------------------------------

--
-- Table structure for table `selected`
--

CREATE TABLE `selected` (
  `selected_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `selected`
--

INSERT INTO `selected` (`selected_id`, `member_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `keyname` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `keyname`, `value`) VALUES
(1, 'AdminUsername', 'admin'),
(2, 'AdminPassword', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'AdminAltPassword', '21232f297a57a5a743894a0e4a801fc3'),
(4, 'SiteTitle', 'Green Generation Agro Distributor Portal'),
(5, 'SiteUrl', 'http://greenagroportal.com/'),
(6, 'PathSite', '/home/lumticetra/public_html/greenagro'),
(7, 'ContactEmail', 'support@greenagroportal.com'),
(8, 'UseSMTPAutorisation', '1'),
(9, 'SMTPServer', 'mail.greenagroportal.com'),
(10, 'SMTPDomain', 'mail.greenagroportal.com'),
(11, 'SMTPUserName', 'support@greenagroportal.com'),
(12, 'SMTPPassword', 'GreenAgro2121@#'),
(13, 'SecurityMode', ''),
(14, 'IPAddress', ''),
(15, 'pin_code', ''),
(16, 'PaymentMode', '1'),
(17, 'PaymentModeDate', '1613135472'),
(18, 'payPeriod', '7'),
(19, 'monthPeriod', '999'),
(20, 'LastCronjobStart', '1620295977'),
(21, 'MinCashOut', '5000.00'),
(22, 'warnPeriod', '5'),
(23, 'matrix_mode', '3'),
(24, 'fee', '0.00'),
(25, 'PhotoBigMaxWidth', '400'),
(26, 'PhotoBigMaxHeight', '400'),
(27, 'PhotoSmallMaxWidth', '120'),
(28, 'PhotoSmallMaxHeight', '120'),
(29, 'cycling', '1'),
(30, 'sponsor_amount', '1000.00'),
(31, 'sponsor_quant', '1'),
(32, 'product', 'Product'),
(33, 'subjectMail', 'Welcome to [SiteTitle]'),
(34, 'messageMail', 'Dear [FirstName] [LastName], \r\n\r\nSome message with tags.\r\n\r\nRegards,\r\n[SiteTitle]'),
(35, 'is_replica', '0'),
(36, 'quant_replica', '10'),
(37, 'SerialCode', 'POU0-QQ96-LNK0-LNK0'),
(38, 'StartDate', '1613127531'),
(39, 'AdminMessage', ''),
(40, 'useBanners', '1'),
(41, 'useBalance', '0'),
(42, 'useSecureMembers', '0'),
(43, 'useFoneMailing', '0'),
(44, 'useAutoresponder', '1'),
(45, 'useEshop', '0'),
(46, 'useValidation', '1'),
(47, 'quant_textadds', '0'),
(48, 'quant_textadds_show', '0'),
(49, 'quant_textadds_show_m', '0'),
(50, 'number_turing', '0'),
(51, 'payp_fromcash', '0'),
(52, 'is_pif', '0'),
(53, 'is_pif_cash', '0'),
(54, 'is_random', '0'),
(55, 'currency', '4'),
(56, 'ReferrerUrl', 'username'),
(57, 'FooterContent', 'Copyright © 2021. Powered by <a href=\"http://bakefunnels.com/\">Bakefunnels @ Lumtice Digital Systems</a>'),
(58, 'LicenseNumber', '2WbSDM6o'),
(59, 'access', 'YYTowOnt9'),
(60, 'Commissions_Value', '2'),
(61, 'PRE_LAUNCH', '0'),
(62, 'PRE_LAUNCH_DATE', '0'),
(63, 'matching_bonus', '0'),
(64, 'matching_bonus_value', '0'),
(65, 'time_after_launch', '36'),
(66, 'Carousel_autoplayTimeout', '3000'),
(67, 'SPONSOR_VALUE', '1'),
(70, 'WITHDRAWAL_VALUE', '1'),
(71, 'currency_rate', '1');

-- --------------------------------------------------------

--
-- Table structure for table `shop_fees`
--

CREATE TABLE `shop_fees` (
  `fee_id` int(11) NOT NULL,
  `to_order_index` int(11) NOT NULL DEFAULT '0',
  `plevel` int(3) NOT NULL DEFAULT '0',
  `fee_member` decimal(12,2) NOT NULL DEFAULT '0.00',
  `fee_sponsor` decimal(12,2) NOT NULL DEFAULT '0.00',
  `from_order_index` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_fees`
--

INSERT INTO `shop_fees` (`fee_id`, `to_order_index`, `plevel`, `fee_member`, `fee_sponsor`, `from_order_index`) VALUES
(2, 1, 1, 0.00, 5.00, 1),
(3, 1, 1, 0.00, 5.00, 2),
(4, 1, 1, 0.00, 5.00, 3),
(5, 1, 1, 0.00, 5.00, 4),
(6, 1, 1, 0.00, 5.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `text`, `image`) VALUES
(6, '', 'y3yhj138xyvhaaos1yv1.png'),
(9, '', 'jtdj79gvij3cs9iial9p.png'),
(8, '', 'wz10zt0lwjrbdnlzctso.png');

-- --------------------------------------------------------

--
-- Table structure for table `sn_messages`
--

CREATE TABLE `sn_messages` (
  `id` int(11) NOT NULL,
  `subj` varchar(256) NOT NULL,
  `mess` text NOT NULL,
  `date` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sn_messages_mem`
--

CREATE TABLE `sn_messages_mem` (
  `id` int(11) NOT NULL,
  `mess_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `from_member_id` int(11) NOT NULL DEFAULT '0',
  `to_member_id` int(11) NOT NULL DEFAULT '0',
  `read_mark` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_bonus`
--

CREATE TABLE `sponsor_bonus` (
  `sponsor_bonus_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `sponsored_id` int(11) NOT NULL DEFAULT '0',
  `is_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `z_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sponsor_bonus`
--

INSERT INTO `sponsor_bonus` (`sponsor_bonus_id`, `member_id`, `sponsored_id`, `is_bonus`, `z_date`) VALUES
(1, 1, 2, 1, 1638258835),
(2, 1, 3, 1, 1638258840),
(3, 1, 10, 1, 1638258847),
(4, 1, 11, 1, 1638258854),
(5, 1, 12, 1, 1638258865),
(6, 1, 13, 1, 1638258870),
(7, 2, 4, 1, 1638258886),
(8, 3, 5, 1, 1638258902),
(9, 2, 6, 1, 1638258908),
(10, 3, 7, 1, 1638258915),
(11, 6, 8, 1, 1638258932),
(12, 1, 9, 1, 1638258966),
(13, 2, 17, 1, 1638432757),
(14, 4, 18, 1, 1638630186),
(15, 17, 19, 1, 1638630211),
(16, 3, 20, 1, 1638784491),
(17, 4, 21, 1, 1638875815),
(18, 17, 22, 1, 1638966221),
(19, 17, 23, 1, 1640291918),
(20, 2, 24, 1, 1641146764),
(21, 2, 25, 1, 1641375305),
(22, 17, 26, 1, 1641990006),
(23, 3, 27, 1, 1642066692),
(24, 27, 28, 1, 1642676249),
(25, 27, 29, 1, 1643019297),
(26, 29, 30, 1, 1643033229),
(27, 25, 31, 1, 1643205132),
(28, 20, 33, 1, 1644242175),
(29, 2, 35, 1, 1646136646),
(30, 25, 36, 1, 1646817756),
(31, 27, 37, 1, 1646916246),
(32, 25, 39, 1, 1648031742);

-- --------------------------------------------------------

--
-- Table structure for table `stats_countries`
--

CREATE TABLE `stats_countries` (
  `country_id` int(11) NOT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stats_countries`
--

INSERT INTO `stats_countries` (`country_id`, `country`) VALUES
(1, 'Undefined');

-- --------------------------------------------------------

--
-- Table structure for table `stats_referrals`
--

CREATE TABLE `stats_referrals` (
  `referral_id` int(11) NOT NULL,
  `referral` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stats_referrals`
--

INSERT INTO `stats_referrals` (`referral_id`, `referral`) VALUES
(1, 'No referrer'),
(2, 'https://greenagroportal.com/'),
(3, 'http://greenagroportal.com/administrator/'),
(4, 'http://www.gumbo.com/'),
(5, 'http://greenagroportal.com/blog/'),
(6, 'http://greenagroportal.com/wp/'),
(7, 'http://greenagroportal.com/wordpress/');

-- --------------------------------------------------------

--
-- Table structure for table `stats_views`
--

CREATE TABLE `stats_views` (
  `view_id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL DEFAULT '0',
  `page` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thetime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stats_views`
--

INSERT INTO `stats_views` (`view_id`, `visitor_id`, `page`, `thetime`) VALUES
(1, 1, '/sites/index.php', 1638677543),
(2, 2, '/sites/index.php', 1655672916),
(3, 3, '/sites/index.php', 1656318243),
(4, 3, '/sites/index.php', 1656318246),
(5, 3, '/sites/index.php', 1656318252),
(6, 4, '/sites/index.php', 1658601750),
(7, 4, '/sites/index.php', 1658601751),
(8, 4, '/sites/index.php', 1658601753),
(9, 4, '/sites/index.php', 1658601764),
(10, 4, '/sites/index.php', 1658601785),
(11, 4, '/sites/index.php', 1658601787),
(12, 5, '/sites/index.php', 1660682284),
(13, 6, '/sites/index.php', 1661276296),
(14, 7, '/sites/index.php', 1663048279),
(15, 8, '/sites/index.php', 1663115079),
(16, 9, '/sites/index.php', 1663445574),
(17, 9, '/sites/index.php', 1663445575),
(18, 10, '/sites/index.php', 1663452443),
(19, 10, '/sites/index.php', 1663452445),
(20, 11, '/sites/index.php', 1663628456),
(21, 12, '/sites/index.php', 1663684528),
(22, 13, '/sites/index.php', 1663724164),
(23, 13, '/sites/index.php', 1663724174),
(24, 13, '/sites/index.php', 1663724203),
(25, 13, '/sites/index.php', 1663724205),
(26, 14, '/sites/index.php', 1663854893),
(27, 15, '/sites/index.php', 1664197915),
(28, 16, '/sites/index.php', 1664201301),
(29, 17, '/sites/index.php', 1664425249),
(30, 18, '/sites/index.php', 1664688277),
(31, 19, '/sites/index.php', 1664787957),
(32, 19, '/sites/index.php', 1664787962),
(33, 19, '/sites/index.php', 1664788022),
(34, 19, '/sites/index.php', 1664788027),
(35, 20, '/sites/index.php', 1665068133),
(36, 20, '/sites/index.php', 1665068141),
(37, 21, '/sites/index.php', 1665070481),
(38, 21, '/sites/index.php', 1665070484),
(39, 22, '/sites/index.php', 1665795734),
(40, 22, '/sites/index.php', 1665795737),
(41, 22, '/sites/index.php', 1665795760),
(42, 22, '/sites/index.php', 1665795762),
(43, 23, '/sites/index.php', 1666041648),
(44, 24, '/sites/index.php', 1666066414),
(45, 24, '/sites/index.php', 1666066417),
(46, 24, '/sites/index.php', 1666066474),
(47, 24, '/sites/index.php', 1666066476),
(48, 25, '/sites/index.php', 1666324584),
(49, 26, '/sites/index.php', 1666490797),
(50, 27, '/sites/index.php', 1667468454),
(51, 27, '/sites/index.php', 1667468456),
(52, 27, '/sites/index.php', 1667468486),
(53, 27, '/sites/index.php', 1667468489);

-- --------------------------------------------------------

--
-- Table structure for table `stats_visitors`
--

CREATE TABLE `stats_visitors` (
  `visitor_id` int(11) NOT NULL,
  `ipaddress` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ipref` int(11) NOT NULL DEFAULT '0',
  `country` int(11) NOT NULL DEFAULT '0',
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thetime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stats_visitors`
--

INSERT INTO `stats_visitors` (`visitor_id`, `ipaddress`, `ipref`, `country`, `city`, `thetime`) VALUES
(1, '5.188.62.214', 1, 1, 'Undefined', 1638677543),
(2, '104.248.152.167', 1, 1, 'Undefined', 1655672916),
(3, '91.227.68.162', 1, 1, 'Undefined', 1656318243),
(4, '181.214.173.89', 1, 1, 'Undefined', 1658601750),
(5, '5.188.62.21', 2, 1, 'Undefined', 1660682284),
(6, '185.153.200.142', 1, 1, 'Undefined', 1661276296),
(7, '5.188.62.26', 2, 1, 'Undefined', 1663048279),
(8, '46.101.3.24', 1, 1, 'Undefined', 1663115079),
(9, '106.75.81.218', 1, 1, 'Undefined', 1663445574),
(10, '106.75.37.234', 1, 1, 'Undefined', 1663452443),
(11, '46.161.27.155', 3, 1, 'Undefined', 1663628456),
(12, '46.161.27.155', 3, 1, 'Undefined', 1663684528),
(13, '117.187.173.4', 1, 1, 'Undefined', 1663724164),
(14, '45.61.50.153', 1, 1, 'Undefined', 1663854893),
(15, '5.188.62.140', 1, 1, 'Undefined', 1664197915),
(16, '35.84.207.62', 4, 1, 'Undefined', 1664201301),
(17, '5.188.62.140', 2, 1, 'Undefined', 1664425249),
(18, '154.44.150.192', 1, 1, 'Undefined', 1664688277),
(19, '106.75.15.80', 1, 1, 'Undefined', 1664787957),
(20, '223.111.175.4', 1, 1, 'Undefined', 1665068133),
(21, '106.75.81.218', 1, 1, 'Undefined', 1665070481),
(22, '117.187.173.3', 1, 1, 'Undefined', 1665795734),
(23, '185.196.220.26', 5, 1, 'Undefined', 1666041648),
(24, '106.75.50.30', 1, 1, 'Undefined', 1666066414),
(25, '185.196.220.26', 6, 1, 'Undefined', 1666324584),
(26, '185.196.220.26', 7, 1, 'Undefined', 1666490797),
(27, '106.75.28.105', 1, 1, 'Undefined', 1667468454);

-- --------------------------------------------------------

--
-- Table structure for table `stat_counter`
--

CREATE TABLE `stat_counter` (
  `id` int(11) UNSIGNED NOT NULL,
  `page` bigint(20) DEFAULT '0',
  `un_ip` bigint(20) DEFAULT '0',
  `un_browser` bigint(20) DEFAULT '0',
  `date` date DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_log`
--

CREATE TABLE `stat_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` date DEFAULT '0000-00-00',
  `time` time DEFAULT '00:00:00',
  `ip` varchar(16) DEFAULT '',
  `proxy` varchar(16) DEFAULT '',
  `page` varchar(1024) DEFAULT '',
  `referer` varchar(1024) DEFAULT '',
  `language` varchar(8) DEFAULT '',
  `agent` varchar(255) DEFAULT '',
  `un_browser` int(1) DEFAULT '0',
  `un_ip` int(1) DEFAULT '0',
  `session` bigint(20) DEFAULT '0',
  `screen` varchar(255) DEFAULT '',
  `get` text,
  `post` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `testimonial_id` int(11) NOT NULL,
  `number` int(5) NOT NULL DEFAULT '0',
  `author` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`testimonial_id`, `number`, `author`, `location`, `description`, `photo`, `is_active`) VALUES
(1, 0, '1 am', '', 'messagemessagemessage', '_9ieghudm2e.jpg', 1),
(2, 0, 'фыв', '', 'ыфп', '_gd1sq6kel3.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `text_ads`
--

CREATE TABLE `text_ads` (
  `text_ad_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description1` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description2` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show_url` tinyint(1) NOT NULL DEFAULT '0',
  `displayed` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_create` int(11) NOT NULL DEFAULT '0',
  `last_update` int(11) NOT NULL DEFAULT '0',
  `last_replier` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `ticket_message_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `message_from` int(11) NOT NULL DEFAULT '0',
  `message_to` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date_post` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `order_index` int(11) NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `host_fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `enr_fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `admin_fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `width` int(3) NOT NULL DEFAULT '0',
  `depth` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`type_id`, `order_index`, `title`, `cost`, `host_fee`, `enr_fee`, `admin_fee`, `width`, `depth`) VALUES
(1, 1, 'Member', 10500.00, 10000.00, 0.00, 0.00, 2, 1),
(2, 2, 'Group Leader', 0.00, 20000.00, 0.00, 0.00, 2, 3),
(3, 3, 'Wholesaler', 0.00, 200000.00, 0.00, 0.00, 2, 4),
(4, 4, 'Distributor', 0.00, 1000000.00, 0.00, 0.00, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_admins`
--

CREATE TABLE `user_admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `passwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_access` int(11) NOT NULL DEFAULT '0',
  `access` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_admins`
--

INSERT INTO `user_admins` (`id`, `username`, `passwd`, `email`, `first_name`, `last_name`, `last_access`, `access`, `is_active`) VALUES
(1, 'justyce', 'c5b258d2a545f5e7a1850d5c2083cb06', 'justicechinemelum@gmail.com', '', '', 0, 'a:42:{i:0;s:5:\"login\";i:1;s:6:\"admins\";i:2;s:4:\"stat\";i:3;s:7:\"members\";i:4;s:4:\"tree\";i:5;s:12:\"admindetails\";i:6;s:8:\"settings\";i:7;s:8:\"matrixes\";i:8;s:6:\"levels\";i:9;s:13:\"levels_forced\";i:10;s:7:\"payment\";i:11;s:4:\"cash\";i:12;s:8:\"cash_out\";i:13;s:10:\"processors\";i:14;s:5:\"pages\";i:15;s:7:\"m_pages\";i:16;s:4:\"news\";i:17;s:3:\"faq\";i:18;s:5:\"lands\";i:19;s:7:\"aptools\";i:20;s:6:\"ptools\";i:21;s:4:\"tads\";i:22;s:7:\"tickets\";i:23;s:11:\"pub_tickets\";i:24;s:10:\"categories\";i:25;s:8:\"products\";i:26;s:9:\"templates\";i:27;s:15:\"autorespondersf\";i:28;s:14:\"autoresponders\";i:29;s:11:\"atempplates\";i:30;s:7:\"mailing\";i:31;s:6:\"backup\";i:32;s:4:\"fees\";i:33;s:11:\"memb_matrix\";i:34;s:8:\"m_levels\";i:35;s:13:\"forced_matrix\";i:36;s:12:\"replica_site\";i:37;s:7:\"shopfee\";i:38;s:6:\"manual\";i:39;s:17:\"template_elements\";i:40;s:14:\"upload_members\";i:41;s:6:\"slider\";}', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aemailtempl`
--
ALTER TABLE `aemailtempl`
  ADD PRIMARY KEY (`emailtempl_id`);

--
-- Indexes for table `aptools`
--
ALTER TABLE `aptools`
  ADD PRIMARY KEY (`aptool_id`);

--
-- Indexes for table `autoresponders`
--
ALTER TABLE `autoresponders`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `cash`
--
ALTER TABLE `cash`
  ADD PRIMARY KEY (`cash_id`),
  ADD KEY `transfer_date_idx` (`cash_date`),
  ADD KEY `user_id_idx` (`to_id`),
  ADD KEY `amount_idx` (`amount`),
  ADD KEY `from_id_idx` (`from_id`);

--
-- Indexes for table `cash_out`
--
ALTER TABLE `cash_out`
  ADD PRIMARY KEY (`cash_out_id`),
  ADD KEY `transfer_date_idx` (`transfer_date`),
  ADD KEY `member_id_idx` (`member_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emailtempl`
--
ALTER TABLE `emailtempl`
  ADD PRIMARY KEY (`emailtempl_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `to_order_index_idx` (`to_order_index`);

--
-- Indexes for table `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`land_id`),
  ADD KEY `z_date_idx` (`z_date`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `z_date_idx` (`z_date`);

--
-- Indexes for table `matrices_completed`
--
ALTER TABLE `matrices_completed`
  ADD PRIMARY KEY (`matrix_id`),
  ADD KEY `place_id_idx` (`place_id`),
  ADD KEY `z_date_idx` (`z_date`);

--
-- Indexes for table `matrix`
--
ALTER TABLE `matrix`
  ADD PRIMARY KEY (`matrix_id`),
  ADD KEY `host_id_idx` (`host_id`),
  ADD KEY `member_id_idx` (`member_id`),
  ADD KEY `referrer_id_idx` (`referrer_id`),
  ADD KEY `m_level_idx` (`m_level`),
  ADD KEY `host_matrix_idx` (`host_matrix`);

--
-- Indexes for table `matrixes`
--
ALTER TABLE `matrixes`
  ADD PRIMARY KEY (`matrix_id`),
  ADD KEY `title_idx` (`title`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `username_idx` (`username`),
  ADD KEY `reg_date_idx` (`reg_date`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `news_date_idx` (`news_date`);

--
-- Indexes for table `online_stats`
--
ALTER TABLE `online_stats`
  ADD PRIMARY KEY (`online_stat_id`),
  ADD KEY `session_id_idx` (`session_id`),
  ADD KEY `member_id_idx` (`member_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `order_index_idx` (`order_index`);

--
-- Indexes for table `payins`
--
ALTER TABLE `payins`
  ADD PRIMARY KEY (`payins_id`),
  ADD KEY `transaction_id_idx` (`transaction_id`),
  ADD KEY `member_id_idx` (`member_id`);

--
-- Indexes for table `payins_log`
--
ALTER TABLE `payins_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`place_id`),
  ADD KEY `member_id_idx` (`member_id`),
  ADD KEY `referrer_place_id_idx` (`referrer_place_id`);

--
-- Indexes for table `processors`
--
ALTER TABLE `processors`
  ADD PRIMARY KEY (`processor_id`),
  ADD KEY `code_idx` (`code`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `price_idx` (`price`);

--
-- Indexes for table `ptools`
--
ALTER TABLE `ptools`
  ADD PRIMARY KEY (`ptool_id`),
  ADD KEY `title_idx` (`title`);

--
-- Indexes for table `pub_tickets`
--
ALTER TABLE `pub_tickets`
  ADD PRIMARY KEY (`pub_ticket_id`);

--
-- Indexes for table `pub_ticket_messages`
--
ALTER TABLE `pub_ticket_messages`
  ADD PRIMARY KEY (`pub_ticket_message_id`);

--
-- Indexes for table `replicas`
--
ALTER TABLE `replicas`
  ADD PRIMARY KEY (`replica_id`),
  ADD KEY `member_id_idx` (`member_id`),
  ADD KEY `order_index_idx` (`order_index`);

--
-- Indexes for table `selected`
--
ALTER TABLE `selected`
  ADD PRIMARY KEY (`selected_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD KEY `key1` (`keyname`);

--
-- Indexes for table `shop_fees`
--
ALTER TABLE `shop_fees`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `to_order_index_idx` (`to_order_index`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sn_messages`
--
ALTER TABLE `sn_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sn_messages_mem`
--
ALTER TABLE `sn_messages_mem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsor_bonus`
--
ALTER TABLE `sponsor_bonus`
  ADD PRIMARY KEY (`sponsor_bonus_id`),
  ADD KEY `member_id_idx` (`member_id`),
  ADD KEY `sponsored_id_idx` (`sponsored_id`);

--
-- Indexes for table `stats_countries`
--
ALTER TABLE `stats_countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `referral_idx` (`country`);

--
-- Indexes for table `stats_referrals`
--
ALTER TABLE `stats_referrals`
  ADD PRIMARY KEY (`referral_id`),
  ADD KEY `referral_idx` (`referral`);

--
-- Indexes for table `stats_views`
--
ALTER TABLE `stats_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `ipaddress_idx` (`visitor_id`),
  ADD KEY `country_idx` (`page`),
  ADD KEY `city_idx` (`thetime`);

--
-- Indexes for table `stats_visitors`
--
ALTER TABLE `stats_visitors`
  ADD PRIMARY KEY (`visitor_id`),
  ADD KEY `ipaddress_idx` (`ipaddress`),
  ADD KEY `country_idx` (`country`),
  ADD KEY `city_idx` (`city`),
  ADD KEY `thetime` (`thetime`);

--
-- Indexes for table `stat_counter`
--
ALTER TABLE `stat_counter`
  ADD KEY `id` (`id`);

--
-- Indexes for table `stat_log`
--
ALTER TABLE `stat_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`testimonial_id`),
  ADD KEY `number_idx` (`number`);

--
-- Indexes for table `text_ads`
--
ALTER TABLE `text_ads`
  ADD PRIMARY KEY (`text_ad_id`),
  ADD KEY `member_id_idx` (`member_id`),
  ADD KEY `displayed_idx` (`displayed`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`ticket_message_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `order_index_idx` (`order_index`);

--
-- Indexes for table `user_admins`
--
ALTER TABLE `user_admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username_idx` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aemailtempl`
--
ALTER TABLE `aemailtempl`
  MODIFY `emailtempl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aptools`
--
ALTER TABLE `aptools`
  MODIFY `aptool_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `autoresponders`
--
ALTER TABLE `autoresponders`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash`
--
ALTER TABLE `cash`
  MODIFY `cash_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `cash_out`
--
ALTER TABLE `cash_out`
  MODIFY `cash_out_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emailtempl`
--
ALTER TABLE `emailtempl`
  MODIFY `emailtempl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lands`
--
ALTER TABLE `lands`
  MODIFY `land_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `matrices_completed`
--
ALTER TABLE `matrices_completed`
  MODIFY `matrix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `matrix`
--
ALTER TABLE `matrix`
  MODIFY `matrix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `matrixes`
--
ALTER TABLE `matrixes`
  MODIFY `matrix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_stats`
--
ALTER TABLE `online_stats`
  MODIFY `online_stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88032;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payins`
--
ALTER TABLE `payins`
  MODIFY `payins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `payins_log`
--
ALTER TABLE `payins_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `processors`
--
ALTER TABLE `processors`
  MODIFY `processor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ptools`
--
ALTER TABLE `ptools`
  MODIFY `ptool_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pub_tickets`
--
ALTER TABLE `pub_tickets`
  MODIFY `pub_ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pub_ticket_messages`
--
ALTER TABLE `pub_ticket_messages`
  MODIFY `pub_ticket_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `replicas`
--
ALTER TABLE `replicas`
  MODIFY `replica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `selected`
--
ALTER TABLE `selected`
  MODIFY `selected_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `shop_fees`
--
ALTER TABLE `shop_fees`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sn_messages`
--
ALTER TABLE `sn_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sn_messages_mem`
--
ALTER TABLE `sn_messages_mem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sponsor_bonus`
--
ALTER TABLE `sponsor_bonus`
  MODIFY `sponsor_bonus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `stats_countries`
--
ALTER TABLE `stats_countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stats_referrals`
--
ALTER TABLE `stats_referrals`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stats_views`
--
ALTER TABLE `stats_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `stats_visitors`
--
ALTER TABLE `stats_visitors`
  MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stat_counter`
--
ALTER TABLE `stat_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_log`
--
ALTER TABLE `stat_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `text_ads`
--
ALTER TABLE `text_ads`
  MODIFY `text_ad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `ticket_message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_admins`
--
ALTER TABLE `user_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
