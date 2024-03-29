unit uCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TCliente = record
    codigo, idade: Integer;
    nome, cidade, sobrenome, sexo: string;
    ativo: Boolean;
    salario: Float32;
  end;

  Tfrm_cliente = class(TForm)
    Label1: TLabel;
    edt_codigo: TEdit;
    Label2: TLabel;
    edt_nome: TEdit;
    Label3: TLabel;
    edt_idade: TEdit;
    Label4: TLabel;
    edt_salario: TEdit;
    Label5: TLabel;
    edt_cidade: TEdit;
    Label8: TLabel;
    edt_sobrenome: TEdit;
    cbSexo: TComboBox;
    Label6: TLabel;
    cbAtivo: TCheckBox;
    btn_gravar: TButton;
    btn_limpar: TButton;
    btn_tirarCarteira: TButton;
    Memo1: TMemo;
    ImprimirTodos: TButton;
    CarregarCliente: TButton;
    procedure btn_gravarClick(Sender: TObject);
    procedure validarCampos();
    procedure limparCampos();
    procedure btn_limparClick(Sender: TObject);
    procedure btn_tirarCarteiraClick(Sender: TObject);
    procedure inserirClienteLista(cliente: TCliente);
    procedure ImprimirTodosClick(Sender: TObject);
    procedure CarregarClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cliente: Tfrm_cliente;
  aCliente: Array [0 .. 10] of TCliente;

implementation

{$R *.fmx}

procedure Tfrm_cliente.btn_gravarClick(Sender: TObject);
var
  vCliente: TCliente;
begin
  validarCampos;

  // atribuindo os valores
  vCliente.codigo := StrToInt(edt_codigo.Text);
  vCliente.nome := edt_nome.Text;
  vCliente.sobrenome := edt_sobrenome.Text;
  vCliente.idade := StrToInt(edt_idade.Text);
  vCliente.salario := StrToFloat(edt_salario.Text);
  vCliente.ativo := cbAtivo.IsChecked;
  vCliente.cidade := edt_cidade.Text;
  if cbSexo.ItemIndex = 0 then
    vCliente.sexo := 'Masculino'
  else
    vCliente.sexo := 'Feminino';

  inserirClienteLista(vCliente);

  ShowMessage('Cliente Cadastrado com sucesso ');
end;

procedure Tfrm_cliente.btn_limparClick(Sender: TObject);
begin
  limparCampos;
end;

procedure Tfrm_cliente.btn_tirarCarteiraClick(Sender: TObject);
begin
  {
    if idade >= 18 then
    ShowMessage('Pode tirar carteira')
    else
    ShowMessage('N�o pode tirar carteira.'); }
end;

procedure Tfrm_cliente.CarregarClienteClick(Sender: TObject);
var
  codigoBusca, I: Integer;
begin
  codigoBusca := StrToInt(edt_codigo.Text);
  for I := 0 to 10 do
  begin
    if codigoBusca = aCliente[I].codigo then
    begin
      Memo1.Lines.Add('Cliente Encontrado');
      Memo1.Lines.Add('Cliente cod: ' + IntToStr(aCliente[I].codigo));
      Memo1.Lines.Add('Nome completo: ' + aCliente[I].nome + '' + aCliente[I]
        .sobrenome);
      Memo1.Lines.Add('Idade: ' + IntToStr(aCliente[I].idade));
      Memo1.Lines.Add('Cidade: ' + aCliente[I].cidade);
      Memo1.Lines.Add('Salario: ' + FloatToStr(aCliente[I].salario));
      Memo1.Lines.Add('Ativo: ' + aCliente[I].ativo.ToString());
      Memo1.Lines.Add('======================');
      break;
    end;

  end;

end;

procedure Tfrm_cliente.ImprimirTodosClick(Sender: TObject);
var
  I: Integer;
begin

  for I := 0 to 10 do
  begin
    if aCliente[I].codigo <> 0 then
    begin
      Memo1.Lines.Add('Cliente cod: ' + IntToStr(aCliente[I].codigo));
      Memo1.Lines.Add('Nome completo: ' + aCliente[I].nome + '' + aCliente[I]
        .sobrenome);
      Memo1.Lines.Add('Idade: ' + IntToStr(aCliente[I].idade));
      Memo1.Lines.Add('Cidade: ' + aCliente[I].cidade);
      Memo1.Lines.Add('Salario: ' + FloatToStr(aCliente[I].salario));
      Memo1.Lines.Add('Ativo: ' + aCliente[I].ativo.ToString());
      Memo1.Lines.Add('======================');

    end;

  end;
end;

procedure Tfrm_cliente.inserirClienteLista(cliente: TCliente);
var
  I: Integer;
begin
  for I := 0 to 10 do
    if aCliente[I].codigo = 0 then
    begin
      aCliente[I] := cliente;
      break;
    end;
end;

procedure Tfrm_cliente.limparCampos;
begin
  edt_codigo.Text := '';
  edt_nome.Text := '';
  edt_sobrenome.Text := '';
  edt_salario.Text := '';
  edt_cidade.Text := '';
end;

procedure Tfrm_cliente.validarCampos;
begin
  if edt_codigo.Text = '' then
  begin
    ShowMessage('Campo codigo � obrigatorio!');
    edt_codigo.SetFocus;
    abort;
  end;
  if edt_nome.Text = '' then
  begin
    ShowMessage('Campo nome � obrigatorio!');
    edt_nome.SetFocus;
    abort;
  end;
  if edt_sobrenome.Text = '' then
  begin
    ShowMessage('Campo sobrenome � obrigatorio!');
    edt_sobrenome.SetFocus;
    abort;
  end;
  if edt_cidade.Text = '' then
  begin
    ShowMessage('Campo cidade � obrigatorio!');
    edt_cidade.SetFocus;
    abort;
  end;
  if edt_salario.Text = '' then
  begin
    ShowMessage('Campo salario � obrigatorio!');
    edt_salario.SetFocus;
    abort;
  end;

  if edt_idade.Text = '' then
  begin
    ShowMessage('Campo idade � obrigatorio!');
    edt_idade.SetFocus;
    abort;
  end;

end;

end.
