#ifndef __VAPROTO_H__
#define __VAPROTO_H__

/*
 * @(#) Gemini\vaproto.h
 * @(#) Stefan Eissing, 11. Dezember 1994
 *
 *
 * Beschreibung: Definition der Nachrichten des Venus <-> Accessory
 * Protokolls
 *
 * 07.12.: AV_PATH_UPDATE, AV_WHAT_IZIT, AV_DRAG_ON_WINDOW eingebaut.
 * 21.10.94: AV_STARTED 
 * 31.10.94: AV_XWIND und VA_FONTCHANGED eingefuehrt.
 *           Siehe auch die neue Bitbelegung in PROTOSTATUS
 * 12.11.94  Neues Bit im PROTOSTATUS des Accessories zum "Quoten"
 *           von Dateinamen
 * 26.06.95: Neue Bits in AV_PROTOKOLL, VA_PROTOSTATUS;
 *           AV_VIEW, VA_VIEWED, AV_FILEINFO, VA_FILECHANGED,
 *           AV_COPYFILE, VA_FILECOPIED, AV_DELFILE, VA_FILEDELETED,
 *           AV_SETWINDPOS, VA_PATH_UPDATE
 */

/* Message-Nummern fuer die Kommunikation zwischen Venus und
 * verschiedenen Accesories.
 * Sollten in Nachrichten Pfade oder Dateinamen vorkommen, so
 * muss immer der absolute Pfad angegeben werden (also mit Laufwerk)
 * und die Laufwerksbuchstaben muessen Grossbuchstaben sein. Pfade 
 * sollten immer mit einem Backslash enden!
 * Neu seit dem 12.11.94 ist, dass optional Namen auch mit einfachen
 * Anfuehrungszeichen versehen werden koennen. Siehe AV_PROTOKOLL.
 *
 * Nachrichten von Venus beginnen mit VA (Venus -> Accessory).
 * Nachrichten an Venus beginnen mit AV (Accessory -> Venus).
 *
 * Mit AV_PROTOKOLL kann jedes Acc nachfragen, welche Nachrichten
 * verstanden werden (Dies ist ja bei VENUS und GEMINI 
 * unterschiedlich! Es waere schoen, wenn auch andere Programme auf
 * dieses Protokoll reagieren wuerden. Zumindest AV_SENDKEY ist
 * sicher leicht zu implementieren und ist die einzige Methode, wie
 * ueber Nachrichten Tastaturdruecke simuliert werden koennen.
 *
 * Unter normalem TOS fragt dazu ein Accessory, wenn es eine
 * AC_CLOSE-Nachricht vom AES erhalten hat, die Applikation 0
 * mit AV_PROTOKOLL, ob sie etwas davon versteht.
 * Unter MultiTOS muss aber das Programm nicht mehr die ID 0
 * haben, zudem kommt es (fast) nicht mehr zu AC_CLOSE-Nachrichten.
 * Es koennen auch nicht nur Accessories, sondern auch normale
 * Programme mit Gemini kommunizieren wollen. Was tun?
 * Wenn es mehr als eine Hauptapplikation geben kann, dann sollte
 * das Programm/Accessory versuchen, mit GEMINI Kontakt aufzunehmen.
 * Die ID kann ja mit appl_find ermittelt werden. Scheitert dies, so
 * kann noch nach AVSERVER oder dem Inhalt der (AES-)Environmentvariable
 * AVSERVER gesucht werden. Besonders die letzte Moeglichkeit erlaubt
 * eine leichte Konfiguration "von aussen". Die neuen Versionen der
 * Library VAFUNC von Stephan Gerle (in gutsortierten Mailboxen
 * erhaeltlich) verfahren fast genauso.
 */

/* AV_PROTOKOLL: Mit dieser Nachrichtennummer sollte man bei 
 * anderen Applikationen und auch GEMINI nachfragen, ob
 * und welche Nachrichten sie versteht.
 */

