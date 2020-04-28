# nim_Termcurs

# NIM-LANG for terminal
# API inspired by 5250/3270

doc : [TERMCURS](http://htmlpreview.github.io/?https://github.com/AS400JPLPC/nim_termcurs/blob/master/termcurs.html)

**<u>premier test fait</u>**

**IN PROGRESS**
**POSSIBLE BUG**

**IMPORT: termkey project**

<u>mise en fonction le 2020-04-15</u>  

  * corrective 2020-04-15 :22:15 &nbsp;&rarr;&nbsp; grammar horizontal
  * add 2020-04-15 :22:15 &nbsp;&rarr;&nbsp; menu horizontal


**Thank you**

  * [ Date](https://rgxdb.com/r/2V9BOC58)
  * [ MAIL](https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression)
  * Thank you to everyone who posted on github their knowledge was precious to me
  * To IBM education and their gifts of various books
  * [NCURSE](https://invisible-island.net/ncurses/announce.html)





**Resumes operation of the 5250/3270 or Ncursew (let's keep it modest).**




**<u>It is not all over.&nbsp;&nbsp;&nbsp;
I still have the part allowing to make a sub-file integrating in the screen more commonly called SFLINE or GRID</u>**  




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
| UP..DOWN           |&nbsp;&rarr;&nbsp; next field                                                               |
| TAB..STAB          |&nbsp;&rarr;&nbsp; next field                                                               |
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

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (Key) {...}

proc ioPanel(pnl: var PANEL): Key {...}
<br>
<br>
<br>
# PROCS

proc def_cursor(e_curs: Natural = 0) {...}

proc setTerminal(termatr: ZONATRB = scratr) {...}

proc button(key: Key; label: string; actif = true): BUTTON {...}

proc fldBox(box: var BOX; name: string; posx: Natural; posy: Natural; lines: Natural;
           cols: Natural; cadre: CADRE; title: string; box_atr: BOXATRB = boxatr;
           actif: bool = true) {...}

proc printBox(pnl: var PANEL; box: BOX) {...}

proc defMenu(menu: var MENU; name: string; posx: Natural; posy: Natural; mnuvh: MNUVH;
            item: seq[string]; cadre: CADRE = CADRE.line0; mnu_atr: MNUATRB = mnuatr;
            actif: bool = true) {...}

proc printMenu(pnl: PANEL; mnu: MENU) {...}

proc fldLabel(lbl: var LABEL; name: string; posx: Natural; posy: Natural; label: string;
             lbl_atr: ZONATRB = lblatr; actif: bool = true) {...}

proc printLabel(pnl: var PANEL; lbl: LABEL) {...}

proc fldString(fld: var FIELD; name: string; posx: Natural; posy: Natural;
              reftyp: Natural; with: Natural; field: string; empty: bool;
              errmsg: string; help: string; regex: string = "";
              fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc fldMail(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: Natural;
            with: Natural; field: string; empty: bool; errmsg: string; help: string;
            fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc fldSwitch(fld: var FIELD; name: string; posx: Natural; posy: Natural;
              reftyp: Natural; switch: bool; empty: bool; errmsg: string; help: string;
              swt_atr: ZONATRB = swtatr; prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc fldDate(fld: var FIELD; name: string; posx: Natural; posy: Natural; reftyp: Natural;
            field: string; empty: bool; errmsg: string; help: string;
            fld_atr: ZONATRB = fldatr; prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc fldNumeric(fld: var FIELD; name: string; posx: Natural; posy: Natural;
               reftyp: Natural; with: Natural; scal: Natural; field: string;
               empty: bool; errmsg: string; help: string; fld_atr: ZONATRB = fldatr;
               prt_atr: ZONATRB = prtatr; actif: bool = true) {...}

proc hdnString(hdn: var HIDEN; name: string; reftyp: Natural; field: string) {...}

proc hdnSwitch(hdn: var HIDEN; name: string; reftyp: Natural; switch: bool) {...}

proc printField(pnl: var PANEL; fld: FIELD) {...}

proc printButton(pnl: var PANEL; btn_esp: BTNSPACE = btnspc) {...}

proc defPanel(pnl: var PANEL; name: string; posx, posy, height, width: Natural;
             backgr: BackgroundColor; backbr: bool; foregr: ForegroundColor;
             forebr: bool; cadre: CADRE; title: string;
             nbrbox, nbrlabel, nbrfield, nbrhiden: Natural; button: seq[(BUTTON)];
             actif: bool = true) {...}

proc displayPanel(pnl: PANEL) {...}

proc printPanel(pnl: var PANEL) {...}

proc clearPanel(pnl: var PANEL) {...}

proc clearPanel(mnu: var MENU) {...}

proc clsLabel(pnl: var PANEL; lbl: LABEL) {...}

proc clsField(pnl: var PANEL; fld: FIELD) {...}

proc clsPanel(pnl: var PANEL) {...}

proc displayLabel(pnl: var PANEL; lbl: LABEL) {...}

proc displayField(pnl: var PANEL; fld: FIELD) {...}

proc displayButton(pnl: var PANEL) {...}

proc restorePanel(dst: PANEL; src: var PANEL) {...}

proc restorePanel(dst: PANEL; mnu: MENU) {...}

proc restorePanel(pnl: PANEL; lines, posy: Natural) {...}

proc setProtect(fld: var FIELD; protect: bool) {...}

proc setActif(fld: var FIELD; actif: bool) {...}

proc setActif(lbl: var LABEL; actif: bool) {...}

proc setActif(box: var BOX; actif: bool) {...}

proc setActif(mnu: var MENU; actif: bool) {...}

proc setActif(btn: var BUTTON; actif: bool) {...}

proc setActif(pnl: var PANEL; actif: bool) {...}

proc setMouse(pnl: var PANEL; actif: bool) {...}

proc isPanelKey(pnl: PANEL; e_key: Key): bool {...}

<br>
<br>
<br>
# FUNCS

func Lines(pnl: PANEL): Natural {...}

func Cols(pnl: PANEL): Natural {...}

func Index(pnl: PANEL): Natural {...}

func fldName(pnl: PANEL): string {...}

func fldIndex(pnl: PANEL; name: string): int {...}

func fldString(pnl: PANEL; name: string): string {...}

func fldString(pnl: PANEL; index: Natural): string {...}

func fldSwitch(pnl: PANEL; index: Natural): int {...}

func hdnName(hdn: PANEL; index: Natural): string {...}

func hdnIndex(hdn: PANEL; name: string): int {...}

func hdnString(hdn: PANEL; name: string): string {...}

func hdnString(hdn: PANEL; index: Natural): string {...}

func hdnSwitch(hdn: PANEL; index: Natural): int {...}

func isProtect(fld: var FIELD): bool {...}

func isActif(fld: var FIELD): bool {...}

func isActif(lbl: var LABEL): bool {...}

func isActif(box: var BOX): bool {...}

func isActif(mnu: var MENU): bool {...}

func isActif(btn: var BUTTON): bool {...}

func isActif(pnl: var PANEL): bool {...}

func isMouse(pnl: var PANEL): bool {...}

