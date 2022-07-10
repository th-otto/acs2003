#include	<acs.h>
#include	"ab_cfg.h"
#include "acs230.h"
#include	"ab_cfg.ah"

int16 ACSinit(void)
{
	if (NULL == F_CFG.create(NULL))
		ACSmoduleterm();
	return OK;
}