#define AV_PROTOKOLL		0x4700
/*
 * Word 6+7: Pointer auf den Accessorynamen, wie er bei
 *           appl_find benutzt werden muss; also 8 Zeichen lang
 *           nullterminiert (char name[9]).
 * Die Bits in den Worten 3, 4 und 5 haben folgende Bedeutung:
 * Word 3:
 * Bit 0:		(VA_SETSTATUS)
 * Bit 1:		(VA_START)
 * Bit 2:       (AV_STARTED)
 * Bit 3:       (VA_FONTCHANGED)
 * Bit 4:       (Versteht und benutzt Quoting von Dateinamen)
 * Bit 5:       VA_PATH_UPDATE
 * Bit 6-15:    reserviert, immer 0
 *
 * Alle anderen Bits sind fuer Erweiterungen reserviert und sollten
 * daher mit 0 vorbesetzt werden. Das gilt natuerlich auch fuer die
 * Bits in den Worten 4 und 5.
 * (Mehr zum Quoting siehe unten)
 */
#define AV_PROTOKOLL_SETSTATUS   0x01
#define AV_PROTOKOLL_START       0x02
#define AV_PROTOKOLL_STARTED     0x04
#define AV_PROTOKOLL_FONTCHANGED 0x08
#define AV_PROTOKOLL_QUOTING     0x10
#define AV_PROTOKOLL_PATH_UPDATE 0x20

#define VA_PROT_SENDKEY          0x0001
#define VA_PROT_ASKFILEFONT      0x0002
#define VA_PROT_ASKCONFONT       0x0004
#define VA_PROT_OPENCONSOLE      0x0004
#define VA_PROT_ASKOBJECT        0x0008
#define VA_PROT_OPENWIND         0x0010
#define VA_PROT_STARTPROG        0x0020
#define VA_PROT_ACCWINDOPEN      0x0040
#define VA_PROT_ACCWINDCLOSED    0x0040
#define VA_PROT_STATUS           0x0080
#define VA_PROT_GETSTATUS        0x0080
#define VA_PROT_COPY_DRAGGED     0x0100
#define VA_PROT_PATH_UPDATE      0x0200
#define VA_PROT_WHAT_IZIT        0x0200
#define VA_PROT_DRAG_ON_WINDOW   0x0200
#define VA_PROT_EXIT             0x0400
#define VA_PROT_XWIND            0x0800
#define VA_PROT_FONTCHANGED      0x1000
#define VA_PROT_STARTED          0x2000
#define VA_PROT_QUOTING          0x4000
#define VA_PROT_FILEINFO         0x8000
#define VA_PROT_FILECHANGED      0x8000
#define VA_PROT_COPYFILE         0x0001
#define VA_PROT_FILECOPIED       0x0001
#define VA_PROT_DELFILE          0x0002
#define VA_PROT_FILEDELETED      0x0002
#define VA_PROT_VIEW             0x0004
#define VA_PROT_VIEWED           0x0004
#define VA_PROT_SETWINDPOS       0x0008
#define VA_PROT_SYMLINKS         0x0010
#define VA_PROT_SENDCLICK        0x0020

/* Macros zum Testen des Protkollstatus auf Quoting
 */
#define VA_ACC_QUOTING(a)		((a) & AV_PROTOKOLL_QUOTING)
#define VA_SERVER_QUOTING(a)	((a) & VA_PROT_QUOTING)

/* VA_PROTOSTATUS: Dem Sender von AV_PROTOKOLL wird mitgeteilt, dass
 * der Empfaenger etwas von diesem Protokoll weiss. Die Worte 3-7 des
 * Nachrichtenpuffers enthalten die Information, welche Nachrichten
 * verstanden werden. Gesetzte Bits stehen dafuer, dass eine Nachricht
 * (Nachrichtengruppe) verstanden werden. 
 */
