#include "config.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mvnc_ext.h"

static void
usage (int ret)
{
  FILE *output;

  if (ret)
    output = stderr;
  else
    output = stdout;

  fputs ("Usage:\n", output);
  fputs ("\tmyriadctl boot|reset\n", output);
  fputs ("\tmyriadctl --help\n", output);
  fputs ("\tmyriadctl --version\n", output);
  exit (ret);
}


int main(int argc, char **argv)
{
  ncStatus_t res = 1;

  if (argc < 2)
    usage (1);

  /* Parse commandline. */
  for (int i = 1; i < argc; i++)
    {
      if (strcmp ("--version", argv[i]) == 0)
        {
          fprintf (stdout, "%s\n", PACKAGE_STRING);
          exit (0);
        }
      else if (strcmp ("boot", argv[i]) == 0)
	res = ncDeviceLoadFirmware (NC_ANY_PLATFORM, "/lib/firmware");
      else if (strcmp ("reset", argv[i]) == 0)
	res = ncDeviceResetAll ();
      else if (strcmp ("help", argv[i]) == 0 ||
	       strcmp ("--help", argv[i]) == 0)
	usage (0);
      else
	usage (1);
    }

  return res;
}
