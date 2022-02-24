# generate source from designer termSDA -> procSDA  2022-02-24


import termkey
import termcurs
import tables


var callQuery: Table[string, proc(fld : var FIELD)]


type
  FIELD_FCOMBO {.pure.}= enum
    vAnimal
const P1: array[FIELD_FCOMBO, int] = [0]

type
  FIELD_TCOMBO2 {.pure.}= enum
    vVoiture
const P2: array[FIELD_TCOMBO2, int] = [0]

# Panel FCOMBO

var FCOMBO= new(PANEL)

# description
proc dscFCOMBO() =
  FCOMBO = newPanel("FCOMBO",1,1,42,132,@[defButton(TKey.F3,"F3",false,true)],line1,"TESTCOMBO")

  # LABEL  -> FCOMBO

  FCOMBO.label.add(deflabel("L02002", 2, 2, "Animal:"))

  # FIELD -> FCOMBO

  FCOMBO.field.add(defString("vAnimal", 2, 9, FPROC,20,"", FILL, "Nom de l'animal obligatoire",""))
  setProcess(FCOMBO.field[P1[vAnimal]],"Tanimal")


#===================================================
proc Tanimal(fld : var FIELD) =
  var G_pos : int = -1
  var Xcombo  = newGRID("Tanimal",2,10,5,sepStyle)
  var G_Animal = defCell("Animal",15,TEXT_FREE,"Cyan")

  setHeaders(Xcombo, @[G_Animal])
  addRows(Xcombo, @[ "Chat" ])
  addRows(Xcombo, @[ "Lion" ])
  addRows(Xcombo, @[ "Poisson" ])
  addRows(Xcombo, @[ "Oiseau" ])
  addRows(Xcombo, @[ "Papillon" ])
  addRows(Xcombo, @[ "Dragon" ])

  printGridHeader(Xcombo)
  case fld.text
    of "Chat"   : G_pos = 0
    of "Lion"   : G_pos = 1
    of "Poisson"   : G_pos = 2
    of "Oiseau"   : G_pos = 3
    of "Papillon"   : G_pos = 4
    of "Dragon"   : G_pos = 5
    else : discard

  while true :
    let (keys, val) = ioGrid(Xcombo,G_pos)
    case keys
      of TKey.Enter :
        restorePanel(FCOMBO,Xcombo)
        fld.text  = $val[0]
        break
      else: discard

callQuery["Tanimal"] = Tanimal
#===================================================

# Panel TCOMBO2

var TCOMBO2= new(PANEL)

# description
proc dscTCOMBO2() =
  TCOMBO2 = newPanel("TCOMBO2",1,1,30,20,@[defButton(TKey.F3,"F3",false,true)],line2,"Test-panel2")

  # LABEL  -> TCOMBO2

  TCOMBO2.label.add(deflabel("L02002", 2, 2, "Voiture:"))

  # FIELD -> TCOMBO2

  TCOMBO2.field.add(defString("vVoiture", 3, 2, FPROC,15,"", FILL, "Choisissez une voiture",""))
  setProcess(TCOMBO2.field[P2[vVoiture]],"Tvoiture")


#===================================================
proc Tvoiture(fld : var FIELD) =
  var G_pos : int = -1
  var Xcombo  = newGRID("Tvoiture",3,2,15,sepStyle)
  var G_Voiture = defCell("Voiture",15,TEXT_FREE,"Cyan")

  setHeaders(Xcombo, @[G_Voiture])
  addRows(Xcombo, @[ "Peugeot" ])
  addRows(Xcombo, @[ "Renault" ])
  addRows(Xcombo, @[ "Bugati" ])

  printGridHeader(Xcombo)
  case fld.text
    of "Peugeot"   : G_pos = 0
    of "Renault"   : G_pos = 1
    of "Bugati"   : G_pos = 2
    else : discard

  while true :
    let (keys, val) = ioGrid(Xcombo,G_pos)
    case keys
      of TKey.Enter :
        restorePanel(TCOMBO2,Xcombo)
        fld.text  = $val[0]
        break
      else: discard

callQuery["Tvoiture"] = Tvoiture
#===================================================


offCursor()
initTerm()

dscFCOMBO()
printPanel(FCOMBO)
displayPanel(FCOMBO)

#Exemple ------

while true:
 let  key = ioPanel(FCOMBO)
 case key
  of TKey.PROC :  # ex: Combo
    if getRefType(FCOMBO,Index(FCOMBO)) == FPROC:
      if isProcess(FCOMBO,Index(FCOMBO)):
        callQuery[getProcess(FCOMBO,Index(FCOMBO))](FCOMBO.field[Index(FCOMBO)])
  of TKey.F3:
    break
  else : discard


dscTCOMBO2()
printPanel(TCOMBO2)
displayPanel(TCOMBO2)

#Exemple ------

while true:
 let  key = ioPanel(TCOMBO2)
 case key
  of TKey.PROC :  # ex: Combo
    if getRefType(TCOMBO2,Index(TCOMBO2)) == FPROC:
      if isProcess(TCOMBO2,Index(TCOMBO2)):
        callQuery[getProcess(TCOMBO2,Index(TCOMBO2))](TCOMBO2.field[Index(TCOMBO2)])
  of TKey.F3:
    break
  else : discard




closeTerm()
