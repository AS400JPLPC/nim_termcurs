# nim_Termcurs
api s'inpirant du 5250/3270 utilisant NIM-LANG exploitation du terminal
premier test fait bientôt le dépot  
  


proc def_cursor(e_curs: Natural = 0) {...}

proc setTerminal(termatr: ZONATRB = scratr) {...}

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


proc printButton(pnl: var PANEL; x, y, interval: Natural) {...}


proc defPanel(pnl: var PANEL; name: string; posx, posy, height, width: Natural;
             backgr: BackgroundColor; backbr: bool; foregr: ForegroundColor;
             forebr: bool; cadre: CADRE; title: string;
             nbrbox, nbrlabel, nbrfield, nbrhiden: Natural; button: seq[(BUTTON)];
             actif: bool = true) {...}


proc clearPanel(pnl: var PANEL) {...}


proc clearPanel(mnu: var MENU) {...}


proc displayField(pnl: PANEL; fld: FIELD) {...}


proc displayPanel(pnl: PANEL) {...}


proc restorePanel(dst: PANEL; src: var PANEL) {...}


proc restorePanel(dst: PANEL; mnu: MENU) {...}


proc restorePanel(pnl: PANEL; lines, posy: Natural) {...}


proc printPanel(pnl: var PANEL) {...}


proc isPanelKey(pnl: PANEL; e_key: Key): bool {...}


proc button(key: Key; label: string): BUTTON {...}


proc setProtect(fld: var FIELD; protect: bool) {...}


proc setActif(fld: var FIELD; actif: bool) {...}


proc setActif(lbl: var LABEL; actif: bool) {...}


proc setActif(box: var BOX; actif: bool) {...}


proc setActif(mnu: var MENU; actif: bool) {...}


proc setActif(pnl: var PANEL; actif: bool) {...}


proc setMouse(pnl: var PANEL; actif: bool) {...}



# Main procedure

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (Key) {...}

proc ioPanel(pnl: var PANEL): Key {...}



# Funcs

func Lines(pnl: PANEL): Natural {...}

func Cols(pnl: PANEL): Natural {...}

func Index(pnl: PANEL): Natural {...}

func fldName(pnl: PANEL): string {...}

func fldIndex(pnl: PANEL; name: string): int {...}

func fldString(pnl: PANEL; name: string): string {...}

func fldString(pnl: PANEL; index: Natural): string {...}

func isProtect(fld: var FIELD): bool {...}

func isActif(fld: var FIELD): bool {...}

func isActif(lbl: var LABEL): bool {...}

func isActif(box: var BOX): bool {...}

func isActif(mnu: var MENU): bool {...}

func isActif(pnl: var PANEL): bool {...}

func isMouse(pnl: var PANEL): bool {...}


