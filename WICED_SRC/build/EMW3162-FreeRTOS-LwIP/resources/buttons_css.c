#include "wiced_resource.h"

const char resources_styles_DIR_buttons_css_data[4893] = "/* Buttons courtesy http://webdesignerwall.com/tutorials/css3-gradient-buttons */\r\n" \
".button {\r\n" \
"    display: inline-block;\r\n" \
"    zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */\r\n" \
"    *display: inline;\r\n" \
"    vertical-align: baseline;\r\n" \
"    margin: 0 2px;\r\n" \
"    outline: none;\r\n" \
"    cursor: pointer;\r\n" \
"    text-align: center;\r\n" \
"    text-decoration: none;\r\n" \
"    font: 14px/100% Arial, Helvetica, sans-serif;\r\n" \
"    padding: .5em 1.5em .55em;\r\n" \
"    text-shadow: 0 1px 1px rgba(0,0,0,.3);\r\n" \
"    behavior: url(/styles/border-radius.htc);\r\n" \
"    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);\r\n" \
"    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);\r\n" \
"    box-shadow: 0 1px 2px rgba(0,0,0,.2);\r\n" \
"}\r\n" \
".button:hover {\r\n" \
"    text-decoration: none;\r\n" \
"}\r\n" \
".button:active {\r\n" \
"    position: relative;\r\n" \
"    top: 1px;\r\n" \
"}\r\n" \
"\r\n" \
".bigrounded {\r\n" \
"    -webkit-border-radius: 2em;\r\n" \
"    -moz-border-radius: 2em;\r\n" \
"    border-radius: 2em;\r\n" \
"}\r\n" \
".medium {\r\n" \
"    font-size: 12px;\r\n" \
"    padding: .4em 1.5em .42em;\r\n" \
"}\r\n" \
".small {\r\n" \
"    font-size: 11px;\r\n" \
"    padding: .2em 1em .275em;\r\n" \
"}\r\n" \
".red {\r\n" \
"    color: #faddde;\r\n" \
"    border: solid 1px #980c10;\r\n" \
"    background: #d81b21;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#ed1c24), to(#aa1317));\r\n" \
"    background: -moz-linear-gradient(top,  #ed1c24,  #aa1317);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#ed1c24\', endColorstr=\'#aa1317\');\r\n" \
"}\r\n" \
".red:hover {\r\n" \
"    background: #b61318;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#c9151b), to(#a11115));\r\n" \
"    background: -moz-linear-gradient(top,  #c9151b,  #a11115);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#c9151b\', endColorstr=\'#a11115\');\r\n" \
"}\r\n" \
".red:active {\r\n" \
"    color: #de898c;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#aa1317), to(#ed1c24));\r\n" \
"    background: -moz-linear-gradient(top,  #aa1317,  #ed1c24);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#aa1317\', endColorstr=\'#ed1c24\');\r\n" \
"}\r\n" \
"\r\n" \
".blue {\r\n" \
"    color: #d9eef7;\r\n" \
"    border: solid 1px #0076a3;\r\n" \
"    background: #0095cd;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));\r\n" \
"    background: -moz-linear-gradient(top,  #00adee,  #0078a5);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#00adee\', endColorstr=\'#0078a5\');\r\n" \
"}\r\n" \
"    .blue:hover {\r\n" \
"    background: #007ead;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));\r\n" \
"    background: -moz-linear-gradient(top,  #0095cc,  #00678e);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#0095cc\', endColorstr=\'#00678e\');\r\n" \
"}\r\n" \
"    .blue:active {\r\n" \
"    color: #80bed6;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee));\r\n" \
"    background: -moz-linear-gradient(top,  #0078a5,  #00adee);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#0078a5\', endColorstr=\'#00adee\');\r\n" \
"}\r\n" \
"\r\n" \
".white {\r\n" \
"    color: #606060;\r\n" \
"    border: solid 1px #b7b7b7;\r\n" \
"    background: #fff;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));\r\n" \
"    background: -moz-linear-gradient(top,  #fff,  #ededed);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#ffffff\', endColorstr=\'#ededed\');\r\n" \
"}\r\n" \
".white:hover {\r\n" \
"    background: #ededed;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));\r\n" \
"    background: -moz-linear-gradient(top,  #fff,  #dcdcdc);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#ffffff\', endColorstr=\'#dcdcdc\');\r\n" \
"}\r\n" \
".white:active {\r\n" \
"    color: #999;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));\r\n" \
"    background: -moz-linear-gradient(top,  #ededed,  #fff);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#ededed\', endColorstr=\'#ffffff\');\r\n" \
"}\r\n" \
".green {\r\n" \
"    color: #e8f0de;\r\n" \
"    border: solid 1px #538312;\r\n" \
"    background: #64991e;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#7db72f), to(#4e7d0e));\r\n" \
"    background: -moz-linear-gradient(top,  #7db72f,  #4e7d0e);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#7db72f\', endColorstr=\'#4e7d0e\');\r\n" \
"}\r\n" \
".green:hover {\r\n" \
"    background: #538018;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#6b9d28), to(#436b0c));\r\n" \
"    background: -moz-linear-gradient(top,  #6b9d28,  #436b0c);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#6b9d28\', endColorstr=\'#436b0c\');\r\n" \
"}\r\n" \
".green:active {\r\n" \
"    color: #a9c08c;\r\n" \
"    background: -webkit-gradient(linear, left top, left bottom, from(#4e7d0e), to(#7db72f));\r\n" \
"    background: -moz-linear-gradient(top,  #4e7d0e,  #7db72f);\r\n" \
"    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#4e7d0e\', endColorstr=\'#7db72f\');\r\n" \
"}";
const resource_hnd_t resources_styles_DIR_buttons_css = { RESOURCE_IN_MEMORY, 4892, { .mem = { resources_styles_DIR_buttons_css_data }}};
