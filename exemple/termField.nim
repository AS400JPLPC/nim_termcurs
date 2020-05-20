
import terminal
import termkey
import termcurs

import tables
var callQuery: Table[string, proc(fld : var FIELD)]
var grid  = new(GRIDSFL)
#===================================================
proc callRefTyp(fld : var FIELD) =
  var g_pos : int = -1
  grid  = newGRID("grid01",2,2,20)

  var g_type  = defCell("Ref.Type",19,ALPHA)

  setHeaders(grid, @[g_type])
  addRows(grid, @["TEXT_FREE"])
  addRows(grid, @["ALPHA"])
  addRows(grid, @["ALPHA_UPPER"])
  addRows(grid, @["ALPHA_NUMERIC"])
  addRows(grid, @["ALPHA_NUMERIC_UPPER"])
  addRows(grid, @["TEXT_FULL"])
  addRows(grid, @["PASSWORD"])
  addRows(grid, @["DIGIT"])
  addRows(grid, @["DIGIT_SIGNED"])
  addRows(grid, @["DECIMAL"])
  addRows(grid, @["DECIMAL_SIGNED"])
  addRows(grid, @["DATE_ISO"])
  addRows(grid, @["DATE_FR"])
  addRows(grid, @["DATE_US"])
  addRows(grid, @["TELEPHONE"])
  addRows(grid, @["MAIL_ISO"])
  addRows(grid, @["YES_NO"])
  addRows(grid, @["SWITCH"])
  addRows(grid, @["FPROC"])
  addRows(grid, @["FCALL"])
  printGridHeader(grid)

  case fld.text
    of "TEXT_FREE"            : g_pos = 0
    of "ALPHA"                : g_pos = 1
    of "ALPHA_UPPER"          : g_pos = 2
    of "ALPHA_NUMERIC"        : g_pos = 3
    of "ALPHA_NUMERIC_UPPER"  : g_pos = 4
    of "TEXT_FULL"            : g_pos = 5
    of "PASSWORD"             : g_pos = 6
    of "DIGIT"                : g_pos = 7
    of "DIGIT_SIGNED"         : g_pos = 8
    of "DECIMAL"              : g_pos = 9
    of "DECIMAL_SIGNED"       : g_pos = 10
    of "DATE_ISO"             : g_pos = 11
    of "DATE_FR"              : g_pos = 12
    of "DATE_US"              : g_pos = 13
    of "TELEPHONE"            : g_pos = 14
    of "MAIL_ISO"             : g_pos = 15
    of "YES_NO"               : g_pos = 16
    of "SWITCH"               : g_pos = 17
    of "FPROC"                : g_pos = 18
    of "FCALL"                : g_pos = 19
    else : discard

  while true :
    let (keys, val) = ioGrid(grid,g_pos)
  
    case keys
      of Key.Enter :
        fld.text  = $val[0]
        break
      else: discard

callQuery["callRefTyp"] = callRefTyp

#===================================================


include ./termFieldEcr.nim

var key : Key = Key.None
var pnlx = new(PANEL)
var pnl : int = 0



InitScreen()
setTerminal() #default color style erase

ecr00()
printPanel(pnlF0)
while true:
  key  = getFunc()
  if key == Key.F12 : break

setTerminal() #default color style erase

