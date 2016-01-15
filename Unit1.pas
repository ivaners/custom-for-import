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

uses SuperObject,HproseClient, HproseCommon, HproseHttpClient;

var
  jo: ISuperObject;
  vitem:Tsuperarray;


procedure TForm1.Button1Click(Sender: TObject);
var
  CsvLines, CommaStr: TStringList;
  i:integer;
  client : THproseHttpClient;     //����HproseClient����
  Args: TVariants;                //RPCԶ�̺����Ĳ���
  Rslt: string;//����ֵ
begin
  if ComboBox1.ItemIndex=-1 then
  begin
    MessageBox(Form1.Handle, '��ѡ��վ�㣡', '��ʾ', MB_OK+MB_ICONHAND);
    exit;
  end;

  if RadioGroup1.ItemIndex=-1 then
  begin
     MessageBox(Form1.Handle, '��ѡ�����ϵ������ͣ�', '��ʾ', MB_OK+MB_ICONHAND);
     exit;
  end;

  if Edit1.Text='' then
  begin
    MessageBox(Form1.Handle, '��ѡ�����ļ���', '��ʾ', MB_OK+MB_ICONHAND);
    exit;
  end;

  CsvLines := TStringList.Create;
  CommaStr := TStringList.Create;
  CsvLines.LoadFromFile(Edit1.Text);  //��ȡ

  for i:=1 to CsvLines.Count-1 do
    CommaStr.CommaText := CsvLines[i];
  SetLength(Args, 2);

  client := THproseHttpClient.Create(nil);
  client.UseService('http://l.gzbms.com/newbms/index.php?app=api&mod=common');
  Rslt:=VarToStr(client.Invoke('test',Args));
  showmessage(Rslt);
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
