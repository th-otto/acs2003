/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Backplane handling                                    */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acslinea.h"

static int16 init = 0;
static int16 pxy[4] = { 0, 0, 0, 0 };
static int16 color[2] = { 1, 0 };
static void *screen;
static int16 max_x;
static int16 max_y;
static int16 bytes_lin;
static int16 v_rez_vt;
static int16 v_rez_hz;
static KBDVECS *vectors;
static void (*kb_mousevec)(CHAR *);

static ssize_t compress_image(MFDB *fdb, IMG_HEADER *header);
static uint8 vreplic(uint8 *planeptr[32], int16 nplanes, int16 linewidth);
static void uncompress_image(const IMG_HEADER *img_header, uint8 *src, uint8 *dst, uint8 *end);


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void INbackplan(void)
{
	if (init++ != 0)
		return;
	screen = Logbase();
	/* FIXME: use VDI for this */
	ACSInitLineA();
	bytes_lin = Vdiesc->bytes_lin;
	max_x = Vdiesc->dev_tab[0];
	max_y = Vdiesc->dev_tab[1];
	v_rez_vt = Vdiesc->v_rez_vt;
	v_rez_hz = Vdiesc->v_rez_hz;
}

/* -------------------------------------------------------------------------- */

/* Create Backplane with Width w and Height h */
MFDB *Abp_create(int16 w, int16 h)
{
	ssize_t size;
	int16 wdwidth;
	MFDB *bp;
	
	wdwidth = (w + 15) >> 4;
	size = (ssize_t)(h * ACSblk->nplanes) * 2 * wdwidth + sizeof(*bp);
	bp = Ax_malloc(size);
	if (bp != NULL)
	{
		memset(bp, 0, size);
		bp->fd_addr = (void *)(bp + 1);
		bp->fd_w = w;
		bp->fd_h = h;
		bp->fd_wdwidth = wdwidth;
		bp->fd_nplanes = ACSblk->nplanes;
	}
	return bp;
}

/* -------------------------------------------------------------------------- */

/* Free Backplane */
void Abp_delete(MFDB *bp)
{
	/* FIXME: nonsense, will only reuse the MFDB but not the buffer */
	Ax_recycle(bp, sizeof(*bp));
}

/* -------------------------------------------------------------------------- */

static void ret(void)
{
}

/* Start Writing on Backplane (all VDI and AES Calls) */
void Abp_start(MFDB *bp)
{
	if (init == 0)
		INbackplan();
	Amo_hide();
	/* FIXME: is that really needed? mouse is hidden and should not write to screen */
	vectors = Kbdvbase();
	kb_mousevec = vectors->kb_mousevec;
	vectors->kb_mousevec = (void (*)(CHAR *))ret;
	Setscreen(bp->fd_addr, (void *)-1, -1);
	Linea->v_lin_wr = Vdiesc->bytes_lin = bp->fd_wdwidth * 2 * bp->fd_nplanes;
	Vdiesc->v_rez_vt = bp->fd_h;
	Vdiesc->v_rez_hz = bp->fd_w;
	pxy[2] = Vdiesc->dev_tab[0] = bp->fd_w - 1;
	pxy[3] = Vdiesc->dev_tab[1] = bp->fd_h - 1;
	vs_clip(ACSblk->vdi_handle, TRUE, pxy);
}

/* -------------------------------------------------------------------------- */

/* Stop Writing on Backplane, resume to Screen */
void Abp_end(void)
{
	Vdiesc->bytes_lin = Linea->v_lin_wr = bytes_lin;
	Vdiesc->v_rez_vt = v_rez_vt;
	Vdiesc->v_rez_hz = v_rez_hz;
	pxy[2] = Vdiesc->dev_tab[0] = max_x;
	pxy[3] = Vdiesc->dev_tab[1] = max_y;
	Setscreen(screen, (void *)-1, -1);
	vectors->kb_mousevec = kb_mousevec;
	vs_clip(ACSblk->vdi_handle, TRUE, pxy);
	Amo_show();
}

/* -------------------------------------------------------------------------- */

