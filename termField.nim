
import terminal
import termkey
import termcurs

#var mnuatrx = new(MNUATRB)
#mnuatrx.style  = {styleDim}
#mnuatrx.backgr = BackgroundColor.bgBlack
#mnuatrx.backbr = true
#mnuatrx.foregr = ForegroundColor.fgGreen
#mnuatrx.forebr = true
#mnuatrx.styleCell  = {styleReverse,styleItalic}

type 
  FIELD_FMT1 = enum 
    Zone0,
    Zone1,
    Zone2,
    Zone3,
    Zone4,
    Zone5,
    Zone6,
    Zone7,
    Zone8,
    Zone9,
    Zone10,
    Zone11,
    Zone12,
    Zone13,
    Zone14,
    Zone15
type 
  HIDEN_FMT1 = enum 
    Hstring,
    Hnumeric,
    Hswitch,
    Hdate


const P_F1: array[FIELD_FMT1, int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
const P_H1: array[HIDEN_FMT1, int] = [0,1,2,3]


InitScreen()
setTerminal() #default color style erase
#var pnlF0  = new(PANEL)
var pnlF1  = new(PANEL)
var pnlF2 = new(PANEL)
var key : Key = Key.None

var pnlx = new(PANEL)


var mField:MENU
defMenu(mField , "Field" , 3 , 50 ,
MNUVH.vertical ,@[
  "zone0","zone1","zone2","zone3","zone4","zone5",
  "zone6","zone7","zone8","zone9","zone10","zone11",
  "zone12","zone13","zone14","zone15"
],line1)  #,mnuatrx


#[
defPanel(pnlF0,"nom",1,1,5,5 ,bgBlack,false,fgWhite,false,CADRE.line0,"",0,1,1,0,
        @[button(Key.F3,"end")])

fldLabel(pnlF0.label[0], "zone0", 1, 1,  "123")
fldString(pnlF0.field[P_F1[Zone0]],"zone0", 2, 1, ALPHA, 2, "..",FILL, "ALPHA Obligatoire", "Type Alpha a-Z")
printPanel(pnlF0)
]#

