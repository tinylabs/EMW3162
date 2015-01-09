#include "wiced_resource.h"

const char resources_config_DIR_redirect_html_data[2465] = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n" \
"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n" \
"<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" \
"  <head>\r\n" \
"    <meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />\r\n" \
"    <title>Broadcom WICED Device Config</title>\r\n" \
"    <style  type=\"text/css\"><!-- .normal { background-color: #ffffff; } .highlight { background-color: #8f0000;  } --></style>\r\n" \
"    <meta http-equiv=\"refresh\" content=\"2; URL=https://securedemo.wiced.broadcom.com/\">\r\n" \
"    <meta content=\"automatic redirection\">\r\n" \
"  </head>\r\n" \
"  <body style=\"font-family:verdana\">\r\n" \
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
"    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\'>\r\n" \
"      <tr><td><br/></td></tr>\r\n" \
"      <tr><td style=\"width:20px\"></td><td>Redirecting to a secure server, or click <a href=\"https://securedemo.wiced.broadcom.com\">here</a>.</td></tr>\r\n" \
"    </table>\r\n" \
"    <br/><br/><br/>\r\n" \
"    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\"98%\">\r\n" \
"      <tr><td style=\"width:20px\"></td><td><hr/></td></tr>\r\n" \
"      <tr><td style=\"width:20px\">\r\n" \
"          <td><i>Browser Compatibility Notes\r\n" \
"            <ol>\r\n" \
"              <li>Internet Explorer may take 15+ seconds to connect as a result of a TLS timeout issue. Please be patient.</li>\r\n" \
"              <li>Page loads may be slow on Apple iOS devices because TLS session resumption is not enabled.</li>\r\n" \
"              <li>Safari on OS X does not work due to an Apple known issue with the captive portal on OS X.</li>\r\n" \
"              <li>Firefox will not work. It expects some level of SSL2.0 compatibility. SSL2.0 is insecure.</li></i>\r\n" \
"          </td>\r\n" \
"      </tr>\r\n" \
"    <table>\r\n" \
"  </body>\r\n" \
"</html>";
const resource_hnd_t resources_config_DIR_redirect_html = { RESOURCE_IN_MEMORY, 2464, { .mem = { resources_config_DIR_redirect_html_data }}};
