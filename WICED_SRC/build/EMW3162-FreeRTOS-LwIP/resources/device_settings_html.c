#include "wiced_resource.h"


const char resources_config_DIR_device_settings_html_data[3313] = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n" \
"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n" \
"<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" \
"  <head>\r\n" \
"    <meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />\r\n" \
"    <title>Broadcom WICED Device Config</title>\r\n" \
"    <style  type=\"text/css\"><!-- .normal { background-color: #ffffff; } .highlight { background-color: #8f0000;  } --></style>\r\n" \
"    <script src=\"../scripts/general_ajax_script.js\" type=\"text/javascript\" ></script>\r\n" \
"    <script type=\"text/javascript\">\r\n" \
"    /* <![CDATA[ */\r\n" \
"      function save_settings()\r\n" \
"      {\r\n" \
"        var s=\"\";\r\n" \
"        var x=document.getElementById(\"settings_form\");\r\n" \
"        for (var i=0;i<x.length; i++)\r\n" \
"        {\r\n" \
"          s += x.elements[i].name + \"=\" + encodeURIComponent(x.elements[i].value) + \"&\";\r\n" \
"        }\r\n" \
"        do_ajax(\'/config_save?\' + s, ajax_handler);\r\n" \
"      }\r\n" \
"      function ajax_handler( result, data )\r\n" \
"      {\r\n" \
"        var text = \"\";\r\n" \
"        switch( result )\r\n" \
"        {\r\n" \
"            case AJAX_PARTIAL_PROGRESS:\r\n" \
"                text = \"Saving...\";\r\n" \
"            case AJAX_STARTING:\r\n" \
"                text = \"Saving...\";\r\n" \
"                break;\r\n" \
"            case AJAX_FINISHED:\r\n" \
"                text = data;\r\n" \
"                break;\r\n" \
"            case AJAX_NO_BROWSER_SUPPORT:\r\n" \
"                text = \"Failed - your browser does not support this script\";\r\n" \
"                break;\r\n" \
"            case AJAX_FAILED:\r\n" \
"                text = \"Failed to save data\";\r\n" \
"                break;\r\n" \
"        }\r\n" \
"        document.getElementById(\"config_res\").innerHTML = text;\r\n" \
"      }\r\n" \
"      function getElementsByClassName(className)\r\n" \
"      {\r\n" \
"        if (document.getElementsByClassName)\r\n" \
"        {\r\n" \
"          return document.getElementsByClassName(className);\r\n" \
"        }\r\n" \
"        else\r\n" \
"        {\r\n" \
"          var a = [];\r\n" \
"          var els = document.getElementsByTagName(\"*\");\r\n" \
"          for ( var i = 0, j = els.length ; i < j ; i++ ) {\r\n" \
"            if ((\" \"+els.item(i).className+\" \").indexOf(\" \" + className + \" \") != -1)\r\n" \
"              a.push(els.item(i));\r\n" \
"          }\r\n" \
"          return a;\r\n" \
"        }\r\n" \
"      }\r\n" \
"    /* ]]> */\r\n" \
"    </script>\r\n" \
"  </head>\r\n" \
"  <body style=\"font-family:verdana;\" >\r\n" \
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
"    <h3 style=\"text-align:center;\">Application Settings</h3>\r\n" \
"    <form id=\"settings_form\" action=\"\">\r\n" \
"      <table style=\"margin-left:auto;margin-right:auto;\" >\r\n" \
"            <tbody>";
const resource_hnd_t resources_config_DIR_device_settings_html = { RESOURCE_IN_MEMORY, 3312, { .mem = { resources_config_DIR_device_settings_html_data }}};

const char resources_config_DIR_device_settings_html_dev_settings_str_data[156] = "            <tr><td class=\"nameid\">String</td><td><input type=\"text\" class=\"ctrlid\"/>\r\n" \
"                <script type=\"text/javascript\">\r\n" \
"    /* <![CDATA[ */";
const resource_hnd_t resources_config_DIR_device_settings_html_dev_settings_str = { RESOURCE_IN_MEMORY, 155, { .mem = { resources_config_DIR_device_settings_html_dev_settings_str_data }}};

const char resources_config_DIR_device_settings_html_dev_settings_str_end_data[252] = "      getElementsByClassName(\"nameid\")[elem_num].innerHTML = labelname;\r\n" \
"      getElementsByClassName(\"ctrlid\")[elem_num].name = fieldname;\r\n" \
"      getElementsByClassName(\"ctrlid\")[elem_num].value = fieldvalue;\r\n" \
"    /* ]]> */\r\n" \
"    </script>\r\n" \
"</td></tr>";
const resource_hnd_t resources_config_DIR_device_settings_html_dev_settings_str_end = { RESOURCE_IN_MEMORY, 251, { .mem = { resources_config_DIR_device_settings_html_dev_settings_str_end_data }}};

const char resources_config_DIR_device_settings_html_dev_settings_int_data[158] = "            <tr><td class=\"nameid\">Integer</td><td><input type=\"number\"  class=\"ctrlid\"/></td></tr>\r\n" \
"    <script type=\"text/javascript\">\r\n" \
"    /* <![CDATA[ */";
const resource_hnd_t resources_config_DIR_device_settings_html_dev_settings_int = { RESOURCE_IN_MEMORY, 157, { .mem = { resources_config_DIR_device_settings_html_dev_settings_int_data }}};

const char resources_config_DIR_device_settings_html_dev_settings_int_end_data[240] = "      getElementsByClassName(\"nameid\")[elem_num].innerHTML = labelname;\r\n" \
"      getElementsByClassName(\"ctrlid\")[elem_num].name = fieldname;\r\n" \
"      getElementsByClassName(\"ctrlid\")[elem_num].value = fieldvalue;\r\n" \
"    /* ]]> */\r\n" \
"    </script>";
const resource_hnd_t resources_config_DIR_device_settings_html_dev_settings_int_end = { RESOURCE_IN_MEMORY, 239, { .mem = { resources_config_DIR_device_settings_html_dev_settings_int_end_data }}};
const char resources_config_DIR_device_settings_html_dev_settings_bottom_data[409] = "        <tr><td colspan=\"2\"><input type=\"button\" value=\"Save settings\" onclick=\"save_settings();\" style=\"float:right\" /><div align=\"center\" id=\"config_res\"></div></td></tr>\r\n" \
"        </tbody>\r\n" \
"      </table>\r\n" \
"    </form>\r\n" \
"    <input style=\"vertical-align:bottom;float:right;margin-right:50px\" type=\"button\" value=\"Wi-Fi Setup >\" onclick=\"document.location.href=\'scan_page_outer.html\'\" />\r\n" \
"  </body>\r\n" \
"</html>\r\n" \
"";
const resource_hnd_t resources_config_DIR_device_settings_html_dev_settings_bottom = { RESOURCE_IN_MEMORY, 408, { .mem = { resources_config_DIR_device_settings_html_dev_settings_bottom_data }}};
