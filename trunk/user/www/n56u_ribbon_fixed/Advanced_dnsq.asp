<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_13_5#></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">

<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/itoggle.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script>
var $j = jQuery.noConflict();

$j(document).ready(function() {
    init_itoggle('dnsq_enable', change_dnsq_enable);
	init_itoggle('dnsq_fq_enable', change_dnsq_fq_enable);
	init_itoggle('dnsq_ad_enable');
	init_itoggle('dnsq_update_enable', change_dnsq_update_enable);
	init_itoggle('dnsq_uhost_enable', change_dnsq_uhost_enable);
	var i=0;
    var j=0;
    var dnsqhours = '<% nvram_get_x("", "dnsq_hours"); %>';
    var dnsqmin = '<% nvram_get_x("", "dnsq_min"); %>';
    while (i<24){
$j("#dnsq_hours").append("<option value='"+i+"'>"+i+"</option>");
i++;
}
$j("#dnsq_hours").val(dnsqhours);
while (j<60)
{
$j("#dnsq_min").append("<option value='"+j+"'>"+j+"</option>");
j++;
}
$j("#dnsq_min").val(dnsqmin);

});
</script>
<script>

function initial(){
	show_banner(1);
	show_menu(5,11,4);
	show_footer();
change_dnsq_enable();
textarea_scripts_enabled(1);
}

function textarea_scripts_enabled(v){
	inputCtrl(document.form['bkyezjm.userhost'], v);
}

function change_dnsq_uhost_enable(){
var v = document.form.dnsq_uhost_enable[0].checked;
        showhide_div('row_user_host', v);
}
function change_dnsq_enable(){
	var v = document.form.dnsq_enable[0].checked;
        showhide_div('dnsq_fq_row', v);
        showhide_div('dnsq_ad_row', v);
	showhide_div('row_dnsqtime_on', v);
	showhide_div('row_dnsq_fq_file', v);
	showhide_div('dnsq_uhost_enable', v);
	showhide_div('dnsq_uhost_on_row', v);
	if (v==false){
     showhide_div('row_dnsqtime_set', v);
	 showhide_div('row_dnsq_fq_file', v);
	 showhide_div('row_user_host', v);
	 }
	 if (v==true){
	 	 	var ct = document.form.dnsq_update_enable_fake.checked;
			var fq = document.form.dnsq_fq_enable_fake.checked;
			var cus = document.form.dnsq_uhost_enable_fake.checked;
			if (fq==true){
	showhide_div('row_dnsq_fq_file', v);
	}
if (ct==true){
	showhide_div('row_dnsqtime_set', v);
	}
	if (cus==true){
	 showhide_div('row_user_host', v);
	}
}
}
function change_dnsq_fq_enable(){
	var v = document.form.dnsq_fq_enable[0].checked;
	showhide_div('row_dnsq_fq_file', v);
	
}
function change_dnsq_update_enable(){
	var v = document.form.dnsq_update_enable[0].checked;
	showhide_div('row_dnsqtime_set', v);
	
}

function applyRule(){
	showLoading();
		
	document.form.action_mode.value = " Apply ";
	document.form.current_page.value = "/Advanced_dnsq.asp";
	document.form.next_page.value = "";
	document.form.submit();
}

</script>
<style>
.nav-tabs > li > a {
	padding-right: 6px;
	padding-left: 6px;
}
</style>
</head>

<body onload="initial();" onunLoad="return unload_body();">

