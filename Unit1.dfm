object main: Tmain
  Left = 235
  Top = 130
  Width = 611
  Height = 420
  Caption = 'Indra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000E7EFEEF88EE0000000000000000000000EEE88FFEEE0000000000000000
    00000EFEEEEE8E78E00000000000000000000EEE8EE8F8EE0000000000000000
    000000E88E78EFE7E0000000000000000000007E8E8EE88EE000000000000000
    0000000EFEEEEFEF0000000000000000000000EF887EE7F80000000000000000
    000000E8FF88EE8E00000000000000000000007FFEFE8E800000000000000000
    000000E8EE878EFE00000000000000000000000E88F8FE8E0000000000000000
    000000E8EF878E800000000000000000000000F7E88F8EF00000000000000000
    000000EE8FFF8EE000000000000000000000000EE88FE7E00000000000000000
    0000000E8EEFEE00000000000000000000000000000000000000000000000000
    00000007778F8800000000000000000000000007778F88000000000000000000
    000000007777F70000000000000000000000000788FF80000000000000000000
    0000007888FF80000000000000007777777777888FF800000000000000008888
    8888888FFFF80000000000000000FFFFFFFFFFFFFF800000000000000000F8F8
    F8F8F8F8F00000000000000000000000078F8000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000797
    979797970000000000000000000000F9F9F9F9F000000000000000000000FF80
    0FFFFFC00FFFFF8007FFFF800FFFFFC007FFFFC007FFFFE00FFFFFC00FFFFFC0
    0FFFFFC01FFFFFC00FFFFFE00FFFFFC01FFFFFC01FFFFFC01FFFFFE01FFFFFE0
    3FFFFFC01FFFFFC01FFFFFC01FFFFFE01FFFFFC03FFF00003FFF00007FFF0000
    7FFF0000FFFF0001FFFF0007FFFFF87FFFFFFCFFFFFF800FFFFFC01FFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 120
  TextHeight = 16
  object Fond: TPaintBox
    Left = 0
    Top = 41
    Width = 603
    Height = 351
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnMouseDown = FondMouseDown
    OnMouseMove = FondMouseMove
    OnMouseUp = FondMouseUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 44
      Height = 16
      Caption = 'Speed:'
    end
    object Edit1: TEdit
      Left = 56
      Top = 8
      Width = 57
      Height = 24
      Hint = 'Nombre de gougouttes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '1500'
    end
    object Button1: TButton
      Left = 122
      Top = 8
      Width = 87
      Height = 25
      Hint = 'Ouvrir le robinet ;-)'
      Caption = 'Start'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 8
      Width = 65
      Height = 25
      Hint = 'Vire moi tou ca ! en vitesse !'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 528
      Top = 8
      Width = 65
      Height = 25
      Hint = 'Good bye...'
      Caption = 'Exit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      Left = 448
      Top = 8
      Width = 74
      Height = 25
      Caption = 'About'
      TabOrder = 4
      OnClick = Button3Click
    end
  end
end
