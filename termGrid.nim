import terminal
import termkey
import termcurs
type
  LABEL_FMT1 {.pure.} = enum 
    Lnom,
    Lanimal,
    Lprix
  FIELD_FMT1 {.pure.}= enum 
    Nom,
    Animal,
    Prix

const P_L1: array[LABEL_FMT1, int] = [0,1,2]

const P_F1: array[FIELD_FMT1, int] = [0,1,2]


func setID*( line : var int ) : string =
  line += 1
  return $line

InitScreen()
setTerminal() #default color style erase

var pnlF1  = new(PANEL)
var grid  : TermGrid
var g_numID : int 
var key : Key = Key.F1

while true:
  if key == Key.F3 :  CloseScren()

  case key
  of Key.F1:

    if not isActif(pnlF1) :  # init Panel

      defPanel(pnlF1,"nom",1,1,terminalHeight(),terminalWidth(),bgBlack,false,fgWhite,false,CADRE.line0,"",0,len(P_L1),len(P_F1),0,
      @[button(Key.F3,"Exit"),button(Key.F2,"Grid"),button(Key.F9,"Add Row"),button(Key.F23,"Delete Row All"),button(Key.CtrlX,"Sel Ligne"),
      button(Key.PageUP,""),button(Key.PageDown,"")])

      fldLabel(pnlF1.label[P_L1[Lnom]],$Lnom, 2, 5,   "Nom.....:")
      fldString(pnlF1.field[P_F1[Nom]],$Nom, 2, 5+(len(pnlF1.label[P_L1[Lnom]].label)), ALPHA, 20, "Jean-Pierre",FILL, "Nom Obligatoire", "Type Alpha a-Z")

      fldLabel(pnlF1.label[P_L1[Lanimal]],$Lanimal, 4, 5,  "Animal..:")
      fldString(pnlF1.field[P_F1[Animal]],$Animal, 4, 5+(len(pnlF1.label[P_L1[Lanimal]].label)), TEXT_NUMERIC,30, "Chat",FILL, "Animale Obligatoire", "Type Alpha a-Z")

      fldLabel(pnlF1.label[P_L1[Lprix]],$Lprix, 6, 5, "Prix....:")
      fldNumeric(pnlF1.field[P_F1[Prix]],$Prix, 6, 5+(len(pnlF1.label[P_L1[Lprix]].label)), DECIMAL,5,2,"12.00",FILL, "Animale Obligatoire", "Type Alpha a-Z")

      printPanel(pnlF1)

    key = ioPanel(pnlF1)

  of Key.F2:
    grid = newTermGrid("GRID01",10,1,5)
    var g_id      = newCell("ID",3,DIGIT)
    var g_name    = newCell("Name",fldNbrcar(pnlF1,$Nom),ALPHA)
    var g_animal  = newCell("Fav animal",fldNbrcar(pnlF1,$Animal),ALPHA)
    var g_prix    = newCell("Prix",fldNbrcar(pnlF1,$Prix),DECIMAL,"€") ;
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
      addRows(grid,@[setID(g_numID), pnlF1.fldValue($Nom), pnlF1.fldvalue($Animal),pnlF1.fldValue($Prix)])
      grid.curspage = grid.pages
      printGridHeader(grid)
      printGridRows(grid)
    key = Key.F1
  of Key.F23:
    if grid.actif:
      g_numID = -1
      dltRows(grid)
      printGridHeader(grid)

    key = Key.F1


  of Key.PageUp :
    if grid.curspage > 0 :
      dec(grid.curspage)
      printGridHeader(grid)
      printGridRows(grid)
    key = Key.F1 
  of Key.PageDown :
    if grid.curspage < grid.pages :
      inc(grid.curspage)
      printGridHeader(grid)
      printGridRows(grid)
    key = Key.F1 

  of Key.Ctrlx :
    let (keys, val) = ioGrid(grid)
    #gotoXY(40,1) ; echo "99", keys, " val :", $val ; let n99 = getFunc();
    #gotoXy(40,1) ; echo "                                                                                                 "
    if keys == Key.Enter :
      pnlF1.field[P_F1[Nom]].field = val[1]
      pnlF1.field[P_F1[Animal]].field = val[2]
      pnlF1.field[P_F1[Prix]].field = val[3]
      displayField(pnlF1, pnlF1.field[P_F1[Nom]])
      displayField(pnlF1, pnlF1.field[P_F1[Animal]])
      displayField(pnlF1, pnlF1.field[P_F1[Prix]])
    key = Key.F1 

  else : discard