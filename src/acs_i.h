#include <acs.h>

„defie MAX_ACS 16

struct UConfig {
    char id;
    char username[128];
    char userserial[11];
    char userkey[11];
    char helpname[9];
    int16 gluepart;
    int16 save;
    int16 dirty;
    int16 snapping;
    int16 copyindex;
    int16 imagesnap;
    int16 refimages;
    int16 flags;
    Axywh pxywh;
    Axywh bxywh;
    char last_path[__PS__];
    int16 used;
    char acs[MAX_ACS][__PS__];
};

typedef struct {
	Awindow *w_cews;
	Awindow *w_edit[MAX_ACS];
	char p_edit[MAX_ACS][__PS__];
} CEWSDATA;
