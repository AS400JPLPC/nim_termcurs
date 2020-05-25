import termkey
import termcurs

# Panel CONTACT
var PanelA = new(PANEL)  

# description
proc dscPanelA() = 
  PanelA = newPanel("PanelA",1,1,42,130,@[defButton(Key.F3,"F3"),defButton(Key.F12,"F12")],line1)

  # LABEL  -> PanelA

  PanelA.label.add(defTitle("T02002", 2, 2, "CONTACT"))
  PanelA.label.add(defLabel("L04002", 4, 2, "Nom........:"))
  PanelA.label.add(defLabel("L04048", 4, 48, "Prénom.....:"))
  PanelA.label.add(defLabel("L06002", 6, 2, "Téléphone..:"))
  PanelA.label.add(defLabel("L08002", 8, 2, "Adresse principale:"))
  PanelA.label.add(defLabel("L10002", 10, 2, "N° rue:"))
  PanelA.label.add(defLabel("L10016", 10, 16, "Rue (1)..:"))
  PanelA.label.add(defLabel("L13002", 13, 2, "Code Postal:"))
  PanelA.label.add(defLabel("L15002", 15, 2, "Code Pays..:"))

  # FIELD -> PanelA

  PanelA.field.add(defString("Nom", 4, 14, ALPHA_NUMERIC_UPPER,30,"",FILL , "Obligatoire", "Nom du Contact"))
  PanelA.field.add(defString("Prenom", 4, 60, TEXT_FULL,30,"",FILL , "Obligatoire", ""))
  PanelA.field.add(defTelephone("TelFixe", 6, 14, TELEPHONE,20,"", EMPTY, "format (033)1234567890", "Téléphone Fixe"))
  PanelA.field.add(defTelephone("TelMobile", 6, 38, TELEPHONE,20,"", EMPTY, "Exemple:(001) 41812345 or 41812345", "N° de téléphone Mobile"))
  PanelA.field.add(defString("Nrue", 10, 9, ALPHA_NUMERIC,5,"", FILL, "Obligatoire", "N° rue"))
  PanelA.field.add(defString("Rue1", 10, 26, TEXT_FULL,30,"", FILL, "Obligatoire", "Nom de la rue du Contact"))
  PanelA.field.add(defString("Rue2", 11, 26, TEXT_FULL,30,"", EMPTY, "", "Suite Rue(1)"))
  PanelA.field.add(defString("CodePtt", 13, 14, TEXT_FULL,11,"", FILL, "Obligatoire", "Code Postal du Contact"))
  PanelA.field.add(defString("TxtPtt", 13, 26, TEXT_FULL,20,"", EMPTY, "", ""))
  setProtect(PanelA.field[8],true)
  PanelA.field.add(defString("CodePays", 15, 14, ALPHA_UPPER,3,"", FILL, "Obligatoire", "Code Pays"))
  PanelA.field.add(defString("TxtPays", 15, 18, TEXT_FULL,25,"", EMPTY, "", ""))
  setProtect(PanelA.field[10],true)

  
InitScreen()

setTerminal() #default color style erase
dscPanelA()
printPanel(PanelA)
displayPanel(PanelA)
while true:
  let  key = ioPanel(PanelA)

  case key
    of Key.F3: break

    of Key.F12:
      clearText(PanelA)

    else : discard

CloseScren()