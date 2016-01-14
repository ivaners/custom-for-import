object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 350
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 60
    Height = 13
    Caption = #36873#25321#31449#28857#65306
  end
  object Button1: TButton
    Left = 24
    Top = 312
    Width = 75
    Height = 25
    Caption = #19978#20256
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 27
    Width = 521
    Height = 21
    Style = csDropDownList
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 64
    Width = 521
    Height = 57
    Caption = #23548#20837#31867#22411
    Columns = 3
    Ctl3D = True
    Items.Strings = (
      #23186#20307#23458#25143#23548#20837
      #24191#21578#23186#20307#21512#20316#23458#25143#23548#20837
      #31532#19977#26041#20250#21592#23548#20837'('#28120#23453#65292#20140#19996#65292#25293#25293#65292'1'#21495#24215')')
    ParentCtl3D = False
    TabOrder = 2
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 24
    Top = 142
    Width = 440
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 470
    Top = 140
    Width = 75
    Height = 25
    Caption = #36873#25321'..'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 185
    Width = 521
    Height = 112
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 120
    Top = 304
  end
end
