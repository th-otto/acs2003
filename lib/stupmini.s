**** STUPMINI.S ************************************************************************
*		minimaler Startup-Code fÅr Pure C
*
*		V 2.0	11.09.2002 von Stefan Kuhr @ OS
*
*		 ˘ keine Behandlung der Kommandozeilenparameter
*		 ˘ keine Environmentvariablenverarbeitung
*		 ˘ optionale FPU-Initialisierung



.EQU			MAINVOID,		1			* Wenn 1, werden an main() keine Parameter 
											* Åbergeben und etwas Speicher gespart.											

.EQU			FPUINIT,		0			* Wenn 1, wird _fpuinit aufgerufen.

.EQU			HEAPONSTACK,	0			* Wenn 1, wird _HeapOnStk als unsigned long 
											* definiert, der angibt, wie viele Bytes des 
											* unteren Stack-Endes durch den Heap belegt 
											* werden. _HeapOnStk ist immer 0.
											* Existiert nur aus KompatibilitÑtsgrÅnden zu
											* STUPARGV.S.

.EQU			CHECKSTACK,		0			* Wenn 1, wird sichergestellt, dass mindestens 
											* ein Rest-Stack der Grîûe SYSSTKSIZE komplett
											* frei bleibt; ansonsten wird illegal ausgefÅhrt.
											* Am einfachsten lÑsst sich das aber 
											* sicherstellen, indem im Linker eine Stack-Grîûe
											* von mindesten SYSSTKSIZE+12 Byte definiert wird.
											* In diesem Fall ist CHECKSTACK unnîtig und sollte
											* deshalb auf 0 gesetz werden.
											
.EQU			SYSSTKSIZE,		256			* Stackreserve fÅr Systemfunktionen,
											* muss ein gerader Wert sein.
											* Der Stack muss mindestens genauso groû sein:
											* _StkSize >= SYSSTKSIZE


.EXPORT			errno
.EXPORT			exit
.EXPORT			_app
.EXPORT			_BasPag
.EXPORT			_AtExitVec
.EXPORT			_FilSysVec
.EXPORT			_StkLim
.EXPORT			_PgmSize
.IF HEAPONSTACK
.EXPORT			_HeapOnStk
.ENDIF
.EXPORT 		__text
.EXPORT 		__data
.EXPORT 		__bss
.EXPORT			__exit

.IMPORT			main
.IMPORT			_fpuinit
.IMPORT			_StkSize
.IMPORT			_FreeAll



.OFFSET										* Basepage-Struktur
TpaStart:		.DS.L	1
TpaEnd: 		.DS.L	1
TextSegStart:	.DS.L	1
TextSegSize:	.DS.L	1
DataSegStart:	.DS.L	1
DataSegSize:	.DS.L	1
BssSegStart:	.DS.L	1
BssSegSize: 	.DS.L	1
DtaPtr: 		.DS.L	1
PntPrcPtr:		.DS.L	1
Reserved0:		.DS.L	1
EnvStrPtr:		.DS.L	1
Reserved1:		.DS.B	7
CurDrv: 		.DS.B	1
Reserved2:		.DS.L	18
CmdLine:		.DS.B	128
BasePageSize:	.DS.B	0



.DATA

__data:
_AtExitVec: 	.DC.L	0					* Vektor fÅr atexit
_FilSysVec: 	.DC.L	0					* Vektor fÅr Deinitialisierung des File-Systems
.EQU			E_OK,			0
errno:			.DC.W	E_OK				* globale Fehler-Variable (ERROR.H)

.IF HEAPONSTACK
_HeapOnStk:		.DC.L	0
.ENDIF

.IF MAINVOID
.ELSE
argv0:			.DC.L	argv1_envp
argv1_envp:		.DC.L	0
.ENDIF



.BSS

