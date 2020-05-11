# nim_Termcurs

# curse TERMINAL inspired 5250/3270 done only with nim

doc : [TERMCURS](http://htmlpreview.github.io/?https://github.com/AS400JPLPC/nim_termcurs/blob/master/termcurs.html)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr01.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr06.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr08.png)

  
<br>
<br>

# <u>&nbsp;&rarr;&nbsp; IN PROGRESS It is possible that there are changes</u>
I test on a real data-base to validate the whole.
It works, but I had to harmonize and add PROC or FUNC

  
<br>
<br>

#**everything is not perfect please report problems Nim forum **

#**in PROGRESS  I prepare to test -> creat simple designer**


**IMPORT: termkey project**

<u>mise en fonction le 2020-04-15</u>  
  * add 2020-04-15 :22:15 &nbsp;&rarr;&nbsp; menu horizontal<br>
  * corrective 2020-04-25 &nbsp;&rarr;&nbsp; field APLHA include "-"<br>
  * 2020-05-02 *&nbsp;&nbsp;&nbsp;&rarr;&nbsp;<u>**add support GRID**</u>*  
  * Full Change 2020-02-11&nbsp;&rarr;&nbsp;Fundamental change Harmonization add proc and func ...<br>  
  * &nbsp;&nbsp;&nbsp;&rarr;&nbsp; <u> ***IMPORTANT change:***</u>  
  * Full Change 2020-02-19&nbsp;&rarr;&nbsp;Progress Designer and Termcurs...<br>  
 

**Thank you**

  * [ Date](https://rgxdb.com/r/2V9BOC58)
  * [ MAIL](https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression)
  * Thank you to everyone who posted on github their knowledge was precious to me
  * To IBM education and their gifts of various books
  * [NCURSE](https://invisible-island.net/ncurses/announce.html)
  * [illwill](https://github.com/johnnovak/illwill)
  * [nim-terminaltables](https://github.com/xmonader/nim-terminaltables)




**Resumes operation of the 5250/3270 or Ncursew (let's keep it modest).**
 




&rarr;&nbsp; **ioMENU** in / out objects and receives the choice:  


| Func...........                    |
|------------------------------------|
| Escape = 0                         |
| Enter = 1..n                       |
| scrolling with UP..DOWN            |
| Mouse                              |
| scrolling done with the wheel      |
| UP&nbsp; DOWN&nbsp; Left&nbsp; RIGHT |

  
<br>
<br>
&nbsp;&rarr;&nbsp; **ioPANEL**&nbsp;&nbsp;&nbsp;
displays all the field labels as well as the function keys (F1 ..). the unfolding this fact according to the order in which you registered in the seq [Field] and not index on lines / cols
<br>

| Func...........| help.                                              |
|----------------|----------------------------------------------------|
| Enter          | &nbsp;&rarr;&nbsp; next field                      |
| UP             | &nbsp;&rarr;&nbsp; next field                      |
| DOWN           | &nbsp;&rarr;&nbsp; previous field                  |
| Escape         | &nbsp;&rarr;&nbsp; return field                    |
| Other KEY      | &nbsp;&rarr;&nbsp; returns to the calling procedure|

  
<br>
<br>
&rarr;&nbsp; **ioGRID** Display field type table, with page / line tracking:  

| Func...........                    |
|------------------------------------|
| Escape = 0                         |
| Enter = return (Key seq[string]    |
| scrolling with UP..DOWN            |
| PageUP/PageDown                    |


  
<br>
<br>

&nbsp;
&rarr;&nbsp; **USE**:

  * windows: PANEL it is its basic vocation as a frame (html)
  * texte: LABEL
  * buffer: FIELD
  * funckey: BUTTON
  * Currently does not control panel output overflows
  * To use restore you must display a panel in a panel (must be included) same for the Menus
  * The framing of the labels or fields are relative to the panel
  * in a PANEL the function keys appear automatically and are included in the Buttons  

<br>
<br>
&nbsp;
&rarr;&nbsp; **ioFIELD**
<br>

| Func...........    | help.                                                                                      |
|--------------------|--------------------------------------------------------------------------------------------|
| Enter              |&nbsp;&rarr;&nbsp; valid, next field                                                        |
| UP..DOWN           |&nbsp;&rarr;&nbsp; valid, next field                                                        |
| TAB..STAB          |&nbsp;&rarr;&nbsp; valid, next field                                                        |
| Insert             |&nbsp;&rarr;&nbsp;                                                                          |
| Delete             |&nbsp;&rarr;&nbsp;                                                                          |
| Left..Rigth        |&nbsp;&rarr;&nbsp;                                                                          |
| Backspace          |&nbsp;&rarr;&nbsp; Delete                                                                   |
| Home               |&nbsp;&rarr;&nbsp;                                                                          |
| End                |&nbsp;&rarr;&nbsp;                                                                          |
| Ctrl-A             |&nbsp;&rarr;&nbsp; Display a help panel specific to the field                               |
| Escape             |&nbsp;&rarr;&nbsp; Returns control to ioPanel then redisplays the field without modification|
| KEY                |&nbsp;&rarr;&nbsp; Returns control to ioPanel                                               |
|                    |                                                                                            |
| Field-Type         |                                                                                            |
|                    |                                                                                            |
| ALPHA              |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha                                     |
| ALPHA_UPPER        |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha automatique UPPER                   |
| PASSWORD           |&nbsp;&rarr;&nbsp; Managed by function: regex , hide                                        |
| ALPHA_NUMERIC      |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and isCarPwd(2)     |
| ALPHA_NUMERIC_UPPER|&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and isCarPwd(2)     |
| TEXT_NUMERIC       |&nbsp;&rarr;&nbsp; Managed by function: regex , Full                                        |
| DIGIT              |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1)                                 |
| DIGIT_SIGNED       |&nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1)                        |
| DECIMAL            |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (.)                             |
| DECIMAL_SIGNED     |&nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1) (.)                    |
| DATE_ISO           |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (-)&nbsp;                       |
| DATE_US..DATE_FR   |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (/)&nbsp;                       |
| MAIL_ISO           |&nbsp;&rarr;&nbsp; Managed by function: regex , [ABNF] [RFC 2822]                           |
| YES_NO             |&nbsp;&rarr;&nbsp; Managed by function: (Y-y-N-n) automatique UPPER                         |
| SWITCH             |&nbsp;&rarr;&nbsp; Managed by function: space bar ON/OFF ◉ ◎                                |



<br>
<br>
<br>
<br>
<br>
<br>

# Main procedure

proc ioGrid(this: TermGrid): (Key, seq[string]) {...}

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (Key) {...}

proc ioPanel(pnl: var PANEL): Key {...}
<br>
<br>
<br>

# Procs


proc def_cursor(e_curs: Natural = 0) {...}

proc setTerminal(termatr: ZONATRB = scratr) {...}

proc button(key: Key; text: string; actif = true): BUTTON {...}

proc fldBox(box: var BOX; name: string; posx: Natural; posy: Natural; lines: Natural;
           cols: Natural; cadre: CADRE; title: string; box_atr: BOXATRB = boxatr;
           actif: bool = true) {...}

proc printBox(pnl: var PANEL; box: BOX) {...}

proc defMenu(menu: var MENU; name: string; posx: Natural; posy: Natural; mnuvh: MNUVH;
            item: seq[string]; cadre: CADRE = CADRE.line0; mnu_atr: MNUATRB = mnuatr;
            actif: bool = true) {...}

proc printMenu(pnl: PANEL; mnu: MENU) {...}

proc fldLabel(lbl: var LABEL; name: string; posx: Natural; posy: Natural; text: string;
             lbl_atr: ZONATRB = lblatr; actif: bool = true) {...}

proc printLabel(pnl: var PANEL; lbl: LABEL) {...}

proc fldString(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
              with: Natural; text: string; empty: bool; errmsg: string; help: string;
              regex: string = ""; fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr;
              actif: bool = true) {...}

proc fldMail(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
            with: Natural; text: string; empty: bool; errmsg: string; help: string;
            fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc fldSwitch(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
              switch: bool; empty: bool; errmsg: string; help: string;
              swt_atr: ZONATRB = swtatr; prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc fldDate(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
            text: string; empty: bool; errmsg: string; help: string;
            fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc fldNumeric(fld: var FIELD; name: string; posx: Natural; posy: Natural;
               reftyp: REFTYP; with: Natural; scal: Natural; text: string; empty: bool;
               errmsg: string; help: string; fld_atr: ZONATRB = fldatr;
               prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc hdnString(hdn: var HIDEN; name: string; reftyp: REFTYP; text: string) {...}

proc hdnSwitch(hdn: var HIDEN; name: string; reftyp: REFTYP; switch: bool) {...}

proc printField(pnl: var PANEL; fld: FIELD) {...}

proc printButton(pnl: var PANEL; btn_esp: BTNSPACE = btnspc) {...}

proc defPanel(pnl: var PANEL; name: string; posx, posy, height, width: Natural;
             cadre: CADRE; title: string;
             nbrbox, nbrlabel, nbrfield, nbrhiden: Natural; button: seq[(BUTTON)];
             pnl_atr: ZONATRB = pnlatr; actif: bool = true) {...}

proc add_Label(name: string; posx: Natural; posy: Natural; text: string;
              lbl_atr: ZONATRB = lblatr; actif: bool = true): LABEL {...}

proc add_String(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
               with: Natural; text: string; empty: bool; errmsg: string; help: string;
               regex: string = ""; fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr;
               actif: bool = true): FIELD {...}

proc add_Mail(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
             with: Natural; text: string; empty: bool; errmsg: string; help: string;
             fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc add_Switch(name: string; posx: Natural; posy: Natural; reftyp: REFTYP; switch: bool;
               empty: bool; errmsg: string; help: string; swt_atr: ZONATRB = swtatr;
               prt_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc add_Date(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
             text: string; empty: bool; errmsg: string; help: string;
             fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc add_Numeric(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
                with: Natural; scal: Natural; text: string; empty: bool; errmsg: string;
                help: string; fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr;
                actif: bool = true): FIELD {...}

proc add_Panel(name: string; posx, posy, height, width: Natural; button: seq[(BUTTON)];
              cadre: CADRE = line0; title: string = ""; pnl_atr: ZONATRB = pnlatr): PANEL {...}

proc displayPanel(pnl: PANEL) {...}

proc printPanel(pnl: var PANEL) {...}

proc clearField(pnl: var PANEL) {...}

proc resetPanel(pnl: var PANEL) {...}

proc resetPanel(mnu: var MENU) {...}

proc clsLabel(pnl: var PANEL; lbl: LABEL) {...}

proc clsField(pnl: var PANEL; fld: FIELD) {...}

proc clsPanel(pnl: var PANEL) {...}

proc displayLabel(pnl: var PANEL; lbl: LABEL) {...}

proc displayField(pnl: var PANEL; fld: FIELD) {...}

proc displayButton(pnl: var PANEL) {...}

proc restorePanel(dst: PANEL; src: var PANEL) {...}

proc restorePanel(dst: PANEL; mnu: MENU) {...}

proc restorePanel(dst: PANEL; grid: TermGrid) {...}

proc restorePanel(pnl: PANEL; lines, posy: Natural) {...}

proc dltLabel(pnl: PANEL; idx: Natural) {...}

proc dltField(pnl: PANEL; idx: Natural) {...}

proc setText(pnl: PANEL; name: string; val: string) {...}

proc setProtect(fld: var FIELD; protect: bool) {...}

proc setEdtCar(fld: var FIELD; Car: char) {...}

proc setError(fld: var FIELD) {...}

proc setActif(fld: var FIELD; actif: bool) {...}

proc setActif(lbl: var LABEL; actif: bool) {...}

proc setActif(box: var BOX; actif: bool) {...}

proc setActif(mnu: var MENU; actif: bool) {...}

proc setActif(btn: var BUTTON; actif: bool) {...}

proc setActif(pnl: var PANEL; actif: bool) {...}

proc setMouse(pnl: var PANEL; actif: bool) {...}

proc setMini(fld: var FIELD; val: int) {...}

proc setMaxi(fld: var FIELD; val: int) {...}

proc isPanelKey(pnl: PANEL; e_key: Key): bool {...}

proc newTermGrid(name: string; posx: Natural; posy: Natural; pageRows: Natural;
                separator: TermStyle = unicodeStyle; grid_atr: GRIDATRB = gridatr;
                actif: bool = true): TermGrid {...}

proc resetGrid(this: TermGrid) {...}

proc columnsCount(this: TermGrid): int {...}

proc setHeaders(this: TermGrid; headers: seq[Cell]) {...}

proc newCell(text: string; len: Natural; reftyp: REFTYP; edtcar: string = ""): Cell {...}

proc addRows(this: TermGrid; rows: seq[string]) {...}

proc dltRows(this: TermGrid; idx: Natural) {...}

proc resetRows(this: TermGrid) {...}

proc printGridHeader(this: TermGrid) {...}

proc printGridRows(this: TermGrid) {...}

proc pageUpGrid(this: TermGrid): Key_Grid {...}

proc pageDownGrid(this: TermGrid): Key_Grid {...}

proc ioGrid(this: TermGrid): (Key, seq[string]) {...}

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (Key) {...}

    tranform letter to * 

proc isValide(pnl: var PANEL): bool {...}

proc ioPanel(pnl: var PANEL): Key {...}

# Funcs

func Lines(pnl: PANEL): Natural {...}

func Cols(pnl: PANEL): Natural {...}

func Index(pnl: PANEL): Natural {...}

func getIndexLabel(pnl: PANEL; name: string): int {...}

func getTextLabel(pnl: PANEL; name: string): string {...}

func getName(pnl: PANEL): string {...}

func getIndex(pnl: PANEL; name: string): int {...}

func getText(pnl: PANEL; name: string): string {...}

func getSwitch(pnl: PANEL; name: string): bool {...}

func getText(pnl: PANEL; index: int): string {...}

func getSwitch(pnl: PANEL; index: int): bool {...}

func getNameHiden(hdn: PANEL; index: int): string {...}

func getIndexHiden(hdn: PANEL; name: string): int {...}

func getTextHiden(hdn: PANEL; name: string): string {...}

func getSwitchHiden(hdn: PANEL; name: string): bool {...}

func getTextHiden(hdn: PANEL; index: int): string {...}

func getSwitchHiden(hdn: PANEL; index: int): bool {...}

func setSwitch(pnl: PANEL; name: string; val: bool): bool {...}

func setText(pnl: PANEL; index: int; val: string) {...}

func setSwitch(pnl: PANEL; index: int; val: bool) {...}

func getNbrcar(pnl: PANEL; name: string): int {...}

func getReftyp(pnl: PANEL; name: string): REFTYP {...}

func isMinMax(fld: var FIELD): bool {...}

func isProtect(fld: var FIELD): bool {...}

func isActif(fld: var FIELD): bool {...}

func isActif(lbl: var LABEL): bool {...}

func isActif(box: var BOX): bool {...}

func isActif(mnu: var MENU): bool {...}

func isActif(btn: var BUTTON): bool {...}

func isActif(pnl: var PANEL): bool {...}

func isMouse(pnl: var PANEL): bool {...}

func getIndexGrid(this: TermGrid; name: string): int {...}

