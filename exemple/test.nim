import termkey
import termcurs

type
  FIELD_Form {.pure.}= enum
    vNom,
    vPrenom
const P1: array[FIELD_Form, int] = [0,1]

var Traitement = new(MENU)
Traitement = newMenu("Traitement",2,2,horizontal,@["File ", "New  ", "Save ", "Exit "],line1)

var Sexe = new(MENU)
Sexe = newMenu("Sexe",12,96,vertical,@["Male", "Femele"],line1)

# Panel Form

var Form= new(PANEL)

# description
proc dscForm() = 
  Form = newPanel("Form",1,1,42,132,@[defButton(Key.F3,"F3",true), defButton(Key.F12,"F12",true),defButton(Key.altM,"Menu",true)],line1)

  # LABEL  -> Form

  Form.label.add(defTitle("T04002", 4, 2, "Contact"))
  Form.label.add(deflabel("L07002", 7, 2, "Nom.......:"))
  Form.label.add(deflabel("L09002", 9, 2, "Prénom....:"))

  # FIELD -> Form

  Form.field.add(defString("vNom", 7, 13, ALPHA_UPPER,30,"", FILL, "Obligatoire", "Nom du contact"))
  Form.field.add(defString("vPrenom", 9, 13, ALPHA_NUMERIC_UPPER,30,"", FILL, "Obligatoire", "Prénom du contact"))


proc main()=
  offCursor()
  initScreen()

  dscForm()
  printPanel(Form)
  displayPanel(Form)

  while true:
    let  key = ioPanel(Form)
    case key
      of Key.F3:
        break
      of Key.F12:
        # only test 	  
        setText(Form,P1[vNom],"JPL")

      of Key.altM:
        # exemple  test
        printMenu(Form,Traitement)
        discard ioMenu(Form,Traitement,0)
        restorePanel(Form,Traitement)

        printMenu(Form,Sexe)
        discard ioMenu(Form,Sexe,0)
        restorePanel(Form,Sexe)

      else : discard




main()
closeScren()