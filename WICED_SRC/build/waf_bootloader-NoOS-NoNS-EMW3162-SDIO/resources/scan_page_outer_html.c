#include "wiced_resource.h"

const char resources_config_DIR_scan_page_outer_html_data[17058] = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n" \
"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\" >\r\n" \
"<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" \
"  <head>\r\n" \
"    <meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />\r\n" \
"    <title>Broadcom WICED Device Scan-Join Config</title>\r\n" \
"    <style  type=\"text/css\"><!--\r\n" \
"      .non_popout { padding:10px; font-weight:bold}\r\n" \
"      tr.highlight .non_popout{ background-color: #ff8f8f;}\r\n" \
"      tr.opened .non_popout{ background-color: #8fff00;}\r\n" \
"      tr.closed .non_popout{ border-bottom-style:solid; border-bottom-width:1px; }\r\n" \
"      .normal { background-color: #cfcfcf; }\r\n" \
"      .popout     { padding:15px;   font-weight:bold; overflow:hidden; background-color: #8fff00; border-bottom-width:1px; border-bottom-style:solid; }\r\n" \
"      tr.unpoppedrow {  display:none; }\r\n" \
"      tr.poppedrow { display:table-row;  }\r\n" \
"\r\n" \
"      #preloadedImages {\r\n" \
"    width: 0px;\r\n" \
"    height: 0px;\r\n" \
"    display: inline;\r\n" \
"    background-image: url(../images/tick.png);\r\n" \
"    background-image: url(../images/cross.png);\r\n" \
"    background-image: url(../images/lock.png);\r\n" \
"    background-image: url(../images/progress.gif);\r\n" \
"    background-image: url(../images/64_0bars.png);\r\n" \
"    background-image: url(../images/64_1bars.png);\r\n" \
"    background-image: url(../images/64_2bars.png);\r\n" \
"    background-image: url(../images/64_3bars.png);\r\n" \
"    background-image: url(../images/64_4bars.png);\r\n" \
"    background-image: url(../images/64_5bars.png);\r\n" \
"    background-image: url();\r\n" \
"    }\r\n" \
"\r\n" \
"    } --></style>\r\n" \
"    <link rel=\"stylesheet\" type=\"text/css\" href=\"../styles/buttons.css\" />\r\n" \
"    <script src=\"../scripts/general_ajax_script.js\" type=\"text/javascript\" ></script>\r\n" \
"    <script type=\"text/javascript\">\r\n" \
"    /* <![CDATA[ */\r\n" \
"    var protocol = \'\';\r\n" \
"    var result_array = [];\r\n" \
"      function scan_handler( result, data )\r\n" \
"      {\r\n" \
"        var text = \"\";\r\n" \
"        switch( result )\r\n" \
"        {\r\n" \
"            case AJAX_PARTIAL_PROGRESS:\r\n" \
"                parse_results( data );\r\n" \
"            case AJAX_STARTING:\r\n" \
"                text = \"<img src=\\\"../images/progress.gif\\\" alt=\\\"in progress\\\"/>Scanning\";\r\n" \
"                break;\r\n" \
"            case AJAX_FINISHED:\r\n" \
"                text = \"<img src=\\\"../images/tick.png\\\" height=\\\"16\\\">Scan Complete\";\r\n" \
"                parse_results( data );\r\n" \
"                break;\r\n" \
"            case AJAX_NO_BROWSER_SUPPORT:\r\n" \
"                text = \"Failed - your browser does not support this script\";\r\n" \
"                break;\r\n" \
"            case AJAX_FAILED:\r\n" \
"                text = \"Failed to get scan results\";\r\n" \
"                break;\r\n" \
"        }\r\n" \
"        document.getElementById(\"scanstatus\").innerHTML = text;\r\n" \
"      }\r\n" \
"\r\n" \
"      function parse_results( text )\r\n" \
"      {\r\n" \
"        var line_array = text.split( \"\\n\" );\r\n" \
"        protocol  = line_array[0];\r\n" \
"        for ( var i = 1; i < parseInt(line_array.length/8)*8 + 1; i+=8 )\r\n" \
"        {\r\n" \
"            var id = parseInt( line_array[i+0] );\r\n" \
"            var rssi = parseInt( line_array[i+4] );\r\n" \
"            var remembered = parseInt( line_array[i+7] );\r\n" \
"            var sec_val  = line_array[i+2];\r\n" \
"            var sec_name  = line_array[i+3];\r\n" \
"            var sec  =  (( sec_name.substr(0, 3) == \"WPA\" ) || ( sec_name.substr(0, 3) == \"WEP\" ))? 1 : 0;\r\n" \
"            var found = 0;\r\n" \
"            var new_loc = 0;\r\n" \
"            for ( var j = 0; j < result_array.length; j++ )\r\n" \
"            {\r\n" \
"                if ( result_array[j].id == id )\r\n" \
"                {\r\n" \
"                    found = 1;\r\n" \
"                }\r\n" \
"                if ( ( result_array[j].rssi > rssi ) &&\r\n" \
"                     ( result_array[j].remembered >= remembered ) )\r\n" \
"                {\r\n" \
"                    new_loc = j+1;\r\n" \
"                }\r\n" \
"            }\r\n" \
"            if ( found != 1 )\r\n" \
"            {\r\n" \
"                /* find where to put it */\r\n" \
"\r\n" \
"                var x = [];\r\n" \
"                x.id   = id;\r\n" \
"                x.ssid = line_array[i+1];\r\n" \
"                x.sec_name  = sec_name;\r\n" \
"                x.sec  =  sec;\r\n" \
"                x.sec_val = sec_val;\r\n" \
"                x.channel  = parseInt(line_array[i+5]);\r\n" \
"                x.bssid  = line_array[i+6];\r\n" \
"                x.rssi = rssi;\r\n" \
"                x.remembered = remembered;\r\n" \
"                result_array.splice( new_loc, 0, x );\r\n" \
"            }\r\n" \
"        }\r\n" \
"        display_results( );\r\n" \
"      }\r\n" \
"\r\n" \
"      function display_results( )\r\n" \
"      {\r\n" \
"        document.getElementById(\"scantable\").innerHTML = \"\";\r\n" \
"        for ( var i = 0; i < result_array.length; i++ )\r\n" \
"        {\r\n" \
"            var res = result_array[i];\r\n" \
"\r\n" \
"            var text = \"<tr class=\\\"normal closed\\\" id=\\\"res\" + res.id + \"\\\"  onmouseover=\\\"overItem(\'res\" + res.id + \"\',1)\\\" onmouseout=\\\"overItem(\'res\" + res.id + \"\',0)\\\" onClick=\\\"expand_collapse_row(\" + res.id + \")\\\">\"\r\n" \
"\r\n" \
"            text += \"<td class=\\\"non_popout\\\" style=\\\"width:100%\\\">\" + hex2a( res.ssid ) + \"</td>\";\r\n" \
"\r\n" \
"            if ( res.sec == 1 )\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Secured: \" + res.sec_name + \"\\\"><img src=\\\"../images/lock.png\\\" height=\\\"20\\\" alt=\\\"Secured: \" + res.sec_name + \"\\\" /></td>\";\r\n" \
"            else\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Unsecured\\\"></td>\";\r\n" \
"\r\n" \
"            if ( res.rssi > -40 )\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Excellent Signal \" + res.rssi + \"dBm\\\"> <img src=\\\"../images/64_5bars.png\\\" height=\\\"32\\\" alt=\\\"Excellent Signal\\\" /></td>\";\r\n" \
"            else if ( res.rssi > -55 )\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Very Good Signal \" + res.rssi + \"dBm\\\"><img src=\\\"../images/64_4bars.png\\\" height=\\\"32\\\" alt=\\\"Very Good Signal\\\" /></td>\";\r\n" \
"            else if ( res.rssi > -70 )\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Good Signal \" + res.rssi + \"dBm\\\"><img src=\\\"../images/64_3bars.png\\\" height=\\\"32\\\" alt=\\\"Good Signal\\\" /></td>\";\r\n" \
"            else if ( res.rssi > -80 )\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Poor Signal \" + res.rssi + \"dBm\\\"><img src=\\\"../images/64_2bars.png\\\" height=\\\"32\\\" alt=\\\"Poor Signal\\\" /></td>\";\r\n" \
"            else if ( res.rssi > -87 )\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Very Poor Signal \" + res.rssi + \"dBm\\\"><img src=\\\"../images/64_1bars.png\\\" height=\\\"32\\\" alt=\\\"Very Poor Signal\\\" /></td>\";\r\n" \
"            else\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"No Signal \" + res.rssi + \"dBm\\\"><img src=\\\"../images/64_0bars.png\\\" height=\\\"32\\\" alt=\\\"No Signal\\\" /></td>\";\r\n" \
"\r\n" \
"            if ( res.remembered == 1 )\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Remembered\\\" ><img src=\\\"../images/tick.png\\\" height=\\\"20\\\" alt=\\\"Remembered\\\" /></td>\";\r\n" \
"            else\r\n" \
"                text += \"<td class=\\\"non_popout\\\" title=\\\"Not Remembered\\\"></td>\";\r\n" \
"\r\n" \
"\r\n" \
"            text += \"</tr>\";\r\n" \
"\r\n" \
"            text += \"<tr class=\\\"unpoppedrow\\\" id=\\\"exp\" + res.id + \"\\\">\"\r\n" \
"            text += \"<td colspan=4 class=\\\"popout\\\" >\";\r\n" \
"            text += \"<form>\";\r\n" \
"            if ( res.sec == 1 )\r\n" \
"            {\r\n" \
"                text += default_box( \"Password\", \"pass\" + res.id, 64 );\r\n" \
"            }\r\n" \
"            text += \"<input type=\\\"button\\\" value=\\\"Connect\\\" class=\\\"white bigrounded button\\\" onClick=\\\"join(\" + res.id + \")\\\"/>\";\r\n" \
"            text += \"</form></td></tr>\";\r\n" \
"\r\n" \
"\r\n" \
"            document.getElementById(\"scantable\").innerHTML += text;\r\n" \
"        }\r\n" \
"\r\n" \
"        if ( result_array.length == 0 )\r\n" \
"        {\r\n" \
"            /* no results add dummy */\r\n" \
"            var text = \"<tr class=\\\"normal closed\\\" id=\\\"res_dummy\\\"><td class=\\\"non_popout\\\" colspan=4 style=\\\"width:100%\\\">No broadcasting networks found</td></tr>\";\r\n" \
"            document.getElementById(\"scantable\").innerHTML += text;\r\n" \
"        }\r\n" \
"\r\n" \
"        /* Add manual config option */\r\n" \
"        var text = \"<tr class=\\\"normal closed\\\" id=\\\"res_manual\\\"  onmouseover=\\\"overItem(\'res_manual\',1)\\\" onmouseout=\\\"overItem(\'res_manual\',0)\\\" onClick=\\\"expand_collapse_row( \'_manual\')\\\">\"\r\n" \
"        text += \"<td class=\\\"non_popout\\\" colspan=4 style=\\\"width:100%\\\">Add network manually</td></tr>\";\r\n" \
"        text += \"<tr class=\\\"unpoppedrow\\\" id=\\\"exp_manual\\\">\"\r\n" \
"        text += \"<td colspan=4 class=\\\"popout\\\" >\";\r\n" \
"        text += \"<form>\" + default_box( \"Network Name\", \"manual_ssid\", 32 );\r\n" \
"        text += default_box( \"Password\", \"manual_pass\", 64 );\r\n" \
"        text += \"Security <select id=\\\"manual_sec\\\">\";\r\n" \
"        text += \"<option value=\\\"0\\\" selected >None</option>\";\r\n" \
"        text += \"<option value=\\\"1\\\">WEP</option>\";\r\n" \
"        text += \"<option value=\\\"32769\\\">WEP shared</option>\";\r\n" \
"        text += \"<option value=\\\"2097154\\\">WPA TKIP</option>\";\r\n" \
"        text += \"<option value=\\\"2097156\\\">WPA AES</option>\";\r\n" \
"        text += \"<option value=\\\"4194306\\\">WPA2 TKIP</option>\";\r\n" \
"        text += \"<option value=\\\"4194308\\\">WPA2 AES</option>\";\r\n" \
"        text += \"<option value=\\\"4194310\\\">WPA2 Mixed</option>\";\r\n" \
"        text += \"<input type=\\\"button\\\" value=\\\"Connect\\\" class=\\\"white bigrounded button\\\" onClick=\\\"join_manual()\\\"/>\";\r\n" \
"        text += \"</form></td></tr>\";\r\n" \
"\r\n" \
"        document.getElementById(\"scantable\").innerHTML += text;\r\n" \
"\r\n" \
"        /* Add WPS config option */\r\n" \
"        var text = \"<tr class=\\\"normal closed\\\" id=\\\"res_wps\\\"  onmouseover=\\\"overItem(\'res_wps\',1)\\\" onmouseout=\\\"overItem(\'res_wps\',0)\\\" onClick=\\\"expand_collapse_row( \'_wps\')\\\">\"\r\n" \
"        text += \"<td class=\\\"non_popout\\\" colspan=4 style=\\\"width:100%\\\">Add Via WPS <img src=\\\"../images/wps_icon.png\\\" style=\\\"height:2em;vertical-align:middle\\\" alt=\\\"WPS icon\\\" /></td></tr>\";\r\n" \
"        text += \"<tr class=\\\"unpoppedrow\\\" id=\\\"exp_wps\\\">\"\r\n" \
"        text += \"<td colspan=4 class=\\\"popout\\\">\";\r\n" \
"        text += \"<form>Press the <b>WPS button</b> on your Access Point then click <input type=\\\"button\\\" value=\\\"Connect\\\" class=\\\"white bigrounded button\\\" onClick=\\\"join_pbc()\\\"/>\";\r\n" \
"        text += \"<hr/>OR<hr/>\";\r\n" \
"        text += \"Enter the <b>WPS PIN</b> from your Access point \" + default_box( \"WPS PIN\", \"wpspin\", 64 ) + \"<br/>\";\r\n" \
"        text += \"Then click <input type=\\\"button\\\" value=\\\"Connect\\\" class=\\\"white bigrounded button\\\" onClick=\\\"join_pin()\\\"/>\";\r\n" \
"        text += \"</form></td></tr>\";\r\n" \
"\r\n" \
"        document.getElementById(\"scantable\").innerHTML += text;\r\n" \
"\r\n" \
"\r\n" \
"      }\r\n" \
"\r\n" \
"      function hex2a( hexstr )\r\n" \
"      {\r\n" \
"        var outstr = \"\";\r\n" \
"        for ( var i = 0; i < hexstr.length; i+= 2 )\r\n" \
"        {\r\n" \
"            outstr += String.fromCharCode( parseInt( hexstr.substr( i, 2 ), 16 ) );\r\n" \
"        }\r\n" \
"        return outstr;\r\n" \
"      }\r\n" \
"\r\n" \
"      function default_box( defaultval, id, maxlen )\r\n" \
"      {\r\n" \
"        return \"<input \\\"color: #f00\\\" type=\\\"text\\\" id=\\\"\" + id + \"\\\" maxlength=\\\"\"+ maxlen +\"\\\" value=\\\"\"+ defaultval +\"\\\" style =\\\"color:#BBB;\\\" onblur=\\\"if(this.value == \'\') { \" + id + \"changed = 0; this.value=\'\"+ defaultval +\"\'; this.style.color = \'#BBB\';} else { \" + id + \"changed = 1; }\\\" onfocus=\\\"this.style.color = \'#000\'; if (typeof \" + id + \"changed == \'undefined\' || \" + id + \"changed == 0) {this.value=\'\'}\\\"/>\";\r\n" \
"      }\r\n" \
"      function default_box_ischanged( id )\r\n" \
"      {\r\n" \
"        return ((typeof window[id + \"changed\"] != \'undefined\') && (window[id + \"changed\"] != 0));\r\n" \
"      }\r\n" \
"\r\n" \
"      function join( id )\r\n" \
"      {\r\n" \
"        var i = 0;\r\n" \
"        while ( result_array[i].id != id )\r\n" \
"        {  i ++ }\r\n" \
"        var res = result_array[i];\r\n" \
"        var s=\'as0=\' + encodeURIComponent(hex2a(res.ssid)) + \'&at0=\' + res.sec_val\r\n" \
"        if ( res.sec == 1 )\r\n" \
"        {\r\n" \
"          if (default_box_ischanged( \'pass\' + res.id ))\r\n" \
"          {\r\n" \
"            s += \'&ap0=\' + encodeURIComponent(document.getElementById(\'pass\' + res.id).value);\r\n" \
"\r\n" \
"            do_ajax( protocol +\'://\' + window.location.hostname + \'/connect?\' + s, join_handler );\r\n" \
"          }\r\n" \
"          else\r\n" \
"          {\r\n" \
"            alert(\"Please enter a password\");\r\n" \
"          }\r\n" \
"        }\r\n" \
"      }\r\n" \
"\r\n" \
"      function join_manual( )\r\n" \
"      {\r\n" \
"        var s=\'as0=\' + encodeURIComponent(hex2a(document.getElementById(\'manual_ssid\').value));\r\n" \
"        s += \'&at0=\' + document.getElementById(\'manual_sec\').value;\r\n" \
"        if ( document.getElementById(\'manual_sec\').value != 0 )\r\n" \
"          s += \'&ap0=\' + encodeURIComponent(document.getElementById(\'manual_pass\').value);\r\n" \
"\r\n" \
"         do_ajax(  protocol +\'://\' + window.location.hostname + \'/connect?\' + s, join_handler );\r\n" \
"      }\r\n" \
"\r\n" \
"      function join_pbc( )\r\n" \
"      {\r\n" \
"          do_ajax( protocol +\'://\' + window.location.hostname + \'/wps_go\', join_handler );\r\n" \
"      }\r\n" \
"\r\n" \
"      function join_pin( )\r\n" \
"      {\r\n" \
"          var s = \'pin=\' + encodeURIComponent(document.getElementById(\'wpspin\').value);\r\n" \
"          do_ajax( protocol +\'://\' + window.location.hostname + \'/wps_go?\' + s, join_handler );\r\n" \
"      }\r\n" \
"\r\n" \
"      function join_handler( result, data )\r\n" \
"      {\r\n" \
"        var text = \"\";\r\n" \
"        switch( result )\r\n" \
"        {\r\n" \
"            case AJAX_PARTIAL_PROGRESS:\r\n" \
"                parse_results( data );\r\n" \
"            case AJAX_STARTING:\r\n" \
"                text = \"<img src=\\\"../images/progress.gif\\\" alt=\\\"in progress\\\"/>Joining network...\";\r\n" \
"                break;\r\n" \
"            case AJAX_FINISHED:\r\n" \
"                text = \"<img src=\\\"../images/tick.png\\\" height=\\\"16\\\">Join Successful\";\r\n" \
"                document.getElementById(\'dim\').style.display = \"block\";\r\n" \
"                document.getElementById(\'conndisp\').innerHTML = \"Device Started<br/>Web server and access point stopped<br/>See UART for further information\"\r\n" \
"                break;\r\n" \
"            case AJAX_NO_BROWSER_SUPPORT:\r\n" \
"                text = \"Failed - your browser does not support this script\";\r\n" \
"                break;\r\n" \
"            case AJAX_FAILED:\r\n" \
"                text = \"Join Failed!\";\r\n" \
"                break;\r\n" \
"        }\r\n" \
"        document.getElementById(\"scanstatus\").innerHTML = text;\r\n" \
"      }\r\n" \
"\r\n" \
"      var curr_expanded_res=null;\r\n" \
"      var curr_expanded_exp=null;\r\n" \
"          function overItem( elem_name, over )\r\n" \
"        {\r\n" \
"            elem = document.getElementById(elem_name);\r\n" \
"            if ( over )\r\n" \
"            {\r\n" \
"                if ( curr_expanded_res && ( elem == curr_expanded_res ) )\r\n" \
"                {\r\n" \
"                    elem.className=\'highlight\';\r\n" \
"                }\r\n" \
"                else\r\n" \
"                {\r\n" \
"                    elem.className=\'highlight closed\';\r\n" \
"                }\r\n" \
"            }\r\n" \
"            else if ( curr_expanded_res && ( elem == curr_expanded_res ) )\r\n" \
"                elem.className=\'opened\';\r\n" \
"            else\r\n" \
"                elem.className=\'normal closed\';\r\n" \
"        }\r\n" \
"      function expand_collapse_row( name )\r\n" \
"      {\r\n" \
"        var reselem = document.getElementById( \'res\' + name );\r\n" \
"        var expelem = document.getElementById( \'exp\' + name );\r\n" \
"        if ( reselem == curr_expanded_res )\r\n" \
"        {\r\n" \
"          expelem.className = \'unpoppedrow\';\r\n" \
"          curr_expanded_res = null;\r\n" \
"          curr_expanded_exp = null;\r\n" \
"          reselem.className=\'highlight\';\r\n" \
"        }\r\n" \
"        else\r\n" \
"        {\r\n" \
"            if ( curr_expanded_exp )\r\n" \
"            {\r\n" \
"              curr_expanded_exp.className = \'unpoppedrow\';\r\n" \
"              curr_expanded_res.className=\'normal\';\r\n" \
"            }\r\n" \
"            expelem.className = \"poppedrow\";\r\n" \
"            curr_expanded_res = reselem;\r\n" \
"            curr_expanded_exp = expelem;\r\n" \
"            reselem.className=\'opened\';\r\n" \
"        }\r\n" \
"      }\r\n" \
"    /* ]]> */\r\n" \
"    </script>\r\n" \
"  </head>\r\n" \
"  <body style=\"font-family:verdana;\" onload=\"do_ajax( \'../scan_results.txt\', scan_handler );\" >\r\n" \
"    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\"98%\">\r\n" \
"      <tr style=\"height:20px\"><td>&nbsp;</td></tr>\r\n" \
"      <tr style=\"border-collapse: collapse; padding: 0;\">\r\n" \
"        <td style=\"width:20px\"></td>\r\n" \
"        <td style=\"width:117px\"><img src=\"../images/brcmlogo.png\" alt=\"Broadcom Logo\" /></td>\r\n" \
"        <td style=\"width:20px;background-image:url(\'../images/brcmlogo_line.png\');\"></td>\r\n" \
"        <td style=\"vertical-align:middle; text-align:center; font: bold 25px/100% Verdana, Arial, Helvetica, sans-serif;background-image:url(\'../images/brcmlogo_line.png\');\">\r\n" \
"        WICED&trade; Device Configuration\r\n" \
"        </td>\r\n" \
"        <td style=\"width:137px;background-image:url(\'../images/brcmlogo_line.png\');\"></td>\r\n" \
"      </tr>\r\n" \
"      <tr><td>&nbsp;</td></tr>\r\n" \
"    </table>\r\n" \
"    <noscript><h2>Javascript is required for this page to work correctly.</h2></noscript>\r\n" \
"\r\n" \
"    <div id=\"scanstatus\"></div><br/>\r\n" \
"    <table id=\"scantable\" border=\"0\" cellspacing=\'0\' style=\"margin-left:5%;width:700px\">\r\n" \
"\r\n" \
"    <div id=\"scanres\"></div>\r\n" \
"\r\n" \
"    <p>\r\n" \
"      <br/>\r\n" \
"      <input style=\"vertical-align:bottom;float:left;margin-left:20px\" type=\"button\" value=\"< Device Setup\" onclick=\"document.location.href=\'device_settings.html\'\" />\r\n" \
"    </p>\r\n" \
"\r\n" \
"    <!-- This DIV allows the main part of the page to be disabled with a \'dimmed\' effect, and displays a message center-screen -->\r\n" \
"    <div id=\"dim\" style=\"display: none; background: #000;position: fixed; left: 0; top: 0;width: 100%; height: 100%;opacity: .80;z-index: 9999;text-align: center\">\r\n" \
"      <h2 id=\"conndisp\" style=\"color:#ff0000;position:relative;top:50%\"></h2>\r\n" \
"    </div>\r\n" \
"\r\n" \
"  </body>\r\n" \
"</html>\r\n" \
"";
const resource_hnd_t resources_config_DIR_scan_page_outer_html = { RESOURCE_IN_MEMORY, 17057, { .mem = { resources_config_DIR_scan_page_outer_html_data }}};
