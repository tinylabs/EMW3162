#include "wiced_resource.h"

const char resources_scripts_DIR_wpad_dat_data[62] = "function FindProxyForURL(url, host)\r\n" \
"{\r\n" \
"  return \"DIRECT\";\r\n" \
"}";
const resource_hnd_t resources_scripts_DIR_wpad_dat = { RESOURCE_IN_MEMORY, 61, { .mem = { resources_scripts_DIR_wpad_dat_data }}};
