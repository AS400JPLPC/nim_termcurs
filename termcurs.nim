import termkey
import terminal , strformat , strutils , std/[re]
import unicode except strip, align


const
  ALPHA* = 1
  ALPHA_UPPER* = 2
  ALPHA_NUMERIC* = 3
  ALPHA_NUMERIC_UPPER* = 4
  TEXT_NUMERIC* = 5
  PASSWORD* = 6
  DIGIT* = 7
  DIGIT_SIGNED* = 8
  DECIMAL* = 9
  DECIMAL_SIGNED* = 10
  DATE_ISO* = 11
  DATE_FR* = 12
  DATE_US* = 13
  MAIL_ISO* = 14
  YES_NO* = 15
  SWITCH* = 16

  EMPTY* = true
  FILL* = false

type
  CADRE* {.pure.} = enum 
    line0,  
    line1,    
    line2 

  MNUVH* {.pure.} = enum 
    vertical = 0  , 
    horizontal  

  MNUATRB* = ref object
    style* : set[Style]
    backgr*: BackgroundColor
    backbr*: bool
    foregr*: ForegroundColor 
    forebr*: bool
    styleCell* : set[Style]

  BOXATRB* = ref object
    style* : set[Style]
    backgr*: BackgroundColor
    backbr*: bool
    foregr*: ForegroundColor 
    forebr*: bool
    title_style* : set[Style]
    title_backgr*: BackgroundColor
    title_backbr*: bool
    title_foregr*: ForegroundColor 
    title_forebr*: bool

  ZONATRB* = ref object
    style* : set[Style]
    backgr*: BackgroundColor
    backbr*: bool
    foregr*: ForegroundColor 
    forebr*: bool

  BTNSPACE* = ref object
    space* : Natural


  FIELD = object
    name: string
    posx: Natural
    posy: Natural
    style : set[Style]
    backgr: BackgroundColor
    backbr: bool
    foregr: ForegroundColor 
    forebr: bool

    #protect
    pstyle : set[Style]
    pbackgr: BackgroundColor
    pbackbr: bool
    pforegr: ForegroundColor 
    pforebr: bool


    reftyp*: Natural           ## / ALPHA...SWITCH
    with: Natural
    scal: Natural
    nbrcar: Natural           ## / nbrcar DECIMAL = (precision+scale + 1'.' ) + 1 this signed || other nbrcar =  ALPA..DIGIT..
    empty : bool
    protect: bool             ## / only display
    pading: bool              ## / pading blank
    edtcar: string            ## / edtcar for monnaie		€ $ ¥ ₪ £ or %
    regex: string             ## / contrôle regex
    errmsg: string            ## / message this field
    help: string              ## / help this field
    field*: string
    switch* : bool            ## / CTRUE CFALSE
    actif*: bool              ## / zone active True

  HIDEN= object               ## / field block out 
    name: string
    reftyp: Natural           ## / ALPHA...SWITCH
    field*: string
    switch* : bool


  LABEL = object
    name: string
    posx: Natural
    posy: Natural
    style : set[Style]
    backgr: BackgroundColor
    backbr: bool
    foregr: ForegroundColor
    forebr: bool
    label*: string
    actif*: bool


  BOX = object
    name : string
    posx : Natural
    posy : Natural
    lines: Natural
    cols : Natural

    cadre: CADRE

    style : set[Style]
    backgr: BackgroundColor
    backbr: bool
    foregr: ForegroundColor
    forebr: bool

    title: string
    titlebackgr: BackgroundColor
    titlebackbr: bool
    titleforegr: ForegroundColor
    titleforebr: bool
    titlestyle:  set[Style]
    actif*: bool



  BUTTON* = object
    key : Key
    label: string
    actif*: bool


  MENU* = object
    name : string
    posx : Natural
    posy : Natural
    lines: Natural
    cols : Natural

    cadre: CADRE

    mnuvh : MNUVH

    style : set[Style]
    styleCell:set[Style]
    backgr: BackgroundColor
    backbr: bool
    foregr: ForegroundColor
    forebr: bool

    item: seq[string]
    selMenu : Natural


    actif*: bool


  TerminalChar = object
    ch: Rune                  # char 
    bg: BackgroundColor       # color
    bgb: bool                 # brigth
    fg: ForegroundColor       # color
    fgb: bool                 # brigth
    style: set[Style]         # style
    on:bool                   # on = true -> cell active

  PANEL* = ref object #ref object of RootObj
    name: string
    posx: Natural
    posy: Natural
    lines: Natural
    cols:  Natural

    backgr:   BackgroundColor
    backbr:   bool
    foregr:   ForegroundColor
    forebr:   bool
    style:    set[Style]

    cadre:    CADRE
    boxpnl:   seq[BOX]

    nbrbox:   Natural
    box*:     seq[BOX]
    nbrlabel*: Natural
    label*:   seq[LABEL]
    nbrfield*: Natural
    field*:   seq[FIELD]
    nbrhiden: Natural
    hiden*:   seq[HIDEN]

    button*:  seq[BUTTON]
    index:    Natural

    funckey:  seq[Key]

    mouse:  bool

    buf:seq[TerminalChar]

    actif:    bool





var scratr* = new(ZONATRB)
scratr.style  = {styleDim}
scratr.backgr = BackgroundColor.bgBlack
scratr.backbr = false
scratr.foregr = ForegroundColor.fgWhite
scratr.forebr = false


var mnuatr* = new(MNUATRB)
mnuatr.style  = {styleDim}
mnuatr.backgr = BackgroundColor.bgWhite
mnuatr.backbr = true
mnuatr.foregr = ForegroundColor.fgBlue
mnuatr.forebr = true
mnuatr.styleCell  = {styleReverse,styleItalic}

var mnuatrCadre* = new(MNUATRB)
mnuatrCadre.style  = {styleDim}
mnuatrCadre.backgr = BackgroundColor.bgBlack
mnuatrCadre.backbr = false
mnuatrCadre.foregr = ForegroundColor.fgWhite
mnuatrCadre.forebr = true
mnuatrCadre.styleCell  = {styleReverse,styleItalic}

var boxatr* = new(BOXATRB)
boxatr.style  = {styleDim}
boxatr.backgr = BackgroundColor.bgBlack
boxatr.backbr = false
boxatr.foregr = ForegroundColor.fgRed 
boxatr.forebr = true
boxatr.title_style = {styleDim}
boxatr.title_backgr = BackgroundColor.bgWhite
boxatr.title_backbr = false
boxatr.title_foregr = ForegroundColor.fgBlack 
boxatr.title_forebr = false

var lblatr* = new(ZONATRB)
lblatr.style  = {styleDim,styleItalic}
lblatr.backgr = BackgroundColor.bgBlack
lblatr.backbr = false
lblatr.foregr = ForegroundColor.fgGreen
lblatr.forebr = true

var fldatr* = new(ZONATRB)
fldatr.style  = {styleDim}
fldatr.backgr = BackgroundColor.bgWhite
fldatr.backbr = false
fldatr.foregr = ForegroundColor.fgBlue
fldatr.forebr = true

var prtatr* = new(ZONATRB)
prtatr.style  = {styleDim,styleItalic}
prtatr.backgr = BackgroundColor.bgBlack
prtatr.backbr = false
prtatr.foregr = ForegroundColor.fgYellow
prtatr.forebr = true

var swtatr* = new(ZONATRB)
swtatr.style  = {styleBright}
swtatr.backgr = BackgroundColor.bgblack
swtatr.backbr = false
swtatr.foregr = ForegroundColor.fgWhite
swtatr.forebr = false

var msgatr* = new(ZONATRB)
msgatr.style  = {styleDim}
msgatr.backgr = BackgroundColor.bgBlack
msgatr.backbr = false
msgatr.foregr = ForegroundColor.fgRed
msgatr.forebr = true

var hlpatr* = new(ZONATRB)
hlpatr.style  = {styleDim}
hlpatr.backgr = BackgroundColor.bgBlack
hlpatr.backbr = false
hlpatr.foregr = ForegroundColor.fgBlue
hlpatr.forebr = true

var btnatr* = new(BOXATRB)
btnatr.style  = {styleDim}
btnatr.backgr = BackgroundColor.bgBlack
btnatr.backbr = false
btnatr.foregr = ForegroundColor.fgRed 
btnatr.forebr = false
btnatr.title_style = {styleDim,styleItalic,styleUnderscore}
btnatr.title_backgr = BackgroundColor.bgBlack
btnatr.title_backbr = false
btnatr.title_foregr = ForegroundColor.fgCyan
boxatr.title_forebr = false

var btnspc* = new(BTNSPACE)
btnspc.space = 3