#define VA_PROTOSTATUS		0x4701
/*
 * Word 6+7: Pointer auf den Programmnamen, wie er bei
 *           appl_find benutzt werden muss; also 8 Zeichen lang
 *           nullterminiert (char name[9]).
 * Die Bits in den Worten 3, 4 und 5 haben folgende Bedeutung:
 * Word 3:
 * Bit 0		(AV_SENDKEY)
 * Bit 1		(AV_ASKFILEFONT)
 * Bit 2		(AV_ASKCONFONT, AV_OPENCONSOLE)
 * Bit 3		(AV_ASKOBJECT)
 * Bit 4		(AV_OPENWIND)
 * Bit 5		(AV_STARTPROG)
 * Bit 6		(AV_ACCWINDOPEN, AV_ACCWINDCLOSED)
 * Bit 7		(AV_STATUS, AV_GETSTATUS)
 * Bit 8		(AV_COPY_DRAGGED)
 * Bit 9        (AV_PATH_UPDATE, AV_WHAT_IZIT, AV_DRAG_ON_WINDOW)
 * Bit 10		(AV_EXIT)
 * Bit 11       (AV_XWIND)
 * Bit 12       (VA_FONTCHANGED)
 * Bit 13		(AV_STARTED)
 * Bit 14       (Versteht und benutzt Quoting von Dateinamen)
 * Bit 15:      AV_FILEINFO, VA_FILECHANGED
 * Wort 4:
 * Bit 0:       AV_COPYFILE, VA_FILECOPIED
 * Bit 1:       AV_DELFILE, VA_FILEDELETED
 * Bit 2:       AV_VIEW, VA_VIEWED
 * Bit 3:       AV_SETWINDPOS
 * Bit 4:       erlaubt Anlegen symbolischer Links mit AV_COPYFILE
 * Bit 5:       AV_SENDCLICK
 * Bit 6-15:    reserviert, immer 0
 * Wort 5:
 *              reserviert, immer 0
 *
 * Alle anderen Bits sind fuer Erweiterungen reserviert und sollten
 * daher mit 0 vorbesetzt werden. Das gilt natuerlich auch fuer die
 * Bits in den Worten 4 und 5.
 *
 * AV_SENDKEY kann sicher jeder leicht in seine Programme einbauen.
 * Bei AV_OPENWIND koennte ein Hauptprogramm auch seine "normale"
 * Routine zum Oeffnen eines Dokumentes anwerfen und dabei den
 * uebergebenen Pfad benutzen. Dies ist zusammen mit der Benutzung
 * von TreeView sicher eine einfache Art, Dateien aus anderen Ordnern
 * oder Laufwerken zu laden.
 *
 * Zu Bit 14 (im Server, z.B. Gemini), bzw. Bit 4 im Client 
 * (Accessory):
 * Mit "Quoting" ist im VA-Protkoll gemeint, dass Dateinamen optional
 * mit einfachen Anfuehrungszeichen 'name' versehen werden koennen.
 * Dies ist aber nur erlaubt, wenn beide Parteien (Server und Client)
 * sich darueber einig sind (lies: beide es verstehen koennen).
 * Wie geht das also vor sich? Angenommen Gemini schickt an ein
 * Accessory einen Dateinamen, der ein Leerzeichen enthaelt. Ein Acc,
 * das Quoting nicht kann, wird statt einem zwei Dateinamen erkennen,
 * da normalerweise Leerzeichen Dateinamen trennen.
 * Versteht das Acc aber Quoting (Bit 4 in seinem Protokollstatus),
 * so wird Gemini den Dateinamen mit '' umgeben und das Acc erkennt,
 * dass das Leerzeichen zum Dateinamen gehoert.
 * Gleiches gilt natuerlich auch fuer Dateinamen, die von einem Acc
 * an einen Server geschickt werden. Die Frage bleibt, wie man denn
 * nun einfache Anfuehrungszeichen uebertraegt. Nun, solche Zeichen,
 * die zum Dateinamen gehoeren, werden einfach verdoppelt. Aus
 * Julian's Profibuch wird fuer die Uebertragung 'Julian''s Profibuch'.
 * Einfach nicht? Nun, die Idee stammt nicht von mir, sondern wird
 * genauso auch in Atari's Drag&Drop Protokoll benutzt.
 */

/* AV_GETSTATUS: Ein Accessory erfragt bei Venus den aktuellen
 * Status, den es Venus mit AV_STATUS mal gegeben hat.
 */
#define AV_GETSTATUS		0x4703

/* AV_STATUS: Ein Accessory kann Venus seinen Status mitteilen,
 * der dann von Venus im INF-File gespeichert wird und mit
 * AV_GETSTATUS wieder abgerufen werden kann.
 * Zuvor MUSS es sich aber mit AV_PROTOKOLL anmelden!
 * Word 3+4: Pointer auf einen String, der keine Steuerzeichen
 *           enthalten darf und nicht laenger als 256 Zeichen
 *           sein darf. Dieser Pointer darf allerdings NULL sein.
 */
#define AV_STATUS			0x4704

