#include "acs_i.h"

#ifdef __GNUC__
/* these are currently not in gemlib */
int16 mt_evnt_event(MultiEventIn *input, MultiEventOut *output, GlobalArray *globl)
{
	output->reserved = mt_evnt_multi(input->ev_mflags,
		input->ev_mbclicks, input->ev_mbmask, input->ev_mbstate,
		input->ev_mm1flags, input->xywh1.g_x, input->xywh1.g_y, input->xywh1.g_w, input->xywh1.g_h,
		input->ev_mm2flags, input->xywh2.g_x, input->xywh2.g_y, input->xywh2.g_w, input->xywh2.g_h,
		input->ev_mmgpbuff,
		input->ev_mtcount,
		&output->ev_mmox, &output->ev_mmoy, &output->ev_mmbutton, &output->ev_mmokstate, &output->ev_mkreturn, &output->ev_mbreturn, globl);
	return output->reserved;
}

int16 mt_EvntMulti(EVENT *evnt_data, GlobalArray *globl)
{
	evnt_data->ev_mwich = mt_evnt_multi(evnt_data->ev_mflags,
		evnt_data->ev_mbclicks, evnt_data->ev_bmask, evnt_data->ev_mbstate,
		evnt_data->ev_mm1flags, evnt_data->ev_mm1x, evnt_data->ev_mm1y, evnt_data->ev_mm1width, evnt_data->ev_mm1height,
		evnt_data->ev_mm2flags, evnt_data->ev_mm2x, evnt_data->ev_mm2y, evnt_data->ev_mm2width, evnt_data->ev_mm2height,
		evnt_data->ev_mmgpbuf,
		(evnt_data->ev_mthicount << 16) | (uint32)(uint16)evnt_data->ev_mtlocount,
		&evnt_data->ev_mmox, &evnt_data->ev_mmoy, &evnt_data->ev_mmobutton, &evnt_data->ev_mmokstate, &evnt_data->ev_mkreturn, &evnt_data->ev_mbreturn, globl);
	return evnt_data->ev_mwich;
}

int16 mt_wind_getQSB(const int16 handle, void **buffer, int32 *length, GlobalArray *globl)
{
	union {
		struct {
			int16 w1;
			int16 w2;
		} w;
		void *buffer;
	} b;
	union {
		struct {
			int16 w1;
			int16 w2;
		} w;
		int32 l;
	} l;
	int16 ret;

	ret = mt_wind_get(handle, WF_SCREEN, &b.w.w1, &b.w.w2, &l.w.w1, &l.w.w2, globl);
	if (buffer != NULL)
		*buffer = b.buffer;
	if (length != NULL)
	{
		*length = l.l;
		/* Die Korrektur fuer TOS 1.02 aus dem Profibuch */
		if (*length == 0 && globl->ap_version == 0x0120)
			*length = 8000;
	}
	return ret;
}

#endif