## define type cursor
proc def_cursor*(e_curs: Natural = 0) =
  const CSIcurs = 0x1b.chr & "[?25h"
  const CSIcurs0 = 0x1b.chr & "[0 q" ##  0 → not blinking block
  case e_curs
  of 0:
    stdout.write(CSIcurs0)
    stdout.write(CSIcurs)
  of 1:
    const CSIcurs1 = 0x1b.chr & "[1 q" ##  1 → blinking block
    stdout.write(CSIcurs1)
    stdout.write(CSIcurs)
  of 2:
    const CSIcurs2 = 0x1b.chr & "[2 q" ##  2 → steady block
    stdout.write(CSIcurs2)
    stdout.write(CSIcurs)
  of 3:
    const CSIcurs3 = 0x1b.chr & "[3 q" ##  3 → blinking underlines
    stdout.write(CSIcurs3)
    stdout.write(CSIcurs)
  of 4:
    const CSIcurs4 = 0x1b.chr & "[4 q" ##  4 → steady underlines
    stdout.write(CSIcurs4)
    stdout.write(CSIcurs)
  of 5:
    const CSIcurs5 = 0x1b.chr & "[5 q" ##  5 → blinking bar
    stdout.write(CSIcurs5)
    stdout.write(CSIcurs)
  of 6:
    const CSIcurs6 = 0x1b.chr & "[6 q" ##  6 → steady bar
    stdout.write(CSIcurs6)
    stdout.write(CSIcurs)
  else:
    stdout.write(CSIcurs0)
    stdout.write(CSIcurs)
  stdout.flushFile()
  stdin.flushFile()





## Erase and color and style default
proc setTerminal*(termatr : ZONATRB = scratr) =
  setStyle(scratr.style)
  setBackgroundColor(scratr.backgr,scratr.backbr)
  setForegroundColor(scratr.foregr,scratr.forebr)
  eraseScreen()
  hideCursor()

proc restorePanel*(dst: PANEL; mnu : MENU) 
func Lines*(pnl: PANEL):Natural


## return BUTTON
proc button*(key: Key; label:string; actif = true): BUTTON =
  var bt:BUTTON
  bt.key = key
  bt.label = label
  bt.actif = actif
  return bt





## Define BOX
proc fldBox*(box : var BOX ; name:string ; posx:Natural; posy:Natural; lines :Natural; cols:Natural;
              cadre :CADRE; title: string; box_atr: BOXATRB = boxatr ;actif: bool = true) =

    box.name  = name
    box.posx  = posx
    box.posy  = posy
    box.lines = lines 
    box.cols  = cols
    
    box.cadre = cadre

    box.style  = box_atr.style
    box.backgr = box_atr.backgr
    box.backbr = box_atr.backbr
    box.foregr = box_atr.foregr
    box.forebr = box_atr.forebr

    box.title = title
    box.titlestyle  = box_atr.title_style
    box.titlebackgr = box_atr.title_backgr
    box.titlebackbr = box_atr.title_backbr
    box.titleforegr = box_atr.title_foregr
    box.titleforebr = box_atr.title_forebr

    box.actif = actif





## assigne BOX to matrice for display
proc printBox*(pnl: var PANEL; box:BOX) =

  if CADRE.line0 == box.cadre : return
  let ACS_Hlines     = "─"
  let ACS_Vlines     = "│"
  let ACS_UCLEFT    = "┌"
  let ACS_UCRIGHT   = "┐"
  let ACS_LCLEFT    = "└"
  let ACS_LCRIGHT   = "┘"

  let ACS_Hline2    = "═"
  let ACS_Vline2    = "║"
  let ACS_UCLEFT2   = "╔"
  let ACS_UCRIGHT2  = "╗"
  let ACS_LCLEFT2   = "╚"
  let ACS_LCRIGHT2  = "╝"

  var trait:string = ""
  var edt :bool
  var
    x: Natural = box.posx
    row: Natural = 1
    y: Natural
    col: Natural
    npos: Natural
    n: Natural
  while row <= box.lines:

    y = box.posy
    col = 1
    while col <= box.cols:
      edt = false
  
      if row == 1:
        if col == 1:
          if CADRE.line1 == box.cadre : trait = ACS_UCLEFT
          else: trait = ACS_UCLEFT2
          edt = true
  
        if col == box.cols:
          if CADRE.line1 == box.cadre : trait = ACS_UCRIGHT
          else : trait = ACS_UCRIGHT2
          edt = true
  
        if col > Natural(1) and col < box.cols:
          if CADRE.line1 == box.cadre : trait = ACS_Hlines
          else : trait = ACS_Hline2
          edt = true
  
      elif row == box.lines:
        if col == Natural(1) :
          if CADRE.line1 == box.cadre : trait = ACS_LCLEFT
          else : trait = ACS_LCLEFT2 
          edt = true
  
        if col == box.cols:
          if CADRE.line1 == box.cadre : trait = ACS_LCRIGHT
          else : trait = ACS_LCRIGHT2 
          edt = true
  
        if col > Natural(1) and col < box.cols:
          if CADRE.line1 == box.cadre : trait = ACS_Hlines
          else : trait = ACS_Hline2
          edt = true
  
      elif row > Natural(1) and row < box. lines:
        if col == Natural(1) or col == box.cols:
          if CADRE.line1 == box.cadre : trait = ACS_Vlines
          else : trait = ACS_Vline2
          edt = true
  
      if edt:
        npos = box.cols * x
        n =  npos + y
        pnl.buf[n].ch = trait.runeAt(0)
        pnl.buf[n].bg  =  box.backgr
        pnl.buf[n].bgb =  box.backbr
        pnl.buf[n].fg  =  box.foregr
        pnl.buf[n].fgb =  box.forebr
        pnl.buf[n].style = box.style
        pnl.buf[n].on = true
      inc(y)
      inc(col)
    inc(x)
    inc(row)

  if box.title > "" :

    if len(box.title) > box.cols - 2: return

    npos = box.cols * box.posx
    n =  npos + (((box.cols - len(box.title) ) div 2) + box.posy)
    for ch in runes(box.title):
      pnl.buf[n].ch = ch
      pnl.buf[n].bg  =  box.titlebackgr
      pnl.buf[n].bgb =  box.titlebackbr
      pnl.buf[n].fg  =  box.titleforegr
      pnl.buf[n].fgb =  box.titleforebr
      pnl.buf[n].style = box.titlestyle
      pnl.buf[n].on = true
      inc(n)





## Define Menu
proc defMenu*(menu : var MENU ; name:string ; posx:Natural; posy:Natural;
              mnuvh: MNUVH ; item : seq[string] ;cadre :CADRE = CADRE.line0 ; mnu_atr : MNUATRB = mnuatr ;  actif: bool = true) =

  menu.name  = name
  menu.posx  = posx
  menu.posy  = posy
  menu.cadre = cadre
  menu.mnuvh = mnuvh
  var i : Natural = 0

  menu.cols = 0
  while  i <  len(item):
    if mnuvh == MNUVH.vertical  :
      if menu.cols < len(item[i]) : menu.cols = runeLen(item[i])
    if mnuvh == MNUVH.horizontal  : menu.cols +=  runeLen(item[i])
    inc(i)

  if mnuvh == MNUVH.vertical:
    if menu.cadre == CADRE.line1 or menu.cadre == CADRE.line2 :
      menu.lines = len(item) + 1
      menu.cols  += 1
    else :
      menu.lines = len(item) + 1

  if mnuvh == MNUVH.horizontal:
    if menu.cadre == CADRE.line1 or menu.cadre == CADRE.line2 : 
      menu.lines = 2
      menu.cols  += 1

  
  #gotoXY(39,1) ; echo "ioMenu",menu.cols ; let o = getFunc();


  menu.style  = mnu_atr.style
  menu.styleCell  = mnu_atr.styleCell
  menu.backgr = mnu_atr.backgr
  menu.backbr = mnu_atr.backbr
  menu.foregr = mnu_atr.foregr
  menu.forebr = mnu_atr.forebr
  menu.item = item
  menu.actif = actif





