#cs ----------------------------------------------------------------------------

 Author:         myName

#ce ----------------------------------------------------------------------------

; Renk kodlarını belirle
Global $aColors[9] = [0x82DCE9, 0x87FE26, 0x89FE25, 0xCDDD00, 0x36BF00, 0x81FF28, 0x45DE04, 0x41CB07, 0xE4FD35]
Global $fRunning = True

; F9 tuşuna basıldığında döngüyü durdur
HotKeySet("{F9}", "Terminate")

; MouseClick fonksiyonu
Func MouseClickOnColor($colors)
    For $color In $colors
        Local $aCoord = PixelSearch(0, 0, @DesktopWidth, @DesktopHeight, $color)
        If Not @error Then
            MouseClick("left", $aCoord[0], $aCoord[1], 1, 1)
            ;ToolTip("Clicked at (" & $aCoord[0] & ", " & $aCoord[1] & ") Color: " & Hex($color, 6), $aCoord[0], $aCoord[1])
            ;Sleep(1) ; 1 milisaniye boyunca tooltip göster
            ;ToolTip("") ; ToolTip'i kapat
        EndIf
    Next
EndFunc

; Ana döngü
While $fRunning
    MouseClickOnColor($aColors)
    Sleep(1) ; 100 milisaniye bekle
WEnd

; Terminate fonksiyonu
Func Terminate()
    $fRunning = False
EndFunc
