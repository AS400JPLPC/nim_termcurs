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

offCursor()
initScreen(Lines(panel01),Cols(panel01),"CONTACT")


printPanel(panel01)
displayPanel(panel01)

proc main()=
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
