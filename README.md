# nim_Termcurs
# NIM-LANG for terminal
# API inspired by 5250/3270


**<u>premier test fait</u>**

**IN PROGRESS**
**POSSIBLE BUG**

**IMPORT: termkey project**

<u>mise en fonction le 2020-04-15</u>

**Thank you**

  * [ Date](https://rgxdb.com/r/2V9BOC58)
  * [ MAIL](https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression)
  * Thank you to everyone who posted on github their knowledge was precious to me
  * To IBM education and their gifts of various books
  * [NCURSE](https://invisible-island.net/ncurses/announce.html)



doc [TERMCURS](http://htmlpreview.github.io/?https://github.com/AS400JPLPC/nim_termcurs/blob/master/termcurs.html)

**Resumes operation of the 5250/3270 or Ncursew (let's keep it modest).**




**<u>It is not all over.&nbsp;&nbsp;&nbsp;
I still have the part allowing to make a sub-file integrating in the screen more commonly called SFLINE or GRID</u>**  




&rarr;&nbsp; **ioMENU** in / out objects and receives the choice:  


| Func...........                    |
|------------------------------------|
| Escape = 0                         |
| Enter = 1..n                       |
| scrolling with UP..DOWN            |
| Mouse                              |
| scrolling done with the wheel      |
| validation with right or left click|
  
<br>
<br>
&nbsp;&rarr;&nbsp; **ioPANEL**&nbsp;&nbsp;&nbsp;
displays all the field labels as well as the function keys (F1 ..). the unfolding this fact according to the order in which you registered in the seq [Field] and not index on lines / cols
<br>

| Func...........| help.                                              |
|----------------|----------------------------------------------------|
| Enter          | &nbsp;&rarr;&nbsp; next field                      |
| UP             | &nbsp;&rarr;&nbsp; next field                      |
| DOWN           | &nbsp;&rarr;&nbsp; previous field                  |
| Escape         | &nbsp;&rarr;&nbsp; return field                    |
| Other KEY      | &nbsp;&rarr;&nbsp; returns to the calling procedure|



&nbsp;
&rarr;&nbsp; **USE**:

  * windows: PANEL it is its basic vocation as a frame (html)
  * texte: LABEL
  * buffer: FIELD
  * funckey: BUTTON
  * Currently does not control panel output overflows
  * To use restore you must display a panel in a panel (must be included) same for the Menus
  * The framing of the labels or fields are relative to the panel
  * in a PANEL the function keys appear automatically and are included in the Buttons  

<br>
<br>
&nbsp;
&rarr;&nbsp; **ioFIELD**
<br>

| Func...........    | help.                                                                                      |
|--------------------|--------------------------------------------------------------------------------------------|
| Enter              |&nbsp;&rarr;&nbsp; valid, next field                                                        |
| UP..DOWN           |&nbsp;&rarr;&nbsp; next field                                                               |
| TAB..STAB          |&nbsp;&rarr;&nbsp; next field                                                               |
| Insert             |&nbsp;&rarr;&nbsp;                                                                          |
| Delete             |&nbsp;&rarr;&nbsp;                                                                          |
| Left..Rigth        |&nbsp;&rarr;&nbsp;                                                                          |
| Backspace          |&nbsp;&rarr;&nbsp; Delete                                                                   |
| Home               |&nbsp;&rarr;&nbsp;                                                                          |
| End                |&nbsp;&rarr;&nbsp;                                                                          |
| Ctrl-A             |&nbsp;&rarr;&nbsp; Display a help panel specific to the field                               |
| Escape             |&nbsp;&rarr;&nbsp; Returns control to ioPanel then redisplays the field without modification|
| KEY                |&nbsp;&rarr;&nbsp; Returns control to ioPanel                                               |
|                    |                                                                                            |
| Field-Type         |                                                                                            |
|                    |                                                                                            |
| ALPHA              |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha                                     |
| ALPHA_UPPER        |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha automatique UPPER                   |
| PASSWORD           |&nbsp;&rarr;&nbsp; Managed by function: regex , hide                                        |
| ALPHA_NUMERIC      |&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and isCarPwd(2)     |
| ALPHA_NUMERIC_UPPER|&nbsp;&rarr;&nbsp; Managed by function: regex , isAlpha and isNumber(1) and isCarPwd(2)     |
| TEXT_NUMERIC       |&nbsp;&rarr;&nbsp; Managed by function: regex , Full                                        |
| DIGIT              |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1)                                 |
| DIGIT_SIGNED       |&nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1)                        |
| DECIMAL            |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (.)                             |
| DECIMAL_SIGNED     |&nbsp;&rarr;&nbsp; Managed by function: regex , (+-) and isNumber(1) (.)                    |
| DATE_ISO           |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (-)&nbsp;                       |
| DATE_US..DATE_FR   |&nbsp;&rarr;&nbsp; Managed by function: regex , isNumber(1) (/)&nbsp;                       |
| MAIL_ISO           |&nbsp;&rarr;&nbsp; Managed by function: regex , [ABNF] [RFC 2822]                           |
| YES_NO             |&nbsp;&rarr;&nbsp; Managed by function: (Y-y-N-n) automatique UPPER                         |
| SWITCH             |&nbsp;&rarr;&nbsp; Managed by function: space bar ON/OFF ◉ ◎                                |



<br>
<br>
<br>
<br>
<br>
<br>

# Main procedure

proc ioMenu(pnl: PANEL; mnu: MENU; npos: Natural): MENU.selMenu {...}

proc ioField(pnl: PANEL; fld: var FIELD): (Key) {...}

proc ioPanel(pnl: var PANEL): Key {...}