<div class="wrapper">
    <div class="container-fluid" style="padding-right: 0px">
        <div class="row-fluid">
            <div class="span3"><center><div id="logo"></div></center></div>
            <div class="span9" >
                <div id="TopBanner"></div>
            </div>
        </div>
    </div>

    <div id="Loading" class="popup_bg"></div>

    <iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

    <input type="hidden" name="current_page" value="Advanced_dnsq.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="Storage;General;">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="">

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <!--Sidebar content-->
                <!--=====Beginning of Main Menu=====-->
                <div class="well sidebar-nav side_nav" style="padding: 0px;">
                    <ul id="mainMenu" class="clearfix"></ul>
                    <ul class="clearfix">
                        <li>
                            <div id="subMenu" class="accordion"></div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="span9">
                <!--Body content-->
                <div class="row-fluid">
                    <div class="span12">
                        <div class="box well grad_colour_dark_blue">
                            <h2 class="box_head round_top"><#menu5_13#> - <#menu5_13_5#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#dnsqabout#></div>

                                    <table id="tbl_dnsq" width="100%" cellpadding="4" cellspacing="0" class="table" >
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#Storagednsq#></th>
                                        </tr>
									<tr>
                                            <th width="50%">
                                                <#dnsq_all#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="dnsq_enable_on_of">
                                                        <input type="checkbox" id="dnsq_enable_fake" <% nvram_match_x("", "dnsq_enable", "1", "value=1 checked"); %><% nvram_match_x("", "dnsq_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="dnsq_enable" id="dnsq_enable_1" value="1" class="input" <% nvram_match_x("", "dnsq_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="dnsq_enable" id="dnsq_enable_0" value="0" class="input" <% nvram_match_x("", "dnsq_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										<tr id="dnsq_fq_row">
                                            <th width="50%">
                                                <#dnsq_fq_v#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="dnsq_fq_enable_on_of">
                                                        <input type="checkbox" id="dnsq_fq_enable_fake" <% nvram_match_x("", "dnsq_fq_enable", "1", "value=1 checked"); %><% nvram_match_x("", "dnsq_fq_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="dnsq_fq_enable" id="dnsq_fq_enable_1" value="1" class="input" <% nvram_match_x("", "dnsq_fq_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="dnsq_fq_enable" id="dnsq_fq_enable_0" value="0" class="input" <% nvram_match_x("", "dnsq_fq_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										 <tr id="row_dnsq_fq_file" style="display:none;">
                                            <th>
                                                <#dnsqfqfilev#>
                                            </th>
                                            <td>
                                                <select id= "dnsq_fq_file" name="dnsq_fq_file" class="input" style="width:250px">
												<option value="https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq" <% nvram_match_x("", "dnsq_fq_file", "https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq", "selected"); %>>https://github.com/sy618/hosts</option>
												<option value="https://raw.githubusercontent.com/racaljk/hosts/master/dnsmasq.conf" <% nvram_match_x("", "dnsq_fq_file", "https://raw.githubusercontent.com/racaljk/hosts/master/dnsmasq.conf", "selected"); %>>https://github.com/racaljk/hosts</option>
												</select>
                                            </td>
                                        </tr>
					<tr id="dnsq_ad_row">
                                            <th width="50%">
                                                <#dnsq_ad_v#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="dnsq_ad_enable_on_of">
                                                        <input type="checkbox" id="dnsq_ad_enable_fake" <% nvram_match_x("", "dnsq_ad_enable", "1", "value=1 checked"); %><% nvram_match_x("", "dnsq_ad_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="dnsq_ad_enable" id="dnsq_ad_enable_1" value="1" class="input" <% nvram_match_x("", "dnsq_ad_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="dnsq_ad_enable" id="dnsq_ad_enable_0" value="0" class="input" <% nvram_match_x("", "dnsq_ad_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>

										<tr id="row_dnsqtime_on">
                                            <th width="50%">
                                                <#dnsqtimeon#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="dnsq_update_enable_on_of">
                                                        <input type="checkbox" id="dnsq_update_enable_fake" <% nvram_match_x("", "dnsq_update_enable", "1", "value=1 checked"); %><% nvram_match_x("", "dnsq_update_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="dnsq_update_enable" id="dnsq_update_enable_1" value="1" class="input" <% nvram_match_x("", "dnsq_update_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="dnsq_update_enable" id="dnsq_update_enable_0" value="0" class="input" <% nvram_match_x("", "dnsq_update_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										 <tr id="row_dnsqtime_set" style="display:none;">
                                            <th>
                                                <#dnsqupdate#>
                                            </th>
                                            <td>
                                                <select name="dnsq_hours" id="dnsq_hours" class="input" style="width: 50px">

                                                </select><#Hour#>
												<select name="dnsq_min" id="dnsq_min" class="input" style="width: 50px">

                                                </select><#Minute#>
                                            </td>
                                        </tr>
										<tr id="dnsq_uhost_on_row" >
                                            <th width="50%" >
                                                <#dnsq_uhost_v#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="dnsq_uhost_enable_on_of">
                                                        <input type="checkbox" id="dnsq_uhost_enable_fake" <% nvram_match_x("", "dnsq_uhost_enable", "1", "value=1 checked"); %><% nvram_match_x("", "dnsq_uhost_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="dnsq_uhost_enable" id="dnsq_uhost_enable_1" value="1" class="input" <% nvram_match_x("", "dnsq_uhost_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="dnsq_uhost_enable" id="dnsq_uhost_enable_0" value="0" class="input" <% nvram_match_x("", "dnsq_uhost_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>	
										 <tr id="row_user_host" style="display:none;" >
                                            <td colspan="2">
                                                <a href="javascript:spoiler_toggle('script0')"><span><#userhost#></span></a>
                                                <div id="script0" style="display:none;">
                                                    <textarea rows="24" wrap="off" spellcheck="false" maxlength="8192" class="span12" name="bkyezjm.userhost" style="font-family:'Courier New'; font-size:12px; width=100%"><% nvram_dump("bkyezjm.userhost",""); %></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <td style="border-top: 0 none;">
                                                <center><input class="btn btn-primary" style="width: 219px" onclick="applyRule();" type="button" value="<#CTL_apply#>" /></center>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </form>

    <div id="footer"></div>
</div>
</body>
</html>

