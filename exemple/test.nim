import termkey
import terminal , strformat


initScreen(42,132)
setBackgroundColor(bgBlue)
eraseScreen()
var cX,cY:Natural
var scrollX,scrollY,scrollP,scrollC:Natural
var bScroll : bool = false
showCursor()
gotoXY(1,1)

while true:
  let (key, chr)  = getTKey()

  case key
    of TKey.Escape: closeScren()

    of TKey.F1 : onMouse()

    of TKey.F2 : offMouse()

    of TKey.F3 :
        hideCursor() 
        scrollP = 10
        scrollX = 6
        scrollY = 10
        scrollC = 1
        bScroll = onScroll(scrollX,scrollP)  # 6 =  start ligne     nbr ligne  par page = 10   

        gotoXY(scrollX,scrollY)

    of TKey.F4 :
      # origine
      resizeScreen(42,132)  
      titleScreen("VTE-TERM3270")
      eraseScreen()
    of TKey.F5:
      if bScroll :
        if ( scrollC <= scrollP) : 
          gotoXY(scrollX,scrollY)
          stdout.write(fmt"{scrollC} ligne ")
          inc(scrollX)
          inc(scrollC)


    of TKey.F6 :
      bScroll = offScroll()
      bScroll = false
      scrollX = 1
      scrollY = 1
      showCursor()

    of TKey.F7 :
      var mask : string

      for u in 1..132 :
        mask = mask & "."

      for i in 1..50 : 
        gotoXY(i , 1)
        stdout.write(mask)
        gotoXY(i , 1)
        stdout.write(fmt"{i} ")

      gotoXY(1 , 1) 

    of TKey.F8: hideCursor()

    of TKey.F9: showCursor()

    of TKey.F10:
      setBackgroundColor(bgBlue)
      resizeScreen(20,80)
      setBackgroundColor(bgBlue) 
      eraseScreen()
      titleScreen("Test KEYBOARD 20/80")


    of TKey.F11:
      resizeScreen(42,132)
      setBackgroundColor(bgBlue)  
      eraseScreen()
      titleScreen("Test KEYBOARD 42/132")

    of TKey.F12 :
      getCursor(cX , cY)
      gotoXY(42 , 1)
      stdout.write(fmt"CursX > {cX} CursY > {cY}")
      gotoXY(cX , cY
      )
    of TKey.PageUp:
      if bScroll :
          upScrool(scrollP)
          scrollX = 6
          scrollC = 1
          # /.../ F5 manuel ;)

    of TKey.PageDown:
      if bScroll :
        downScrool(scrollP)
        scrollX = 6
        scrollC = 1
        # /.../  F5 manuel ;)

    of TKey.Up:
        cursorUp()

    of TKey.Down:
        cursorDown()

    of TKey.Left:
        cursorBackward()

    of TKey.Right:
        cursorForward()

    of TKey.Mouse : 
      let mi = getMouse()
      if mi.action == MouseButtonAction.mbaPressed:

        # work this first /.../ bla bla 
        case mi.button
        of mbLeft:
          gotoXY(mi.x,mi.y)

        of mbMiddle:
          gotoXY(mi.x,mi.y)
        of mbRight:
          gotoXY(mi.x,mi.y)
        else: discard
      elif mi.action == MouseButtonAction.mbaReleased:
          gotoXY(mi.x,mi.y)
          
      stdout.write fmt"CursX > {mi.x} CursY > {mi.y}"
      gotoXY(mi.x,mi.y)

    of TKey.Char:
      setCursorXPos(1)
      stdout.write(fmt"char :{RightBlack}{chr} ")

    else :
      setCursorXPos(1)
      stdout.write(fmt"key  :{RightBlack}{key} ")

  stdout.flushFile
  stdin.flushFile
