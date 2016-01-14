unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses SuperObject;

var
  jo: ISuperObject;
  vitem:Tsuperarray;


procedure TForm1.Button1Click(Sender: TObject);
begin
if ComboBox1.ItemIndex=-1 then
begin
  MessageBox(Form1.Handle, '请选择站点！', '提示', MB_OK+MB_ICONHAND);
  exit;
end;

if RadioGroup1.ItemIndex=-1 then
begin
   MessageBox(Form1.Handle, '请选择资料导入类型！', '提示', MB_OK+MB_ICONHAND);
   exit;
end;

if Edit1.Text='' then
begin
  MessageBox(Form1.Handle, '请选择导入文件！', '提示', MB_OK+MB_ICONHAND);
  exit;
end;

showmessage(vitem[ComboBox1.ItemIndex]['id'].AsString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  F: TextFile;
begin
   if OpenDialog1.Execute then          { Display Open dialog box }
  begin
    AssignFile(F, OpenDialog1.FileName);   { File selected in dialog box }
    Reset(F);
    Edit1.Text := OpenDialog1.FileName;                       { Put string in a TEdit control }
    CloseFile(F);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  b: TStringStream;
  s: String;
  i:integer;
begin
  Memo1.Text:='';
  b := TStringStream.Create();
  b.LoadFromFile('site.json');
  s := b.DataString;
  jo := SO(s);
  vitem:=jo.AsArray;
  for i:=0 to vitem.Length-1 do begin
    ComboBox1.Items.AddObject(vitem[i]['name'].AsString,TObject(vitem[i]['id']))
  end;
end;

end.