##  assigne MENU to matrice for display
proc printMenu*(pnl: PANEL; mnu:MENU) =
  var row: Natural = 0
  var col: Natural
  if CADRE.line1 == mnu.cadre  or CADRE.line2 == mnu.cadre: 
    let ACS_Hlines     = "─"
    let ACS_Vlines     = "│"
    let ACS_UCLEFT    = "┌"
    let ACS_UCRIGHT   = "┐"
    let ACS_LCLEFT    = "└"
    let ACS_LCRIGHT   = "┘"


    let ACS_Hline2    = "═"
    let ACS_Vline2    = "║"
    let ACS_UCLEFT2   = "╔"
    let ACS_UCRIGHT2  = "╗"
    let ACS_LCLEFT2   = "╚"
    let ACS_LCRIGHT2  = "╝"

    var trait:string = ""
    var edt :bool
    row = 0
    while row <= mnu.lines:
      col = 0
      while col <= mnu.cols:
        edt = false
    
        if row == 0:
          if col == 0:
            if CADRE.line1 == mnu.cadre : trait = ACS_UCLEFT
            else: trait = ACS_UCLEFT2
            edt = true
    
          if col == mnu.cols:
            if CADRE.line1 == mnu.cadre : trait = ACS_UCRIGHT
            else : trait = ACS_UCRIGHT2
            edt = true
    
          if col > Natural(0) and col < mnu.cols:
            if CADRE.line1 == mnu.cadre : trait = ACS_Hlines
            else : trait = ACS_Hline2
            edt = true
    
        elif row == mnu.lines:
          if col == Natural(0) :
            if CADRE.line1 == mnu.cadre : trait = ACS_LCLEFT
            else : trait = ACS_LCLEFT2 
            edt = true
    
          if col == mnu.cols:
            if CADRE.line1 == mnu.cadre : trait = ACS_LCRIGHT
            else : trait = ACS_LCRIGHT2 
            edt = true
    
          if col > Natural(0) and col < mnu.cols:
            if CADRE.line1 == mnu.cadre : trait = ACS_Hlines
            else : trait = ACS_Hline2
            edt = true
    
        elif row > Natural(0) and row < mnu.lines:
          if col == Natural(0) or col == mnu.cols:
            if CADRE.line1 == mnu.cadre : trait = ACS_Vlines
            else : trait = ACS_Vline2
            edt = true
    
        if edt:
          gotoXY(row + mnu.posx + pnl.posx - 1  , col + mnu.posy + pnl.posy - 1)
          setBackgroundColor(mnu.backgr,mnu.backbr)
          setForegroundColor(mnu.foregr,mnu.forebr)
          writeStyled(trait,mnu.style)
        else:
          gotoXY(row + mnu.posx + pnl.posx - 1 , col + mnu.posy + pnl.posy - 1)
          setBackgroundColor(mnu.backgr,mnu.backbr)
          setForegroundColor(mnu.foregr,mnu.forebr)
          writeStyled(" ",mnu.style)
        stdout.flushFile()
        inc(col)
      inc(row)

  else : # no cadre
    
    if mnu.mnuvh == MNUVH.vertical:
      row = 0
      while row <= mnu.lines:
        col = 0
        while col <= mnu.cols:
          gotoXY(row + mnu.posx  + pnl.posx - 1,mnu.posy + pnl.posy - 1)
          setBackgroundColor(mnu.backgr,mnu.backbr)
          setForegroundColor(mnu.foregr,mnu.forebr)
          writeStyled(" ",mnu.style)
          stdout.flushFile()
          inc(col)
        inc(row)
    if mnu.mnuvh == MNUVH.horizontal:
      col = 0
      while col < mnu.cols:
        gotoXY(mnu.posx  + pnl.posx - 1, col + mnu.posy + pnl.posy - 1)
        setBackgroundColor(mnu.backgr,mnu.backbr)
        setForegroundColor(mnu.foregr,mnu.forebr)
        writeStyled(" ",mnu.style)
        stdout.flushFile()
        inc(col)






## Define Label
proc fldLabel*(lbl : var LABEL ; name:string ; posx:Natural; posy:Natural; label: string;
                lbl_atr : ZONATRB = lblatr ; actif: bool = true) =

  lbl.name        = name
  lbl.posx        = posx
  lbl.posy        = posy
  lbl.label       = label
  lbl.actif       = actif

  lbl.style  = lbl_atr.style
  lbl.backgr = lbl_atr.backgr
  lbl.backbr = lbl_atr.backbr
  lbl.foregr = lbl_atr.foregr
  lbl.forebr = lbl_atr.forebr

## assigne LABEL to matrice for display
proc printLabel*(pnl: var PANEL, lbl : LABEL ) =
  var npos = pnl.cols * lbl.posx 
  var n =  npos + lbl.posy
  for ch in runes(lbl.label):
    if lbl.actif == true :
      pnl.buf[n].ch = ch
      pnl.buf[n].bg  = lbl.backgr
      pnl.buf[n].bgb = lbl.backbr
      pnl.buf[n].fg  = lbl.foregr
      pnl.buf[n].fgb = lbl.forebr
      pnl.buf[n].style = lbl.style
      pnl.buf[n].on = true
    else :
      pnl.buf[n].ch = " ".runeAt(0)
      pnl.buf[n].bg  = pnl.backgr
      pnl.buf[n].bgb = pnl.backbr
      pnl.buf[n].fg  = pnl.foregr
      pnl.buf[n].fgb = pnl.forebr
      pnl.buf[n].style =  pnl.style
      pnl.buf[n].on = false
    inc(n)





## Define Field String Standard
proc fldString*(fld : var FIELD ; name:string ; posx:Natural; posy:Natural; reftyp: Natural;
              with: Natural;field: string; empty: bool;
              errmsg: string   ; help: string;
              regex: string = "";
              fld_atr : ZONATRB = fldatr ;prt_atr : ZONATRB = prtatr ;
              actif: bool = true) =

  fld.name        = name
  fld.posx        = posx
  fld.posy        = posy
  fld.reftyp      = reftyp      ## / ALPHA...SWITCH
  fld.with        = with
  fld.scal        = 0
  fld.nbrcar      = with
  fld.field       = field
  fld.empty       = empty
  fld.protect     = false       ## / only display
  fld.pading      = true        ## / pading blank
  fld.edtcar      = ""          ## / edtcar for monnaie		€ $ ¥ ₪ £ or %
  fld.regex       = regex       ## / contrôle regex
  fld.errmsg      = errmsg      ## / message this field
  fld.help        = help        ## / help this field
  fld.switch      = false       ## / CTRUE CFALSE
  fld.actif       = actif       ## / zone active True


  fld.style  = fld_atr.style
  fld.backgr = fld_atr.backgr
  fld.backbr = fld_atr.backbr
  fld.foregr = fld_atr.foregr
  fld.forebr = fld_atr.forebr

  fld.pstyle  = prt_atr.style
  fld.pbackgr = prt_atr.backgr
  fld.pbackbr = prt_atr.backbr
  fld.pforegr = prt_atr.foregr
  fld.pforebr = prt_atr.forebr





## Define Field Mail
proc fldMail*(fld : var FIELD ; name:string ; posx:Natural; posy:Natural; reftyp: Natural;
              with: Natural;field: string; empty: bool;
              errmsg: string   ; help: string;
              fld_atr : ZONATRB = fldatr ;prt_atr : ZONATRB = prtatr ;
              actif: bool = true) =

  fld.name        = name
  fld.posx        = posx
  fld.posy        = posy
  fld.reftyp      = reftyp     ## / ALPHA...SWITCH
  fld.with        = with
  fld.scal        = 0
  fld.nbrcar      = with
  fld.field       = field
  fld.empty       = empty
  fld.protect     = false       ## / only display
  fld.pading      = true        ## / pading blank
  fld.edtcar      = ""          ## / edtcar for monnaie		€ $ ¥ ₪ £ or %

  fld.regex       ="""(?:[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"""
  ## / contrôle regex  [ABNF] [RFC 2822]
  fld.errmsg      = errmsg      ## / message this field
  fld.help        = help        ## / help this field
  fld.switch      = false       ## / CTRUE CFALSE
  fld.actif       = actif       ## / zone active True


  fld.style  = fld_atr.style
  fld.backgr = fld_atr.backgr
  fld.backbr = fld_atr.backbr
  fld.foregr = fld_atr.foregr
  fld.forebr = fld_atr.forebr

  fld.pstyle  = prt_atr.style
  fld.pbackgr = prt_atr.backgr
  fld.pbackbr = prt_atr.backbr
  fld.pforegr = prt_atr.foregr
  fld.pforebr = prt_atr.forebr





## Define Field switch
proc fldSwitch*(fld : var FIELD ; name:string ; posx:Natural; posy:Natural; reftyp: Natural;
              switch: bool;  empty: bool;
              errmsg: string ; help: string;
              swt_atr : ZONATRB = swtatr ;prt_atr : ZONATRB = prtatr ;
              actif: bool = true) =
  fld.name        = name
  fld.posx        = posx
  fld.posy        = posy
  fld.reftyp      = reftyp      ## / ALPHA...SWITCH
  fld.with        = 1
  fld.scal        = 0
  fld.nbrcar      = 1
  fld.field       = ""
  fld.empty       = empty
  fld.protect     = false       ## / only display
  fld.pading      = false       ## / pading blank
  fld.edtcar      = ""          ## / edtcar for monnaie		€ $ ¥ ₪ £ or %
  fld.regex       = ""          ## / contrôle regex
  fld.errmsg      = errmsg      ## / message this field
  fld.help        = help        ## / help this field
  fld.switch      = switch      ## / CTRUE CFALSE
  fld.actif       = actif       ## / zone active True


  fld.style  = swt_atr.style
  fld.backgr = swt_atr.backgr
  fld.backbr = swt_atr.backbr
  fld.foregr = swt_atr.foregr
  fld.forebr = swt_atr.forebr

  fld.pstyle  = prt_atr.style
  fld.pbackgr = prt_atr.backgr
  fld.pbackbr = prt_atr.backbr
  fld.pforegr = prt_atr.foregr
  fld.pforebr = prt_atr.forebr





