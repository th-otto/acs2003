typedef struct {
	ThermoData aktData;
	const char *title;
	int16 prozent;
	int16 thermArt;
	int16 thermComp;
	int16 color;
	boolean running;
	int32 timer;
	Awindow *thermo;
} ThermoStruct;

typedef struct {
	char *grp_name;
	int16 anzahl;
	char **cfg_strings;
} ACSCfgGruppe;

typedef struct _ACSConfig {
	UCfgInfo info;
	/* 18 */ boolean changed;
	/* 20 */ int16 grp_anzahl;
	/* 22 */ ACSCfgGruppe **cfg_grp;
	/* 26 */ int16 flags;
	/* 28 */ int16 head_anz;
	/* 30 */ char **header;
} ACSConfig;

typedef struct {
	char *grp_name;
	ACSCfgGruppe *gruppe;
	char *name;
	char *value;
	int16 index;
} ACSCfgSearchStruct;

typedef A_ListNextStruct StackElem;
typedef A_ListNextStruct QueueElem;
