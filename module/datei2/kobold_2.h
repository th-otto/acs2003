/* ----------- Schnittstellen-Nachrichten -------------------------------------*/

#define KOBOLD_JOB 0x2F10          /* Speicherjob starten                      */
#define KOBOLD_JOB_NO_WINDOW 0x2F11/* Dito, ohne Hauptdialog                   */

#define KOBOLD_ANSWER 0x2F12       /* Antwort vom KOBOLD mit Status in Wort 3  */
                                   /* und Zeile in Wort 4                      */

#define KOBOLD_CONFIG 0x2F13       /* Konfiguration erfragen. Dazu muû in Wort */
                                   /* 3 & 4 ein Zeiger auf eine KOBOLD_CONFIGU-*/
                                   /* RATION Struktur Åbergeben werden.        */

#define KOBOLD_FIRST_SLCT 0x2F14   /* Erfragt die aktuelle Selektion im Quell- */
#define KOBOLD_NEXT_SLCT 0x2F15    /* fenster. Mit ..FIRST.. erhÑlt man das    */
                                   /* erste Objekt, mit ..NEXT.. alle weiteren.*/
                                   /* In Wort 3 & 4 muû ein Zeiger auf einen   */
                                   /* 128 Bytes langen Speicherbereich Åber-   */
                                   /* geben werden (unter MultiTos als 'global'*/
                                   /* alloziert!), in den der komplette Pfad   */
                                   /* geschrieben wird. In der KOBOLD_ANSWER   */
                                   /* steht in Wort 3:                         */
                                   /*      -1: Keine weiteren Objekte          */
                                   /*       0: Objekt ist eine Datei           */
                                   /*       1: Objekt ist ein Ordner           */

#define KOBOLD_CLOSE 0x2F16        /* Dient zum expliziten Schlieûen des       */
                                   /* KOBOLD, falls Antwortstatus != FINISHED  */

#define KOBOLD_FREE_DRIVES 0x2F17   /* Gibt evt. belegte Laufwerke frei und     */
                                    /* lîscht eingelesene Verzeichnisse         */

/*-----------------------------------------------------------------------------*/
/* Ein Zeiger auf die folgende Struktur muû dem Kobold in Wort 3+4 des
Message-Puffers fÅr den Code KOBOLD_CONFIG Åbergeben werden. Die entsprechende
Speicherstruktur muû unter MultiTos fÅr andere Prozesse als beschreibbar
('global') alloziert werden (Mxalloc(size,0x1mode)). Kobold fÅllt dann die
Daten auf und teilt mit einer KOBOLD_ANSWER Message die Beendigung mit.      */

typedef struct
{
    unsigned int
        version,                    /* Version, z.B. 0x205 fÅr version 2.05     */
        min_buffer,                 /* Eingestellte Speichergrenzen (in KB)     */
        max_buffer,
        min_administration,
        max_administration,

        administration_percentage,  /* Prozentanteil des Verwaltungsspeichers   */

        buffer_in_fast_ram,         /* Lage der Speicherbereiche                */
        administration_in_fast_ram, /* 0 = ST-Ram, 1 = Fast-Ram                 */

        administration, /* Freier Verwaltungsspeicher zum Zeitpunkt der Abfrage */
        buffer,         /* Freier Dateipuffer zum Zeitpunkt der Abfrage         */

        kobold_active,  /* 1 = KOBOLD aktiv, 0 = KOBOLD inaktiv                 */
        kobold_dialog,  /* 0 = keine Hauptdialoganzeige, 1 = Hauptformular offen*/

        no_of_files,    /* Anzahl der im Quellaufwerk selektierten Dateien      */
        no_of_folders,  /* Anzahl der im Quellaufwerk selektierten Ordner       */
        total_kb,       /* Auswahlumfang in Kilobytes                           */
        source_drive,   /* Quellaufwerk, -1 = Keins                             */
        dest_drive;     /* Ziellaufwerk, -1 = Keins                             */

    unsigned long
        gemdos_mode;    /* Bitvektor: Bit 0: Laufwerk A usw.                    */
                        /* Bit gesetzt = GEMDOS-Modus                           */
} KOBOLD_CONFIGURATION;

