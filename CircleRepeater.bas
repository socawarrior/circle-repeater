Attribute VB_Name = "Module1"
Sub circleRepeater()
    'This macro creates an oval shape and copy & pastes to every slide in the presentation
    
    'set shape objects, x (for  loop), defualt width and height objects
    Dim oSh As Shape
    Dim x As Long
    DefaultSlideWidth = ActivePresentation.PageSetup.SlideWidth
    DefaultSlideHeight = ActivePresentation.PageSetup.SlideHeight

    'create oval shape and set size
    Set oSh = ActivePresentation.Slides(1).Shapes.AddShape(Type:=msoShapeOval, _
    Left:=150, Top:=50, Width:=470, Height:=350)

    'set oval shape's border color, width, fill, then centers the shape and copies it
    With oSh
        .Line.ForeColor.RGB = RGB(255, 51, 51)
        .Line.Weight = 3
        .Fill.Transparency = 1
        .LockAspectRatio = msoTrue
        .Left = (DefaultSlideWidth - .Width) / 2
        .Top = (DefaultSlideHeight - .Height) / 2
        .Copy
    End With

    'paste shape onto every slide in the presentation
    For x = 2 To ActivePresentation.Slides.Count
        ActivePresentation.Slides(x).Shapes.Paste
    Next

End Sub