/* VA_SETSTATUS: Venus teilt dem Accessory den abgespeicherten
 * Status bei Nachfrage durch AV_GETSTATUS mit. Dieser kann dann 
 * von einem Accessory gesetzt werden.
 * Word 3+4: Pointer auf einen String, der keine Steuerzeichen
 *           enthaelt.
 *           Dieser Pointer kann allerdings NULL sein, dann war
 *           kein Status gespeichert.
 */
#define VA_SETSTATUS		0x4705

/* AV_SENDCLICK: Ein Acc sendet VENUS/GEMINI einen Mausklick, den
 * es selber vielleicht nicht versteht.
 * Word 3 = Maus X-position
 * Word 4 = Maus Y-position
 * Word 5 = Mausstatus                     ev_mmobutton
 * Word 6 = Tastaturstatus                 ev_mmokstate
 * Word 7 = Anzahl Klicks                  ev_mbreturn
 */
#define	AV_SENDCLICK		0x4709

/* AV_SENDKEY: Ein Acc sendet VENUS/GEMINI einen Tastaturevent, den
 * es selber vielleicht nicht versteht.
 * Word 3 = Tastaturstatus                 ev_mmokstate
 * Word 4 = Scancode der gedrueckten Taste  ev_mkreturn
 */
#define	AV_SENDKEY			0x4710

/* VA_START: Accessory wird aktiviert. Word 3+4 enthalten einen
 * Pointer auf eine Kommandozeile, der auch NULL sein kann.
 * In der Kommandozeile stehen Pfade oder Dateinamen.
 */
#define VA_START			0x4711

/* AV_ASKFILEFONT: Frage nach dem eingestellten Zeichensatz
 * fuer Dateinamen.
 */
#define AV_ASKFILEFONT		0x4712

/* VA_FILEFONT: Gibt den derzeit eingestellten Zeichensatz.
 * Word 3 = Dateifontnummer (font id)
 * Word 4 = Dateifontgroesse (in points)
 */
#define VA_FILEFONT			0x4713

/* (Nur Gemini) AV_ASKCONFONT: Frage nach dem eingestellten 
 * Zeichensatz fuer das Console-Fenster.
 */
#define AV_ASKCONFONT		0x4714

/* VA_CONFONT: Gibt den derzeit eingestellten Zeichensatz.
 * Word 3 = Consolefontnummer (font id)
 * Word 4 = Consolefontgroesse (in points)
 */
#define VA_CONFONT			0x4715

/* AV_ASKOBJECT: Fragt nach dem derzeit selektiertem Objekt.
 * Es wird der Name des derzeit selektierten Objektes zurueckgegeben.
 * Ist kein Objekt selektiert, so ist der String leer.
 * Sind mehrere Objekte selektiert, so sind ihre Namen durch Leer-
 * zeichen getrennt.
 */
#define AV_ASKOBJECT		0x4716

/* VA_OBJECT: Gibt Namen der derzeit selektierten Objekte.
 * Aufbau wie bei VA_START
 */
#define VA_OBJECT			0x4717

/* (Nur Gemini)AV_OPENCONSOLE: Venus soll das Console-Fenster oeffnen.
 * Ist es schon offen, so wird es nach vorne gebracht. Diese Aktion
 * ist vor allen Dingen sinnvoll, wenn ein Accessory ein TOS-Programm
 * mittels der system()-Funktion starten will (Warnung: Auf keinen
 * Fall darf ein GEM-Programm von einem Accessory via system() 
 * gestartet werden! (siehe auch AV_STARTPROG)
 * Auch sollte diese Nachricht nur auf ausdruecklichen Wunsch des
 * Benutzers gebraucht werden, da es ihn sonst nur verwirren kann.
 *
 * ACHTUNG: Diese Nachricht steht nur in Gemini.app zur Verfuegung.
 */
#define AV_OPENCONSOLE		0x4718

/* VA_CONSOLEOPEN: Gibt zurueck, ob das Console-Fenster nach vorne
 * gebracht worden ist. Word 3 == 0 (nein) != 0 (ja)
 */
#define VA_CONSOLEOPEN		0x4719