/* Converts dev-depend. MFDB to IMG-Format, gives IMG-DATA-Length */
/* dest=NULL serves ONLY img_len, returns OK on sucess */
int16 Abp_mfdb2img(MFDB *org, IMG_HEADER **img_header, ssize_t *img_len)
{
	MFDB *dst;
	
	dst = Abp_create(org->fd_w, org->fd_h);
	if (dst == NULL)
		return FAIL;
	dst->fd_stand = TRUE;
#if WITH_FIXES
	if (org->fd_stand != 0)
		memcpy(dst, org, (ssize_t)dst->fd_wdwidth * 2 * dst->fd_h * dst->fd_nplanes + sizeof(*dst));
	else
		vr_trnfm(ACSblk->vdi_handle, org, dst);
	*img_len = compress_image(dst, NULL);
	if (img_header != NULL)
	{
		*img_header = Ax_malloc(*img_len + sizeof(**img_header));
		if (*img_header == NULL)
		{
			Abp_delete(dst);
			return FAIL;
		}
		compress_image(dst, *img_header);
		(*img_header)->version = 1;
		(*img_header)->headlen = (int)sizeof(**img_header) / 2;
		(*img_header)->planes = dst->fd_nplanes;
		(*img_header)->pat_run = 2;
		(*img_header)->pix_width = (*img_header)->pix_height = 500;
		(*img_header)->sl_width = dst->fd_w;
		(*img_header)->sl_height = dst->fd_h;
	}
	Abp_delete(dst);
#else
	if (org->fd_stand != 0)
		memcpy(dst, org, dst->fd_wdwidth * 2 * dst->fd_h * dst->fd_nplanes + sizeof(*dst)); /* BUG: missing cast to long */
	else
		vr_trnfm(ACSblk->vdi_handle, org, dst);
	*img_len = compress_image(dst, NULL);
	Abp_delete(dst);
	if (img_header == NULL)
		return OK;
	*img_header = Ax_malloc(*img_len + sizeof(**img_header));
	if (*img_header == NULL)
		return FAIL;
	dst = Abp_create(org->fd_w, org->fd_h);
	if (dst == NULL)
	{
		Ax_ifree(*img_header);
		return FAIL;
	}
	dst->fd_stand = TRUE;
	if (org->fd_stand != 0)
		memcpy(dst, org, dst->fd_wdwidth * 2 * dst->fd_h * dst->fd_nplanes + sizeof(*dst)); /* BUG: missing cast to long */
	else
		vr_trnfm(ACSblk->vdi_handle, org, dst);
	compress_image(dst, *img_header);
	(*img_header)->version = 1;
	(*img_header)->headlen = (int)sizeof(**img_header) / 2;
	(*img_header)->planes = dst->fd_nplanes;
	(*img_header)->pat_run = 2;
	(*img_header)->pix_width = (*img_header)->pix_height = 500;
	(*img_header)->sl_width = dst->fd_w;
	(*img_header)->sl_height = dst->fd_h;
	Abp_delete(dst);
#endif
	return OK;
}

/* -------------------------------------------------------------------------- */

