SCREEN 12
RANDOMIZE TIMER
CLS
' --- 1. Рисуем звездное небо ---
FOR i = 1 TO 100
    x = INT(RND * 640)
    y = INT(RND * 320)
    c = 7 + INT(RND * 9) ' Случайный светлый цвет
    ' Рисуем "крупную" звезду (крестик)
    PSET (x, y), c
    PSET (x + 1, y), c
    PSET (x - 1, y), c
    PSET (x, y + 1), c
    PSET (x, y - 1), c
NEXT i
' --- 2. Параметры пирамиды ---
topX = 320: topY = 150      ' Вершина
baseY = 400                 ' Линия основания
leftX = 120: centerX = 400: rightX = 520 ' Точки основания
' Сначала рисуем левую грань (Желтую)
LINE (topX, topY)-(leftX, baseY), 14
LINE (leftX, baseY)-(centerX, baseY), 14
LINE (centerX, baseY)-(topX, topY), 14
' Точка заливки чуть выше основания и между левым краем и центром
PAINT (centerX - 50, baseY - 5), 14, 14

' Затем рисуем правую грань (Коричневую)
LINE (topX, topY)-(rightX, baseY), 6
LINE (rightX, baseY)-(centerX, baseY), 6
LINE (centerX, baseY)-(topX, topY), 6
' Точка заливки чуть выше основания и между центром и правым краем
PAINT (centerX + 20, baseY - 5), 6, 6

' --- 5. Добавляем объем (горизонтальные линии блоков) ---
FOR h = 1 TO 10
    currY = topY + (h * (baseY - topY) / 10)
    
    ' Вычисляем границы линий для каждой грани
    ls = topX - (h * (topX - leftX) / 10)
    le = topX + (h * (centerX - topX) / 10)
    re = topX + (h * (rightX - topX) / 10)
    
    LINE (ls, currY)-(le, currY), 0 ' Линии на светлой грани
    LINE (le, currY)-(re, currY), 0   ' Линии на темной грани
NEXT h

' --- 6. Песок (линия горизонта) ---
LINE (0, baseY)-(640, baseY), 7

' --- Финал ---
'LOCATE 2, 25: COLOR 15
'PRINT "GIZA PLATEAU BY NIGHT"
'LOCATE 25, 20
'PRINT "Press any key to exit..."

SLEEP
CLS
END
