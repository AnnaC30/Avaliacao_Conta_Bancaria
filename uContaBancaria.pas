unit uContaBancaria;

interface

type
  TContaBancaria = class
  private
    FNumero: string;
    FTitular: string;
    FSaldo: Double;
  public
    constructor Create(const ANumero, ATitular: string);
    procedure Depositar(const Valor: Double);
    function Sacar(const Valor: Double): Boolean;
    function ExibirSaldo: Double;

    property Numero: string read FNumero;
    property Titular: string read FTitular;
    property Saldo: Double read FSaldo;
  end;

implementation

uses
  System.SysUtils;

{ TContaBancaria }

constructor TContaBancaria.Create(const ANumero, ATitular: string);
begin
  inherited Create;
  FNumero := ANumero;
  FTitular := ATitular;
  FSaldo := 0.0;
end;

procedure TContaBancaria.Depositar(const Valor: Double);
begin
  if Valor > 0 then
    FSaldo := FSaldo + Valor
  else
    raise Exception.Create('Valor de depósito deve ser maior que zero.');
end;

function TContaBancaria.Sacar(const Valor: Double): Boolean;
begin
  Result := False;
  if Valor <= 0 then
    Exit;
  if Valor <= FSaldo then
  begin
    FSaldo := FSaldo - Valor;
    Result := True;
  end
  else
    Result := False;
end;

function TContaBancaria.ExibirSaldo: Double;
begin
  Result := FSaldo;
end;

end.

