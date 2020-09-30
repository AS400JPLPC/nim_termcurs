# nim_Termcurs

# curse TERMINAL inspired 5250/3270 done only with nim

#  I am not yet posting designer and source generator.it is not operational but written at the base of termcurs




doc : [TERMCURS](http://htmlpreview.github.io/?https://github.com/AS400JPLPC/nim_termcurs/blob/master/termcurs.html)



img : [TERMCURS PRESENTATION](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr00.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr01.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr06.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr08.png)


img : [EXEMPLE](https://github.com/AS400JPLPC/nim_termcurs/blob/master/TEST.png)
img : [SOURCE GENERATED](https://github.com/AS400JPLPC/nim_termcurs/blob/master/source_generated.png)


img : [GENERATOR-00](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_00.png)
img : [GENERATOR-01](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_01.png)
img : [GENERATOR-02](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_02.png)
img : [GENERATOR-03](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_03.png)
img : [GENERATOR-04](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_04.png)
img : [GENERATOR-05](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_05.png)
img : [GENERATOR-06](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_06.png)
img : [GENERATOR-10](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_10.png)
img : [GENERATOR-11](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_11.png)
img : [GENERATOR-12](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_12.png)
img : [GENERATOR-20](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_20.png)
img : [GENERATOR-30](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Generateur_30.png)


  
<br>
<br>

# <u>&nbsp;&rarr;&nbsp; IN PROGRESS It is possible that there are changes</u>
I test on a real data-base to validate the whole.
It works, but I had to harmonize and add PROC or FUNC

  
<br>
<br>

**everything is not perfect please report problems Nim forum **

**in PROGRESS  I prepare to test -> creat simple designer**


**IMPORT: termkey project**

<u>mise en fonction le 2020-04-15</u><br>  
  * add 2020-04-15 :22:15 &nbsp;&rarr;&nbsp; menu horizontal<br>  
  * corrective 2020-04-25 &nbsp;&rarr;&nbsp; field APLHA include "-"<br>  
  * 2020-05-02 *&nbsp;&nbsp;&nbsp;&rarr;&nbsp;<u>**add support GRID**</u>*<br>  
  * Full Change 2020-05-02&nbsp;&rarr;&nbsp;Fundamental change Harmonization add proc and func ...<br><br>  
  * &nbsp;&nbsp;&nbsp;&rarr;&nbsp; <u> ***IMPORTANT change:***</u><br>  
  * Full Change 2020-05-13&nbsp;&rarr;&nbsp;Progress Designer and Termcurs...<br>  
  * Full Change 2020-05-14&nbsp;&rarr;&nbsp;Validity check correction<br>  
  * Full Change 2020-05-15&nbsp;&rarr;&nbsp;Validity check Grid add QUERY "queryselector"<br>  
  * Full Change 2020-05-19&nbsp;&rarr;&nbsp;Change Func QUERY --> FPROC FCALL "queryselector"<br>  
  * Full Change 2020-05-20&nbsp;&rarr;&nbsp;**TESTING GENERATOR SOURCE**<br>  
  * Full Change 2020-05-25&nbsp;&rarr;&nbsp;**Validate GENERATOR SOURCE   not product **<br>  
  * Full Change 2020-06-02&nbsp;&rarr;&nbsp;**TESTING GENERATOR SOURCE   not product ** &nbsp;&rarr;&nbsp; Possibility to modify the PANEL. Ergonomics improvement<br>  
  * Full Change 2020-06-02&nbsp;&rarr;&nbsp;add color Cell grid<br>  
  * Full Change 2020-06-10&nbsp;&rarr;&nbsp;add access FIELD LABEL Regularization of the Mouse function for menus and combos .... I need to improve the visual grid<br>  
  * Full Change 2020-06-22&nbsp;&rarr;&nbsp;**TESTING GENERATOR SOURCE   patience and persistence**<br>  
  * Full Change 2020-06-22&nbsp;&rarr;&nbsp;continue not finish :  genereted --> Menu...<br>  
  * Full Change 2020-08-26&nbsp;&rarr;&nbsp;Validity check correction and Multiple window definition introduction <br>  
  * Full Change 2020-09-14&nbsp;&rarr;&nbsp;Structuring code & adding different proc for grid<br>  
  * Full Change 2020-09-14&nbsp;&rarr;&nbsp;Update exemple<br>  
  * Testing.... 2020-09-30&nbsp;&rarr;&nbsp;**panel Label Field Menu Combo Grid this OK**<br>  
  * Générator.. 2020-09-30&nbsp;&rarr;&nbsp;panel Label Field Menu this OK --- testing Combo <br>  
  
**Thank you**

  * [ Date](https://rgxdb.com/r/2V9BOC58)  
  * [ MAIL](https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression) 
  * [TELEPHONE](https://regexr.com/3c53v)
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
| selector mouse                     |

  
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
| selector                           |
| Mouse on service                   |


  
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
| Enter              |&nbsp;&rarr;&nbsp; valid, next field                                                         |
| UP..DOWN           |&nbsp;&rarr;&nbsp; valid, next field                                                         |
| TAB..STAB          |&nbsp;&rarr;&nbsp; valid, next field                                                         |
| Insert             |&nbsp;&rarr;&nbsp;                                                                          |
| Delete             |&nbsp;&rarr;&nbsp;                                                                          |
| Left..Rigth        |&nbsp;&rarr;&nbsp;                                                                          |
| Backspace          |&nbsp;&rarr;&nbsp; Delete                                                                   |
| Home               |&nbsp;&rarr;&nbsp;                                                                          |
| End                |&nbsp;&rarr;&nbsp;                                                                          |
| Ctrl-H             |&nbsp;&rarr;&nbsp; Display a help panel specific to the field                                 |
| Escape             |&nbsp;&rarr;&nbsp; Returns control to ioPanel then redisplays the field without modification  |
| KEY                |&nbsp;&rarr;&nbsp; Returns control to ioPanel                                               |
|                    |                                                                                            |
| Field-Type         |                                                                                            |
|                    |                                                                                            |
| TEXT_FREE          |&nbsp;&rarr;&nbsp; Managed by function: regex , FULL                                        |
| ALPHA              |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and "-"                             |
| ALPHA_UPPER        |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha automatique UPPER and "-"           |
| PASSWORD           |&nbsp;&rarr;&nbsp; Managed by function: regex , hide  alpha + (1) + (3)                     |
| ALPHA_NUMERIC      |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and "-"             |
| ALPHA_NUMERIC_UPPER|&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and "-"             |
| TEXT_FULL          |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and isCarPwd(3)     |
| DIGIT              |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1)                                 |
| DIGIT_SIGNED       |&nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1)                        |
| DECIMAL            |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (.)                             |
| DECIMAL_SIGNED     |&nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1) (.)                    |
| DATE_ISO           |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (-)&nbsp;                       |
| DATE_US..DATE_FR   |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (/)&nbsp;                       |
| TELEPHONE          |&nbsp;&rarr;&nbsp; Managed by function: regex , International                               |
| MAIL_ISO           |&nbsp;&rarr;&nbsp; Managed by function: regex , [ABNF] [RFC 2822]                           |
| YES_NO             |&nbsp;&rarr;&nbsp; Managed by function: (Y-y-N-n) automatique UPPER                         |
| SWITCH             |&nbsp;&rarr;&nbsp; Managed by function: space bar ON/OFF ◉ ◎                                |
| FPROC              |&nbsp;&rarr;&nbsp; Managed by function: Call proc           "queryselector" Key.PROC        |
| FCALL              |&nbsp;&rarr;&nbsp; Managed by function: Call programme      "queryselector" Key.CALL        |


(1) numeric
"1","2","3","4","5","6","7","8","9","0"

(2) password
"~","!","?","@","#","$","£","€","%","^","&","*","-","+","=","(",")","{","}","[","]","<",">"

(3) punct
".",":",",","!","?","'","-","(",")","<",">"

not ";" reserved csv
<br>
<br>
#Usage
<br>
<br>
```
import termkey
import termcurs
import std/[re]
type
  FIELD_panel01 {.pure.}= enum
    vnom,
    vprenom,
    vnele,
    vdom,
    vmobil,
    vbur
const P1: array[FIELD_panel01, int] = [0,1,2,3,4,5]

# Panel panel01

var panel01= new(PANEL)

# description
proc dscPanel01() = 
  panel01 = newPanel("panel01",1,1,42,132,@[defButton(Key.F3,"Exit",true), defButton(Key.F12,"Return",true)],line1)

  # LABEL  -> panel01

  panel01.label.add(defTitle("T02002", 2, 2, "CONTACT"))
  panel01.label.add(deflabel("L04002", 4, 2, "Nom.......:"))
  panel01.label.add(deflabel("L06002", 6, 2, "Prénom....:"))
  panel01.label.add(deflabel("L09002", 9, 2, "Né le.....:"))
  panel01.label.add(deflabel("L11002", 11, 2, "Téléphone.."))
  panel01.label.add(deflabel("L12006", 12, 6, "Dom...:"))
  panel01.label.add(deflabel("L13006", 13, 6, "Mobil.:"))
  panel01.label.add(deflabel("L14006", 14, 6, "Bur...:"))

  # FIELD -> panel01

  panel01.field.add(defString("vnom", 4, 13, ALPHA_UPPER,30,"", FILL, "Obligatoire", "Nom du contact"))
  panel01.field.add(defString("vprenom", 6, 13, ALPHA_NUMERIC_UPPER,30,"", EMPTY, "Obligatoire", "Prénom du contact"))
  panel01.field.add(defDate("vnele", 9, 13, DATE_ISO,"", EMPTY, "", "Date de naissance"))
  panel01.field.add(defTelephone("vdom", 12, 13, TELEPHONE,15,"", EMPTY, "valeur incorrecte", "Téléphone domicile"))
  panel01.field.add(defTelephone("vmobil", 13, 13, TELEPHONE,15,"", FILL, "valeur incorrect", "Téléphone Mobile"))
  panel01.field.add(defTelephone("vbur", 14, 13, TELEPHONE,15,"", EMPTY, "Valeur incorrecte", "Téléphone bureau"))



dscPanel01()
proc main()=
  offCursor()
  initScreen(Lines(panel01),Cols(panel01),"CONTACT")


  printPanel(panel01)
  displayPanel(panel01)


  while true:
    let  key = ioPanel(panel01)
    case key
      of Key.F3:
        break
      of Key.F12:
	# only test 	  
        setText(panel01,P1[vnom],"JPL")
      else : discard


main()
closeScren()
```
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
# Main procedure

proc ioGrid(this: GRIDSFL; pos: int = -1): (Key, seq[string]) {...}

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (Key) {...}

proc isValide(pnl: var PANEL): bool {...}

proc ioPanel(pnl: var PANEL): Key {...}
<br>
<br>
<br>



# Procs
proc defCursor(e_curs: Natural = 0) {...}

proc setTerminal(termatr: ZONATRB = scratr) {...}

proc defButton(key: Key; text: string; actif = true): BUTTON {...}

proc defBox(name: string; posx: Natural; posy: Natural; lines: Natural; cols: Natural;
           cadre: CADRE; title: string; box_atr: BOXATRB = boxatr; actif: bool = true): BOX {...}

proc printBox(pnl: var PANEL; box: BOX) {...}

proc newMenu(name: string; posx: Natural; posy: Natural; mnuvh: MNUVH; item: seq[string];
            cadre: CADRE = CADRE.line0; mnu_atr: MNUATRB = mnuatr; actif: bool = true): MENU {...}

proc printMenu(pnl: PANEL; mnu: MENU) {...}

proc defLabel(name: string; posx: Natural; posy: Natural; text: string;
             lbl_atr: ZONATRB = lblatr; actif: bool = true): LABEL {...}

proc defTitle(name: string; posx: Natural; posy: Natural; text: string;
             ttl_atr: ZONATRB = ttlatr; actif: bool = true): LABEL {...}

proc printLabel(pnl: var PANEL; lbl: LABEL) {...}

proc defString(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
              width: Natural; text: string; empty: bool; errmsg: string; help: string;
              regex: string = ""; fld_atr: ZONATRB = fldatr;
              protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc defMail(name: string; posx: Natural; posy: Natural; reftyp: REFTYP; width: Natural;
            text: string; empty: bool; errmsg: string; help: string;
            fld_atr: ZONATRB = fldatr; protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc defSwitch(name: string; posx: Natural; posy: Natural; reftyp: REFTYP; switch: bool;
              empty: bool; errmsg: string; help: string; swt_atr: ZONATRB = swtatr;
              protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc defDate(name: string; posx: Natural; posy: Natural; reftyp: REFTYP; text: string;
            empty: bool; errmsg: string; help: string; fld_atr: ZONATRB = fldatr;
            protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc defNumeric(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
               width: Natural; scal: Natural; text: string; empty: bool; errmsg: string;
               help: string; fld_atr: ZONATRB = fldatr; protect_atr: ZONATRB = prtatr;
               actif: bool = true): FIELD {...}

proc defTelephone(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
                 width: Natural; text: string; empty: bool; errmsg: string;
                 help: string; fld_atr: ZONATRB = fldatr;
                 protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

proc defStringH(name: string; reftyp: REFTYP; text: string): HIDEN {...}

proc defSwitchH(name: string; reftyp: REFTYP; switch: bool): HIDEN {...}

proc Lines(pnl: PANEL): Natural {...}

proc Cols(pnl: PANEL): Natural {...}

proc Index(pnl: PANEL): Natural {...}

proc newPanel(name: string; posx, posy, height, width: Natural; button: seq[(BUTTON)];
             cadre: CADRE = line0; title: string = ""; pnl_atr: ZONATRB = pnlatr): PANEL {...}

proc updPanel(pnl: var PANEL; name: string; posx, posy, height, width: Natural;
             button: seq[(BUTTON)]; cadre: CADRE = line0; title: string = "";
             pnl_atr: ZONATRB = pnlatr) {...}

proc printField(pnl: var PANEL; fld: FIELD) {...}

proc printButton(pnl: var PANEL; btn_esp: BTNSPACE = btnspc) {...}

proc displayPanel(pnl: PANEL) {...}

proc printPanel(pnl: var PANEL) {...}

proc resetPanel(pnl: var PANEL) {...}

proc resetMenu(mnu: var MENU) {...}

proc clsLabel(pnl: var PANEL; lbl: LABEL) {...}

proc clsField(pnl: var PANEL; fld: FIELD) {...}

proc clsPanel(pnl: var PANEL) {...}

proc displayLabel(pnl: var PANEL; lbl: LABEL) {...}

proc displayField(pnl: var PANEL; fld: FIELD) {...}

proc displayButton(pnl: var PANEL) {...}

proc restorePanel(dst: PANEL; src: var PANEL) {...}

proc restorePanel(dst: PANEL; mnu: MENU) {...}

proc restorePanel(dst: PANEL; grid: GRIDSFL) {...}

proc restorePanel(pnl: PANEL; lines, posy: Natural) {...}

proc getPnlName(pnl: PANEL): string {...}

proc getPnlTitle(pnl: PANEL): string {...}

proc getIndexL(pnl: PANEL; name: string): int {...}

proc getNameL(pnl: PANEL; index: int): string {...}

proc getPosxL(pnl: PANEL; index: int): int {...}

proc getPosyL(pnl: PANEL; index: int): int {...}

proc getTextL(pnl: PANEL; index: int): string {...}

proc isTitle(pnl: PANEL; index: int): bool {...}

proc getTextL(pnl: PANEL; name: string): string {...}

proc setTextL(pnl: PANEL; name: string; val: string) {...}

proc setTextL(pnl: PANEL; index: int; val: string) {...}

proc setTitle(pnl: PANEL; index: int; val: bool) {...}

proc dltLabel(pnl: PANEL; idx: Natural) {...}

proc clearText(pnl: var PANEL) {...}

proc getName(pnl: PANEL): string {...}

proc getProcess(pnl: PANEL; index: int): string {...}

proc getName(pnl: PANEL; index: int): string {...}

proc getPosx(pnl: PANEL; index: int): int {...}

proc getPosy(pnl: PANEL; index: int): int {...}

proc getRefType(pnl: PANEL; index: int): REFTYP {...}

proc getWidth(pnl: PANEL; index: int): int {...}

proc getScal(pnl: PANEL; index: int): int {...}

proc getEmpty(pnl: PANEL; index: int): bool {...}

proc getErrmsg(pnl: PANEL; index: int): string {...}

proc getHelp(pnl: PANEL; index: int): string {...}

proc getEdtcar(pnl: PANEL; index: int): string {...}

proc getProtect(pnl: PANEL; index: int): bool {...}

proc getText(pnl: PANEL; index: int): string {...}

proc getSwitch(pnl: PANEL; index: int): bool {...}

proc getText(pnl: PANEL; name: string): string {...}

proc getSwitch(pnl: PANEL; name: string): bool {...}

proc getIndex(pnl: PANEL; name: string): int {...}

proc setName(pnl: PANEL; index: int; val: string) {...}

proc setName(pnl: PANEL; index: int; val: Natural) {...}

proc setPosy(pnl: PANEL; index: int; val: Natural) {...}

proc setType(pnl: PANEL; index: int; val: REFTYP) {...}

proc setWidth(pnl: PANEL; index: int; val: Natural) {...}

proc setScal(pnl: PANEL; index: int; val: Natural) {...}

proc setEmpty(pnl: PANEL; index: int; val: bool) {...}

proc setErrmsg(pnl: PANEL; index: int; val: string) {...}

proc setHelp(pnl: PANEL; index: int; val: string) {...}

proc setEdtcar(pnl: PANEL; index: int; val: string) {...}

proc setProtect(pnl: PANEL; index: int; val: bool) {...}

proc setText(pnl: PANEL; name: string; val: string) {...}

proc setSwitch(pnl: PANEL; name: string; val: bool): bool {...}

proc setText(pnl: PANEL; index: int; val: string) {...}

proc setSwitch(pnl: PANEL; index: int; val: bool) {...}

proc dltField(pnl: PANEL; idx: Natural) {...}

proc isProcess(pnl: PANEL; index: int): bool {...}

proc getNameH(hdn: PANEL; index: int): string {...}

proc getIndexH(hdn: PANEL; name: string): int {...}

proc getTextH(hdn: PANEL; name: string): string {...}

proc getSwitchH(hdn: PANEL; name: string): bool {...}

proc getTextH(hdn: PANEL; index: int): string {...}

proc getSwitchH(hdn: PANEL; index: int): bool {...}

proc dltFieldH(hdn: PANEL; idx: Natural) {...}

proc getNbrcar(pnl: PANEL; name: string): int {...}

proc getReftyp(pnl: PANEL; name: string): REFTYP {...}

proc setColor(lbl: var LABEL; lbl_atr: ZONATRB) {...}

proc setColor(fld: var FIELD; fld_atr: ZONATRB) {...}

proc setColorProtect(fld: var FIELD; protect_atr: ZONATRB) {...}

proc setProtect(fld: var FIELD; protect: bool) {...}

proc setEdtCar(fld: var FIELD; Car: string) {...}

proc setError(fld: var FIELD; val: bool) {...}

proc setActif(fld: var FIELD; actif: bool) {...}

proc setActif(lbl: var LABEL; actif: bool) {...}

proc setActif(box: var BOX; actif: bool) {...}

proc setActif(mnu: var MENU; actif: bool) {...}

proc setActif(btn: var BUTTON; actif: bool) {...}

proc setActif(pnl: var PANEL; actif: bool) {...}

proc setMouse(pnl: var PANEL; actif: bool) {...}

proc setProcess(fld: var FIELD; process: string) {...}

proc isPanelKey(pnl: PANEL; e_key: Key): bool {...}

proc isProtect(fld: var FIELD): bool {...}

proc isError(fld: var FIELD): bool {...}

proc isActif(fld: var FIELD): bool {...}

proc isActif(lbl: var LABEL): bool {...}

proc isActif(box: var BOX): bool {...}

proc isActif(mnu: var MENU): bool {...}

proc isActif(btn: var BUTTON): bool {...}

proc isActif(pnl: var PANEL): bool {...}

proc isMouse(pnl: var PANEL): bool {...}

proc setPageGrid(this: GRIDSFL) {...}

proc setLastPage(this: GRIDSFL) {...}

proc newGrid(name: string; posx: Natural; posy: Natural; pageRows: Natural;
            separator: GridStyle = sepStyle; grid_atr: GRIDATRB = gridatr;
            actif: bool = true): GRIDSFL {...}

proc resetGrid(this: GRIDSFL) {...}

proc counColumns(this: GRIDSFL): Natural {...}

proc countRows(this: GRIDSFL): Natural {...}

proc setHeaders(this: GRIDSFL; headers: seq[CELL]) {...}

proc defCell(text: string; long: Natural; reftyp: REFTYP; cell_atr: CELLATRB = cellatr): CELL {...}

proc setCellEditCar(cell: var CELL; edtcar: string = "") {...}

proc getcellLen(cell: var CELL): int {...}

proc getIndexG(this: GRIDSFL; name: string): int {...}

proc getrowName(this: GRIDSFL; r: int): string {...}

proc getrowPosx(this: GRIDSFL; r: int): int {...}

proc getrowPosy(this: GRIDSFL; r: int): int {...}

proc getrowType(this: GRIDSFL; r: int): REFTYP {...}

proc isrowTitle(this: GRIDSFL; r: int): bool {...}

proc getrowText(this: GRIDSFL; r: int): string {...}

proc getrowWidth(this: GRIDSFL; r: int): int {...}

proc getrowScal(this: GRIDSFL; r: int): int {...}

proc getrowEmpty(this: GRIDSFL; r: int): bool {...}

proc getrowErrmsg(this: GRIDSFL; r: int): string {...}

proc getrowHelp(this: GRIDSFL; r: int): string {...}

proc getrowCar(this: GRIDSFL; r: int): string {...}

proc isrowProtect(this: GRIDSFL; r: int): bool {...}

proc getrowProcess(this: GRIDSFL; r: int): string {...}

proc addRows(this: GRIDSFL; rows: seq[string]) {...}

proc dltRows(this: GRIDSFL; idx: Natural) {...}

proc resetRows(this: GRIDSFL) {...}

proc printGridHeader(this: GRIDSFL) {...}

proc printGridRows(this: GRIDSFL) {...}

proc pageUpGrid(this: GRIDSFL): Key_Grid {...}

proc pageDownGrid(this: GRIDSFL): Key_Grid {...}

proc ioGrid(this: GRIDSFL; pos: int = -1): (Key, seq[string]) {...}

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (Key) {...}

proc isValide(pnl: var PANEL): bool {...}

proc ioPanel(pnl: var PANEL): Key {...}


Made with Nim. Generated: 2020-09-14 12:54:23 UTC