/* AV_OPENWIND: Venus soll ein Datei-Fenster oeffnen.
 * Dies sollte auch nur geschehen, wenn die Ursache fuer den
 * Benutzer ersichtlich ist.
 * Word 3+4 (Pointer) Pfad fuer das Fenster (s.o.).
 * Word 5+6 (Pointer) Wildcard fuer darzustellende Dateien.
 */
#define AV_OPENWIND			0x4720

/* VA_WINDOPEN: Gibt an, ob das Fenster geoeffnet werden konnte.
 * siehe VA_CONSOLEOPEN
 */
#define VA_WINDOPEN			0x4721


/* Word 7 in AV_STARTPROG und Word 4 und 7 in VA_PROGSTART sind
 * neu seit dem 29. Maerz 1992.
 */
 
/* AV_STARTPROG: Venus soll ein Programm starten. Hierbei
 * werden die angemeldeten Applikationen der Venus mit
 * beruecksichtigt. Man kann also auch eine Datei angeben, fuer
 * die Venus dann ein Programm sucht.
 * Word 3+4 (Pointer) Programmname mit kompletten Pfad
 * Word 5+6 (Pointer) Kommandozeile (kann NULL sein)
 * Word 7   Beliebiges 16-Bit Wort, das in VA_PROGSTART wieder
 *          zurueckgeliefert wird.
 */
#define AV_STARTPROG		0x4722

/* VA_PROGSTART: Gibt an, ob Venus das Programm startet.
 * Word 3 == 0: nicht gestartet, != 0 gestartet
 * Im Allgemeinen wird das Acc. im Fehlerfall sofort eine
 * Nachricht bekommen. Wenn das Programm aber gestartet wird, erhaelt
 * das Acc. diese Nachricht erst nach dem Start des Programms, da
 * die Routine, die den Pexec macht nicht mehr wissen kann, das ein
 * Acc. noch schnell eine Nachricht bekommen muss. Bei einem GEM-
 * Programm, kann man der Erfolg auch an dem AC_CLOSE erkennen.
 * Auch ist die Fehlererkennung nicht optimal. Der Rueckgabewert weist
 * auch nicht aus, das das Programm fehlerfrei gelaufen ist.
 *
 * Word 4   Returncode des gestarteten Programms (so vorhanden)
 * Word 7   16-Bit Wort aus AV_STARTPROG
 */
#define VA_PROGSTART		0x4723

/* AV_ACCWINDOPEN: Mit dieser Nachricht kann ein Acc Venus mitteilen, dass
 * es ein Fenster geoeffnet hat.
 * Word 3 AES-Handle des geoeffneten Fensters
 */
#define AV_ACCWINDOPEN		0x4724

/* VA_DRAGACCWIND: Venus teilt dem Acc mit, dass Objekte auf eines seiner
 * mittels AV_ACCWINDOPEN angemeldeten Fenster gezogen worden sind.
 * Word 3   AES-Handle des Fensters
 * Word 4   X-Position der Maus
 * Word 5   Y-Position der Maus
 * Word 6+7 Pointer auf einen String, der die Namen der Objekte enthaelt.
 */
#define VA_DRAGACCWIND		0x4725

/* AV_ACCWINDCLOSED: Acc teilt Venus mit, dass sein Fenster geschlossen
 * wurde. Dies braucht das Acc nur in dem Fall zu tun, wenn es selbst das
 * Fenster schliesst. Bekommt es eine AC_CLOSE Mitteilung vom AES, so weiss
 * Venus schon, dass alle Fenster weg sind.
 * Word 3   AES-Handle des Fensters
 */
#define AV_ACCWINDCLOSED	0x4726


/* Neu seit dem 11.04.1991!!!
 */
 
/* AV_COPY_DRAGGED: Accessorie teilt Venus mit, dass die Objekte,
 * die auf sein Fenster gezogen wurden, zu kopieren sind.
 * Dies kann z.B. nach dem Ziehen von Objekten auf das TreeView-
 * Fenster erwuenscht sein. Diese Nachricht ist nur als Antwort
 * auf VA_DRAGACCWIND gedacht.
 * Word 3	Tastaturstatus (Alternate, Control, Shift)
 * Word 4+5	Pointer auf einen String, der den Namen des Zielobjektes 
 *			enthaelt. Dies *muss* ein Pfad sein!
 */
#define AV_COPY_DRAGGED		0x4728

