#include <string.h>
#include <math.h>
#include "acs.h"
#include "acs230.h"
#include "../src/country.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

static void calc_drag(void);
static void calc_clear(void);
static void calc_backspace(void);
static void calc_plusminus(void);
static void calc_mul(void);
static void calc_div(void);
static void calc_add(void);
static void calc_sub(void);
static void calc_equal(void);
static void calc_insert0(void);
static void calc_insert1(void);
static void calc_insert2(void);
static void calc_insert3(void);
static void calc_insert4(void);
static void calc_insert5(void);
static void calc_insert6(void);
static void calc_insert7(void);
static void calc_insert8(void);
static void calc_insert9(void);
static void calc_insert_dot(void);
static int16 calc_keys(Awindow *self, int16 kstate, int16 key);

static boolean calc_service(Awindow *self, int16 task, void *in_out);
static Awindow *calc_create(void *para);

#include "rechner.ah"

#define CALC_INPUT 3

#define INPUT_LEN 14
#define NUM_OPS   2

typedef struct {
	double val[NUM_OPS];
	char op[NUM_OPS];
	char input[INPUT_LEN + 2];
} CALC_DATA;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void setinput(Awindow *self)
{
	CALC_DATA *data = self->user;
	char *text = self->work[CALC_INPUT].ob_spec.tedinfo->te_ptext;
	
	strcpy(text, data->input);
	while (*text == ' ')
		text++;
	((AOBJECT *)&self->work[CALC_INPUT + 1])->userp1 = text;
	self->obchange(self, CALC_INPUT, -1);
}

/* -------------------------------------------------------------------------- */

static void calc_key(char key)
{
	CALC_DATA *data = ACSblk->ev_window->user;
	char *text;
	
	if (data->op[0] != 'E' && data->input[1] == ' ')
	{
		text = data->input;
		while (*text == ' ')
			text++;
		if (*text != '0')
			strcpy(data->input, data->input + 1);
		data->input[INPUT_LEN - 1] = key;
		setinput(ACSblk->ev_window);
	}
}

/* -------------------------------------------------------------------------- */

static void calc_insert0(void)
{
	calc_key('0');
}

/* -------------------------------------------------------------------------- */

static void calc_insert1(void)
{
	calc_key('1');
}

/* -------------------------------------------------------------------------- */

static void calc_insert2(void)
{
	calc_key('2');
}

/* -------------------------------------------------------------------------- */

static void calc_insert3(void)
{
	calc_key('3');
}

/* -------------------------------------------------------------------------- */

static void calc_insert4(void)
{
	calc_key('4');
}

/* -------------------------------------------------------------------------- */

static void calc_insert5(void)
{
	calc_key('5');
}

/* -------------------------------------------------------------------------- */

static void calc_insert6(void)
{
	calc_key('6');
}

/* -------------------------------------------------------------------------- */

static void calc_insert7(void)
{
	calc_key('7');
}

/* -------------------------------------------------------------------------- */

static void calc_insert8(void)
{
	calc_key('8');
}

/* -------------------------------------------------------------------------- */

static void calc_insert9(void)
{
	calc_key('9');
}

/* -------------------------------------------------------------------------- */

static void calc_insert_dot(void)
{
	CALC_DATA *data = ACSblk->ev_window->user;
	
	if (strchr(data->input, '.') == NULL)
		calc_key('.');
}

/* -------------------------------------------------------------------------- */

static void setzero(Awindow *self)
{
	CALC_DATA *data = self->user;
	
	strncpy(data->input, "             0", INPUT_LEN);
	data->input[INPUT_LEN] = '\0';
}

/* -------------------------------------------------------------------------- */

static void reset(Awindow *self)
{
	int i;
	CALC_DATA *data;
	
	setzero(self);
	data = self->user;
	for (i = 0; i < NUM_OPS; i++)
	{
		data->val[i] = 0.0;
		data->op[i] = '=';
	}
}

/* -------------------------------------------------------------------------- */

