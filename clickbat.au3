#cs ----------------------------------------------------------------------------
 Author:         J.Boris
#ce ----------------------------------------------------------------------------
; Koordinatları ve renk kodunu belirle
;87fe26
;89fe25
;cddd00
;36bf00
;81ff28
;45de04
;41cb07
Global $iColor = 0x75fe1f ; Aradığın renk kodunu buraya gir
Global $fRunning = True

; F9 tuşuna basıldığında döngüyü durdur
HotKeySet("{F9}", "Terminate")

; MouseClick fonksiyonu
Func MouseClickOnColor($color)
    Local $aCoord = PixelSearch(0, 0, @DesktopWidth, @DesktopHeight, $color)
    If Not @error Then
        MouseClick("left", $aCoord[0], $aCoord[1], 1, 10)
        ToolTip("Clicked at (" & $aCoord[0] & ", " & $aCoord[1] & ")", $aCoord[0], $aCoord[1])
        Sleep(1000) ; 1 saniye boyunca tooltip göster
        ToolTip("") ; ToolTip'i kapat
    EndIf
EndFunc

; Ana döngü
While $fRunning
    MouseClickOnColor($iColor)
    Sleep(100) ; 100 milisaniye bekle
WEnd

; Terminate fonksiyonu
Func Terminate()
    $fRunning = False
EndFunc