/* VA_COPY_COMPLETE: Antwort auf AV_COPY. 
 * Word 3	Status des Kopierens. (!= 0 heisst, dass wirklich etwas
 *			kopiert oder verschoben wurde. Dies kann das Acc evtl.
 *          zum Neuaufbau seines Fensters nutzen.)
 */
#define VA_COPY_COMPLETE	0x4729


/* AV_PATH_UPDATE: Programm/Accessory teilt Gemini mit, dass sich
 * der Inhalt eines Verzeichnisses geaendert hat. Gemini stellt dann
 * dieses Verzeichnis (so ein Fenster davon offen ist) neu dar. Dies
 * wirkt auch auf die Unterverzeichnisse; Update von "C:\" sorgt
 * dafuer, dass alles, was mit Laufwerk C:\ zu tun hat, neu eingelesen
 * wird.
 *
 * Word 3+4 Pointer auf den absolten Pfad
 */
#define AV_PATH_UPDATE		0x4730


/* AV_WHAT_IZIT: Programm/Accessory fragt Gemini, was sich an 
 * Position X/Y auf dem Bildschirm befindet. Die Koordinaten sind
 * normale Pixelkoordinaten mit Ursprung in der linken oberen
 * Bildschirmecke. Antwort ist VA_THAT_IZIT.
 * Word 3   X-Koordinate
 * Word 4   Y-Koordinate
 */
#define AV_WHAT_IZIT		0x4732

/* VA_THAT_IZIT:
 * Word 3   ID der zustaendigen Applikation
 * Word 4   Typ des Objektes
 * word 5+6 Zeiger auf den Namen des Objektes (oder NULL, falls nicht 
 *          vorhanden)
 *
 * Typ ist wie folgt: (alle anderen fuer Erweiterungen reserviert.)
 */
#define	VA_OB_UNKNOWN	0		
#define VA_OB_TRASHCAN  1
#define VA_OB_SHREDDER  2
#define VA_OB_CLIPBOARD 3
#define VA_OB_FILE      4
#define VA_OB_FOLDER	5
#define VA_OB_DRIVE		6
#define VA_OB_WINDOW    7

#define VA_THAT_IZIT		0x4733

/* AV_DRAG_ON_WINDOW: Programm/Accessory teilt Gemini mit, dass 
 * Objekte auf eines seiner mittels AV_WHATIZIT erfragten Fenster 
 * gezogen worden sind. Die Namen sind Namen von Dateien, Ordnern
 * oder Laufwerken, jeweils durch ein Leerzeichen getrennt. Namen
 * von Ordnern oder Laufwerken enden mit einem Backslash.
 *
 * Word 3   X-Position, wohin die Maus gezogen wurde
 * Word 4   Y-Position, wohin die Maus gezogen wurde
 * Word 5   Tastaturstatus (Shift,Control,Alternate)
 * Word 6+7 Pointer auf einen String, der die Namen der Objekte enthaelt.
 *
 * (nun implementiert, beachte dass sich die Belegung der Nachricht
 *  leicht geaendert hat. Das Fenster handle ist verschwunden und 
 *  dafuer wurde der aktuelle Tastaturstatus eingefuegt.)
 *
 */
#define AV_DRAG_ON_WINDOW	0x4734

/* VA_DRAG_COMPLETE: Die Aktion, die mittels AV_DRAG_ON_WINDOW
 * ausgeloest wurde (Kopieren, Verschieben, Loeschen oder ablegen
 * auf den Hintergrund) ist beendet. Bei Erfolg wird ein Wert
 * wie bei AV_COPY_COMPLETE zurueckgeliefert.
 * Word 3	Status der Aktion. (!= 0 heisst, dass wirklich etwas
 *			kopiert oder verschoben wurde. Dies kann das Acc evtl.
 *          zum Neuaufbau seines Fensters nutzen.)
 */
#define VA_DRAG_COMPLETE	0x4735

/* AV_EXIT: Ein Programm/Accessory teilt Gemini mit, dass es nicht
 * mehr am Protokoll teilnimmt (normalerweise, weil es beendet
 * wurde).
 * Word 3   AES-ID des Programms/Accessories
 */
#define AV_EXIT				0x4736