static double binop(Awindow *self, double x)
{
	CALC_DATA *data = self->user;
	double val0;
	char op0;
	int i;
	
	val0 = data->val[0];
	op0 = data->op[0];
	for (i = 0; i < NUM_OPS - 1; i++)
	{
		data->val[i] = data->val[i + 1];
		data->op[i] = data->op[i + 1];
	}
	data->op[NUM_OPS - 1] = '=';
	switch (op0)
	{
	case '+':
		return val0 + x;
	case '-':
		return val0 - x;
	case '*':
		return val0 * x;
	case '/':
		if (x != 0.0)
			return val0 / x;
		break;
	}
	strncpy(data->input, TEXT_001, INPUT_LEN);
	setinput(self);
	data->op[0] = 'E';
	return 0.0;
}

/* -------------------------------------------------------------------------- */

#ifdef __GNUC__
static int ftoa(double *x, char *resStr, int ndig, int __format, int *decPnt, int *sign)
{
	strcpy(resStr, fcvt(*x, ndig, decPnt, sign));
	return 0;
}
#endif

static void calc_op(char op)
{
	Awindow *self = ACSblk->ev_window;
	CALC_DATA *data = self->user;
	double val;
	char buf[40];
	int decpnt;
	int sign;
	int i;
	
	if (data->op[0] != 'E')
	{
		if (data->input[INPUT_LEN - 1] == ' ')
		{
			switch (data->op[0])
			{
			case '*':
			case '/':
				if (op == '*' || op == '/')
				{
					data->op[0] = op;
					return;
				} else
				{
					val = 1.0;
				}
				break;
			case '+':
			case '-':
				if (op == '+' || op == '-')
				{
					data->op[0] = op;
					return;
				} else
				{
					val = 0.0;
				}
				break;
			case '=':
				if (op == '=')
					return;
				val = data->val[0];
				break;
#ifdef __GNUC__
			default:
				val = 0.0;
				break;
#endif
			}
		} else
		{
			val = strtod(data->input, NULL);
		}
		
		for (;;)
		{
			if (op == '+' || op == '-' || op == '=')
			{
				if (data->op[0] == '=')
					break;
				val = binop(self, val);
				if (data->op[0] == 'E')
					return;
				continue;
			} else
			{
				if (op != '*' && op != '/')
					break;
				if (data->op[0] == '*' || data->op[0] == '/')
				{
					val = binop(self, val);
					if (data->op[0] == 'E')
						return;
					continue;
				} else
				{
					for (i = NUM_OPS - 1; i > 0; i--)
					{
						data->val[i] = data->val[i - 1];
						data->op[i] = data->op[i - 1];
					}
					break;
				}
			}
		}
		
		data->val[0] = val;
		data->op[0] = op;
		ftoa(&val, &buf[1], 14, 1, &decpnt, &sign);
		if (sign == 0)
			buf[0] = ' ';
		else
			buf[0] = '-';
		if (decpnt > 0)
		{
			i = 14 - decpnt;
			i--;
			if (i < 0)
			{
				strcpy(&buf[1], "OVERFLOW");
			} else
			{
				memmove(&buf[decpnt + 2], &buf[decpnt + 1], i);
				buf[decpnt + 1] = '.';
			}
		} else
		{
			decpnt = -decpnt;
			i = 14 - decpnt;
			i -= 2;
			if (i <= 0)
			{
				strcpy(buf, " .000000000000000");
				val = 0.0;
			} else
			{
				memmove(&buf[decpnt + 2], &buf[1], i + 1);
				buf[1] = '.';
				memset(&buf[2], '0', decpnt);
			}
		}
		
		i = INPUT_LEN;
		do
		{
			buf[i] = '\0';
			i--;
		} while (buf[i] == '0');
		if (buf[i] == '.')
		{
			if (i <= 1)
			{
				buf[i] = '0';
			} else
			{
				buf[i] = '\0';
				i--;
			}
		}
		strcpy(data->input, "              ");
		i = INPUT_LEN - i - 1;
		if (i < 0)
			i = 0;
		strncpy(&data->input[i], buf, INPUT_LEN - i);
		data->input[INPUT_LEN] = '\0';
		setinput(self);
		setzero(self);
	}
}

/* -------------------------------------------------------------------------- */

