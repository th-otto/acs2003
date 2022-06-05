#include "acs_i.h"
#include "country.h"
#include "version.h"

static MFORM MO_ADD = {
	8, 8, 1, 0, 1,
	{ 0x0300, 0x1fb0, 0x3ff8, 0x3ffc, 0x7ffe, 0xfffe, 0xfffe, 0x7fff,
	  0x7fff, 0xffff, 0xffff, 0x7fff, 0x3fff, 0x0fff, 0x01ff, 0x007f },
	{ 0x0300, 0x1cb0, 0x2448, 0x2224, 0x7112, 0x9802, 0x84c2, 0x40c1,
	  0x73f1, 0x9bf0, 0x84cc, 0x40cc, 0x303f, 0x0e3f, 0x018c, 0x006c }
};
static MFORM MO_BLACK = {
	0, 0, 1, 0, 1,
	{ 0xc0ff, 0xe0ff, 0xf0ff, 0xf8ff, 0xfcff, 0xfeff, 0xffff, 0xffff,
	  0xffc0, 0xffe0, 0xfe00, 0xef00, 0xcf00, 0x8780, 0x0780, 0x0380 },
	{ 0x0000, 0x407e, 0x607e, 0x707e, 0x787e, 0x7c7e, 0x7e7e, 0x7f00,
	  0x7f80, 0x7c00, 0x6c00, 0x4600, 0x0600, 0x0300, 0x0300, 0x0000 }
};
static MFORM MO_DRAG = {
	8, 8, 1, 0, 1,
	{ 0x0300, 0x1fb0, 0x3ff8, 0x3ffc, 0x7ffe, 0xfffe, 0xfffe, 0x7fff,
	  0x7fff, 0xffff, 0xffff, 0x7fff, 0x3fff, 0x0fff, 0x01ff, 0x007f },
	{ 0x0300, 0x1cb0, 0x2448, 0x2224, 0x7112, 0x9802, 0x84c2, 0x40c1,
	  0x73f1, 0x9bf0, 0x84c0, 0x40c0, 0x3000, 0x0e00, 0x0180, 0x0060 }
};
static MFORM MO_TRANS = {
	0, 0, 1, 0, 1,
	{ 0xc0ff, 0xe0ff, 0xf0ff, 0xf8ff, 0xfcff, 0xfeff, 0xffff, 0xffff,
	  0xffc0, 0xffe0, 0xfe00, 0xef00, 0xcf00, 0x8780, 0x0780, 0x0380 },
	{ 0x00ff, 0x40ab, 0x60d5, 0x70ab, 0x78d5, 0x7cab, 0x7ed5, 0x7fff,
	  0x7f80, 0x7c00, 0x6c00, 0x4600, 0x0600, 0x0300, 0x0300, 0x0000 }
};
static MFORM MO_WHITE = {
	0, 0, 1, 0, 1,
	{ 0xc0ff, 0xe0ff, 0xf0ff, 0xf8ff, 0xfcff, 0xfeff, 0xffff, 0xffff,
	  0xffc0, 0xffe0, 0xfe00, 0xef00, 0xcf00, 0x8780, 0x0780, 0x0380 },
	{ 0x00ff, 0x4081, 0x6081, 0x7081, 0x7881, 0x7c81, 0x7e81, 0x7fff,
	  0x7f80, 0x7c00, 0x6c00, 0x4600, 0x0600, 0x0300, 0x0300, 0x0000 }
};

#if COUNTRY == COUNTRY_DE

