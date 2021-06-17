import termkey
import termcurs

type
  FIELD_TEST {.pure.}= enum
    vCONTACT,
    vPRENOM
const P1: array[FIELD_TEST, int] = [0,1]

# Panel TEST

var TEST= new(PANEL)

# description
proc dscTEST() =
  TEST = newPanel("TEST",1,1,42,132,@[defButton(TKey.F3,"F3",true), defButton(TKey.F9,"F9",true), defButton(TKey.F10,"F10",true), defButton(TKey.F12,"F12",true)],line1)

  # LABEL  -> TEST

  TEST.label.add(defTitle("T02002", 2, 2, "CONTACT"))
  TEST.label.add(deflabel("L05002", 5, 2, "Nom......:"))
  TEST.label.add(deflabel("L07002", 7, 2, "Prénom...:"))
  TEST.label.add(deflabel("L12002", 12, 2, "Test-Menu:"))

  # FIELD -> TEST

  TEST.field.add(defString("vCONTACT", 5, 13, ALPHA_UPPER,30,"", FILL, "Invalide", "Le Nom est obligatoire"))
  TEST.field.add(defString("vPRENOM", 7, 13, ALPHA_NUMERIC,30,"", FILL, "invalide", "Le prénom est obligatoire ou '-'"))


# MENU -> TEST
var MH00 = new(MENU)
MH00 = newMenu("MH00", 12, 13, horizontal, @["File ", "Print ", "exit"], line1)

var MVPRINT = new(MENU)
MVPRINT = newMenu("MVPRINT", 14, 19, vertical, @["Contact", "exit"], line1)



offCursor()
initTerm()

dscTEST()
printPanel(TEST)
displayPanel(TEST)

# ONLY -> TEST
dspMenuItem(TEST,MH00,0)
dspMenuItem(TEST,MVPRINT,0)
let nTest = ioMenu(TEST,MVPRINT,0)

while true:
 let  key = ioPanel(TEST)

 case key
  of TKey.F3:
    #....#
    break
  of TKey.F9:
    #....#
    break
  of TKey.F11:
    #....#
    break
  of TKey.F12:
    #....#
    break
  else : discard




closeTerm()
