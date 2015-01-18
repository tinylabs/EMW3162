#include "wiced.h"
#include "http_server.h"
#include "resources.h"
#include "dns_redirect.h"
//#include "wifi_config_dct.h"
//#include "AudioCodec.h"
#include "audioboard.h"

static const wiced_ip_setting_t ap_ip_settings =
{
    INITIALISER_IPV4_ADDRESS( .ip_address, MAKE_IPV4_ADDRESS( 192,168,  0,  1 ) ),
    INITIALISER_IPV4_ADDRESS( .netmask,    MAKE_IPV4_ADDRESS( 255,255,255,  0 ) ),
    INITIALISER_IPV4_ADDRESS( .gateway,    MAKE_IPV4_ADDRESS( 192,168,  0,  1 ) ),
};

static wiced_http_server_t ap_http_server;

START_OF_HTTP_PAGE_DATABASE(ap_web_pages)
    ROOT_HTTP_PAGE_REDIRECT("/index.html"),
    { "/index.html", "text/html", WICED_RESOURCE_URL_CONTENT,   .url_content.resource_data  = &build_resources_index_html_c,    },
    { "/test.png",   "image/png", WICED_RESOURCE_URL_CONTENT,   .url_content.resource_data  = &build_resources_test_png_c,      },
END_OF_HTTP_PAGE_DATABASE();

static dns_redirector_t    dns_redirector;

/******************************************************
 *               Function Definitions
 ******************************************************/
I2C_TypeDef i2cbus;
static wiced_thread_t transmit_thread;

static void transmit_over_i2c(uint32_t arg)
{

}

void application_start(void)
{
    /* Initialise the device */
    wiced_init();
    WPRINT_PLATFORM_INFO( ("WICED initialized.\n") );
	I2C_LowLevel_Init();
    WPRINT_PLATFORM_INFO( ("Audio shield initialized.\n") );
    /* Bring up the softAP interface ------------------------------------------------------------- */
    wiced_network_up(WICED_AP_INTERFACE, WICED_USE_INTERNAL_DHCP_SERVER, &ap_ip_settings);
    WPRINT_PLATFORM_INFO( ("Soft AP Up.\n") );
    /* Start a DNS redirect server to redirect wiced.com to the AP webserver database*/
    wiced_dns_redirector_start( &dns_redirector, WICED_AP_INTERFACE );
    WPRINT_PLATFORM_INFO( ("DNS Redirector initialised\n") );

    /* Start a web server on the AP interface */
    wiced_http_server_start( &ap_http_server, 80, ap_web_pages, WICED_AP_INTERFACE );
    WPRINT_PLATFORM_INFO( ("HTTP Daemon started\n") );



	//wiced_result_t result = wm8533_init(&ac);
}
