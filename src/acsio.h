#include <setjmp.h>

/*
 * io/acsio.c
 */
#define NL "\r\n"

extern char const pc_welcome[];
extern char const pp_welcome[];
extern char const str_welcome[];

void acs_closewi(Awindow *win, int16);
void assert_error(int16 error, void *para);
jmp_buf *set_handle(int16 h);
void save_buf(const void *data, size_t len);
void save_string(const char *str);
void close_buf(void);
void read_buf(void *data, size_t len);
int16 save_acs(ACS_HEAD *acs, int16 handle);
void init_acs(ACS_HEAD *acs);
void init_ml_list(ACS_HEAD *acs, Obj_Head *obj, void *);
void del_mess(ACS_HEAD *acs);
void init_mess(ACS_HEAD *acs);
int16 read_acs(ACS_HEAD *parent, ACS_HEAD *acs, int32);