## Define Field date ISO
proc fldDate*(fld : var FIELD ; name:string ; posx:Natural; posy:Natural; reftyp: Natural;
              field: string; empty: bool;
              errmsg: string   ; help: string;
              fld_atr : ZONATRB = fldatr ; prt_atr : ZONATRB = prtatr ;
              actif: bool = true) =

  fld.name        = name
  fld.posx        = posx
  fld.posy        = posy
  fld.reftyp      = reftyp      ## / ALPHA...SWITCH
  fld.with        = 10
  fld.scal        = 0
  fld.nbrcar      = 10
  fld.field       = field
  fld.empty       = empty
  fld.protect     = false       ## / only display
  fld.pading      = false       ## / pading blank
  fld.edtcar      = ""          ## / edtcar for monnaie		€ $ ¥ ₪ £ or %
  if reftyp == DATE_ISO:
    fld.regex       = """^(?:(?:(?:(?:(?:[1-9]\d)(?:0[48]|[2468][048]|[13579][26])|(?:(?:[2468][048]|[13579][26])00))(|-|)(?:0?2\1(?:29)))|(?:(?:[1-9]\d{3})(|-|)(?:(?:(?:0?[13578]|1[02])\2(?:31))|(?:(?:0?[13-9]|1[0-2])\2(?:29|30))|(?:(?:0?[1-9])|(?:1[0-2]))\2(?:0?[1-9]|1\d|2[0-8])))))$""" ## / contrôle regex  YYYY-MM-DD

  if reftyp == DATE_US:
    fld.regex       ="""^(((0[13-9]|1[012])[/]?(0[1-9]|[12][0-9]|30)|(0[13578]|1[02])[/]?31|02[/]?(0[1-9]|1[0-9]|2[0-8]))[/]?[0-9]{4}|
    02[/]?29[/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"""

  if reftyp == DATE_FR:
    fld.regex       ="""^(((0[1-9]|[12][0-9]|30)[/]?(0[13-9]|1[012])|31[/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[/]?02)[/]?[0-9]{4}|
    29[/]?02[/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"""


  fld.errmsg      = errmsg      ## / message this field
  fld.help        = help        ## / help this field
  fld.switch      = false      ## / CTRUE CFALSE
  fld.actif       = actif       ## / zone active True

  fld.style  = fld_atr.style
  fld.backgr = fld_atr.backgr
  fld.backbr = fld_atr.backbr
  fld.foregr = fld_atr.foregr
  fld.forebr = fld_atr.forebr

  fld.pstyle  = prt_atr.style
  fld.pbackgr = prt_atr.backgr
  fld.pbackbr = prt_atr.backbr
  fld.pforegr = prt_atr.foregr
  fld.pforebr = prt_atr.forebr





## Define Field Numeric
proc fldNumeric*(fld : var FIELD ; name:string ; posx:Natural; posy:Natural; reftyp: Natural;
              with: Natural;  scal: Natural;  field: string; empty:bool;
              errmsg: string   ; help: string;
              fld_atr : ZONATRB = fldatr ;prt_atr : ZONATRB = prtatr ;
              actif: bool = true) =

  fld.name        = name
  fld.posx        = posx
  fld.posy        = posy
  fld.reftyp      = reftyp      ## / ALPHA...SWITCH
  fld.with        = with
  fld.scal        = scal
  fld.nbrcar      = with + scal 
  if scal > 0 : inc(fld.nbrcar)
  fld.field       = field
  fld.empty       = empty
  fld.protect     = false       ## / only display
  fld.pading      = true        ## / pading blank
  fld.edtcar      = ""          ## / edtcar for monnaie		€ $ ¥ ₪ £ or %
  fld.regex       = ""          ## / contrôle 

  if fld.reftyp == DIGIT:
    fld.regex = "^[0-9]{1,$1}$" % [fmt"{with}"]
  elif fld.reftyp == DIGIT_SIGNED:
    inc(fld.nbrcar)
    fld.regex = "^[+-]?[0-9]{1,$1}$" % [fmt"{with}"]


  if fld.reftyp == DECIMAL: 
    if (scal == 0 ) :
        fld.regex = "^[0-9]{1,$1}$" % [fmt"{with}"]
    else :
        fld.regex = "^[0-9]{1,$1}[.]([0-9]{$2,$2})$" % [fmt"{with}",fmt"{scal}",fmt"{scal}"]
  elif fld.reftyp == DECIMAL_SIGNED:
    inc(fld.nbrcar) 
    if (scal == 0 ) :
        fld.regex = "^[+-]?[0-9]{1,$1}$" % [fmt"{with}"]
    else :
        fld.regex = "^[+-]?[0-9]{1,$1}[.]([0-9]{$2,$2})$" % [fmt"{with}",fmt"{scal}",fmt"{scal}"]

  fld.errmsg      = errmsg      ## / message this field
  fld.help        = help        ## / help this field
  fld.switch      = false       ## / CTRUE CFALSE
  fld.actif       = actif       ## / zone active True


  fld.style  = fld_atr.style
  fld.backgr = fld_atr.backgr
  fld.backbr = fld_atr.backbr
  fld.foregr = fld_atr.foregr
  fld.forebr = fld_atr.forebr

  fld.pstyle  = prt_atr.style
  fld.pbackgr = prt_atr.backgr
  fld.pbackbr = prt_atr.backbr
  fld.pforegr = prt_atr.foregr
  fld.pforebr = prt_atr.forebr





# Hiden bloc out
proc hdnString*(hdn : var HIDEN ; name:string ; reftyp: Natural;field: string;) =
  hdn.name        = name
  hdn.reftyp      = reftyp      ## / ALPHA...SWITCH
  hdn.field       = field
  hdn.switch      = false       ## / CTRUE CFALSE
#switch
proc hdnSwitch*(hdn : var HIDEN  ; name:string; reftyp: Natural;  switch: bool;) =
  hdn.name        = name
  hdn.reftyp      = reftyp      ## / ALPHA...SWITCH
  hdn.field       = ""
  hdn.switch      = switch       ## / CTRUE CFALSE





## assigne FIELD to matrice for display
proc printField*(pnl: var PANEL, fld : Field) =
  var i: Natural = 0

  var e_FIELD : string = fld.field

  if fld.reftyp == PASSWORD:
    i = 0
    e_FIELD = ""
    while i < runeLen(fld.field):
        e_FIELD = e_FIELD & fmt"*"
        inc(i)

  if fld.reftyp == DIGIT_SIGNED or fld.reftyp == DECIMAL_SIGNED:
    if isDigit(char(fld.field[0])):
      e_FIELD = fmt"+{fld.field}"
  
  if  fld.pading and fld.reftyp == DIGIT or
      fld.pading and fld.reftyp == DIGIT_SIGNED or
      fld.pading and fld.reftyp == DECIMAL or
      fld.pading and fld.reftyp == DECIMAL_SIGNED:
        e_FIELD = align(e_FIELD,fld.nbrcar)
  elif fld.pading :   e_FIELD = alignString(e_FIELD,fld.nbrcar)


  if fld.reftyp == SWITCH:
    if fld.switch == true:
      e_FIELD = "◉"
    else:
      e_FIELD = "◎"

  if fld.edtcar != "":
    e_FIELD = fmt"{e_FIELD}{fld.edtcar}"

  var npos = pnl.cols * fld.posx
  var n =  npos + fld.posy
  for ch in runes(e_FIELD):
    if fld.actif == true : 
      pnl.buf[n].ch = ch
      if fld.protect :
        pnl.buf[n].bg  = fld.pbackgr
        pnl.buf[n].bgb = fld.pbackbr
        pnl.buf[n].fg  = fld.pforegr
        pnl.buf[n].fgb = fld.pforebr
        pnl.buf[n].style =  fld.pstyle
      else:
        pnl.buf[n].bg  = fld.backgr
        pnl.buf[n].bgb = fld.backbr
        pnl.buf[n].fg  = fld.foregr
        pnl.buf[n].fgb = fld.forebr
        pnl.buf[n].style =  fld.style
      pnl.buf[n].on = true
    else :
        pnl.buf[n].ch = " ".runeAt(0)
        pnl.buf[n].bg  = pnl.backgr
        pnl.buf[n].bgb = pnl.backbr
        pnl.buf[n].fg  = pnl.foregr
        pnl.buf[n].fgb = pnl.forebr
        pnl.buf[n].style =  pnl.style
        pnl.buf[n].on = false
    inc(n)





