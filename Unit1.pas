unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uContaBancaria;

type
  TForm1 = class(TForm)
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblTitular: TLabel;
    edtTitular: TEdit;
    lblValor: TLabel;
    edtValor: TEdit;
    btnCriar: TButton;
    btnDepositar: TButton;
    btnSacar: TButton;
    btnExibir: TButton;
    lblSaldo: TLabel;
    memLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnDepositarClick(Sender: TObject);
    procedure btnSacarClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
  private
    { private declarations }
    FConta: TContaBancaria;
    procedure AtualizarSaldoNaTela;
    procedure Log(const Msg: string);
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.Math, System.SysUtils;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FConta := nil;
  lblSaldo.Caption := 'Saldo: R$ 0,00';
  memLog.Lines.Clear;

  btnDepositar.Enabled := False;
  btnSacar.Enabled := False;
  btnExibir.Enabled := False;
end;

procedure TForm1.Log(const Msg: string);
begin
  memLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ' + Msg);
end;

procedure TForm1.AtualizarSaldoNaTela;
begin
  if Assigned(FConta) then
    lblSaldo.Caption := Format('Saldo: R$ %.2n', [FConta.Saldo])
  else
    lblSaldo.Caption := 'Saldo: R$ 0,00';
end;

procedure TForm1.btnCriarClick(Sender: TObject);
var
  numero, titular: string;
begin
  numero := Trim(edtNumero.Text);
  titular := Trim(edtTitular.Text);

  if numero = '' then
  begin
    ShowMessage('Informe o número da conta.');
    Exit;
  end;

  if titular = '' then
  begin
    ShowMessage('Informe o nome do titular.');
    Exit;
  end;

  if Assigned(FConta) then
  begin
    FreeAndNil(FConta);
  end;

  FConta := TContaBancaria.Create(numero, titular);
  Log(Format('Conta criada: %s - %s', [FConta.Numero, FConta.Titular]));
  AtualizarSaldoNaTela;

  btnDepositar.Enabled := True;
  btnSacar.Enabled := True;
  btnExibir.Enabled := True;
end;

procedure TForm1.btnDepositarClick(Sender: TObject);
var
  sValor: string;
  valor: Double;
begin
  if not Assigned(FConta) then
  begin
    ShowMessage('Crie uma conta antes de operar.');
    Exit;
  end;

  sValor := Trim(edtValor.Text);
  if sValor = '' then
  begin
    ShowMessage('Informe o valor para depósito.');
    Exit;
  end;

  if not TryStrToFloat(sValor, valor) then
  begin
    ShowMessage('Valor inválido. Digite um número (ex: 100.50).');
    Exit;
  end;

  if valor <= 0 then
  begin
    ShowMessage('O valor do depósito deve ser maior que zero.');
    Exit;
  end;

  try
    FConta.Depositar(valor);
    Log(Format('Depósito: R$ %.2n', [valor]));
    AtualizarSaldoNaTela;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao depositar: ' + E.Message);
      Log('Erro depósito: ' + E.Message);
    end;
  end;
end;

procedure TForm1.btnSacarClick(Sender: TObject);
var
  sValor: string;
  valor: Double;
begin
  if not Assigned(FConta) then
  begin
    ShowMessage('Crie uma conta antes de operar.');
    Exit;
  end;

  sValor := Trim(edtValor.Text);
  if sValor = '' then
  begin
    ShowMessage('Informe o valor para saque.');
    Exit;
  end;

  if not TryStrToFloat(sValor, valor) then
  begin
    ShowMessage('Valor inválido. Digite um número (ex: 50.00).');
    Exit;
  end;

  if valor <= 0 then
  begin
    ShowMessage('O valor do saque deve ser maior que zero.');
    Exit;
  end;

  if FConta.Sacar(valor) then
  begin
    Log(Format('Saque: R$ %.2n', [valor]));
    AtualizarSaldoNaTela;
  end
  else
  begin
    ShowMessage('Saldo insuficiente para o saque solicitado.');
    Log(Format('Tentativa de saque recusada (saldo insuf.): R$ %.2n', [valor]));
  end;
end;

procedure TForm1.btnExibirClick(Sender: TObject);
begin
  if not Assigned(FConta) then
  begin
    ShowMessage('Crie uma conta antes de operar.');
    Exit;
  end;

  AtualizarSaldoNaTela;
  ShowMessage(Format('Saldo atual: R$ %.2n', [FConta.ExibirSaldo]));
  Log(Format('Exibir saldo: R$ %.2n', [FConta.ExibirSaldo]));
end;

end.

