# nim_Termcurs

*** curse TERMINAL inspired 5250/3270 done only with nim***

**  I am not yet posting designer and source generator.it is not operational but written at the base of termcurs**<br />


** generator **<br />
&rarr;&nbsp; creat Panel    OK<br />
&rarr;&nbsp; creat Label    OK<br />
&rarr;&nbsp; creat Field    OK<br />
&rarr;&nbsp; creat Grid/Combo curent<br />
&rarr;&nbsp; creat Menu     OK<br />
&rarr;&nbsp; creat json     OK<br />
&rarr;&nbsp; creat save/restor  OK<br />

** require termkey **


doc : [TERMCURS](http://htmlpreview.github.io/?https://github.com/AS400JPLPC/nim_termcurs/blob/master/htmldocs/termcurs.html)



img : [TERMCURS PRESENTATION](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr00.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr01.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr06.png)

img : [TERMCURS](https://github.com/AS400JPLPC/nim_termcurs/blob/master/ecr08.png)


img : [EXEMPLE](https://github.com/AS400JPLPC/nim_termcurs/blob/master/TEST.png)
img : [SOURCE GENERATED](https://github.com/AS400JPLPC/nim_termcurs/blob/master/source_generated.png)
<br />
<br />
**Progress of the designer test**<br />
<br />
img : [Source-ouput](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Output_Code.png)
img : [Source-screen](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Output_Screen.png)
img : [Source-screen](https://github.com/AS400JPLPC/nim_termcurs/blob/master/Output_Screen2.png)
<br />
<br />

**IMPORT: termkey project**<br />

<u>put in function 2020-04-15</u><br />  
  * add 2020-04-15 :22:15 &nbsp;&rarr;&nbsp; menu horizontal<br />  
  * corrective 2020-04-25 &nbsp;&rarr;&nbsp; field APLHA include "-"<br />  
  * 2020-05-02 *&nbsp;&nbsp;&nbsp;&rarr;&nbsp;<u>**add support GRID**</u>*<br />  
  * Full Change 2020-05-02&nbsp;&rarr;&nbsp;Fundamental change Harmonization add proc and func ...<br />  
  * &nbsp;&nbsp;&nbsp;&rarr;&nbsp; <u> ***IMPORTANT change:***</u><br /> 
  * Full Change 2020-05-13&nbsp;&rarr;&nbsp;Progress Designer and Termcurs...<br />  
  * Full Change 2020-05-14&nbsp;&rarr;&nbsp;Validity check correction<br />  
  * Full Change 2020-05-15&nbsp;&rarr;&nbsp;Validity check Grid add QUERY "queryselector"<br />  
  * Full Change 2020-05-19&nbsp;&rarr;&nbsp;Change Func QUERY --> FPROC FCALL "queryselector"<br />  
  * Full Change 2020-05-20&nbsp;&rarr;&nbsp;**TESTING GENERATOR SOURCE**<br />  
  * Full Change 2020-05-25&nbsp;&rarr;&nbsp;**Validate GENERATOR SOURCE   not product **<br />  
  * Full Change 2020-06-02&nbsp;&rarr;&nbsp;**TESTING GENERATOR SOURCE   not product ** &nbsp;&rarr;&nbsp; Possibility to modify the PANEL. Ergonomics improvement<br />  
  * Full Change 2020-06-02&nbsp;&rarr;&nbsp;add color Cell grid<br />  
  * Full Change 2020-06-10&nbsp;&rarr;&nbsp;add access FIELD LABEL Regularization of the Mouse function for menus and combos .... I need to improve the visual grid<br />  
  * Full Change 2020-06-22&nbsp;&rarr;&nbsp;**TESTING GENERATOR SOURCE   patience and persistence**<br />  
  * Full Change 2020-06-22&nbsp;&rarr;&nbsp;continue not finish :  genereted --> Menu...<br />  
  * Full Change 2020-08-26&nbsp;&rarr;&nbsp;Validity check correction and Multiple window definition introduction <br />  
  * Full Change 2020-09-14&nbsp;&rarr;&nbsp;Structuring code & adding different proc for grid<br />  
  * Full Change 2020-09-14&nbsp;&rarr;&nbsp;Update exemple<br />  
  * Testing.... 2020-09-30&nbsp;&rarr;&nbsp;**panel Label Field Menu Combo Grid this OK**<br />  
  * Générator.. 2020-09-30&nbsp;&rarr;&nbsp;panel Label Field Menu this OK --- testing Combo<br />  
  * Full Change 2020-11-04&nbsp;&rarr;&nbsp;homogeneity with termkey<br />
  * Full Change 2020-11-10&nbsp;&rarr;&nbsp;enfranchisement Nim:Terminal code cleanup operational with libvte or ex xfce-terminal<br />
  * Full Change 2020-11-15&nbsp;&rarr;&nbsp;correctif define Menu colors  <br />
  <br />  <br />
  * Full Change 2021-06-17&nbsp;&rarr;&nbsp;correctif define MENU* and  mnuatr  <br />
  * Full Change 2021-06-17&nbsp;&rarr;&nbsp;add dspMenuItem  and mnuatrCadre <br />
  * Full Change 2021-06-17&nbsp;&rarr;&nbsp;** First generator Full source code --> panel Label Field Menu<br />
  * Full Change 2021-06-17&nbsp;&rarr;&nbsp;** First TEST.nim view Output_Code/Output_Screen<br />
 <br />
  * Full Change 2021-07-07&nbsp;&rarr;&nbsp;** Correctif mineur date check form valide  <br />
  * Full Change 2021-07-24&nbsp;&rarr;&nbsp;** Correctif mineur (insert and nbrRune)  -> cohésion start/end field<br />
  * Full Change 2021-07-24&nbsp;&rarr;&nbsp;** optimisation and solution import conflict unicode strutils  <br />
  * Full Change 2021-07-24&nbsp;&rarr;&nbsp;** First generator file Json for designer and restore <br />
 <br />
  * Full Change 2021-08-06&nbsp;&rarr;&nbsp;** Change work and défine Button defButton() <br />
  * Full Change 2021-08-06&nbsp;&rarr;&nbsp;** text get/set text add générator define Button   <br /> 
  * Full Change 2021-08-06&nbsp;&rarr;&nbsp;** add ctrl is true force control panel field   <br /> 
  * Full Change 2021-08-06&nbsp;&rarr;&nbsp;** change work field numéric difference between null and zeros  <br /> 
  * Full Change 2021-08-06&nbsp;&rarr;&nbsp;** add setRegex field   exemple:test.nim<br /> 
 <br />
  * Full Change 2021-10-25&nbsp;&rarr;&nbsp;** change defCell if text.len > long long = text.len<br /> 
  * Full Change 2021-10-25&nbsp;&rarr;&nbsp;** change pageDownGrid if curspage= pages return PGend<br /> 
  * Full Change 2021-10-25&nbsp;&rarr;&nbsp;** add setActif() Grid<br /> 
  * Full Change 2021-10-25&nbsp;&rarr;&nbsp;** add isActif() Grid<br /> 
 <br />
  


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

| Func...........                    |
|------------------------------------|
| Escape = 0                         |
| Enter = 1..n                       |
| scrolling with UP..DOWN            |
| Mouse                              |
| scrolling done with the wheel      |
| UP&nbsp; DOWN&nbsp; Left&nbsp; RIGHT |
| selector mouse                     |

  
<br />
<br />
&nbsp;&rarr;&nbsp; **ioPANEL**&nbsp;&nbsp;&nbsp;<br />
displays all the field labels as well as the function keys (F1 ..). the unfolding this fact according to the order in which you registered in the seq [Field] and not index on lines / cols
<br />

| Func...........| help.                                              |
|----------------|----------------------------------------------------|
| Enter          | &nbsp;&rarr;&nbsp; next field                      |
| UP             | &nbsp;&rarr;&nbsp; next field                      |
| DOWN           | &nbsp;&rarr;&nbsp; previous field                  |
| Escape         | &nbsp;&rarr;&nbsp; return field                    |
| Other KEY      | &nbsp;&rarr;&nbsp; returns to the calling procedure|

  
<br />
<br />
&rarr;&nbsp; **ioGRID** Display field type table, with page / line tracking:<br />

| Func...........                    |
|------------------------------------|
| Escape = 0                         |
| Enter = return (Key seq[string]    |
| scrolling with UP..DOWN            |
| PageUP/PageDown                    |
| selector                           |
| Mouse on service                   |


<br />
<br />
<br />

&nbsp;
&rarr;&nbsp; **USE**:<br />

  * windows: PANEL it is its basic vocation as a frame (html)<br />
  * texte: LABEL<br />
  * buffer: FIELD<br />
  * funckey: BUTTON<br />
  * Currently does not control panel output overflows<br />
  * To use restore you must display a panel in a panel (must be included) same for the Menus<br />
  * The framing of the labels or fields are relative to the panel<br />
  * in a PANEL the function keys appear automatically and are included in the Buttons<br />

<br />
&nbsp;
&rarr;&nbsp; **ioFIELD**<br />
<br />

| Func...........    | help.                                                                                      |
|--------------------|--------------------------------------------------------------------------------------------|
| Enter              |&nbsp;&rarr;&nbsp; valid, next field                                                        |
| UP..DOWN           |&nbsp;&rarr;&nbsp; valid, next field                                                        |
| TAB..STAB          |&nbsp;&rarr;&nbsp; valid, next field                                                        |
| Insert             |&nbsp;&rarr;&nbsp; insert char field                                                        |
| Delete             |&nbsp;&rarr;&nbsp; delete char field                                                        |
| Left..Rigth        |&nbsp;&rarr;&nbsp;                                                                          |
| Backspace          |&nbsp;&rarr;&nbsp; Delete                                                                   |
| Home               |&nbsp;&rarr;&nbsp; First field                                                              |
| End                |&nbsp;&rarr;&nbsp; Last field                                                               |
| Ctrl-H             |&nbsp;&rarr;&nbsp; Display a help panel specific to the field                               |
| Escape             |&nbsp;&rarr;&nbsp; Returns control to ioPanel then redisplays the field without modification|
| TKEY               |&nbsp;&rarr;&nbsp; Returns control to ioPanel                                               |
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
doc : [Source-screen.nim](https://github.com/AS400JPLPC/nim_termcurs/blob/master/exemple/test.nim)
<br />
<br />
<br />
<br />
<br />


** Main procedure**<br />
proc setTerminal(termatr: ZONATRB = scratr) {...}

    Erase and color and style default 

proc defButton(key: TKey; text: string; ctrl: bool = false; actif: bool = true): BUTTON {...}

    define BUTTON 

proc defBox(name: string; posx: Natural; posy: Natural; lines: Natural;
            cols: Natural; cadre: CADRE; title: string;
            box_atr: BOXATRB = boxatr; actif: bool = true): BOX {...}

    Define BOX 

proc printBox(pnl: var PANEL; box: BOX) {...}

    assigne BOX to matrice for display 

proc newMenu(name: string; posx: Natural; posy: Natural; mnuvh: MNUVH;
             item: seq[string]; cadre: CADRE = CADRE.line0;
             mnu_atr: MNUATRB = mnuatr; actif: bool = true): MENU {...}

proc printMenu(pnl: PANEL; mnu: MENU) {...}

proc dspMenuItem(pnl: PANEL; mnu: MENU; npos: Natural = 0) {...}

proc defLabel(name: string; posx: Natural; posy: Natural; text: string;
              lbl_atr: ZONATRB = lblatr; actif: bool = true): LABEL {...}

    Define Label 

proc defTitle(name: string; posx: Natural; posy: Natural; text: string;
              ttl_atr: ZONATRB = ttlatr; actif: bool = true): LABEL {...}

    Define Title 

proc printLabel(pnl: var PANEL; lbl: LABEL) {...}

    assigne LABEL to matrice for display 

proc defString(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
               width: Natural; text: string; empty: bool; errmsg: string;
               help: string; regex: string = ""; fld_atr: ZONATRB = fldatr;
               protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

    Define Field String Standard 

proc defMail(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
             width: Natural; text: string; empty: bool; errmsg: string;
             help: string; fld_atr: ZONATRB = fldatr;
             protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

    Define Field Mail 

proc defSwitch(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
               switch: bool; empty: bool; errmsg: string; help: string;
               swt_atr: ZONATRB = swtatr; protect_atr: ZONATRB = prtatr;
               actif: bool = true): FIELD {...}

    Define Field switch 

proc defDate(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
             text: string; empty: bool; errmsg: string; help: string;
             fld_atr: ZONATRB = fldatr; protect_atr: ZONATRB = prtatr;
             actif: bool = true): FIELD {...}

    Define Field date ISO 

proc defNumeric(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
                width: Natural; scal: Natural; text: string; empty: bool;
                errmsg: string; help: string; fld_atr: ZONATRB = fldatr;
                protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

    Define Field Numeric 

proc defTelephone(name: string; posx: Natural; posy: Natural; reftyp: REFTYP;
                  width: Natural; text: string; empty: bool; errmsg: string;
                  help: string; fld_atr: ZONATRB = fldatr;
                  protect_atr: ZONATRB = prtatr; actif: bool = true): FIELD {...}

    Define Field Telephone 

proc defStringH(name: string; reftyp: REFTYP; text: string): HIDEN {...}

    Hiden field 

proc defSwitchH(name: string; reftyp: REFTYP; switch: bool): HIDEN {...}

    Hiden switch 

proc Lines(pnl: PANEL): Natural {...}

    get lines PANEL 

proc Cols(pnl: PANEL): Natural {...}

    get cols PANEL 

proc Index(pnl: PANEL): Natural {...}

    index actived from panel this getField 

proc newPanel(name: string; posx, posy, height, width: Natural;
              button: seq[(BUTTON)]; cadre: CADRE = line0; title: string = "";
              pnl_atr: ZONATRB = pnlatr): PANEL {...}

    Define PANEL 

proc printField(pnl: var PANEL; fld: FIELD) {...}

    assigne FIELD to matrice for display 

proc printButton(pnl: var PANEL; btn_esp: BTNSPACE = btnspc) {...}

    assigne BUTTON matrice for display 

proc displayPanel(pnl: PANEL) {...}

    display matrice PANEL 

proc printPanel(pnl: var PANEL) {...}

    assigne PANEL and all OBJECT to matrice for display 

proc resetPanel(pnl: var PANEL) {...}

    clear object PANEL / box/label/fld/proc 

proc resetMenu(mnu: var MENU) {...}

    clear object MENU 

proc clsLabel(pnl: var PANEL; lbl: LABEL) {...}

    cls Label from Panel 

proc clsField(pnl: var PANEL; fld: FIELD) {...}

    cls Field from Panel 

proc clsPanel(pnl: var PANEL) {...}

    cls Panel 

proc displayLabel(pnl: var PANEL; lbl: LABEL) {...}

    display matrice only LABEL 

proc displayField(pnl: var PANEL; fld: FIELD) {...}

    display matrice only FIELD 

proc displayButton(pnl: var PANEL) {...}

    display matrice only BUTTON 

proc restorePanel(dst: PANEL; src: var PANEL) {...}

    restore the base occupied by panel 

proc restorePanel(dst: PANEL; mnu: MENU) {...}

    restore the base occupied by menu 

proc restorePanel(dst: PANEL; grid: GRIDSFL) {...}

    restore the base occupied by grid 

proc restorePanel(pnl: PANEL; lines, posy: Natural) {...}

    restore the lines occupied by the error message 

proc getPnlName(pnl: PANEL): string {...}

    get name From Panel 

proc getPnlTitle(pnl: PANEL): string {...}

    get Title From Panel 

proc getIndexL(pnl: PANEL; name: string): int {...}

    get index Sequence Label from name 

proc getNameL(pnl: PANEL; index: int): string {...}

    get name label Sequence Field 

proc getPosxL(pnl: PANEL; index: int): int {...}

    get Posx label Sequence Field 

proc getPosyL(pnl: PANEL; index: int): int {...}

    get Posy label Sequence Field 

proc getTextL(pnl: PANEL; index: int): string {...}

    get value label Sequence Label 

proc isTitle(pnl: PANEL; index: int): bool {...}

    test Title label Sequence Label 

proc getTextL(pnl: PANEL; name: string): string {...}

    get value Label Sequence from name 

proc setTextL(pnl: PANEL; name: string; val: string) {...}

    set value Label Sequence from name 

proc setTextL(pnl: PANEL; index: int; val: string) {...}

    set value Label Sequence Label 

proc setTitle(pnl: PANEL; index: int; val: bool) {...}

    set value Label Sequence Label 

proc dltLabel(pnl: PANEL; idx: Natural) {...}

    delete Label from index 

proc clearText(pnl: var PANEL) {...}

    clear value ALL FIELD 

proc getName(pnl: PANEL): string {...}

    get name field from panel this getField 

proc getProcess(pnl: PANEL; index: int): string {...}

    get callVoid Field Sequence Field 

proc getName(pnl: PANEL; index: int): string {...}

    get name Field Sequence Field 

proc getPosx(pnl: PANEL; index: int): int {...}

    get Posx Field Sequence Field 

proc getPosy(pnl: PANEL; index: int): int {...}

    get Posy Field Sequence Field 

proc getRefType(pnl: PANEL; index: int): REFTYP {...}

    get Type Field Sequence Field 

proc getWidth(pnl: PANEL; index: int): int {...}

    get width Field Sequence Field 

proc getScal(pnl: PANEL; index: int): int {...}

    get Scal Field Sequence Field 

proc getEmpty(pnl: PANEL; index: int): bool {...}

    get Empty Field Sequence Field 

proc getErrmsg(pnl: PANEL; index: int): string {...}

    get errmsg Field Sequence Field 

proc getHelp(pnl: PANEL; index: int): string {...}

    get help Field Sequence Field 

proc getEdtcar(pnl: PANEL; index: int): string {...}

    get Edtcar Field Sequence Field 

proc getProtect(pnl: PANEL; index: int): bool {...}

    get Protect Field Sequence Field 

proc getText(pnl: PANEL; index: int): string {...}

    get value Field Sequence Field 

proc getSwitch(pnl: PANEL; index: int): bool {...}

    get value Field Sequence Field 

proc getText(pnl: PANEL; name: string): string {...}

    get value Field from name Field 

proc getSwitch(pnl: PANEL; name: string): bool {...}

    get value switch from name Field 

proc getIndex(pnl: PANEL; name: string): int {...}

    get index Field from name Field 

proc setName(pnl: PANEL; index: int; val: string) {...}

    set name Field Sequence Field 

proc setName(pnl: PANEL; index: int; val: Natural) {...}

    set posx Field Sequence Field 

proc setPosy(pnl: PANEL; index: int; val: Natural) {...}

    set posy Field Sequence Field 

proc setType(pnl: PANEL; index: int; val: REFTYP) {...}

    set Type Field Sequence Field 

proc setWidth(pnl: PANEL; index: int; val: Natural) {...}

    set width Field Sequence Field 

proc setScal(pnl: PANEL; index: int; val: Natural) {...}

    set Scal Field Sequence Field 

proc setEmpty(pnl: PANEL; index: int; val: bool) {...}

    set Empty Field Sequence Field 

proc setErrmsg(pnl: PANEL; index: int; val: string) {...}

    set errmsg Field Sequence Field 

proc setHelp(pnl: PANEL; index: int; val: string) {...}

    set help Field Sequence Field 

proc setEdtcar(pnl: PANEL; index: int; val: string) {...}

    set Edtcar Field Sequence Field 

proc setProtect(pnl: PANEL; index: int; val: bool) {...}

    set protect Field Sequence Field 

proc setText(pnl: PANEL; name: string; val: string) {...}

    set value Field from name Field 

proc setRegex(pnl: PANEL; name: string; val: string) {...}

proc setSwitch(pnl: PANEL; name: string; val: bool): bool {...}

    set switch Field from name Field 

proc setText(pnl: PANEL; index: int; val: string) {...}

    set value Field from index Field 

proc setRegex(pnl: PANEL; index: int; val: string) {...}

proc setSwitch(pnl: PANEL; index: int; val: bool) {...}

    set switch Field from index Field 

proc dltField(pnl: PANEL; idx: Natural) {...}

    delete Field index Field 

proc isProcess(pnl: PANEL; index: int): bool {...}

    test process index Field 

proc getNameH(hdn: PANEL; index: int): string {...}

    get name Hiden from index 

proc getIndexH(hdn: PANEL; name: string): int {...}

    get index Hiden from name 

proc getTextH(hdn: PANEL; name: string): string {...}

    get value Field Hiden from name 

proc getSwitchH(hdn: PANEL; name: string): bool {...}

    get switch Hiden from name 

proc getTextH(hdn: PANEL; index: int): string {...}

    get value Field Hiden from index 

proc getSwitchH(hdn: PANEL; index: int): bool {...}

    get switch Hiden from index 

proc dltFieldH(hdn: PANEL; idx: Natural) {...}

    delete Field Hiden from indexField 

proc getNbrcar(pnl: PANEL; name: string): int {...}

    get nbrCar Field from name 

proc getReftyp(pnl: PANEL; name: string): REFTYP {...}

    get ref.type Field from name 

proc setColor(lbl: var LABEL; lbl_atr: ZONATRB) {...}

    set attribut label 

proc setColor(fld: var FIELD; fld_atr: ZONATRB) {...}

    set attribut field 

proc setColorProtect(fld: var FIELD; protect_atr: ZONATRB) {...}

    set attribut protect field 

proc setProtect(fld: var FIELD; protect: bool) {...}

proc setEdtCar(fld: var FIELD; Car: string) {...}

proc setError(fld: var FIELD; val: bool) {...}

proc setActif(fld: var FIELD; actif: bool) {...}

proc setActif(lbl: var LABEL; actif: bool) {...}

proc setActif(box: var BOX; actif: bool) {...}

proc setActif(mnu: var MENU; actif: bool) {...}

proc setActif(pnl: var PANEL; actif: bool) {...}

proc setMouse(pnl: var PANEL; actif: bool) {...}

proc setProcess(fld: var FIELD; process: string) {...}

proc setActif(btn: var BUTTON; actif: bool) {...}

proc setCtrl(btn: var BUTTON; ctrl: bool) {...}

proc setText(btn: var BUTTON; val: string) {...}

proc getText(btn: var BUTTON): string {...}

proc getCtrl(btn: var BUTTON): bool {...}

proc getName(btn: var BUTTON): TKey {...}

proc isPanelKey(pnl: PANEL; e_key: TKey): bool {...}

    Test if KEYs must be managed by the programmer 

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

proc defCell(text: string; long: Natural; reftyp: REFTYP;
             cell_atr: CELLATRB = cellatr): CELL {...}

proc setCellEditCar(cell: var CELL; edtcar: string = "") {...}

proc getcellLen(cell: var CELL): int {...}

    get len from cell 

proc getIndexG(this: GRIDSFL; name: string): int {...}

    get index from grid,name 

proc getrowName(this: GRIDSFL; r: int): string {...}

    get name from grid,rows 

proc getrowPosx(this: GRIDSFL; r: int): int {...}

    get posx from grid,rows 

proc getrowPosy(this: GRIDSFL; r: int): int {...}

    get posy from grid,rows 

proc getrowType(this: GRIDSFL; r: int): REFTYP {...}

    get type from grid,rows 

proc isrowTitle(this: GRIDSFL; r: int): bool {...}

    get isTitle from grid,rows 

proc getrowText(this: GRIDSFL; r: int): string {...}

    get text from grid,rows 

proc getrowWidth(this: GRIDSFL; r: int): int {...}

    get Width from grid,rows 

proc getrowScal(this: GRIDSFL; r: int): int {...}

    get scal from grid,rows 

proc getrowEmpty(this: GRIDSFL; r: int): bool {...}

    get Empty from grid,rows 

proc getrowErrmsg(this: GRIDSFL; r: int): string {...}

    get errmsg from grid,rows 

proc getrowHelp(this: GRIDSFL; r: int): string {...}

    get help from grid,rows 

proc getrowCar(this: GRIDSFL; r: int): string {...}

    get Car from grid,rows 

proc isrowProtect(this: GRIDSFL; r: int): bool {...}

    get isProtect from grid,rows 

proc getrowProcess(this: GRIDSFL; r: int): string {...}

    get Process from grid,rows 

proc addRows(this: GRIDSFL; rows: seq[string]) {...}

proc dltRows(this: GRIDSFL; idx: Natural) {...}

proc resetRows(this: GRIDSFL) {...}

proc printGridHeader(this: GRIDSFL) {...}

proc printGridRows(this: GRIDSFL) {...}

proc pageUpGrid(this: GRIDSFL): TKey_Grid {...}

proc pageDownGrid(this: GRIDSFL): TKey_Grid {...}

proc ioGrid(this: GRIDSFL; pos: int = -1): (TKey, seq[string]) {...}

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (TKey) {...}

proc isValide(pnl: var PANEL): bool {...}

    Contrôle Format Panel full Field 

proc ioPanel(pnl: var PANEL): TKey {...}





<br />
<br />

**Made with Nim. Generated: 2021-08-06 12:53:31 UTC**