/* -----------------  Fehlercodes in der Antwort  ---------------------------- */

#define KOB_FINISHED            -1   /* KOBOLD wurde beendet */
#define KOB_OK                  0    /* Job abgeschlossen, aber
                                    KOBOLD noch aktiv */
#define KOB_ERROR               1
#define KOB_NO_MEMORY           2
#define KOB_USER_BREAK          3
#define KOB_INVALID_POINTER     4
#define KOB_LOW_BUFFER          5
#define KOB_WRONG_DRIVE         6
#define KOB_WRONG_PARAMETER     7
#define KOB_UNEXPECTED_COMMAND  8
#define KOB_INVALID_MEMSIZE     9
#define KOB_NO_SUCH_OBJECT      10
#define KOB_NO_DRIVE_SELECTED   11
#define KOB_NO_FOLDER_CREATION  12
#define KOB_WRITE_PROTECTION    13
#define KOB_LOW_SPACE           14
#define KOB_LOW_ROOT            15
#define KOB_INVALID_PATH        16
#define KOB_BUFFER_IN_USE       17
#define KOB_BAD_BPB             18
#define KOB_BAD_READ            19
#define KOB_BAD_WRITE           20
#define KOB_UNKNOWN_COMMAND     21
#define KOB_NO_WINDOW           22
#define KOB_TOO_MANY_GOSUBS     23
#define KOB_TOO_MANY_RETURNS    24
#define KOB_LABEL_NOT_FOUND     25
#define KOB_NO_SUCH_FOLDER      26
#define KOB_REORGANIZED_MEMORY  27
#define KOB_NO_SELECTION_MODE   28

/* ---------------  Job Kommandos --------------------------------------------*/

#define _KOB_SRC_SELECT         0
#define _KOB_DST_SELECT         1
#define _KOB_DIALOG_LEVEL       2
#define _KOB_KEEP_FLAGS         3
#define _KOB_IGNORE_WP          4
#define _KOB_ALERT              5
#define _KOB_PAUSE              6
#define _KOB_NEW_FOLDER         7
#define _KOB_CHOOSE             8
#define _KOB_RESET_STATUS       9
#define _KOB_READ_INTO_BUFFER   10
#define _KOB_WRITE_BUFFER       11
#define _KOB_COPY               12
#define _KOB_MOVE               13
#define _KOB_DELETE             14
#define _KOB_QUIT               15
#define _KOB_GOTO               16
#define _KOB_GOSUB              17
#define _KOB_RETURN             18
#define _KOB_PERMANENT          19
#define _KOB_MEMORY             20
#define _KOB_VERIFY             21
#define _KOB_DATE               22
#define _KOB_ARCHIVE_TREATMENT  23
#define _KOB_GEMDOS_MODE        24
#define _KOB_FORMAT_PARAMETER   25
#define _KOB_FORMAT             26
#define _KOB_SOFT_FORMAT        27
#define _KOB_OFF                28
#define _KOB_ON                 29
#define _KOB_EVER_OFF           30
#define _KOB_EVER_ON            31
#define _KOB_CONSIDER_PATHS     32
#define _KOB_ON_LEVEL           33
#define _KOB_EXTENSIONS         34
#define _KOB_ARCHIVE            35
#define _KOB_FILE               36
#define _KOB_KEEP_SEQUENCE      37
#define _KOB_RESET_ARCHIVES     38
#define _KOB_OPEN_FOLDERS       39
#define _KOB_CURRENT            40
#define _KOB_KEEP               41
#define _KOB_SET                42
#define _KOB_CLEAR              43
#define _KOB_CLEARED            44
#define _KOB_SI                 45
#define _KOB_SE                 46
#define _KOB_DI                 47
#define _KOB_DE                 48
#define _KOB_ST                 49
#define _KOB_TT                 50
#define _KOB_CLEAR_BUFFER       51
#define _KOB_SOURCE_TREATMENT   52
#define _KOB_DIALOG_WINDOWS     53
#define _KOB_RENAME             54
