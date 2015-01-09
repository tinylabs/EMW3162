#include "wiced_resource.h"

const char resources_scripts_DIR_general_ajax_script_js_data[1907] = "\n" \
"function insert_and_eval( elemid, content )\r\n" \
"{\r\n" \
"  var elem = document.getElementById( elemid );\r\n" \
"  elem.innerHTML = content;\r\n" \
"  var scripts = elem.getElementsByTagName(\"script\");\r\n" \
"  for(var i=0; i < scripts.length; i++)\r\n" \
"  {\r\n" \
"    eval(scripts[i].innerHTML || scripts[i].text); // .text is necessary for IE.\r\n" \
"  }\r\n" \
"}\r\n" \
"\r\n" \
"var AJAX_FINISHED           =  0;\r\n" \
"var AJAX_NO_BROWSER_SUPPORT = -1;\r\n" \
"var AJAX_STARTING           = -2;\r\n" \
"var AJAX_PARTIAL_PROGRESS   = -3;\r\n" \
"var AJAX_FAILED             = -4;\r\n" \
"\r\n" \
"function do_ajax( ajax_url, callback_func )\r\n" \
"{\r\n" \
"  req = null;\r\n" \
"  if (window.XMLHttpRequest)\r\n" \
"  {\r\n" \
"    req = new XMLHttpRequest();\r\n" \
"    if (req.overrideMimeType)\r\n" \
"    {\r\n" \
"      req.overrideMimeType(\'text/xml\');\r\n" \
"    }\r\n" \
"  }\r\n" \
"  else if (window.ActiveXObject)\r\n" \
"  {\r\n" \
"    try {\r\n" \
"      req = new ActiveXObject(\"Msxml2.XMLHTTP\");\r\n" \
"    } catch (e)\r\n" \
"    {\r\n" \
"      try {\r\n" \
"          req = new ActiveXObject(\"Microsoft.XMLHTTP\");\r\n" \
"      } catch (e) {\r\n" \
"        if ( callback_func != null ) callback_func( AJAX_NO_BROWSER_SUPPORT, null );\r\n" \
"        return;\r\n" \
"      }\r\n" \
"    }\r\n" \
"  }\r\n" \
"  try {\r\n" \
"    req.onprogress = function( e )\r\n" \
"    {\r\n" \
"        if ( callback_func != null ) callback_func( AJAX_PARTIAL_PROGRESS, req.responseText );\r\n" \
"    }\r\n" \
"  } catch (e) { if ( callback_func != null ) callback_func( AJAX_PARTIAL_PROGRESS, null ); }\r\n" \
"  req.onreadystatechange = function()\r\n" \
"  {\r\n" \
"    if(req.readyState == 4)\r\n" \
"    {\r\n" \
"      if ((req.status == 200) \r\n" \
"//          || ( req.status == 0 )   // For testing local files in chrome with chrome.exe --allow-file-access-from-files\r\n" \
"          )\r\n" \
"      {\r\n" \
"        if ( callback_func != null ) callback_func( AJAX_FINISHED, req.responseText );\r\n" \
"      }\r\n" \
"      else\r\n" \
"      {\r\n" \
"        if ( callback_func != null ) callback_func( AJAX_FAILED, null );\r\n" \
"      }\r\n" \
"    }\r\n" \
"  };\r\n" \
"  req.open(\"GET\", ajax_url, true);\r\n" \
"  req.send(null);\r\n" \
"  if ( callback_func != null ) callback_func( AJAX_STARTING, null );\r\n" \
"}\r\n" \
"\r\n" \
"";
const resource_hnd_t resources_scripts_DIR_general_ajax_script_js = { RESOURCE_IN_MEMORY, 1906, { .mem = { resources_scripts_DIR_general_ajax_script_js_data }}};
