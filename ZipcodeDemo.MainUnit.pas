unit ZipcodeDemo.MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TFormMain = class(TForm)
    BtnCheckStatus: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    Edit5: TEdit;
    Label4: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Button4: TButton;
    Edit8: TEdit;
    Memo1: TMemo;
    Label5: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Button5: TButton;
    Edit11: TEdit;
    Label6: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Button6: TButton;
    Edit14: TEdit;
    StyleBook1: TStyleBook;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    procedure BtnCheckStatusClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  System.Threading, System.JSON;

procedure TFormMain.BtnCheckStatusClick(Sender: TObject);
begin
  var
  HTTP := TNetHTTPClient.Create(nil);
  try
    var
    Response := HTTP.Get
      ('https://app.zipcodebase.com/api/v1/status?apikey=2dcdac40-c868-11ed-89a3-9f38d4d6f5a2');

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      RESTClient1.ResetToDefaults;
      RESTClient1.Accept :=
        'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient1.BaseURL := 'https://app.zipcodebase.com/api/v1/search';
      RESTClient1.ContentType := 'application/json';

      RESTRequest1.ClearBody;
      RESTRequest1.Params.Clear;

      // API acc. key
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[0].Kind := pkHTTPHEADER;
      RESTRequest1.Params.Items[0].Name := 'apikey';
      RESTRequest1.Params.Items[0].Value :=
        '2dcdac40-c868-11ed-89a3-9f38d4d6f5a2';
      RESTRequest1.Params.Items[0].Options := [poDoNotEncode];

      // codes
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[1].Kind := pkGETorPOST;
      RESTRequest1.Params.Items[1].Name := 'codes';
      RESTRequest1.Params.Items[1].Value := Edit1.Text;
      RESTRequest1.Params.Items[1].Options := [poDoNotEncode];

      RESTRequest1.Execute;

    end);
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
 TTask.Run(
    procedure
    begin
      RESTClient1.ResetToDefaults;
      RESTClient1.Accept :=
        'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient1.BaseURL := 'https://app.zipcodebase.com/api/v1/distance';
      RESTClient1.ContentType := 'application/json';

      RESTRequest1.ClearBody;
      RESTRequest1.Params.Clear;

      // API acc. key
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[0].Kind := pkHTTPHEADER;
      RESTRequest1.Params.Items[0].Name := 'apikey';
      RESTRequest1.Params.Items[0].Value :=
        '2dcdac40-c868-11ed-89a3-9f38d4d6f5a2';
      RESTRequest1.Params.Items[0].Options := [poDoNotEncode];

      // codes
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[1].Kind := pkGETorPOST;
      RESTRequest1.Params.Items[1].Name := 'code';
      RESTRequest1.Params.Items[1].Value := Edit3.Text;
      RESTRequest1.Params.Items[1].Options := [poDoNotEncode];

      // compare
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[2].Kind := pkGETorPOST;
      RESTRequest1.Params.Items[2].Name := 'compare';
      RESTRequest1.Params.Items[2].Value := Edit4.Text;
      RESTRequest1.Params.Items[2].Options := [poDoNotEncode];

      // country
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[3].Kind := pkGETorPOST;
      RESTRequest1.Params.Items[3].Name := 'country';
      RESTRequest1.Params.Items[3].Value := Edit5.Text;
      RESTRequest1.Params.Items[3].Options := [poDoNotEncode];

      RESTRequest1.Execute;

    end);
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;

procedure TFormMain.Button4Click(Sender: TObject);
begin
  // code
  // radius
  // country

  // https://app.zipcodebase.com/api/v1/radius?apikey=2dcdac40-c868-11ed-89a3-9f38d4d6f5a2
  // &code=10005&radius=100&country=us

 TTask.Run(
    procedure
    begin
      RESTClient1.ResetToDefaults;
      RESTClient1.Accept :=
        'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient1.BaseURL := 'https://app.zipcodebase.com/api/v1/distance';
      RESTClient1.ContentType := 'application/json';

      RESTRequest1.ClearBody;
      RESTRequest1.Params.Clear;

      // API acc. key
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[0].Kind := pkHTTPHEADER;
      RESTRequest1.Params.Items[0].Name := 'apikey';
      RESTRequest1.Params.Items[0].Value :=
        '2dcdac40-c868-11ed-89a3-9f38d4d6f5a2';
      RESTRequest1.Params.Items[0].Options := [poDoNotEncode];

      // codes
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[1].Kind := pkGETorPOST;
      RESTRequest1.Params.Items[1].Name := 'code';
      RESTRequest1.Params.Items[1].Value := Edit6.Text;
      RESTRequest1.Params.Items[1].Options := [poDoNotEncode];

      // compare
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[2].Kind := pkGETorPOST;
      RESTRequest1.Params.Items[2].Name := 'radius';
      RESTRequest1.Params.Items[2].Value := Edit7.Text;
      RESTRequest1.Params.Items[2].Options := [poDoNotEncode];

      // country
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[3].Kind := pkGETorPOST;
      RESTRequest1.Params.Items[3].Name := 'country';
      RESTRequest1.Params.Items[3].Value := Edit8.Text;
      RESTRequest1.Params.Items[3].Options := [poDoNotEncode];

      RESTRequest1.Execute;

    end);
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);

end;

procedure TFormMain.Button5Click(Sender: TObject);
begin
  // codes
  // distance
  // country

// https://app.zipcodebase.com/api/v1/match
// codes=10005%2C10006%2C10009%2C90001&distance=100&country=us


(*params = (
   ("codes","10005,10006,10009,90001"),
   ("distance","100"),
   ("country","us"),
);*)

end;

end.
