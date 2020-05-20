import terminal
import termkey
import termcurs
type
  LABEL_FMT1 {.pure.} = enum 
    Lnom,
    Lanimal,
    Lprix,
    LGrid
  FIELD_FMT1 {.pure.}= enum 
    Nom,
    Animal,
    Prix

const P_L1: array[LABEL_FMT1, int] = [0,1,2,3]

const P_F1: array[FIELD_FMT1, int] = [0,1,2]


func setID*( line : var int ) : string =
  line += 1
  return $line

InitScreen()
setTerminal() #default color style erase

var pnlF1  = new(PANEL)
var grid  : GRIDSFL
var g_numID : int 
var key : Key = Key.F1
var keyG : Key_Grid
while true:
  if key == Key.F3 :  CloseScren()

  case key
  of Key.F1:

    if not isActif(pnlF1) :  # init Panel
      pnlF1 = newPanel("nom",1,1,terminalHeight(),terminalWidth(),
      @[defButton(Key.F3,"Exit"),defButton(Key.F2,"Grid"),defButton(Key.F9,"Add Row"),
      defButton(Key.F23,"Delete Row All"),defButton(Key.CtrlX,"Sel Ligne"),
      defButton(Key.PageUP,""),defButton(Key.PageDown,"")],CADRE.line0)

      pnlF1.label.add(defLabel($Nom, 2, 5,   "Nom.....:"))
      pnlF1.field.add(defString($Nom, 2, 5+(len(pnlF1.label[P_L1[Lnom]].text)), ALPHA, 20, "Jean-Pierre",FILL, "Nom Obligatoire", "Type Alpha a-Z"))

      pnlF1.label.add(defLabel($Animal, 4, 5,  "Animal..:"))
      pnlF1.field.add(defString($Animal, 4, 5+(len(pnlF1.label[P_L1[Lanimal]].text)), TEXT_FULL,30, "Chat",FILL, "Animale Obligatoire", "Type Alpha a-Z"))

      pnlF1.label.add(defLabel($Prix, 6, 5, "Prix....:"))
      pnlF1.field.add(defNumeric($Prix, 6, 5+(len(pnlF1.label[P_L1[Lprix]].text)), DECIMAL,5,2,"12.00",FILL, "Animale Obligatoire", "Type Alpha a-Z"))

      pnlF1.label.add(defLabel($Lgrid, 42, 127, ""))
      printPanel(pnlF1)

    key = ioPanel(pnlF1)

  of Key.F2:
    grid = newGrid("GRID01",10,1,5)
    var g_id      = defCell("ID",3,DIGIT)
    var g_name    = defCell("Name",getNbrcar(pnlF1,$Nom),ALPHA)
    var g_animal  = defCell("Fav animal",getNbrcar(pnlF1,$Animal),ALPHA)
    var g_prix    = defCell("Prix",getNbrcar(pnlF1,$Prix),DECIMAL,"€") ;
    g_numID = - 1 


    setHeaders(grid, @[g_id, g_name, g_animal,g_prix])
    addRows(grid, @[setID(g_numID), "Adam", "Cat, Aigle","50.00"])
    addRows(grid, @[setID(g_numID), "Eve" , "Cat, Papillon","50.00"])
    addRows(grid, @[setID(g_numID), "Roger", "Singe","50.00"])
    addRows(grid, @[setID(g_numID), "Ginette" , "Chien","50.00"])
    addRows(grid, @[setID(g_numID), "Maurice", "Dauphin","50.00"])
    addRows(grid, @[setID(g_numID), "Elisabhet" , "Oiseaux","50.00"])
    addRows(grid, @[setID(g_numID), "Eric", "Poisson","50.00"])
    addRows(grid, @[setID(g_numID), "Daniel" ,"Insect","50.00"])
    addRows(grid, @[setID(g_numID), "Mendi", "Chien","50.00"])
    addRows(grid, @[setID(g_numID), "Simon" ,"Scorpion","50.00"])

    #gotoXY(39,1) ; echo "60"; let y = getFunc();

    printGridHeader(grid)
    printGridRows(grid)
    key = Key.F1

  of Key.F9:
    if grid.actif:
      addRows(grid,@[setID(g_numID), pnlF1.getTextF($Nom), pnlF1.getTextF($Animal),pnlF1.getTextF($Prix)])
      grid.curspage = grid.pages
      printGridHeader(grid)
      printGridRows(grid)
    key = Key.F1
  of Key.F23:
    if grid.actif:
      g_numID = -1
      grid = newGrid("GRID01",10,1,5)
      var g_id      = defCell("ID",3,DIGIT)
      var g_name    = defCell("Name",getNbrcar(pnlF1,$Nom),ALPHA)
      var g_animal  = defCell("Fav animal",getNbrcar(pnlF1,$Animal),ALPHA)
      var g_prix    = defCell("Prix",getNbrcar(pnlF1,$Prix),DECIMAL,"€") ;
      g_numID = - 1 
      setHeaders(grid, @[g_id, g_name, g_animal,g_prix])
      printGridHeader(grid)

    key = Key.F1


  of Key.PageUp :
    keyG = pageUpGrid(grid)
    if keyG == Key_Grid.PGup:
      pnlF1.label[P_L1[Lgrid]].text = "Prior"
    else:
      pnlF1.label[P_L1[Lgrid]].text = "Home "
    displayLabel(pnlF1,pnlF1.label[P_L1[Lgrid]])

    key = Key.F1 
  of Key.PageDown :
    keyG = pageDownGrid(grid)
    if keyG == Key_Grid.PGdown:
      pnlF1.label[P_L1[Lgrid]].text = "Next "
    else:
      pnlF1.label[P_L1[Lgrid]].text = "End  "
    displayLabel(pnlF1,pnlF1.label[P_L1[Lgrid]])
    key = Key.F1 

  of Key.Ctrlx :
    let (keys, val) = ioGrid(grid)
    #gotoXY(40,1) ; echo "99", keys, " val :", $val ; let n99 = getFunc();
    #gotoXy(40,1) ; echo "                                                                                                 "
    if keys == Key.Enter :
      pnlF1.field[P_F1[Nom]].text = val[1]
      pnlF1.field[P_F1[Animal]].text = val[2]
      pnlF1.field[P_F1[Prix]].text = val[3]
      displayField(pnlF1, pnlF1.field[P_F1[Nom]])
      displayField(pnlF1, pnlF1.field[P_F1[Animal]])
      displayField(pnlF1, pnlF1.field[P_F1[Prix]])
    key = Key.F1 

  else : discard