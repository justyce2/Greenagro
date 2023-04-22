<!-- BEGIN: MAIN -->

{FILE {HEADER_TEMPLATE}}

<table width='100%' border='0' cellspacing='0' cellpadding='0' class='ptitle'>
    <tr><td>{MAIN_HEADER}</td></tr>
</table>

<table width='100%' border='0' cellspacing='0' cellpadding='3' align='center'>
    <tr>
        <td>

<form action='{MAIN_ACTION}' method='POST'  enctype='multipart/form-data'>
<table width='80%' border='0' cellspacing='0' cellpadding='2'>
    <tr>
        <td colspan='2'> {MAIN_QUESTION} <span class='error'>{MAIN_QUESTION_ERROR}</span></td>
    </tr>
    <tr>
        <td width='20%' valign='top'>Answer:</td>
        <td> {MAIN_ANSWER} <span class='error'>{MAIN_ANSWER_ERROR}</span></td>
    </tr>
    <tr>
        <td colspan='2'>
            <input class='some_btn' type='submit' value=" Save "> &nbsp;
            <input class='some_btn' type='button' value=" Cancel " onClick="window.location.href='{MAIN_CANCEL_URL}'">

            <input type='hidden' name='content' value='{MAIN_CONTENT}'>
            <input type='hidden' name='ocd' value='{MAIN_OCD}'>
            <input type='hidden' name='id' value='{MAIN_ID}'>
            </form>
        </td>
    </tr>
</table>
{FILE {FOOTER_TEMPLATE}}

<!-- END: MAIN -->