## assigne BUTTON matrice for display
proc printButton*(pnl: var PANEL; btn_esp : BTNSPACE = btnspc )  =
  var x,y :Natural
  if pnl.cadre == CADRE.line0 :
    x = Lines(pnl)
    y = 1
  else:
    x = Lines(pnl) - int(1)
    y = 2

  var npos = pnl.cols * x
  var s : string
  var n =  npos + y

  for i,btn in pnl.button:
    s = $btn.key
    if btn.actif :
      for ch in runes(s):
        pnl.buf[n].ch = ch
        pnl.buf[n].bg  = btnatr.backgr
        pnl.buf[n].bgb = btnatr.backbr
        pnl.buf[n].fg  = btnatr.foregr
        pnl.buf[n].fgb = btnatr.forebr
        pnl.buf[n].style = btnatr.style
        pnl.buf[n].on = true
        inc(n)
      n += 1
      for ch in runes(btn.label):
        pnl.buf[n].ch = ch
        pnl.buf[n].bg  = btnatr.title_backgr
        pnl.buf[n].bgb = btnatr.title_backbr
        pnl.buf[n].fg  = btnatr.title_foregr
        pnl.buf[n].fgb = btnatr.title_forebr
        pnl.buf[n].style = btnatr.title_style
        pnl.buf[n].on = true
        inc(n)
    else :
      for ch in runes(s):
        pnl.buf[n].ch = " ".runeAt(0)
        pnl.buf[n].bg  = pnl.backgr
        pnl.buf[n].bgb = pnl.backbr
        pnl.buf[n].fg  = pnl.foregr
        pnl.buf[n].fgb = pnl.forebr
        pnl.buf[n].style =  pnl.style
        pnl.buf[n].on = false
        inc(n)
      n += 1
      for ch in runes(btn.label):
        pnl.buf[n].ch = " ".runeAt(0)
        pnl.buf[n].bg  = pnl.backgr
        pnl.buf[n].bgb = pnl.backbr
        pnl.buf[n].fg  = pnl.foregr
        pnl.buf[n].fgb = pnl.forebr
        pnl.buf[n].style =  pnl.style
        pnl.buf[n].on = false
        inc(n)
      
    n += btn_esp.space





## Define PANEL
proc defPanel*(pnl: var PANEL;name:string;posx,posy,height,width,:Natural;
              backgr: BackgroundColor; backbr: bool; foregr: ForegroundColor; forebr: bool ;cadre:CADRE; title:string;
              nbrbox,nbrlabel,nbrfield,nbrhiden:Natural; button: seq[(BUTTON)]; actif: bool = true) =
  
  pnl.name  = name
  pnl.posx  = posx
  pnl.posy  = posy
  pnl.lines  = height
  pnl.cols  = width
  pnl.backgr  = backgr
  pnl.backbr  = backbr
  pnl.foregr  = foregr
  pnl.forebr  = forebr
  pnl.style   ={styleDim}

  pnl.cadre   = cadre
  pnl.boxpnl  = newseq[BOX](1)
  if pnl.cadre == CADRE.line1 or pnl.cadre == CADRE.line2 :
    fldBox(pnl.boxpnl[0], name, 1 , 1 ,pnl.lines, pnl.cols, cadre, title)


  pnl.nbrbox   = nbrbox
  pnl.nbrlabel = nbrlabel
  pnl.nbrfield = nbrfield
  pnl.nbrhiden = nbrhiden
  pnl.box  = newseq[BOX](nbrbox)
  pnl.label  = newseq[LABEL](nbrlabel)
  pnl.field  = newseq[FIELD](nbrfield)
  pnl.hiden  = newseq[HIDEN](nbrhiden)
  pnl.index = 0
  pnl.button  = newseq[BUTTON](len(button))
  pnl.button   = button
  pnl.funckey = newseq[Key](len(button))

  for i,btn in pnl.button :
    pnl.funckey[i] = btn.key

  pnl.mouse = false
  pnl.buf = newSeq[TerminalChar]((pnl.lines+1)*(pnl.cols+1))

  pnl.actif = actif





## display matrice PANEL
proc displayPanel*(pnl: PANEL) =
  if not pnl.actif : return
  var npos :int =0
  for x in 1..pnl.lines:
    npos = pnl.cols * x
    for y in 1..pnl.cols:
      inc(npos)
      gotoXY(x + pnl.posx - 1 , y + pnl.posy - 1)
      if pnl.buf[npos].on :
        setBackgroundColor(pnl.buf[npos].bg,pnl.buf[npos].bgb)
        setForegroundColor(pnl.buf[npos].fg,pnl.buf[npos].fgb)
        writeStyled($pnl.buf[npos].ch,pnl.buf[npos].style)
      else :
        setBackgroundColor(pnl.backgr,pnl.backbr)
        setForegroundColor(pnl.foregr,pnl.forebr)
        writeStyled(" ",pnl.style)
  stdout.flushFile()





## assigne PANEL and all OBJECT to matrice for display
proc printPanel*(pnl: var PANEL)=
  if pnl.cadre == CADRE.line1 or pnl.cadre == CADRE.line2 :
    printBox(pnl,pnl.boxpnl[0])

  for i in 0..len(pnl.box)-1:
    if pnl.box[i].actif    : printBox(pnl,pnl.box[i])

  for i in 0..len(pnl.label)-1:
    if pnl.label[i].actif : printLabel(pnl,pnl.label[i])

  for i in 0..len(pnl.field)-1:
    if pnl.field[i].actif : printField(pnl,pnl.field[i])

  printButton(pnl)
  displayPanel(pnl)





## vide object PANEL / box/label/fld/func
proc clearPanel*(pnl: var PANEL)=
  pnl.nbrbox   = 0
  pnl.nbrlabel = 0
  pnl.nbrfield = 0
  pnl.box    = newseq[BOX](0)
  pnl.label  = newseq[LABEL](0)
  pnl.field  = newseq[FIELD](0)
  pnl.hiden  = newseq[HIDEN](0)
  pnl.index  = 0
  pnl.button= newseq[BUTTON](0)
  pnl.funckey = newseq[Key](0)
  pnl.buf = newSeq[TerminalChar](0)
  pnl.actif = false





## vide object MENU
proc clearPanel*(mnu: var MENU)=
  mnu.selMenu  = 0
  mnu.item = newseq[string](0)
  mnu.actif = false





## 
proc clsLabel*(pnl: var PANEL, lbl : Label) =
  var npos = pnl.cols * lbl.posx
  var n =  npos + lbl.posy
  for i in 0..<runeLen(lbl.label):
    pnl.buf[n].ch = " ".runeAt(0)
    pnl.buf[n].bg  = pnl.backgr
    pnl.buf[n].bgb = pnl.backbr
    pnl.buf[n].fg  = pnl.foregr
    pnl.buf[n].fgb = pnl.forebr
    pnl.buf[n].style =  pnl.style
    pnl.buf[n].on = false
    inc(n)





proc clsField*(pnl: var PANEL, fld : Field) =
  var npos = pnl.cols * fld.posx
  var n =  npos + fld.posy
  for i in 0..<fld.nbrcar:
    pnl.buf[n].ch = " ".runeAt(0)
    pnl.buf[n].bg  = pnl.backgr
    pnl.buf[n].bgb = pnl.backbr
    pnl.buf[n].fg  = pnl.foregr
    pnl.buf[n].fgb = pnl.forebr
    pnl.buf[n].style =  pnl.style
    pnl.buf[n].on = false
    inc(n)





proc clsPanel*(pnl: var PANEL) =
  for x in 1..pnl.lines:
    for y in 1..pnl.cols:
      gotoXY(x + pnl.posx - 1 , y + pnl.posy - 1)
      setBackgroundColor(pnl.backgr,pnl.backbr)
      setForegroundColor(pnl.foregr,pnl.forebr)
      writeStyled(" ",pnl.style)






# display matrice only FIELD
proc displayLabel*(pnl: var PANEL; lbl: Label) =
  if not pnl.actif : 
    return
  if not lbl.actif : 
    clsLabel(pnl, lbl)
  else : printLabel(pnl , lbl)
  var npos :int = pnl.cols * lbl.posx
  var n =  npos + lbl.posy
  for y in 0..<runeLen(lbl.label):
    gotoXY(lbl.posx + pnl.posx - 1 , y + pnl.posy + lbl.posy - 1)
    if pnl.buf[n].on :
      setBackgroundColor(pnl.buf[n].bg,pnl.buf[npos].bgb)
      setForegroundColor(pnl.buf[n].fg,pnl.buf[npos].fgb)
      writeStyled($pnl.buf[n].ch,pnl.buf[npos].style)
    else :
      setBackgroundColor(pnl.backgr,pnl.backbr)
      setForegroundColor(pnl.foregr,pnl.forebr)
      writeStyled(" ",pnl.style)
    inc(n)
  stdout.flushFile()





# display matrice only FIELD
proc displayField*(pnl: var  PANEL; fld: FIELD) =
  if not pnl.actif : return
  if not fld.actif : clsField(pnl, fld)
  else : printField(pnl,fld)

  var npos :int = pnl.cols * fld.posx
  var n =  npos + fld.posy
  for y in 0..<fld.nbrcar:
    gotoXY(fld.posx + pnl.posx - 1 , y + pnl.posy + fld.posy - 1)
    if pnl.buf[n].on :
        setBackgroundColor(pnl.buf[n].bg,pnl.buf[npos].bgb)
        setForegroundColor(pnl.buf[n].fg,pnl.buf[npos].fgb)
        writeStyled($pnl.buf[n].ch,pnl.buf[npos].style)
    else :
      setBackgroundColor(pnl.backgr,pnl.backbr)
      setForegroundColor(pnl.foregr,pnl.forebr)
      writeStyled(" ",pnl.style)
    inc(n)
  stdout.flushFile()