key =  Key.F1
while true:
  if key == Key.F3 :  CloseScren()
  if key != Key.F1 and key != Key.F2 and key != Key.F9 and key != Key.F15 : key  = getFunc()
 
  case key
    of Key.F1:
      if not isActif(pnlF1) :
        ecr01()
        printPanel(pnlF1)
      pnl = 1
      key = ioPanel(pnlF1)
      
      if key == Key.PROC :
        if pnlF1.field[Index(pnlF1)].reftyp == FPROC:
          if isVoidF(pnlF1,Index(pnlF1)):
            callQuery[pnlF1.field[Index(pnlF1)].cvoid](pnlF1.field[Index(pnlF1)])
            restorePanel(pnlF1, grid)

        key = Key.F1
        continue

      if key == Key.F6:
        for i in 0..len(pnlF1.label) - 1 :
          setActif(pnlF1.label[i],true)         # test actif dynamic
          printLabel(pnlF1, pnlF1.label[i])
        for i in 0..len(pnlF1.field) - 1 :
          setProtect(pnlF1.field[i],false)         # test actif dynamic
          setActif(pnlF1.field[i],true)         # test actif dynamic
          printField(pnlF1, pnlF1.field[i])
        displayPanel(pnlF1)
        key = Key.F1

    of Key.F2:
      ecr02()
      printPanel(pnlF2)
      pnl = 2
      key = ioPanel(pnlF2)
      case key
        of Key.CtrlV :
          if isActif(pnlF1):
            # Field coherence check exemple
            if getNameF(pnlF1) == getNameF(pnlF2):
              pnlF1.field[Index(pnlF1)].switch = getSwitch(pnlF2,getNameF(pnlF2))
              pnlF1.field[Index(pnlF1)].text  = getTextF(pnlF2,getNameF(pnlF2))
            restorePanel(pnlF1,pnlF2)
          else : resetPanel(pnlF2)
          key = Key.F1

        of Key.CtrlH :
          if isActif(pnlF1):
            # Field coherence check exemple retrived hiden field
            if getNameF(pnlF1) == getNameH(pnlF1,getIndexH(pnlF1, getNameF(pnlF1))):
              pnlF1.field[Index(pnlF1)].text =  getTextH(pnlF1,getNameF(pnlF1))
              pnlF1.field[Index(pnlF1)].switch = getSwitchH(pnlF1,getNameF(pnlF1))
            restorePanel(pnlF1,pnlF2)
          else : resetPanel(pnlF2)
          key = Key.F1

        of Key.F12 :
          if isActif(pnlF1) and isActif(pnlF2) :              # if isActif(pnlF0) and isActif(pnlF2)
            restorePanel(pnlF1,pnlF2)                         # restorePanel(pnlF0,pnlF2)
            resetPanel(pnlF2)
            #key=getFunc()
            key = Key.F1
          if not isActif(pnlF1) :
            resetPanel(pnlF2)
            key = Key.F1

        of Key.F9:
          key = Key.F9
        of Key.F15 :
          key = Key.F15
        else : key = Key.None    # F9 Display Menu

    of Key.F15:
      resetPanel(pnlF1)
      clsPanel(pnlF2)
      resetPanel(pnlF2)
      setTerminal()
      key = Key.None

    of Key.F9 :
      if pnl == 0 :
        key = Key.None
        continue
      var menuF9= new(MENU)
      if pnl == 1 :
        pnlx  = pnlF1           #------------ test manuel pnlx  = pnlF1/pnlF2   pnl =1/2
      if pnl == 2 :
        pnlx  = pnlF2

      menuF9 = newMenu("Test Horizontal" , 7 , 33,
              MNUVH.horizontal , @["unProtect ","Protect   ","Inactif   ","Actif     ","Quitter   "],line2
              )  #,mnuatrx
      printMenu(pnlx,menuF9)
      var sel :Natural = 0
      sel = ioMenu(pnlx,menuF9 , sel) 

      case sel
        of 1 :
          if isActif(pnlF1):
            printMenu(pnlx,mField)
            var msel :Natural = 0
            msel = ioMenu(pnlx,mField , msel)                 # test protect dynamic off
            restorePanel(pnlx,mField)
            if msel > 0 :
              setProtect(pnlF1.field[msel-1],false)
              printField(pnlF1, pnlF1.field[msel-1])
              displayField(pnlF1, pnlF1.field[msel-1])
              setActif(pnlF1.button[2],false)
              displayButton(pnlF1)
          if pnl == 1 : key = Key.F1
          if pnl == 2 : key = Key.F2
        of 2 :
          if isActif(pnlF1):
            setProtect(pnlF1.field[Index(pnlF1)],true)         # test protect dynamic on
            printField(pnlF1, pnlF1.field[Index(pnlF1)])
            setActif(pnlF1.button[2],true)
            printButton(pnlF1)
            displayField(pnlF1, pnlF1.field[Index(pnlF1)])
          if pnl == 1 : key = Key.F1
          if pnl == 2 : key = Key.F2

        of 3 :
          if isActif(pnlF1):
            setActif(pnlF1.label[Index(pnlF1)],false)         # test inactif dynamic off
            setActif(pnlF1.field[Index(pnlF1)],false)         # test inactif dynamic

            displayLabel(pnlF1, pnlF1.label[Index(pnlF1)])
            displayField(pnlF1, pnlF1.field[Index(pnlF1)])
          if pnl == 1 : key = Key.F1
          if pnl == 2 : key = Key.F2


        of 4 :
          if isActif(pnlF1):
            printMenu(pnlx,mField)
            var msel :Natural = 0
            msel = ioMenu(pnlx,mField , msel)
            restorePanel(pnlx,mField)
            if msel > 0 :
              setActif(pnlF1.field[msel-1],true)               # test actif dynamic on
              setActif(pnlF1.label[msel-1],true)               # test actif dynamic
              displayLabel(pnlF1, pnlF1.label[msel-1])
              displayField(pnlF1, pnlF1.field[msel-1])

          if pnl == 1 : key = Key.F1
          if pnl == 2 : key = Key.F2

        of 5 : 
          key = Key.F3
          break

        else : discard

      if pnl == 2 : 
        if isActif(pnlF1) :
          setTerminal()
          printPanel(pnlF1)
        else :
          setTerminal()

      if pnl == 1 :
        if isActif(menuF9) : restorePanel(pnlx,menuF9)
      if pnl == 0 :
        key = Key.None
      resetPanel(menuF9)
    else: discard
  stdout.flushFile
  stdin.flushFile