static ssize_t compress_image(MFDB *fdb, IMG_HEADER *header)
{
	int8 *dst;
	int16 p;
	int16 h;
	int16 w;
	int16 wdwidth;
	int16 linewidth;
	uint8 linecount;
	uint8 pattern;
	uint8 plane;
	uint8 c1;
	uint8 c2;
	uint8 *ptr;
	uint8 *start;
	uint8 *planeptr[32];
	ssize_t planesize;
	ssize_t size;
	
	if (header == NULL)
		dst = NULL;
	else
		dst = (int8 *)(header + 1);
	linewidth = (fdb->fd_w + 7) >> 3;
	wdwidth = fdb->fd_wdwidth;
	planesize = (ssize_t)(wdwidth * 2) * fdb->fd_h;
	ptr = fdb->fd_addr;
	for (plane = 0; plane < fdb->fd_nplanes; plane++)
		planeptr[plane] = ptr + plane * planesize;
	size = 0;
	for (h = fdb->fd_h; h > 0; )
	{
		linecount = vreplic(planeptr, fdb->fd_nplanes, linewidth);
		if (linecount > 1)
		{
			if (linecount > h)
				linecount = h;
			size += 4;
			if (dst != NULL)
			{
				*dst++ = 0;
				*dst++ = 0;
				*dst++ = -1;
				*dst++ = linecount;
			}
		}
		for (p = 0; p < fdb->fd_nplanes; p++)
		{
			w = linewidth;
			ptr = planeptr[p];
			while (w > 0)
			{
				pattern = 0;
				if (*ptr == 0)
				{
					do
					{
						--w;
						++pattern;
						++ptr;
					} while (*ptr == 0 && pattern < 127 && w > 0);
					size++;
					if (dst != NULL)
						*dst++ = pattern;
				} else if (*ptr == 0xff)
				{
					do
					{
						--w;
						++pattern;
						++ptr;
					} while (*ptr == 0xff && pattern < 127 && w > 0);
					size++;
					if (dst != NULL)
						*dst++ = pattern | 0x80;
				} else
				{
					c1 = ptr[0];
					c2 = ptr[1];
					if (w > 3 && c1 == ptr[2] && c2 == ptr[3])
					{
						pattern = 1;
						ptr += 2;
						w -= 2;
						do
						{
							w -= 2;
							pattern += 1;
							ptr += 2;
						} while (c1 == ptr[0] && c2 == ptr[1] && pattern < 254 && w > 1);
						size += 4;
						if (dst != NULL)
						{
							*dst++ = 0;
							*dst++ = pattern;
							*dst++ = c1;
							*dst++ = c2;
						}
					} else
					{
						start = ptr;
						while (TRUE)
						{
							w -= 1;
							pattern += 1;
							ptr++;
							if (w == 0 || pattern == 255)
								break;
							if (w > 2)
							{
								if (ptr[0] == 0 && ptr[1] == 0 && ptr[2] == 0)
									break;
								if (ptr[0] == 0xff && ptr[1] == 0xff && ptr[2] == 0xff)
									break;
								if (w > 4)
								{
									c1 = ptr[0];
									c2 = ptr[1];
									if (ptr[2] == c1 && ptr[3] == c2)
										break;
								}
							}
						}
						size += pattern + 2;
						if (dst != NULL)
						{
							*dst++ = 0x80;
							*dst++ = pattern;
							while (pattern-- != 0)
								*dst++ = *start++;
						}
					}
				}
			}
			planeptr[p] += (ssize_t)linecount * wdwidth * 2;
		}
		h -= linecount;
	}
	return size;
}

/* -------------------------------------------------------------------------- */

static uint8 vreplic(uint8 *planeptr[32], int16 nplanes, int16 linewidth)
{
	int16 plane;
	int16 x;
	uint8 *end[32];
	uint8 *ptr;
	uint8 *nextptr;
	uint8 linecount;
	int16 w;
	
	w = linewidth;
	if (linewidth & 1)
		w++;
	linecount = 1;
	for (plane = nplanes - 1; plane >= 0; plane--)
		end[plane] = planeptr[plane] + w;
	while (linecount < 255)
	{
		for (plane = nplanes - 1; plane >= 0; plane--)
		{
			ptr = planeptr[plane];
			nextptr = end[plane];
			for (x = linewidth - 1; x >= 0; x--)
			{
				if (*ptr++ != *nextptr++)
					return linecount;
			}
			end[plane] += w;
		}
		linecount++;
	}
	return linecount;
}

/* -------------------------------------------------------------------------- */