# display matrice only FIELD
proc displayButton*(pnl: var PANEL;) =
  if not pnl.actif : return

  printButton(pnl)
  var x,y :Natural
  if pnl.cadre == CADRE.line0 :
    x = Lines(pnl)
    y = 1
  else:
    x = Lines(pnl) - int(1)
    y = 2

  var npos = pnl.cols * x

  var n =  npos + y
  for y in 0..<pnl.cols:
    gotoXY(x + pnl.posx - 1 , y + pnl.posy  - 1)
    if pnl.buf[n].on :
      setBackgroundColor(pnl.buf[n].bg,pnl.buf[npos].bgb)
      setForegroundColor(pnl.buf[n].fg,pnl.buf[npos].fgb)
      writeStyled($pnl.buf[n].ch,pnl.buf[npos].style)
    else :
      setBackgroundColor(pnl.backgr,pnl.backbr)
      setForegroundColor(pnl.foregr,pnl.forebr)
      writeStyled(" ",pnl.style)
    inc(n)
  stdout.flushFile()





# restore the base occupied by pnl
proc restorePanel*(dst: PANEL; src:var PANEL) =
  if not dst.actif : return

  if src.posx <= dst.posx  and  src.posy >= dst.posy:
    clsPanel(src)
    displayPanel(dst)
    return

  var npos :int =0
  var n = src.posx - dst.posx

  for x in 0..src.lines:
    npos = dst.cols * n + src.posy - dst.posy
    for y in 0..src.cols:
      inc(npos)
      gotoXY(x + src.posx - 1, y  + src.posy )
      if dst.buf[npos].on :
        setBackgroundColor(dst.buf[npos].bg,dst.buf[npos].bgb)
        setForegroundColor(dst.buf[npos].fg,dst.buf[npos].fgb)
        writeStyled($dst.buf[npos].ch,dst.buf[npos].style)
      else :
        setBackgroundColor(dst.backgr,dst.backbr)
        setForegroundColor(dst.foregr,dst.forebr)
        writeStyled(" ",dst.style)
    inc(n)
  stdout.flushFile()





# restore the base occupied by mnu
proc restorePanel*(dst: PANEL; mnu: MENU) =
  if not dst.actif : return
  var npos :int =0
  var n = mnu.posx
  #if mnu.mnuvh == MNUVH.vertical:
  for x in 0..mnu.lines:
    npos = dst.cols * n + mnu.posy - 1
    for y in 0..mnu.cols:
      inc(npos)
      gotoXY(x + mnu.posx + dst.posx - 1 , y + mnu.posy + dst.posy - 1 )
      if dst.buf[npos].on :
        setBackgroundColor(dst.buf[npos].bg,dst.buf[npos].bgb)
        setForegroundColor(dst.buf[npos].fg,dst.buf[npos].fgb)
        writeStyled($dst.buf[npos].ch,dst.buf[npos].style)
      else :
        setBackgroundColor(dst.backgr,dst.backbr)
        setForegroundColor(dst.foregr,dst.forebr)
        writeStyled(" ",dst.style)
    inc(n)
    stdout.flushFile()





# restore the lines occupied by the error message
proc restorePanel*(pnl: PANEL; lines, posy : Natural) =
  if not pnl.actif : return
  var npos :int =0
  var x = lines
  npos = (pnl.cols * x)
  for y in 1..pnl.cols:
    inc(npos)
    gotoXY(x + pnl.posx - 1 , y + pnl.posy  - 1)
    if pnl.buf[npos].on  :
      setBackgroundColor(pnl.buf[npos].bg,pnl.buf[npos].bgb)
      setForegroundColor(pnl.buf[npos].fg,pnl.buf[npos].fgb)
      writeStyled($pnl.buf[npos].ch,pnl.buf[npos].style)
    else :
      setBackgroundColor(pnl.backgr,pnl.backbr)
      setForegroundColor(pnl.foregr,pnl.forebr)
      writeStyled(" ",pnl.style)
  stdout.flushFile()





##  get lines/COLS PANEL
func Lines*(pnl: PANEL) :Natural =
  result = pnl.lines
func Cols*(pnl: PANEL) :Natural =
  result = pnl.cols

## return index actived from panel this getField
func Index*(pnl: PANEL): Natural =
  result = pnl.index

## return name from index actived from panel this getField
func fldName*(pnl: PANEL): string =
  result = pnl.field[pnl.index].name

## return index Sequence Field
func fldIndex*(pnl: PANEL; name: string): int  =
  for i in 0..len(pnl.field)-1:
    if pnl.field[i].name == name : return i
  return - 1

## return value Field Sequence Field
func fldString*(pnl: PANEL; name: string): string  =
  for i in 0..len(pnl.field)-1 :
    if pnl.field[i].name == name : return pnl.field[i].field
  return "NAN"
## return value Field Sequence Field
func fldString*(pnl: PANEL; index: Natural): string  =
  if index < 0 or index > len(pnl.field)-1 : return "NAN"
  return pnl.field[index].field                             # use enum Use enum attach array look ex
## return value Field Sequence Field
func fldSwitch*(pnl : PANEL ; index: Natural): int  =
  if index < 0 or index > len(pnl.field)-1 : return -1
  if pnl.field[index].switch : return 1
  else : 
    return 0                                                # Warning possibility out of sequence

## return name from index actived from panel this getField
func hdnName*(hdn: PANEL,index: Natural): string =
  result = hdn.hiden[index].name

## return index Sequence Field
func hdnIndex*(hdn : PANEL; name: string): int  =
  for i in 0..len(hdn.hiden)-1:
    if hdn.hiden[i].name == name : return i
  return - 1

## return value Field Sequence Field
func hdnString*(hdn : PANEL ; name: string): string  =
  for i in 0..len(hdn.hiden)-1 :
    if hdn.hiden[i].name == name : return hdn.hiden[i].field
  return "NAN"
## return value Field Sequence Field
func hdnString*(hdn : PANEL ; index: Natural): string  =
  if index < 0 or index > len(hdn.hiden)-1 : return "NAN"
  return hdn.hiden[index].field                             # use enum Use enum attach array look ex
## return value Field Sequence Field
func hdnSwitch*(hdn : PANEL ; index: Natural): int  =
  if index < 0 or index > len(hdn.hiden)-1 : return -1
  if hdn.hiden[index].switch : return 1
  else : 
    return 0                                                # Warning possibility out of sequence



##  set on  = display ONLY
proc setProtect*(fld : var FIELD ; protect : bool)=
    fld.protect = protect

## Enables or disables FIELD / LABEL / BOX / MENU / PANEL
proc setActif*(fld : var FIELD ; actif : bool)=
    fld.actif = actif
proc setActif*(lbl : var LABEL ; actif : bool)=
    lbl.actif = actif
proc setActif*(box: var BOX ; actif : bool)=
    box.actif = actif
proc setActif*(mnu: var MENU ; actif : bool)=
    mnu.actif = actif
proc setActif*(btn: var BUTTON; actif : bool)=
    btn.actif = actif
proc setActif*(pnl: var PANEL ; actif : bool)=
    pnl.actif = actif
proc setMouse*(pnl: var PANEL ; actif : bool)=
    pnl.actif = actif



## Test if KEYs must be managed by the programmer
proc isPanelKey*(pnl: PANEL; e_key:Key): bool =
  var i = 0
  var ok :bool = false
  while i < len(pnl.funckey):
    if e_key == pnl.funckey[i] : ok = true
    inc(i)
  return ok
##  if on/off  FIELD / LABEL / BOX / MENU / PANEL
func isProtect*(fld : var FIELD): bool=
    return fld.protect 
func isActif*(fld : var FIELD): bool=
    return fld.actif 
func isActif*(lbl : var LABEL ): bool=
    return lbl.actif 
func isActif*(box : var BOX): bool=
    return box.actif
func isActif*(mnu : var MENU): bool=
    return mnu.actif
func isActif*(btn : var BUTTON): bool=
    return btn.actif
func isActif*(pnl : var PANEL): bool=
    return pnl.actif
func isMouse*(pnl : var PANEL): bool=
    return pnl.mouse





