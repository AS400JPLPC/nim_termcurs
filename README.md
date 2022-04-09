# nim_Termcurs

*** curse TERMINAL inspired 5250/3270 done only with nim***

**  I am not yet posting designer and source generator.it is not operational but written at the base of termcurs**<br />

** In the meantime you can test with the nim_Termvte repository**<br />

** require termkey **

doc : [TERMCURS](http://htmlpreview.github.io/?https://github.com/AS400JPLPC/nim_termcurs/blob/master/htmldocs/termcurs.html)

img : [EXEMPLE](https://github.com/AS400JPLPC/nim_termcurs/blob/master/TEST.png)
img : [SOURCE GENERATED](https://github.com/AS400JPLPC/nim_termcurs/blob/master/source_generated.png)

doc : [SOURCE](https://github.com/AS400JPLPC/nim_termcurs/blob/master/exemple/termGrid.nim)
<br />
<br />
**Progress of the designer test**<br />
<br />
img : [Source-ouput](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Output_Code.png)

img : [Source-screen](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Output_Screen.png)

img : [exemple-Combo/Field](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Output_Screen2.png)

<br />
<br />git config pull.rebase true

**IMPORT: termkey project**<br />

<u>put in function 2020-04-15</u><br />

* Full Change 2022-04-07&nbsp;&rarr;&nbsp;**change setPageGrid() calcul nbr page   and  isPanelKey test button actif  **<br />
* Full Change 2022-04-07&nbsp;&rarr;&nbsp;**add ioFMT(PANEL;GRIDSFL; select , pos)
  work resume ioPANEL and ioGRID reserved Crtl UP Down Right Left --> reserved for line progress and line tracking**<br />
* Change 2022-04-09&nbsp;&rarr;&nbsp;**poster(PANEL) (resume printField(PANEL) and display(PANEL)**<br />
* Change 2022-04-09&nbsp;&rarr;&nbsp;**add setIndex(PANEL,pos) pos= num. field**<br />

**Thank you**

* [ Date](https://rgxdb.com/r/2V9BOC58)<br />
* [ MAIL](https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression)<br />
* [TELEPHONE](https://regexr.com/3c53v)<br />
* Thank you to everyone who posted on github their knowledge was precious to me<br />
* To IBM education and their gifts of various books<br />
* [NCURSE](https://invisible-island.net/ncurses/announce.html)<br />
* [illwill](https://github.com/johnnovak/illwill)<br />
* [nim-terminaltables](https://github.com/xmonader/nim-terminaltables)<br />
  <br />

&rarr;&nbsp; **ioMENU** in / out objects and receives the choice:<br />


| Func...........                      |
| -------------------------------------- |
| Escape = 0                           |
| Enter = 1..n                         |
| scrolling with UP..DOWN              |
| Mouse                                |
| scrolling done with the wheel        |
| UP&nbsp; DOWN&nbsp; Left&nbsp; RIGHT |
| selector mouse                       |

<br />
<br />
 →  **ioPANEL**   <br />
displays all the field labels as well as the function keys (F1 ..). the unfolding this fact according to the order in which you registered in the seq [Field] and not index on lines / cols
<br />


| Func........... | help.                                               |
| ----------------- | ----------------------------------------------------- |
| Enter           | &nbsp;&rarr;&nbsp; next field                       |
| UP              | &nbsp;&rarr;&nbsp; next field                       |
| DOWN            | &nbsp;&rarr;&nbsp; previous field                   |
| Escape          | &nbsp;&rarr;&nbsp; return field                     |
| Other KEY       | &nbsp;&rarr;&nbsp; returns to the calling procedure |

<br />
<br />
→  **ioGRID** Display field type table, with page / line tracking:<br />


| Func...........                 |
| --------------------------------- |
| Escape = 0                      |
| Enter = return (Key seq[string] |
| scrolling with UP..DOWN         |
| PageUP/PageDown                 |
| selector                        |
| Mouse on service                |

<br />
<br />
<br />

&nbsp;
&rarr;&nbsp; **USE**:<br />

* windows: PANEL it is its basic vocation as a frame (html)<br />
* texte: LABEL<br />
* buffer: FIELD<br />
* funckey: BUTTON<br />
* funckey: MENU<br />
* funckey: GRID<br />
* Currently does not control panel output overflows<br />
* To use restore you must display a panel in a panel (must be included) same for the Menus<br />
* The framing of the labels or fields are relative to the panel<br />
* in a PANEL the function keys appear automatically and are included in the Buttons<br />

<br />
 
→  **ioFIELD**<br />
<br />


| Func...........     | help.                                                                                        |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| Enter               | &nbsp;&rarr;&nbsp; valid, next field                                                         |
| UP..DOWN            | &nbsp;&rarr;&nbsp; valid, next field                                                         |
| TAB..STAB           | &nbsp;&rarr;&nbsp; valid, next field                                                         |
| Insert              | &nbsp;&rarr;&nbsp; insert char field                                                         |
| Delete              | &nbsp;&rarr;&nbsp; delete char field                                                         |
| Left..Rigth         | &nbsp;&rarr;&nbsp;                                                                           |
| Backspace           | &nbsp;&rarr;&nbsp; Delete                                                                    |
| Home                | &nbsp;&rarr;&nbsp; First field                                                               |
| End                 | &nbsp;&rarr;&nbsp; Last field                                                                |
| Ctrl-H              | &nbsp;&rarr;&nbsp; Display a help panel specific to the field                                |
| Escape              | &nbsp;&rarr;&nbsp; Returns control to ioPanel then redisplays the field without modification |
| TKEY                | &nbsp;&rarr;&nbsp; Returns control to ioPanel                                                |
|                     |                                                                                              |
| Field-Type          |                                                                                              |
|                     |                                                                                              |
| TEXT_FREE           | &nbsp;&rarr;&nbsp; Managed by function: regex , FULL                                         |
| ALPHA               | &nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and "-"                              |
| ALPHA_UPPER         | &nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha automatique UPPER and "-"            |
| PASSWORD            | &nbsp;&rarr;&nbsp; Managed by function: regex , hide  alpha + (1) + (3)                      |
| ALPHA_NUMERIC       | &nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and "-"              |
| ALPHA_NUMERIC_UPPER | &nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and "-"              |
| TEXT_FULL           | &nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and isCarPwd(3)      |
| DIGIT               | &nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1)                                  |
| DIGIT_SIGNED        | &nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1)                         |
| DECIMAL             | &nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (.)                              |
| DECIMAL_SIGNED      | &nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1) (.)                     |
| DATE_ISO            | &nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (-)&nbsp;                        |
| DATE_US..DATE_FR    | &nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (/)&nbsp;                        |
| TELEPHONE           | &nbsp;&rarr;&nbsp; Managed by function: regex , International                                |
| MAIL_ISO            | &nbsp;&rarr;&nbsp; Managed by function: regex , [ABNF] [RFC 2822]                            |
| YES_NO              | &nbsp;&rarr;&nbsp; Managed by function: (Y-y-N-n) automatique UPPER                          |
| SWITCH              | &nbsp;&rarr;&nbsp; Managed by function: space bar ON/OFF ◉ ◎                               |
| FPROC               | &nbsp;&rarr;&nbsp; Managed by function: Call proc           "queryselector" Key.PROC         |
| FCALL               | &nbsp;&rarr;&nbsp; Managed by function: Call programme      "queryselector" Key.CALL         |

(1) numeric<br />
"1","2","3","4","5","6","7","8","9","0"<br />

(2) password<br />
"~","!","?","@","#","$","£","€","%","^","&","*","-","+","=","(",")","{","}","[","]","<",">"<br />

(3) punct<br />
".",":",",","!","?","'","-","(",")","<",">"<br />
not ";" reserved csv<br />

<br />
<br />
**Usage**<br />
<br />
<br />
<br />
doc : [Source-exemple-GRID.nim](https://github.com/AS400JPLPC/nim_termcurs/blob/master/exemple/termGrid.nim)
<br />
<br />
<br />
<br />
<br />

** Main procedure**<br />

proc addRows(this: GRIDSFL; rows: seq[string]) {.....}

proc clearText(pnl: var PANEL) {.....}

clear value ALL FIELD
proc clsField(pnl: var PANEL; fld: FIELD) {.....}

cls Field from Panel
proc clsLabel(pnl: var PANEL; lbl: LABEL) {.....}

cls Label from Panel
proc clsPanel(pnl: var PANEL) {.....}

cls Panel
proc Cols(pnl: PANEL): Natural {.....}

get cols PANEL
proc counColumns(this: GRIDSFL): Natural {.....}

proc countRows(this: GRIDSFL): Natural {.....}

proc defBox(name: string; posx: Natural; posy: Natural; lines: Natural;
cols: Natural; cadre: CADRE; title: string;
box_atr: BOXATRB = boxatr; actif: bool = true): BOX {.....}

Define BOX
proc defButton(key: TKey; text: string; ctrl: bool = false; actif: bool = true): BUTTON {.
....}

define BUTTON
proc defCell(text: string; long: Natural; reftyp: REFTYP;
cell_atr: CELLATRB = cellatr): CELL {.....}

proc defCell(text: string; long: Natural; reftyp: REFTYP;
cell_ForegroundColor: string): CELL {.....}

proc defDate(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
text: string; empty: bool; errmsg: string; help: string;
fld_atr: ZONATRB = fldatr; protect_atr: ZONATRB = prtatr;
actif: bool = true): FIELD {.....}

Define Field date ISO
proc defLabel(name: string; posx: Natural; posy: Natural; text: string;
lbl_atr: ZONATRB = lblatr; actif: bool = true): LABEL {.
....}

Define Label
proc defMail(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
width: Natural; text: string; empty: bool; errmsg: string;
help: string; fld_atr: ZONATRB = fldatr;
protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {.
....}

Define Field Mail
proc defNumeric(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
width: Natural; scal: Natural; text: string; empty: bool;
errmsg: string; help: string; fld_atr: ZONATRB = fldatr;
protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {.
....}

Define Field Numeric
proc defString(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
width: Natural; text: string; empty: bool; errmsg: string;
help: string; regex: string = ""; fld_atr: ZONATRB = fldatr;
protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {.
....}

Define Field String Standard
proc defStringH(name: string; reftyp: REFTYP; text: string): HIDEN {.....}

Hiden field
proc defSwitch(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
switch: bool; empty: bool; errmsg: string; help: string;
swt_atr: ZONATRB = swtatr; protect_atr: ZONATRB = prtatr;
actif: bool = true): FIELD {.....}

Define Field switch
proc defSwitchH(name: string; reftyp: REFTYP; switch: bool): HIDEN {.....}

Hiden switch
proc defTelephone(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
width: Natural; text: string; empty: bool; errmsg: string;
help: string; fld_atr: ZONATRB = fldatr;
protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {.
....}

Define Field Telephone
proc defTitle(name: string; posx: Natural; posy: Natural; text: string;
ttl_atr: ZONATRB = ttlatr; actif: bool = true): LABEL {.
....}

Define Title
proc displayButton(pnl: var PANEL) {.....}

display matrice only BUTTON
proc displayField(pnl: var PANEL; fld: FIELD) {.....}

display matrice only FIELD
proc displayLabel(pnl: var PANEL; lbl: LABEL) {.....}

display matrice only LABEL
proc displayPanel(pnl: PANEL) {.....}

display matrice PANEL
proc dltField(pnl: PANEL; idx: Natural) {.....}

delete Field index Field
proc dltFieldH(hdn: PANEL; idx: Natural) {.....}

delete Field Hiden from indexField
proc dltLabel(pnl: PANEL; idx: Natural) {.....}

delete Label from index
proc dltRows(this: GRIDSFL; idx: Natural) {.....}

proc dspMenuItem(pnl: PANEL; mnu: MENU; npos: Natural = 0) {.
....}

proc getcellLen(cell: var CELL): int {.....}

get len from cell
proc getCtrl(btn: var BUTTON): bool {.....}

proc getEdtcar(pnl: PANEL; index: int): string {.....}

get Edtcar Field Sequence Field
proc getEmpty(pnl: PANEL; index: int): bool {.....}

get Empty Field Sequence Field
proc getErrmsg(pnl: PANEL; index: int): string {.....}

get errmsg Field Sequence Field
proc getHeadersCar(this: GRIDSFL; r: int): string {.....}

proc getHeadersName(this: GRIDSFL; r: int): string {.....}

proc getHeadersPosy(this: GRIDSFL; r: int): int {.....}

proc getHeadersType(this: GRIDSFL; r: int): REFTYP {.....}

proc getHelp(pnl: PANEL; index: int): string {.....}

get help Field Sequence Field
proc getIndex(pnl: PANEL; name: string): int {.....}

get index Field from name Field
proc getIndexG(this: GRIDSFL; name: string; idx: Natural = 0): int {.....}

proc getIndexH(hdn: PANEL; name: string): int {.....}

get index Hiden from name
proc getIndexL(pnl: PANEL; name: string): int {.....}

get index Sequence Label from name
proc getName(btn: var BUTTON): TKey {.....}

proc getName(pnl: PANEL): string {.....}

get name field from panel this getField
proc getName(pnl: PANEL; index: int): string {.....}

get name Field Sequence Field
proc getNameH(hdn: PANEL; index: int): string {.....}

get name Hiden from index
proc getNameL(pnl: PANEL; index: int): string {.....}

get name label Sequence Field
proc getNbrcar(pnl: PANEL; name: string): int {.....}

get nbrCar Field from name
proc getPnlName(pnl: PANEL): string {.....}

get name From Panel
proc getPnlTitle(pnl: PANEL): string {.....}

get Title From Panel
proc getPosx(pnl: PANEL; index: int): int {.....}

get Posx Field Sequence Field
proc getPosxL(pnl: PANEL; index: int): int {.....}

get Posx label Sequence Field
proc getPosy(pnl: PANEL; index: int): int {.....}

get Posy Field Sequence Field
proc getPosyL(pnl: PANEL; index: int): int {.....}

get Posy label Sequence Field
proc getProcess(pnl: PANEL; index: int): string {.....}

get callVoid Field Sequence Field
proc getProtect(pnl: PANEL; index: int): bool {.....}

get Protect Field Sequence Field
proc getReftyp(pnl: PANEL; name: string): REFTYP {.....}

get ref.type Field from name
proc getRefType(pnl: PANEL; index: int): REFTYP {.....}

get Type Field Sequence Field
proc getrowCar(this: GRIDSFL; r: int): string {.....}

get Car from grid,rows
proc getrowEmpty(this: GRIDSFL; r: int): bool {.....}

get Empty from grid,rows
proc getrowErrmsg(this: GRIDSFL; r: int): string {.....}

get errmsg from grid,rows
proc getrowHelp(this: GRIDSFL; r: int): string {.....}

get help from grid,rows
proc getrowName(this: GRIDSFL; r: int): string {.....}

get name from grid,rows
proc getrowPosx(this: GRIDSFL; r: int): int {.....}

get posx from grid,rows
proc getrowPosy(this: GRIDSFL; r: int): int {.....}

get posy from grid,rows
proc getrowProcess(this: GRIDSFL; r: int): string {.....}

get Process from grid,rows
proc getrowScal(this: GRIDSFL; r: int): int {.....}

get scal from grid,rows
proc getRowsText(this: GRIDSFL; r: int; i: int): string {.....}

get text from grid,rows
proc getrowText(this: GRIDSFL; r: int): string {.....}

get text from grid,rows
proc getrowType(this: GRIDSFL; r: int): REFTYP {.....}

get type from grid,rows
proc getrowWidth(this: GRIDSFL; r: int): int {.....}

get Width from grid,rows
proc getScal(pnl: PANEL; index: int): int {.....}

get Scal Field Sequence Field
proc getSwitch(pnl: PANEL; index: int): bool {.....}

get value Field Sequence Field
proc getSwitch(pnl: PANEL; name: string): bool {.....}

get value switch from name Field
proc getSwitchH(hdn: PANEL; index: int): bool {.....}

get switch Hiden from index
proc getSwitchH(hdn: PANEL; name: string): bool {.....}

get switch Hiden from name
proc getText(btn: var BUTTON): string {.....}

proc getText(pnl: PANEL; index: int): string {.....}

get value Field Sequence Field
proc getText(pnl: PANEL; name: string): string {.....}

get value Field from name Field
proc getTextH(hdn: PANEL; index: int): string {.....}

get value Field Hiden from index
proc getTextH(hdn: PANEL; name: string): string {.....}

get value Field Hiden from name
proc getTextL(pnl: PANEL; index: int): string {.....}

get value label Sequence Label
proc getTextL(pnl: PANEL; name: string): string {.....}

get value Label Sequence from name
proc getWidth(pnl: PANEL; index: int): int {.....}

get width Field Sequence Field
proc Index(pnl: PANEL): Natural {.....}

index actived from panel this getField
proc ioField(pnl: PANEL; fld: var FIELD; fmt: bool = false): (TKey) {.
....}

proc ioFMT(pnl: var PANEL; grid: var GRIDSFL; select: bool = false;
pos: int = -1): (TKey, seq[string]) {.
....}

proc ioGrid(this: GRIDSFL; pos: int = -1): (TKey, seq[string]) {.
....}

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {.
....}

proc ioPanel(pnl: var PANEL): TKey {.....}

proc isActif(box: var BOX): bool {.....}

proc isActif(btn: var BUTTON): bool {.....}

proc isActif(fld: var FIELD): bool {.....}

proc isActif(lbl: var LABEL): bool {.....}

proc isActif(mnu: var MENU): bool {.....}

proc isActif(pnl: var PANEL): bool {.....}

proc isActif(this: GRIDSFL): bool {.....}

proc isError(fld: var FIELD): bool {.....}

proc isMouse(pnl: var PANEL): bool {.....}

proc isPanelKey(pnl: PANEL; e_key: TKey): bool {.....}

Test if KEYs must be managed by the programmer
proc isProcess(pnl: PANEL; index: int): bool {.....}

test process index Field
proc isProtect(fld: var FIELD): bool {.....}

proc isrowProtect(this: GRIDSFL; r: int): bool {.....}

get isProtect from grid,rows
proc isrowTitle(this: GRIDSFL; r: int): bool {.....}

get isTitle from grid,rows
proc isTitle(pnl: PANEL; index: int): bool {.....}

test Title label Sequence Label
proc isValide(pnl: var PANEL): bool {.....}

Contrôle Format Panel full Field
proc Lines(pnl: PANEL): Natural {.....}

get lines PANEL
proc newGrid(name: string; posx: Natural; posy: Natural; pageRows: Natural;
separator: GridStyle = sepStyle; grid_atr: GRIDATRB = gridatr;
actif: bool = true): GRIDSFL {.....}

proc newMenu(name: string; posx: Natural; posy: Natural; mnuvh: MNUVH;
item: seq[string]; cadre: CADRE = CADRE.line0;
mnu_atr: MNUATRB = mnuatr; actif: bool = true): MENU {.....}

proc newPanel(name: string; posx, posy, height, width: Natural;
button: seq[(BUTTON)]; cadre: CADRE = line0; title: string = "";
pnl_atr: ZONATRB = pnlatr): PANEL {.....}

Define PANEL
proc pageDownGrid(this: GRIDSFL): TKey_Grid {.....}

proc pageUpGrid(this: GRIDSFL): TKey_Grid {.....}

proc printBox(pnl: var PANEL; box: BOX) {.....}

assigne BOX to matrice for display
proc printButton(pnl: var PANEL; btn_esp: BTNSPACE = btnspc) {.....}

assigne BUTTON matrice for display
proc printField(pnl: var PANEL; fld: FIELD) {.....}

assigne FIELD to matrice for display
proc printGridHeader(this: GRIDSFL) {.....}

proc printGridRows(this: GRIDSFL) {.....}

proc printLabel(pnl: var PANEL; lbl: LABEL) {.....}

assigne LABEL to matrice for display
proc printMenu(pnl: PANEL; mnu: MENU) {.....}

proc printPanel(pnl: var PANEL) {.....}

assigne PANEL and all OBJECT to matrice for display
proc resetGrid(this: GRIDSFL) {.....}

proc resetMenu(mnu: var MENU) {.....}

clear object MENU
proc resetPanel(pnl: var PANEL) {.....}

clear object PANEL / box/label/fld/proc
proc resetRows(this: GRIDSFL) {.....}

proc restorePanel(dst: PANEL; grid: GRIDSFL) {.....}

restore the base occupied by grid
proc restorePanel(dst: PANEL; mnu: MENU) {.....}

restore the base occupied by menu
proc restorePanel(dst: PANEL; src: var PANEL) {.....}

restore the base occupied by panel
proc restorePanel(pnl: PANEL; lines, posy: Natural) {.
....}

restore the lines occupied by the error message
proc setActif(box: var BOX; actif: bool) {.....}

proc setActif(btn: var BUTTON; actif: bool) {.....}

proc setActif(fld: var FIELD; actif: bool) {.....}

proc setActif(lbl: var LABEL; actif: bool) {.....}

proc setActif(mnu: var MENU; actif: bool) {.....}

proc setActif(pnl: var PANEL; actif: bool) {.....}

proc setActif(this: GRIDSFL; actif: bool) {.....}

proc setCellEditCar(cell: var CELL; edtcar: string = "") {.....}

proc setColor(fld: var FIELD; fld_atr: ZONATRB) {.....}

set attribut field
proc setColor(lbl: var LABEL; lbl_atr: ZONATRB) {.....}

set attribut label
proc setColorProtect(fld: var FIELD; protect_atr: ZONATRB) {.....}

set attribut protect field
proc setCtrl(btn: var BUTTON; ctrl: bool) {.....}

proc setEdtCar(fld: var FIELD; Car: string) {.....}

proc setEdtcar(pnl: PANEL; index: int; val: string) {.....}

set Edtcar Field Sequence Field
proc setEmpty(pnl: PANEL; index: int; val: bool) {.....}

set Empty Field Sequence Field
proc setErrmsg(pnl: PANEL; index: int; val: string) {.....}

set errmsg Field Sequence Field
proc setError(fld: var FIELD; val: bool) {.....}

proc setHeaders(this: GRIDSFL; headers: seq[CELL]) {.....}

proc setHelp(pnl: PANEL; index: int; val: string) {.....}

set help Field Sequence Field
proc setLastPage(this: GRIDSFL) {.....}

proc setMouse(pnl: var PANEL; actif: bool) {.....}

proc setName(pnl: PANEL; index: int; val: Natural) {.....}

set posx Field Sequence Field
proc setName(pnl: PANEL; index: int; val: string) {.....}

set name Field Sequence Field
proc setPageGrid(this: GRIDSFL) {.....}

proc setPageGrid(this: GRIDSFL; pos: Natural) {.....}

proc setPosy(pnl: PANEL; index: int; val: Natural) {.....}

set posy Field Sequence Field
proc setProcess(fld: var FIELD; process: string) {.....}

proc setProtect(fld: var FIELD; protect: bool) {.....}

proc setProtect(pnl: PANEL; index: int; val: bool) {.....}

set protect Field Sequence Field
proc setRegex(pnl: PANEL; index: int; val: string) {.....}

proc setRegex(pnl: PANEL; name: string; val: string) {.....}

proc setScal(pnl: PANEL; index: int; val: Natural) {.....}

set Scal Field Sequence Field
proc setSwitch(pnl: PANEL; index: int; val: bool) {.....}

set switch Field from index Field
proc setSwitch(pnl: PANEL; name: string; val: bool): bool {.....}

set switch Field from name Field
proc setTerminal(termatr: ZONATRB = scratr) {.....}

Erase and color and style default
proc setText(btn: var BUTTON; val: string) {.....}

proc setText(pnl: PANEL; index: int; val: string) {.....}

set value Field from index Field
proc setText(pnl: PANEL; name: string; val: string) {.....}

set value Field from name Field
proc setTextL(pnl: PANEL; index: int; val: string) {.....}

set value Label Sequence Label
proc setTextL(pnl: PANEL; name: string; val: string) {.....}

set value Label Sequence from name
proc setTitle(pnl: PANEL; index: int; val: bool) {.....}

set value Label Sequence Label
proc setType(pnl: PANEL; index: int; val: REFTYP) {.....}

set Type Field Sequence Field
proc setWidth(pnl: PANEL; index: int; val: Natural) {.....}

set width Field Sequence Field
<br />
<br />

Made with Nim. Generated: 2022-04-08 13:10:50 UTC
