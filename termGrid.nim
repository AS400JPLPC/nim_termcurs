import terminal
import termkey
import termcurs
type
  LABEL_FMT1 {.pure.} = enum 
    Lnom,
    Lanimal
  FIELD_FMT1 {.pure.}= enum 
    Nom,
    Animal

const P_L1: array[LABEL_FMT1, int] = [0,1]

const P_F1: array[FIELD_FMT1, int] = [0,1]

InitScreen()
setTerminal() #default color style erase

var pnlF1  = new(PANEL)
var grid  : TermGrid
var g_line : int 
var key : Key = Key.None

while true:
  if key == Key.F3 :  CloseScren()
  if key != Key.F1 and key != Key.F2 and key != Key.F5 and key != Key.F9 and
    key != Key.PageUP and key != Key.PageDown  and key != Key.CtrlX  : key = getFunc()
  case key
  of Key.F1:

    if not isActif(pnlF1) :  # init Panel

      defPanel(pnlF1,"nom",1,1,terminalHeight(),terminalWidth(),bgBlack,false,fgWhite,false,CADRE.line0,"",0,len(P_L1),len(P_F1),0,
      @[button(Key.F3,"Exit"),button(Key.F2,"Def Grid"),button(Key.F9,"Add Row"),button(Key.F5,"Print Grig"),button(Key.CtrlX,"Sel Ligne"),
      button(Key.PageUP,""),button(Key.PageDown,"")])

      fldLabel(pnlF1.label[P_L1[Lnom]],$Lnom, 2, 5,  "Nom.....:")
      fldString(pnlF1.field[P_F1[Nom]],$Nom, 2, 5+(len(pnlF1.label[P_L1[Lnom]].label)), ALPHA, 20, "Jean-Pierre",FILL, "Nom Obligatoire", "Type Alpha a-Z")

      fldLabel(pnlF1.label[P_L1[Lanimal]],$Lanimal, 4, 5,  "Animal..:")
      fldString(pnlF1.field[P_F1[Animal]],$Animal, 4, 5+(len(pnlF1.label[P_L1[Lanimal]].label)), TEXT_NUMERIC,30, "Chat",FILL, "Animale Obligatoire", "Type Alpha a-Z")

      printPanel(pnlF1)

    key = ioPanel(pnlF1)

  of Key.F2:
    grid = newTermGrid("GRID01",10,1,5)
    var g_id    : Cell = newCell("ID",3)
    var g_name  : Cell = newCell("Name",20)
    var g_animal : Cell = newCell("Fav animal",30)
    g_line = - 1 


    setHeaders(grid, @[g_id, g_name, g_animal])
    nRow(g_line);    addRows(grid, @[$g_line, "Adam", "Cat, Aigle"])
    nRow(g_line);    addRows(grid, @[$g_line, "Eve" , "Cat, Papillon"])
    nRow(g_line);    addRows(grid, @[$g_line, "Roger", "Singe"])
    nRow(g_line);    addRows(grid, @[$g_line, "Ginette" , "Chien"])
    nRow(g_line);    addRows(grid, @[$g_line, "Maurice", "Dauphin"])
    nRow(g_line);    addRows(grid, @[$g_line, "Elisabhet" , "Oiseaux"])
    nRow(g_line);    addRows(grid, @[$g_line, "Eric", "Poisson"])
    nRow(g_line);    addRows(grid, @[$g_line, "Daniel" ,"Insect"])
    nRow(g_line);    addRows(grid, @[$g_line, "Mendi", "Chien"])
    nRow(g_line);    addRows(grid, @[$g_line, "Simon" ,"Scorpion"])

    #gotoXY(39,1) ; echo "60"; let y = getFunc();
    PrintGridHeader(grid)
    key = Key.F1

  of Key.F9:
    if grid.actif:
      nRow(g_line)
      addRows(grid,@[$g_line, pnlF1.fldString($Nom), pnlF1.fldString($Animal)])
      setPage(grid)
      grid.curspage = grid.pages
      PrintGridRows(grid)
    key = Key.F1


  of Key.F5:
    PrintGridRows(grid)

    key = Key.F1 

  of Key.PageUp :
    if grid.curspage > 0 : dec(grid.curspage)
    PrintGridRows(grid)
    key = Key.F1 
  of Key.PageDown :
    if grid.curspage < grid.pages : inc(grid.curspage)
    PrintGridRows(grid)
    key = Key.F1 

  of Key.Ctrlx :
    let (keys, val) = ioGrid(grid)
    #gotoXY(40,1) ; echo "99", keys, " val :", $val ; let n99 = getFunc();
    #gotoXy(40,1) ; echo "                                                                                                 "
    if keys == Key.Enter :
      pnlF1.field[P_F1[Nom]].field = val[1]
      pnlF1.field[P_F1[Animal]].field = val[2]
      displayField(pnlF1, pnlF1.field[P_F1[Nom]])
      displayField(pnlF1, pnlF1.field[P_F1[Animal]])
    key = Key.F1 

  else : discard