##================================================================
## traiement des menus enter = select  1..n 0 = abort (Escape)
## Turning on the mouse
## movement with the wheel and validation with the clik
##================================================================
proc ioMenu*(pnl: PANEL; mnu:MENU; npos: Natural) : MENU.selMenu =
  var pos : Natural = npos
  var n , h   : Natural 
  OnMouse()
  hideCursor()
  stdout.flushFile()
  if pos > len(mnu.item) or pos < 0 : pos = 0

  while true:
    n = 0
    h = 0
    for cell in  mnu.item :
      
      if mnu.mnuvh == MNUVH.vertical :
        if mnu.cadre == CADRE.line0 :
          gotoXY(mnu.posx + pnl.posx  + n - 1 , mnu.posy + pnl.posy - 1)
        else : 
          gotoXY(mnu.posx + pnl.posx  + n, mnu.posy + pnl.posy)
        
      if mnu.mnuvh == MNUVH.horizontal :
        if mnu.cadre == CADRE.line0 :
          gotoXY(mnu.posx + pnl.posx  - 1 , h  + mnu.posy + pnl.posy - 1)
        else : 
          gotoXY(mnu.posx + pnl.posx  , h +  mnu.posy + pnl.posy )

      setBackgroundColor(mnu.backgr,mnu.backbr)
      setForegroundColor(mnu.foregr,mnu.forebr)
      if pos == n :
        writeStyled(cell,mnu.styleCell)  
      else :
        writeStyled(cell,mnu.style)
      inc(n)
      h += runeLen(cell)
    stdout.flushFile()
    var key  = getFunc()

    if key == Key.Mouse :
      let mnuMouse = getMouse()
      if mnuMouse.scroll and mnuMouse.scrollDir == ScrollDirection.sdUp   :
        if mnu.mnuvh == MNUVH.vertical :    key = Key.Up
        if mnu.mnuvh == MNUVH.horizontal :  key = Key.Left
      if mnuMouse.scroll and mnuMouse.scrollDir == ScrollDirection.sdDown :
        if mnu.mnuvh == MNUVH.vertical :    key = Key.Down
        if mnu.mnuvh == MNUVH.horizontal :  key = Key.Right
      if mnuMouse.action == MouseButtonAction.mbaReleased : key = Key.Enter
    case key

      of Key.Escape:
        result = 0
        if not pnl.mouse : OffMouse()
        break 
      of Key.Enter:
        result = pos + 1
        if not pnl.mouse : OffMouse()
        break
      of Key.Down:
        if pos < (len(mnu.item) - 1) : inc(pos)
      of Key.Up:
        if pos > 0 : dec(pos)
      of Key.Right:
        if pos < (len(mnu.item) - 1) : inc(pos)
      of Key.Left:
        if pos > 0 : dec(pos)
      else: discard





##======================================================
## Input buffer management modeled on 5250/3270
## inspiration ncurse 
## application hold principe and new langage
## use termkey.nim
##======================================================
proc ioField*(pnl : PANEL ; fld : var FIELD) : (Key )=

  if fld.protect : return Key.Enter

  var e_key:Key

  var e_posx :Natural = pnl.posx + fld.posx - 1
  var e_posy :Natural = pnl.posy + fld.posy - 1
  var e_curs :Natural = e_posy
  
  var e_FIELD = toRunes(fld.field)
  var e_switch = fld.switch
  let e_reftyp = fld.reftyp
  let e_nbrcar:int  = fld.nbrcar
  var e_count :int  = 0
  var e_str   :string
  var statusCursInsert : bool = false


  #format the area
  for i in 0 .. e_nbrcar - len(e_FIELD) - 1  :
    e_FIELD.add(" ".runeAt(0))

  #prepare the switch edition
  if fld.reftyp == SWITCH:
    if e_switch == true:
      e_FIELD[e_count] = "◉".runeAt(0)
    else:
      e_FIELD[e_count] = "◎".runeAt(0)


  func isNumber(s: string): bool =
    case s
      of "1","2","3","4","5","6","7","8","9","0":
        result = true
      else : result = false

  func isPunct(s: string): bool =
    case s
      of ".",":",",","!","?","'","-","(",")","<",">":                   # not ";" etc reserved communication commercial ex csv
        result = true
      else : result = false

  func isCarPwd(s: string): bool =
    case s
      of  "~","!","?","@","#","$","£","€","%","^","&","*",
          "-","+","=","(",")","{","}","[","]","<",">":      # specifique password
        result = true
      else : result = false

  func isEmpty(s:seq[Rune]): bool =
    var i = 0
    var ok :bool = true
    while i < len(s):
        if s[i] != " ".runeAt(0) : ok = false
        inc(i)
    return ok

  func nbrRune(s:seq[Rune]): Natural =
    var i : Natural = len(s)-1
    while i >= 0:
        if s[i] != " ".runeAt(0) : return i   # last not blank
        dec(i)
    result = 0

  func isFuncKey(e_key:Key): bool =
    var i = 0
    var ok :bool = false
    while i < len(pnl.funckey):
      if e_key == pnl.funckey[i] : ok = true
      inc(i)
    return ok


  proc insert() =
    if e_count < e_nbrcar :
      var i: Natural = e_count
      var s_FIELD = e_FIELD
      while i < e_nbrcar - 1:
        e_FIELD[i + 1 ] = s_FIELD[i]
        inc(i)


  proc delete() =
    if e_count < e_nbrcar :
      var i: int = e_count
      var s_FIELD = e_FIELD
      while i < e_nbrcar - 1:
        e_FIELD[i] = s_FIELD[i + 1]
        inc(i)
      e_FIELD[e_nbrcar - 1] = " ".runeAt(0)

  ## tranform letter to *
  proc password(s:seq[Rune]): string =
    var i = 0
    var buf : string = ""
    while i < len(s):
        if s[i] != " ".runeAt(0): buf = buf & fmt"*"
        else : buf = buf & " "
        inc(i)
    return buf

  ##================================================================
  ## Definition of the panel (window) on a lines
  ## Message display
  ## to exit press the Escape key
  ## restoration of the original panel lines
  ##================================================================

  proc msgErr(pnl: PANEL ; info:string) =
    setBackgroundColor(msgatr.backgr,msgatr.backbr)
    setForegroundColor(msgatr.foregr,msgatr.forebr)
    gotoXY(e_posx,e_posy)
    if e_reftyp == PASSWORD: 
      writeStyled(password(e_FIELD),{styleUnderscore})
    else : writeStyled($e_FIELD,{styleUnderscore})


    var pnlmsg  = new(PANEL)
    var button: BUTTON 
    button.key   = Key.None
    button.label  = ""
    defPanel(pnlmsg,"msg",pnl.lines + pnl.posx - 1 ,pnl.posy,1,pnl.cols,pnl.backgr,pnl.backbr,pnl.foregr,pnl.forebr,CADRE.line0,"",0,1,0,0,@[button])

    fldLabel(pnlmsg.label[0], "msg", 1, 1,fmt"Info :{info}", msgatr)
    printLabel(pnlmsg,pnlmsg.label[0])
    displayPanel(pnlmsg)

    while true:
      e_key = getFunc()
      case e_key
        of Key.Escape:
          break
        else :discard
    restorePanel(pnl,pnl.lines,pnl.posy)



  ## display message Help
  proc msgHelp(pnl: PANEL ; info:string) =
    setBackgroundColor(hlpatr.backgr,hlpatr.backbr)
    setForegroundColor(hlpatr.foregr,hlpatr.forebr)
    gotoXY(e_posx,e_posy)
    if e_reftyp == PASSWORD: 
      writeStyled(password(e_FIELD),{styleUnderscore})
    else : writeStyled($e_FIELD,{styleUnderscore})

    var pnlmsg  = new(PANEL)
    var button: BUTTON 
    button.key   = Key.None
    button.label  = ""
    defPanel(pnlmsg,"msg",pnl.lines + pnl.posx - 1 ,pnl.posy,1,pnl.cols,pnl.backgr,pnl.backbr,pnl.foregr,pnl.forebr,CADRE.line0,"",0,1,0,0,@[button])

    fldLabel(pnlmsg.label[0], "msg", 1, 1,fmt"Info :{info}", hlpatr)
    printLabel(pnlmsg,pnlmsg.label[0])
    displayPanel(pnlmsg)

    while true:
      e_key = getFunc()
      case e_key
        of Key.Escape:
          break
        else :discard
    restorePanel(pnl,pnl.lines,pnl.posy)


  ##--------------------------------------------------
  ## field buffer management
  ##--------------------------------------------------
  while true :
    # debug
    #gotoXY(40,1)
    #echo fmt"                                                                                                         "
    #gotoXY(40,1)
    #echo fmt"{e_curs}, count {e_count} posx {e_posx}  posy {e_posy} nbrCar {e_nbrcar} {e_str} {e_FIELD} {len(e_FIELD)}    {fld.field.runeLen()}"

    setBackgroundColor(fld.backgr,fld.backbr)
    setForegroundColor(fld.foregr,fld.forebr)

    gotoXY(e_posx,e_posy)

    if fld.reftyp == PASSWORD: 
      writeStyled(password(e_FIELD),fld.style)
    else : writeStyled($e_FIELD,fld.style)

    gotoXY(e_posx,e_curs)

    if statusCursInsert: def_cursor(5) else: def_cursor(0) # CHANGE CURSOR FORM BAR/BLOCK

    showCursor()
    # read keyboard
    (e_key,e_str) = getKey()

  

    # control transfert panel
    if isFuncKey(e_key) : 
      result = e_key
      hideCursor()
      break
    
    # work key based 5250/3270
    case e_key 

      of Key.Escape:
        result = e_key          #release  buffer
        break
      of Key.CtrlA:             # touche .Help for Field
        if fld.help > "" :
          msgHelp(pnl,fld.help)

      of Key.Up , Key.Down:     # next Field
        if isEmpty(e_Field) and fld.empty == true:
          msgErr(pnl,fld.errmsg)
        else :
          result = e_key
          break
      of Key.Stab:              # next Field
        if isEmpty(e_Field) and fld.empty == true:
          msgErr(pnl,fld.errmsg)
        else :
          result = Key.Up
          break
      of Key.Tab:               # next Field
        if isEmpty(e_Field) and fld.empty == true:
          msgErr(pnl,fld.errmsg)
        else :
          result = Key.Down
          break
      of Key.Enter :            # enrg to Field
        if fld.regex != " " and false == match(strip($e_FIELD,trailing = true) ,re(fld.regex)) or 
          isEmpty(e_Field) and fld.empty == true :
          msgErr(pnl,fld.errmsg)
        else :
          fld.field  = $e_FIELD
          fld.field = fld.field.strip(trailing = true)
          fld.switch = e_switch
          result = e_key
          break



      of Key.Home:              # pos cursor home/field
        e_count = 0
        e_curs = e_posy

      of Key.End:               # pos cursor End/field last not blank
        e_count = nbrRune(e_FIELD)
        e_curs = e_posy + nbrRune(e_FIELD)


      of Key.Right:             # move cursor
        if e_count < e_nbrcar - 1:
          inc(e_count)
          inc(e_curs)

      of Key.Left:              # move cursor
        if e_curs > e_posy:
          dec(e_curs)
          dec(e_count)

      of Key.Backspace:         # delete char
        if e_curs > e_posy:
          dec(e_curs)
          dec(e_count)
          delete()
          if e_curs > e_posy + e_count:
            dec(e_count)
            e_curs = e_posy + e_count

      of Key.Delete:            # delete char
        delete()
        if e_curs > e_posy + e_count:
          dec(e_count)
          e_curs = e_posy + e_count

      of Key.Insert:            # insert char
        if statusCursInsert : statusCursInsert = false else : statusCursInsert = true