/* Converts IMAGE to MFDB, transform into dev-fmt, if do_trnsfm=TRUE, OK on success */
int16 Abp_img2mfdb(const IMG_HEADER *img_header, MFDB **fdb, boolean do_trnsfm)
{
	MFDB tmp;
	ssize_t planesize;
	int16 nplanes;
	int16 pxy[8];
	int16 diff_planes;
	uint8 *dst;
	uint8 *src;
	
	if ((*fdb = Abp_create(img_header->sl_width, img_header->sl_height)) == NULL)
		return FAIL;
	tmp.fd_w = img_header->sl_width;
	tmp.fd_h = img_header->sl_height;
	tmp.fd_wdwidth = ((img_header->sl_width + 15u) & -16) >> 4;
	tmp.fd_stand = 1;
	tmp.fd_nplanes = ACSblk->nplanes;
	if (ACSblk->nplanes > img_header->planes)
		nplanes = ACSblk->nplanes;
	else
		nplanes = img_header->planes;
	tmp.fd_r1 = tmp.fd_r2 = tmp.fd_r3 = 0;
	planesize = (ssize_t)tmp.fd_wdwidth * tmp.fd_h * 2;
	dst = Ax_malloc(planesize * nplanes + 1);
	if (dst == NULL)
	{
		Abp_delete(*fdb);
		return FAIL;
	}
	tmp.fd_addr = dst;
	src = (uint8 *)img_header + (ssize_t)img_header->headlen * 2;
	uncompress_image(img_header, src, dst, &dst[planesize * nplanes]);
	if (do_trnsfm)
	{
		diff_planes = ACSblk->nplanes - img_header->planes;
		if (diff_planes > 0)
		{
			if (img_header->planes == 1)
			{
				tmp.fd_nplanes = 1;
				vr_trnfm(ACSblk->vdi_handle, &tmp, &tmp);
				pxy[0] = pxy[1] = pxy[4] = pxy[5] = 0;
				pxy[2] = pxy[6] = (*fdb)->fd_w - 1;
				pxy[3] = pxy[7] = (*fdb)->fd_h - 1;
				vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &tmp, *fdb, color);
			} else
			{
				memset(dst + img_header->planes * planesize, 0, diff_planes * planesize);
				vr_trnfm(ACSblk->vdi_handle, &tmp, *fdb);
			}
		} else
		{
			vr_trnfm(ACSblk->vdi_handle, &tmp, *fdb);
		}
		(*fdb)->fd_stand = FALSE;
	} else
	{
		memcpy((*fdb)->fd_addr, dst, planesize * nplanes);
		(*fdb)->fd_stand = TRUE;
	}
	Ax_ifree(dst);
	return OK;
}

/* -------------------------------------------------------------------------- */

static void uncompress_image(const IMG_HEADER *img_header, uint8 *src, uint8 *dst, uint8 *end)
{
	int16 plane;
	int16 h;
	int16 w;
	int16 linewidth;
	int16 wdwidth;
	uint8 linecount;
	uint8 bytecount;
	uint8 patternsize;
	uint8 c2;
	uint8 *ptr;
	uint8 *dstptr;
	uint8 *planeptr[32];
	ssize_t planesize;
	
	linewidth = (img_header->sl_width + 7) >> 3;
	wdwidth = (linewidth + 1) & -2;
	planesize = (ssize_t)wdwidth * img_header->sl_height;
	for (bytecount = 0; bytecount < img_header->planes; bytecount++)
		planeptr[bytecount] = dst + bytecount * planesize;
	for (h = img_header->sl_height; h > 0; h--)
	{
		linecount = 0;
		for (plane = 0; plane < img_header->planes; plane++)
		{
			w = linewidth;
			ptr = dstptr = planeptr[plane];
			if (dstptr >= end)
			{
				ACSblk->ACSerror(AE_IMG, NULL);
				return;
			}
			while (w > 0)
			{
				switch (*src++)
				{
				case 0:
					bytecount = *src++;
					if (bytecount == 0)
					{
						if (*src == 0xff)
							src++;
						linecount = *src++ - 1;
					} else
					{
						/* patternrun */
						while (bytecount != 0)
						{
							for (patternsize = 0; patternsize < img_header->pat_run; patternsize++)
							{
								*dstptr++ = src[patternsize];
								w--;
							}
							bytecount--;
						}
						src += img_header->pat_run;
					}
					break;
				
				case 0x80:
					/* bitstring */
					bytecount = *src++;
					while (bytecount != 0)
					{
						*dstptr++ = *src++;
						w--;
						bytecount--;
					}
					break;
				
				default:
					/* solidrun */
					bytecount = src[-1];
					if (bytecount & 0x80)
					{
						c2 = 0xff;
						bytecount &= 0x7f;
					} else
					{
						c2 = 0;
					}
					while (bytecount != 0)
					{
						*dstptr++ = c2;
						w--;
						bytecount --;
					}
					break;
				}
			}
			if (linewidth & 1)
				*dstptr++ = 0;
			for (bytecount = 0; bytecount < linecount; bytecount++)
			{
				memcpy(dstptr, ptr, linewidth);
				dstptr += linewidth;
				if (linewidth & 1)
					*dstptr++ = 0;
			}
			planeptr[plane] = dstptr;
		}
		h -= linecount;
	}
}