Adescr ACSdescr = {
	"ACS" __STRINGIFY(ACS_VERSION_MAJOR) ".00",
	ACS_VERSION,
	-80, -80,
	AB_CLICKMENU | AB_FEEDBACK | AB_ACUSTIC | AB_CENTERDIALOG | AB_GDOSFONT | AB_SMARTREDRAW | AB_LAZYEVAL | AB_NOMEMCHECK,
	"  ACSpro " __STRINGIFY(ACS_VERSION_MAJOR) "." __STRINGIFY(ACS_VERSION_MINOR) "." __STRINGIFY(ACS_VERSION_MICRO) "\341",
	&PUR_DESK,
	NULL,
	{
		{ ARROW, NULL },
		{ BUSYBEE, NULL },
		{ POINT_HAND, NULL },
		{ FLAT_HAND, NULL },
		{ TEXT_CRSR, NULL },
		{ THIN_CROSS, NULL },
		{ THICK_CROSS, NULL },
		{ OUTLN_CROSS, NULL },
		{ USER_DEF, &MO_BLACK },
		{ USER_DEF, &MO_WHITE },
		{ USER_DEF, &MO_TRANS },
		{ USER_DEF, &MO_DRAG },
		{ USER_DEF, &MO_ADD },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL }
	},
	{
		"[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]",
		"[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildaufl”sung | ist nicht korrekt!][ Abbruch ]",
		"[1][ Eine Datei liež sich | nicht erzeugen!][ Abbruch ]",
		"[3][ Die Datei '%s'| l„žt sich nicht erzeugen! ][ Abbruch ]",
		"[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]",
		"[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]",
		"[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]",
		"[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schliežen.][    OK    ]",
		"[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| l”schen.][    OK    ]",
		"[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]",
		"[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]",
		"[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]",
		"[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]",
		"[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]",
		"[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]",
		"[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]",
		"[1][ Eine Datei liež sich| nicht korrekt ”ffnen! ][ Abbruch ]",
		"[1][ Die Datei '%s' | l„žt sich nicht ”ffnen!][ Abbruch ]",
		"[1][ Es steht nicht gengend | Speicher zur Verfgung!][ Abbruch ]",
		"[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]",
		"[1][ Ein Speicherblock| befindet sich aužerhalb | der legalen Bereiche!][ Abbruch ]",
		"[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]",
		"[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]",
		"[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		" Achtung ",
		" Frage ",
		" Stop ",
		" Meldung "
	}
};

Aconfig ACSconfig = {
	{ "", "%;", NULL, 0, 0, 4 },
	"PUR_DESK",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	CFG_INIT_GEMSCRIPT | CFG_INIT_BUBBLEGEM,
	0x5045,
	NULL,
	ACSinit0,
	ACSinit
};

#endif


#if COUNTRY == COUNTRY_US

Adescr ACSdescr = {
	"ACS" __STRINGIFY(ACS_VERSION_MAJOR) ".00",
	ACS_VERSION,
	-80, -80,
	AB_CLICKMENU | AB_FEEDBACK | AB_ACUSTIC | AB_CENTERDIALOG | AB_GDOSFONT | AB_SMARTREDRAW | AB_LAZYEVAL | AB_NOMEMCHECK,
	"  ACSpro " __STRINGIFY(ACS_VERSION_MAJOR) "." __STRINGIFY(ACS_VERSION_MINOR) "." __STRINGIFY(ACS_VERSION_MICRO) "\341",
	&PUR_DESK,
	NULL,
	{
		{ ARROW, NULL },
		{ BUSYBEE, NULL },
		{ POINT_HAND, NULL },
		{ FLAT_HAND, NULL },
		{ TEXT_CRSR, NULL },
		{ THIN_CROSS, NULL },
		{ THICK_CROSS, NULL },
		{ OUTLN_CROSS, NULL },
		{ USER_DEF, &MO_BLACK },
		{ USER_DEF, &MO_WHITE },
		{ USER_DEF, &MO_TRANS },
		{ USER_DEF, &MO_DRAG },
		{ USER_DEF, &MO_ADD },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL }
	},
	{
		"[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]",
		"[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildaufl”sung | ist nicht korrekt!][ Abbruch ]",
		"[1][ Eine Datei liež sich | nicht erzeugen!][ Abbruch ]",
		"[3][ Die Datei '%s'| l„žt sich nicht erzeugen! ][ Abbruch ]",
		"[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]",
		"[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]",
		"[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]",
		"[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schliežen.][    OK    ]",
		"[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| l”schen.][    OK    ]",
		"[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]",
		"[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]",
		"[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]",
		"[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]",
		"[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]",
		"[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]",
		"[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]",
		"[1][ Eine Datei liež sich| nicht korrekt ”ffnen! ][ Abbruch ]",
		"[1][ Die Datei '%s' | l„žt sich nicht ”ffnen!][ Abbruch ]",
		"[1][ Es steht nicht gengend | Speicher zur Verfgung!][ Abbruch ]",
		"[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]",
		"[1][ Ein Speicherblock| befindet sich aužerhalb | der legalen Bereiche!][ Abbruch ]",
		"[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]",
		"[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]",
		"[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		" Achtung ",
		" Frage ",
		" Stop ",
		" Meldung "
	}
};

Aconfig ACSconfig = {
	{ "", "%;", NULL, 0, 0, 4 },
	"PUR_DESK",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	CFG_INIT_GEMSCRIPT | CFG_INIT_BUBBLEGEM,
	0x5045,
	NULL,
	ACSinit0,
	ACSinit
};

#endif