#--------------------------------------------------------------------------------
# work buffer
#--------------------------------------------------------------------------------
      of Key.Char:

        case fld.reftyp         ## Standard treatment of FIELD TYPE

          of ALPHA, ALPHA_UPPER:
            if e_count < e_nbrcar and isAlpha(e_str) or
              (isSpace(e_str) and e_count > 0 and e_count < e_nbrcar):
              if statusCursInsert: insert()
              if fld.reftyp == ALPHA:
                e_FIELD[e_count] = e_str.runeAt(0)
              else:
                e_str = e_str.toUpper()
                e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of PASSWORD:
            if e_count < e_nbrcar and (isAlpha(e_str) or isNumber(e_str) or isCarPwd(e_str)) :
              if statusCursInsert: insert()
              e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of ALPHA_NUMERIC, ALPHA_NUMERIC_UPPER  :
            if e_count < e_nbrcar and (isAlpha(e_str) or isNumber(e_str) or isPunct(e_str)) or
              (isSpace(e_str) and e_count > 0 and e_count < e_nbrcar):
              if statusCursInsert: insert()
              if fld.reftyp == ALPHA_NUMERIC:
                e_FIELD[e_count] = e_str.runeAt(0)
              else:
                e_str = e_str.toUpper()
                e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of TEXT_NUMERIC:
            if e_count < e_nbrcar and e_str != " " or
              (isSpace(e_str) and e_count > 0 and e_count < e_nbrcar):
              if statusCursInsert: insert()
              if fld.reftyp == ALPHA_NUMERIC:
                e_FIELD[e_count] = e_str.runeAt(0)
              else:
                e_str = e_str.toUpper()
                e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of DIGIT:
            if e_count < e_nbrcar and isNumber(e_str):
              if statusCursInsert: insert()
              e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of DIGIT_SIGNED:
            if e_count < e_nbrcar and isNumber(e_str) or
              (e_str == "+" and e_count == 0) or (e_str == "-" and e_count == 0):
              if statusCursInsert and e_count > 0 : insert()
              e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of DECIMAL:
            if e_count < e_nbrcar and isNumber(e_str) or
              (e_str == "." and e_count > 0 and e_count < e_nbrcar):
                if statusCursInsert: insert()
                e_FIELD[e_count] = e_str.runeAt(0)
                inc(e_count)
                inc(e_curs)
                if e_count == e_nbrcar:
                  dec(e_count)
                  dec(e_curs)

          of DECIMAL_SIGNED:
            if e_count < e_nbrcar and isNumber(e_str) or
              (e_str == "." and e_count > 0 and e_count < e_nbrcar) or
              (e_str == "+" and e_count == 0) or (e_str == "-" and e_count == 0):
                if statusCursInsert and e_count > 0 : insert()
                e_FIELD[e_count] = e_str.runeAt(0)
                inc(e_count)
                inc(e_curs)
                if e_count == e_nbrcar:
                  dec(e_count)
                  dec(e_curs)

          of DATE_ISO:
            if (e_count < e_nbrcar and isNumber(e_str)) or e_str == "-":
              if statusCursInsert: insert()
              e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)


          of DATE_US, DATE_FR:
            if (e_count < e_nbrcar and isNumber(e_str)) or e_str == "/":
              if statusCursInsert: insert()
              e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of MAIL_ISO:
            if e_count < e_nbrcar:
              if statusCursInsert: insert()
              e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of YES_NO:
            if e_count < e_nbrcar and (e_str == "y" or e_str == "Y" or e_str == "n" or e_str == "N"  ) :
              e_str = e_str.toUpper()
              e_FIELD[e_count] = e_str.runeAt(0)
              inc(e_count)
              inc(e_curs)
              if e_count == e_nbrcar:
                dec(e_count)
                dec(e_curs)

          of SWITCH:
            if e_count < e_nbrcar and e_str == " ":
              if e_switch == false:
                e_FIELD[e_count] = "◉".runeAt(0)
                e_switch = true
              else:
                e_FIELD[e_count] = "◎".runeAt(0)
                e_switch = false

          else : discard
      else : discard





##------------------------------------------------------
## Format management including zones
## keyboard Function keys are returned to the calling procedure
##
## only the key CtrlA = Aide / Help for field
## F1 is reserved for complex help programming
## 
## Reserved keys for FIELD management
## traditionally  UP, DOWN, TAB, STAB, CtrlA,
## ENTER, HOME, END, RIGTH, LEFt, BACKSPACE, DELETE, INSERT
## predefined and customizable REGEX control
##------------------------------------------------------

proc ioPanel*(pnl:var PANEL): Key =                       # IO Format
  if not pnl.actif : return Key.None

  var CountField = pnl.index
  var fld_key:Key = Key.Enter

  var index = fldIndex(pnl,pnl.field[CountField].name)

  # check if there are any free field
  func isFieldIO(pnl: PANEL):Natural =
    var n : Natural = len(pnl.field)
    var nfield: int = len(pnl.field) 
    for i in 0..nfield - 1 :
      if pnl.field[i].protect  or not pnl.field[i].actif: n -= 1
    return n
  #search there first available field
  func isFirstIO(pnl: PANEL, idx : Natural):int =
    var i : Natural = idx
    while i < len(pnl.field)-1  :
      if pnl.field[i].actif:
        if not pnl.field[i].protect : break
      inc(i)
    return i
  #search there last available field
  proc isPriorIO(pnl: PANEL, idx : Natural):int =
    var i : int = idx
    while i >= 0 :
      if pnl.field[i].actif :
        if not pnl.field[i].protect : break
      dec(i)
    if i < 0 : return 0
    return i


  #displays with framing the field
  if not pnl.field[CountField].protect and pnl.field[index].actif :
    printField(pnl,pnl.field[index])
    displayField(pnl,pnl.field[index])



  while true :

    #controls the boundary sequence of the field
    if CountField == len(pnl.field)-1  and isFieldIO(pnl) > 0 : 
      CountField = isPriorIO(pnl,len(pnl.field)-1)
    if CountField == 0  and isFieldIO(pnl) > 0 :
      CountField = isFirstIO(pnl,0)

    if not pnl.field[CountField].protect and pnl.field[CountField].actif:

      fld_key = ioField(pnl,pnl.field[CountField])   # work input/output Field

      printField(pnl,pnl.field[CountField])
      displayField(pnl,pnl.field[CountField])


    if isPanelKey(pnl,fld_key) :                      # this key sav index field return main 
      pnl.index = fldIndex(pnl,pnl.field[CountField].name)
      return fld_key

    if isFieldIO(pnl) == 0 :                          # this full protect only work Key active
      fld_key = getFunc()
    else :
      case fld_Key
        of Key.Escape :                               # we replay & resume the basic value
          continue
        of Key.Enter:
          if CountField < len(pnl.field)-1 : inc(CountField)
          if pnl.field[CountField].protect :
            CountField = isFirstIO(pnl,CountField) 

        of Key.Up :
          if CountField > 0 : dec(CountField)
          if pnl.field[CountField].protect  :
            CountField = isPriorIO(pnl,CountField )

        of Key.Down :
          if CountField < len(pnl.field)-1 : inc(CountField)
          if pnl.field[CountField].protect  :
            CountField = isFirstIO(pnl,CountField)
        else :discard
