/*
 * protocol-version we support (currently 1.2)
 */
#define GEMSCRIPT_VERSION 0x120


#if 0
typedef struct {
	int32	len;			/* Laenge der Struktur in Bytes */
	int16	version;		/* Versionsnummer des Protokolles beim Sender */
	int16	msgs;			/* Bitmap der unterstuetzten Nachrichten (GSM_xxx) */
	int32	ext;			/* benutzte Endung, etwa '.SIC' */
} GS_INFO;
#endif

/* Nachrichten */	
#define GS_REQUEST		0x1350
#define GS_REPLY		0x1351
#define GS_COMMAND		0x1352
#define GS_ACK			0x1353
#define GS_QUIT			0x1354
#define GS_OPENMACRO	0x1355
#define GS_MACRO		0x1356
#define GS_WRITE		0x1357
#define GS_CLOSEMACRO	0x1358

