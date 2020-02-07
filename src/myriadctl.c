#include "mvnc_ext.h"

int main()
{
  ncStatus_t res = ncDeviceLoadFirmware(NC_ANY_PLATFORM, "/lib/firmware");

  return res;
}
