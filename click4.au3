#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
; Renk kodlarını belirle
Global $aColors[9] = [0x82DCE9, 0x87FE26, 0x89FE25, 0xCDDD00, 0x36BF00, 0x81FF28, 0x45DE04, 0x41CB07, 0xE4FD35]
Global $fRunning = True

; F9 tuşuna basıldığında döngüyü durdur
HotKeySet("{F9}", "Terminate")

; MouseClick fonksiyonu
Func MouseClickOnColor($colors)
    For $color In $colors
        ; Belirli bir rengi birden fazla pikselde arayalım
        Local $aCoord = PixelSearch(0, 0, @DesktopWidth, @DesktopHeight, $color, 10, 1)
        While Not @error
            For $i = 0 To UBound($aCoord) - 1 Step 2
                MouseClick("left", $aCoord[$i], $aCoord[$i + 1], 1, 0) ; En hızlı tıklama için 0 ms bekleme süresi
            Next
            ; Aynı rengi tekrar arayalım, önceki bulunduğu yerden itibaren devam edelim
            $aCoord = PixelSearch($aCoord[0] + 1, $aCoord[1], @DesktopWidth, @DesktopHeight, $color, 10, 1)
        WEnd
    Next
EndFunc

; Ana döngü
While $fRunning
    MouseClickOnColor($aColors)
	;Sleep(1) ;
WEnd

; Terminate fonksiyonu
Func Terminate()
    $fRunning = False
EndFunc