/* AV_STARTED: Ein Programm/Accessory teilt Gemini mit, dass es
 * die VA_START Nachricht verstanden hat und der Speicher des
 * Strings, der an die Nachricht angehaengt war, freigegeben werden
 * kann. Zum Erkennen um welche VA_START Nachricht es sich handelt,
 * werden die Werte von VA_START zurueckgeliefert.
 * Word 3+4: exakt derselbe Inhalt der VA_START Nachricht.
 */
#define AV_STARTED          0x4738

/* VA_FONTCHANGED: Einer der in Gemini eingestellen Fonts hat
 * sich geaendert. Wird an alle Applikationen geschickt, die schon
 * mal den Font von Gemini erfragt haben.
 *
 * Word 3 = Dateifontnummer   (font id)
 * Word 4 = Dateifontgroesse    (in points)
 * Word 5 = Consolefontnummer (font id)
 * Word 6 = Consolefontgroesse  (in points)
 */
#define VA_FONTCHANGED		0x4739

/* AV_XWIND: Venus soll ein Datei-Fenster oeffnen (eXtended).
 * Dies sollte auch nur geschehen, wenn die Ursache fuer den
 * Benutzer ersichtlich ist.
 * Word 3+4 (Pointer) Pfad fuer das Fenster (s.o.).
 * Word 5+6 (Pointer) Wildcard als Filter fuer Anzeige
 * Word 7   Bitmaske  0x0001 - toppe evtl. vorhandenes Fenter
 *                    0x0002 - Wildcard soll nur selektieren
 *                           - alle anderen Bits auf 0 setzen!
 */
#define AV_XWIND			0x4740

/* VA_XOPEN: Gibt an, ob das Fenster geoeffnet werden konnte.
 * (Word 3 == 0 (nein) != 0 (ja))
 */
#define VA_XOPEN			0x4741




/* Neue Messages seit dem 26.06.1995 */

/* AV_VIEW (0x4751) Server <- Client (26. Juni 1995)
 *
 * Der Server soll den Viewer fuer eine bestimmte Datei aufrufen. Ist
 * kein Viewer vorhanden, erhaelt der Benutzer eine Fehlermeldung.

 * Anmerkung: Thing kennt im Gegensatz zu Gemini 1.a auch Applikationen,
 *   die zum Anzeigen bestimmter Dateien angemeldet sind. Mit dieser
 *   Message kann Thing dazu aufgefordert werden eben eine solche
 *   Applikation zu starten (z.B. einen IMG-Viewer statt einem umfang-
 *   reichen Grafikprogramm fuer IMG-Dateien).
 *
 *   Wort 3+4: Zeiger auf den Namen der anzuzeigenden Datei (es ist nur
 *             EINE einzelne Datei zulaessig!)
 *   Wort 5-7: reserviert, immer 0
 */
#define AV_VIEW           	0x4751

/* VA_VIEWED (0x4752) Server -> Client (26. Juni 1995)
 * 
 * Antwort auf AV_VIEW. Der Server teilt dem Client mit, ob die
 * Datei angezeigt wird oder nicht. Die Antwort wird sofort und immer
 * verschickt, falls ein Fehler aufgetreten ist. Andernfalls erhaelt
 * man die Antwort in einer Multitasking-Umgebung sobald der Viewer
 * aktiv ist oder unter Single-TOS nach Beendigung des Viewers, falls
 * der Server nicht vorher beendet wurde (z.B. durch Auslagerung vor
 * dem Start des Viewers).
 * 
 *   Wort 3:   0=Fehler, 1=Alles ok
 *   Wort 4-7: reserviert, immer 0
 */
#define VA_VIEWED         	0x4752

/* AV_FILEINFO (0x4753) Server <- Client (26. Juni 1995)
 * 
 * Datei-/Ordnerinfo anzeigen. Als Antwort erhaelt man VA_FILECHANGED.
 * 
 *   Wort 3+4: Zeiger auf Datei oder Ordnernamen. Mehrere Dateien/Ordner
 *             werden durch Leerzeichen getrennt. Ordner MUESSEN mit ab-
 *             schliessendem '\' uebergeben werden!
 *   Wort 5-7: reserviert, immer 0
 */
#define AV_FILEINFO       	0x4753