__bss:
_BasPag:		.DS.L	1					* Zeiger auf Basepage
_app:			.DS.W	1					* Applikation-Flag
_StkLim:		.DS.L	1					* Stacklimit
_PgmSize:		.DS.L	1					* Programmgrîûe

.EVEN



.TEXT
											* A6
											* A5
											* A4
											* A3
											* A2
											* A1
											* A0 Basepage
											* D7
											* D6 _app
											* D5 _PgmSize
											* D4 _StkLim
											* D3
											* D2
											* D1
											* D0
__text:
				moveq.l	#0,D6				* vorsorglich als Accessory markieren
				move.l	A0,D0				* prÅfen, ob's wirklich ein Accessory ist
				bne 	Cont				* wenn Accessory ->

				movea.l 4(SP),A0			* Basepage-Zeiger vom Stack
				moveq.l	#1,D6				* Programm ist Applikation
Cont:
				move.l	A0,_BasPag

				move.l	BssSegStart(A0),D5	* Startadresse des BSS-Segments
				add.l	BssSegSize(A0),D5	* + dessen Grîûe => Ende des BSS-Segments

				and.b	#$FE,D5 			* Stackadresse auf gerade Adresse abrunden
				movea.l D5,SP				* Stack einrichten
				move.l	D5,D4				* und Adresse fÅr Stacklimit merken

				sub.l	A0,D5				* Stack minus Basepage => Programmgrîûe
				move.l	D5,_PgmSize 		* Programmgrîûe vermerken

				sub.l	#_StkSize-SYSSTKSIZE,D4
											* Stacklimit = BSS-Ende - (Stackgrîûe - Sicherheitszone)
				move.l	D4,_StkLim			* Stacklimit vermerken
.IF CHECKSTACK
				cmp.l	SP,D4				* falls die Stackadresse kleiner als _StkLim ist
				bls		EndCheckStack		* lÑuft das Programm auf illegal
				illegal
EndCheckStack:		
.ENDIF
				move.w	D6,_app				* Applikationsart vermerken
				beq 	Start

											* Speicher schrumpfen
				move.l	D5,-(SP)			* Programmgrîûe,
				move.l	A0,-(SP)			* Adresse der Basepage = Startadresse des Speicherblocks,
			    pea		$4A0000				* eine 0 und den Mshrink-Opcode auf den Stack
				trap	#1					* Mshrink aufrufen
				lea 	12(SP),SP			* Stack korrigieren

Start:

.IF FPUINIT
****************************************************************************************
*	Test auf 68881 FPU
				jsr		_fpuinit			* Test auf 68881
.ENDIF

.IF MAINVOID
.ELSE
				moveq.l	#1,D0				* D0 ist argc und 1
				move.l	#argv0,A0			* A0 wird argv
				lea		4(A0),A1			* A1 wird envp
.ENDIF

**** int main(unsigned long argc, char *argv[], char *envp[]) **************************
*	<D0.L> = Kommandozeilenparameteranzahl						argc
*	<A0.L> = Zeiger auf Kommandozeilenparameterfeld 			argv
*	<A1.L> = Zeiger auf Environmentvariablenfeld				envp
*	Vom Standard abweichend wird argc als unsigned long Åbergeben!
				jsr 	main



**** void exit (int status) ************************************************************
*	<D0.W> = RÅckgabewert des Programms

exit:
				move.w	D0,-(SP)			* Returnwert von main auf den Stack
				move.l	_AtExitVec,D0		* alle registrierten atexit-Prozeduren ausfÅhren
				beq 	exit1
				movea.l D0,A0
				jsr 	(A0)
exit1:
				move.l	_FilSysVec,D0		* Dateisystem deinitialisieren
				beq 	exit2
				movea.l D0,A0
				jsr 	(A0)
exit2:
				jsr 	_FreeAll			* alle Speicherblîcke freigeben
											* Returnwert von main liegt schon auf dem Stack
				move.w	#76,-(SP)			* Pterm-Opcode auf den Stack
				trap	#1					* Programm beenden



.END



