object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 341
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClick = btnSacarClick
  TextHeight = 15
  object lblNumero: TLabel
    Left = 48
    Top = 48
    Width = 96
    Height = 15
    Caption = 'N'#250'mero da conta:'
  end
  object lblTitular: TLabel
    Left = 48
    Top = 88
    Width = 87
    Height = 15
    Caption = 'Nome do titular:'
  end
  object lblValor: TLabel
    Left = 48
    Top = 128
    Width = 122
    Height = 15
    Caption = 'Valor (dep'#243'sito/saque):'
  end
  object lblSaldo: TLabel
    Left = 48
    Top = 272
    Width = 78
    Height = 15
    Caption = 'Saldo: R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNumero: TEdit
    Left = 150
    Top = 48
    Width = 147
    Height = 23
    TabOrder = 0
  end
  object edtTitular: TEdit
    Left = 150
    Top = 85
    Width = 147
    Height = 23
    TabOrder = 1
  end
  object edtValor: TEdit
    Left = 176
    Top = 128
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object btnCriar: TButton
    Left = 48
    Top = 176
    Width = 87
    Height = 25
    Caption = 'Criar Conta'
    TabOrder = 3
    OnClick = btnCriarClick
  end
  object btnDepositar: TButton
    Left = 216
    Top = 176
    Width = 81
    Height = 25
    Caption = 'Depositar'
    TabOrder = 4
    OnClick = btnDepositarClick
  end
  object btnExibir: TButton
    Left = 48
    Top = 216
    Width = 87
    Height = 25
    Caption = 'Exibir Saldo'
    TabOrder = 5
    OnClick = btnExibirClick
  end
  object btnSacar: TButton
    Left = 216
    Top = 216
    Width = 81
    Height = 25
    Caption = 'Sacar'
    TabOrder = 6
    OnClick = btnSacarClick
  end
  object memLog: TMemo
    Left = 328
    Top = 48
    Width = 209
    Height = 193
    Lines.Strings = (
      '')
    TabOrder = 7
  end
end