/* VA_FILECHANGED (0x4754) Server -> Client (26. Juni 1995)
 * 
 * Antwort auf AV_FILEINFO.
 * 
 *   Wort 3+4: Zeiger auf die Namen der Dateien/Ordner, die bei
 *             AV_FILEINFO uebergeben wurden, wobei natuerlich einige
 *             Dateien/Ordner neue Namen haben koennen
 * 
 *             Beispiel: Es wurde 'C:\ANNA.TXT C:\AUTO\' uebergeben.
 *                       Der Benutzer aendert 'ANNA.TXT' in 'ANNELIE.TXT'
 *                       um. Als Ergebnis erhaelt man dann in dieser
 *                       Message den String 'C:\ANNELIE.TXT C:\AUTO\'
 *
 *   Wort 5-7: reserviert, immer 0
 */
#define VA_FILECHANGED    	0x4754

/* AV_COPYFILE (0x4755) Server <- Client (26. Juni 1995)
 * 
 * Dateien/Ordner kopieren/verschieben. Als Antwort erhaelt man
 * VA_FILECOPIED.
 * 
 *   Wort 3+4: Zeiger auf die Quelldateie(n) und -Ordner, durch Leer-
 *             stellen getrennt, Order mit abschliessendem '\'
 *   Wort 5+6: Zeiger auf den Zielordner
 *   Wort 7:   Bit 0:    Originale loeschen (verschieben)
 *             Bit 1:    Kopien umbenennen
 *             Bit 2:    Ziel kommentarlos ueberschreiben
 *             Bit 3-15: reserviert, immer 0
 */
#define AV_COPYFILE       	0x4755

/* VA_FILECOPIED (0x4756) Server -> Client (26. Juni 1995)
 * 
 * Antwort auf AV_COPYFILE.
 * 
 *   Wort 3:   0=Fehler, 1=Alles Ok
 *   Wort 4-7: reserviert, immer 0
 */
#define VA_FILECOPIED     	0x4756

/* AV_DELFILE (0x4757) Server <- Client (26. Juni 1995)
 * 
 * Dateien/Ordner loeschen. Als Antwort erhaelt man VA_FILEDELETED.
 * 
 *   Wort 3+4: Zeiger auf die zu loeschenden Dateie(n)/Ordner, durch Leer-
 *             stellen getrennt, Order mit abschliessendem '\'
 *   Wort 5-7: reserviert, immer 0
 */
#define AV_DELFILE        	0x4757

/* VA_FILEDELETED (0x4758) Server -> Client (26. Juni 1995)
 * 
 * Antwort auf AV_DELFILE.
 * 
 *   Wort 3:   0=Fehler, 1=Alles Ok
 *   Wort 4-7: reserviert, immer 0
 */
#define VA_FILEDELETED    	0x4758

/* AV_SETWINDPOS (0x4759) Server <- Client (26. Juni 1995)
 * 
 * Als Erweiterung zu AV_XWIND bzw. AV_OPENWIND gedacht. Hiermit
 * kann ein Client angeben, an welcher Position und mit welcher
 * Groesse das naechste Verzeichnisfenster (mit AV_XWIND oder AV_OPENWIND)
 * geoeffnet werden soll. Die Koordinaten werden absolut angegeben.
 * 
 * Wird durch AV_XWIND kein neues Fenster geoeffnet, sondern nur ein
 * bereits offenes Fenster getoppt, ist diese Message ohne Wirkung!
 * 
 *   Wort 3:  Position X
 *   Wort 4:  Position Y
 *   Wort 5:  Breite
 *   Wort 6:  Hoehe
 *   Wort 7:  reserviert, immer 0
 */
#define AV_SETWINDPOS     	0x4759

/* VA_PATH_UPDATE (0x4760) Server -> Client (26. Juni 1995)
 * 
 * Hat der Client bei AV_PROTOKOLL kundgetan, dass er diese Message
 * akzeptiert, teilt der Server hiermit mit, dass sich der Inhalt
 * eines Verzeichnisses geaendert hat. Der Client sollte dann ggf.
 * auch alle betroffenen Unterverzeichnisse neu lesen bzw. schliessen,
 * wenn diese nicht mehr existieren.
 * 
 *   Wort 3+4: Zeiger auf das Verzeichnis, immer mit '\' abgeschlossen
 *   Wort 5-7: reserviert, immer 0
 */
#define VA_PATH_UPDATE    	0x4760

#endif /* __VAPROTO_H__ */