while true:
  if key == Key.F3 :  CloseScren()
  if key != Key.F2 and key != Key.F1 and key != Key.F9 and key != Key.F15: key  = getFunc()

  case key
    of Key.F1:
      if not isActif(pnlF1) :

        defPanel(pnlF1,"nom",1,1,terminalHeight(),terminalWidth(),CADRE.line0,"",0,17,len(P_F1),len(P_H1),
        @[button(Key.F3,"Exit"),button(Key.F2,"PANEL F2"),button(Key.F6, "active",false),button(Key.F9, "menu")])

        fldLabel(pnlF1.label[0], "zone0", 2, 5,  "ALPHA               zone0  :")
        fldString(pnlF1.field[P_F1[Zone0]],"zone0", 2, 5+(len(pnlF1.label[0].text)), ALPHA, 30, "Soleil",FILL, "ALPHA Obligatoire", "Type Alpha a-Z")

        fldLabel(pnlF1.label[1], "zone1", 4, 5,  "ALPHA_UPPER         zone1  :")
        fldString(pnlF1.field[P_F1[Zone1]],"zone1", 4, 5+(len(pnlF1.label[1].text)), ALPHA_UPPER, 30, "BONJOUR",EMPTY, "ALPHA Obligatoire", "Type Alpha A-Z")
        setProtect(pnlF1.field[1],true)
        
        fldLabel(pnlF1.label[2], "zone2", 6, 5,  "PASSWORD            zone2  :")
        fldString(pnlF1.field[P_F1[Zone2]],"zone2", 6, 5+(len(pnlF1.label[2].text)), PASSWORD, 10, "flagada",EMPTY, "PASSWORD Obligatoire", "Type Password")

        fldLabel(pnlF1.label[3], "zone3", 10, 5, "ALPHA_NUMERIC       zone3  :")
        fldString(pnlF1.field[P_F1[Zone3]],"zone3", 10, 5+(len(pnlF1.label[3].text)), ALPHA_NUMERIC, 30, "Soleil 1 étoile",EMPTY, "ALPHA_NUMERIC Obligatoire", "Type 'a-Z 0-9 and Punct'")

        fldLabel(pnlF1.label[4], "zone4", 12, 5, "ALPHA_NUMERIC_UPPER zone4  :")
        fldString(pnlF1.field[P_F1[Zone4]],"zone4", 12, 5+(len(pnlF1.label[4].text)), ALPHA_NUMERIC_UPPER, 30, "LE SOLEIL EST 1 ÉTOILE",EMPTY, "ALPHA_NUMERIC Obligatoire", "Type  'A-Z 0-9 and Punct'")      

        fldLabel(pnlF1.label[5], "zone5", 14, 5, "TEXT_NUMERIC        zone5  :")
        fldString(pnlF1.field[P_F1[Zone5]],"zone5", 14, 5+(len(pnlF1.label[5].text)), TEXT_FULL, 30, "BONJOUR, (3*7) étoiles",FILL, " TEXT_NUMERIC Obligatoire", "Type  FILL")      

        fldLabel(pnlF1.label[6],  "zone6", 16, 5,"DIGIT               zone6  :")
        fldNumeric(pnlF1.field[P_F1[Zone6]],"zone6", 16, 5+(len(pnlF1.label[6].text)), DIGIT, 5, 0, "67",FILL, "DIGIT Obligatoire", "Type Digit 0-9")

        fldLabel(pnlF1.label[7],  "zone7", 18, 5,"DIGIT_SIGNED        zone7  :")
        fldNumeric(pnlF1.field[P_F1[Zone7]],"zone7", 18, 5+(len(pnlF1.label[7].text)), DIGIT_SIGNED, 5,0, "-67",EMPTY, "DIGIT Obligatoire", "Type Digot '-/+ -9'")

        fldLabel(pnlF1.label[8],  "zone8", 20, 5,"DECIMAL             zone8  :")
        fldNumeric(pnlF1.field[P_F1[Zone8]],"zone8", 20, 5+(len(pnlF1.label[8].text)), DECIMAL, 5,2, "67.58",EMPTY, "DECIMAL Obligatoire", "Type Digot .0-9")

        fldLabel(pnlF1.label[9],  "zone9", 22, 5,  "DECIMAL_SIGNED      zone9  :")
        fldNumeric(pnlF1.field[P_F1[Zone9]],"zone9", 22, 5+(len(pnlF1.label[9].text)), DECIMAL_SIGNED, 5,2, "-67.58",EMPTY, "DECIMAL Obligatoire", "Type DECIMAL '-/+.0-9'")

        fldLabel(pnlF1.label[10],  "zone10", 24, 5,"DATE_ISO            zone10 :")
        fldDate(pnlF1.field[P_F1[Zone10]], "zone10", 24, 5+(len(pnlF1.label[10].text)), DATE_ISO, "2020-04-18",FILL, "DATE Obligatoire", "Type Date-ISO YYYY-MM-DD")
        
        fldLabel(pnlF1.label[11],  "zone11", 26, 5,"DATE_US             zone11  ")
        fldDate(pnlF1.field[P_F1[Zone11]], "zone11", 26, 5+(len(pnlF1.label[11].text)), DATE_US, "04/18/2020",EMPTY, "DATE Obligatoire", "Type Date-ISO YYYY-MM-DD")
        
        fldLabel(pnlF1.label[12],  "zone12", 28, 5,"DATE_FR             zone12 :")
        fldDate(pnlF1.field[P_F1[Zone12]], "zone12", 28, 5+(len(pnlF1.label[12].text)), DATE_FR, "18/04/2020",EMPTY, "DATE Obligatoire", "Type Date-ISO YYYY-MM-DD")

        fldLabel(pnlF1.label[13],  "zone13", 30, 5,"MAIL_ISO            zone13 :")
        fldMail(pnlF1.field[P_F1[Zone13]],   "zone13", 30, 5+(len(pnlF1.label[13].text)), MAIL_ISO, 50, "newmane@orange.fr",EMPTY, "MAIL Obligatoire", "Type Email")

        fldLabel(pnlF1.label[14],  "zone14", 32, 5,"YES_NO              zone14 :")
        fldString(pnlF1.field[P_F1[Zone14]], "zone14", 32, 5+(len(pnlF1.label[14].text)), YES_NO, 1, "N",FILL, "YES_NO Obligatoire", "Type n/y")

        fldLabel(pnlF1.label[15],  "zone15", 34, 5,"SWITCH              zone15 :")
        fldSwitch(pnlF1.field[P_F1[Zone15]], "zone15", 34, 5+(len(pnlF1.label[15].text)), SWITCH,false,EMPTY, "SWITCH Obligatoire", "Type ◉/◎")

        fldLabel(pnlF1.label[16],  "zone16", 38, 5,"F1 = Help   Escape= return (error/menu)")

        hdnString(pnlF1.hiden[P_H1[Hstring]], "zone3",TEXT_FULL, "BONJOUR, (36) étoiles")   # full String
        hdnString(pnlF1.hiden[P_H1[HDate]], "zone10",DATE_ISO, "2020-04-24")                    # full String
        hdnSwitch(pnlF1.hiden[P_H1[Hswitch]], "zone15", SWITCH,true)                            # specifique switch
        hdnString(pnlF1.hiden[P_H1[Hnumeric]], "zone8",DECIMAL, "256.05")                       # full String
        printPanel(pnlF1)

      key = ioPanel(pnlF1)

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
      defPanel(pnlF2,"nom",10,30,20,70,CADRE.line1,"test Panel",0,3,3,0,
              @[button(Key.CtrlV,"get VAL"),button(Key.CtrlH,"get HIDEN"),button(Key.F12,"Abandon"),button(Key.F9,"Menu"),button(Key.F15,"Clear")])
      fldLabel(pnlF2.label[0], "nom", 5, 2,"ASTRE :")
      fldLabel(pnlF2.label[1], "fruit", 10, 2,"Fruit :")
      fldLabel(pnlF2.label[2], "aime", 12, 2,"Aimez-Vous les fruits :")
      fldString(pnlF2.field[0], "zone0", 5, 3+(len(pnlF2.label[0].text)), ALPHA, 30, "Lune",EMPTY, "Obligatoire", "Nom de la personne ")
      fldNumeric(pnlF2.field[1], "zone8", 10, 3+(len(pnlF2.label[1].text)), DECIMAL, 3,2, "345.6",EMPTY, "Obligatoire", "Prix  des carottes")
      fldSwitch(pnlF2.field[2], "zone15", 12, 3+(len(pnlF2.label[2].text)), SWITCH,true,EMPTY,"","Appuyer sur la bare espacement")
      printPanel(pnlF2)

      key = ioPanel(pnlF2)
      case key
        of Key.CtrlV :
          if isActif(pnlF1):
            # Field coherence check exemple
            if getName(pnlF1) == getName(pnlF2):
              pnlF1.field[Index(pnlF1)].switch = getSwitch(pnlF2,getName(pnlF2))
              pnlF1.field[Index(pnlF1)].text  = getText(pnlF2,getName(pnlF2))
            restorePanel(pnlF1,pnlF2)
          else : resetPanel(pnlF2)
          key = Key.F1

        of Key.CtrlH :
          if isActif(pnlF1):
            # Field coherence check exemple retrived hiden field
            if getName(pnlF1) == getNameHiden(pnlF1,getIndexHiden(pnlF1, getName(pnlF1))):
              pnlF1.field[Index(pnlF1)].text =  getTextHiden(pnlF1,getName(pnlF1))
              pnlF1.field[Index(pnlF1)].switch = getSwitchHiden(pnlF1,getName(pnlF1))
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

    of Key.F13:
      key = Key.F2

    of Key.F14:
      key = Key.F1

    of Key.F15:
      resetPanel(pnlF1)
      clsPanel(pnlF2)
      key = getFunc()
      resetPanel(pnlF2)
      setTerminal()
      key = Key.None

    of Key.F9 :
      var menuF9:MENU
      pnlx  = pnlF1           #------------ test manuel pnlx  = pnlF1/pnlF2   pnl =1/2
      var pnl = 1
      defMenu(menuF9 , "Test Horizontal" , 7 , 33,
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
            key = Key.F1
          else:
            key = Key.F2
        of 2 :
          if isActif(pnlF1):
            setProtect(pnlF1.field[Index(pnlF1)],true)         # test protect dynamic on
            printField(pnlF1, pnlF1.field[Index(pnlF1)])
            setActif(pnlF1.button[2],true)
            printButton(pnlF1)
            displayField(pnlF1, pnlF1.field[Index(pnlF1)])
            key = Key.F1
          else :

            key = Key.F2

        of 3 :
          if isActif(pnlF1):
            setActif(pnlF1.label[Index(pnlF1)],false)         # test inactif dynamic off
            setActif(pnlF1.field[Index(pnlF1)],false)         # test inactif dynamic

            displayLabel(pnlF1, pnlF1.label[Index(pnlF1)])
            displayField(pnlF1, pnlF1.field[Index(pnlF1)])
            key = Key.F1
          else :
            key = Key.F2


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

            key = Key.F1
          else :
            key = Key.F2

        of 5 : 
          key = Key.F3
          break

        else : discard

      if not isActif(pnlF1) or sel == 0 : 
        if pnl == 2 : key = Key.F2        # Escape = 0 
        if pnl == 1 : key = Key.F1        # Escape = 0 


      if pnl == 2 : 
        restorePanel(pnlF1,pnlF2)
        resetPanel(pnlF2)
      else :
        restorePanel(pnlx,menuF9)
        
      resetPanel(menuF9)
    else: discard
  stdout.flushFile
  stdin.flushFile