static void calc_clear(void)
{
	reset(ACSblk->ev_window);
	setinput(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void calc_backspace(void)
{
	CALC_DATA *data = ACSblk->ev_window->user;
	char buf[INPUT_LEN * 2 + 4];
	
	if (data->input[INPUT_LEN - 1] != ' ')
	{
		strcpy(buf, data->input);
		strcpy(&data->input[1], buf);
		data->input[0] = ' ';
		data->input[INPUT_LEN] = '\0';
		setinput(ACSblk->ev_window);
	}
}

/* -------------------------------------------------------------------------- */

static void calc_plusminus(void)
{
	Awindow *self = ACSblk->ev_window;
	CALC_DATA *data = self->user;
	char *text;
	
	if (data->op[0] != 'E')
	{
		if (data->input[INPUT_LEN - 1] == ' ')
		{
			strcpy(data->input, self->work[CALC_INPUT].ob_spec.tedinfo->te_ptext);
		}
		text = data->input;
		while (*text == ' ')
			text++;
		if (*text != '0')
		{
			if (*text == '-')
				*text = ' ';
			else
				text[-1] = '-';
			setinput(self);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void calc_div(void)
{
	calc_op('/');
}

/* -------------------------------------------------------------------------- */

static void calc_mul(void)
{
	calc_op('*');
}

/* -------------------------------------------------------------------------- */

static void calc_add(void)
{
	calc_op('+');
}

/* -------------------------------------------------------------------------- */

static void calc_sub(void)
{
	calc_op('-');
}

/* -------------------------------------------------------------------------- */

static void calc_equal(void)
{
	calc_op('=');
}

/* -------------------------------------------------------------------------- */

static void calc_drag(void)
{
	Awindow *win;
	int16 obnr;
	AOBJECT *aobj;
	CALC_DATA *data;
	
	win = ACSblk->Aselect.window;
	if (ACSblk->ev_window != win)
	{
		Adr_start();
		obnr = Adr_next();
		if (obnr >= 0)
		{
			aobj = (AOBJECT *)&win->work[obnr] + 1;
			if (aobj->type == AT_STRING)
			{
				Adr_del(win, obnr);
				data = ACSblk->ev_window->user;
				strncpy(data->input, aobj->userp1, INPUT_LEN);
				setinput(ACSblk->ev_window);
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static int16 calc_keys(Awindow *self, int16 kstate, int16 key)
{
	CALC_DATA *data = self->user;
	void *text;
	ssize_t len;
	
	if (key < 0 && (key & NKF_CTRL)) /* key & NKF_FUNC */
	{
		switch ((char) key)
		{
		case 'C':
			Ascrp_put("TXT", data->input, strlen(data->input), FALSE);
			return -1;
		case 'V':
			if (Ascrp_get("TXT", &text, &len))
			{
				strncpy(data->input, text, min(len, INPUT_LEN));
				setinput(self);
				Ax_free(text);
			}
			return -1;
		}
	}
	return Awi_keys(self, kstate, key);
}

/* -------------------------------------------------------------------------- */

static Awindow *calc_create(void *para)
{
	CALC_DATA *data;
	Awindow *self;
	
	UNUSED(para);
	data = Ax_malloc(sizeof(*data));
	if (data == NULL)
		return NULL;
	self = Awi_create((Awindow *)&calc_win);
	if (self == NULL)
	{
		Ax_free(data);
		return NULL;
	}
	self->user = data;
	reset(self);
	setinput(self);
	return self;
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	Ax_free(self->user);
	Awi_delete(self);
	ACSmoduleterm();
}

/* -------------------------------------------------------------------------- */

static boolean calc_service(Awindow *self, int16 task, void *in_out)
{
	Awindow *win;
	
	switch (task)
	{
	case AS_TERM:
		term(self);
		break;
	
	case AS_INFO:
		win = info_win.create((Awindow *)&info_win);
		if (win != NULL)
		{
			Awi_dialog(win);
			Awi_delete(win);
		}
		break;
	
	case AS_DELETE:
		Adr_unselect();
		reset(self);
		setinput(self);
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	calc_win.create(NULL);
	return OK;
}
