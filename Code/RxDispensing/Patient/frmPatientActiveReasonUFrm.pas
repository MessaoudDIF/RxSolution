unit frmPatientActiveReasonUFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzDlgBtn, RzLine, ExtCtrls;

type
  TfrmPatientActiveReasonFrm = class(TForm)
    pnlRXBackground: TPanel;
    pnlForm_Header: TPanel;
    lblDispenser: TLabel;
    rzdButtons: TRzDialogButtons;
    RzComboBox1: TRzComboBox;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

  
type
  TRXReason = class(TObject)
  public
     class function Show(vactive: Boolean; const vOption: integer = 0): String;
  end;
{
var
  frmPatientActiveReasonFrm: TfrmPatientActiveReasonFrm;
}

implementation

{$R *.dfm}

class function TRXReason.Show(vactive: Boolean; const vOption: integer = 0): String;
var
  frmRxReason: TfrmPatientActiveReasonFrm;
  vReason: string;
begin

  Result := '';

  frmRxReason := TfrmPatientActiveReasonFrm.Create(nil);

  //Load reasons for patient changin active status
  with frmRxReason.RzComboBox1 do
   begin
   Items.Clear;
   if vactive then
    begin
    Items.Add('Duplicate');
    Items.Add('Transferred Out');
    Items.Add('Deceased');
    Items.Add('Archived');
    end
   else
    begin
    Items.Add('Transferred In');
    Items.Add('Restored');
    end;
   end;

   //Load reasons for system user changing status
 if vOption =1 then
  with frmRxReason.RzComboBox1 do
   begin
   Items.Clear;
   if vactive then
    begin
    Items.Add('Duplicate');
    Items.Add('Resigned');
    Items.Add('Transferred');
    Items.Add('Archived'); 
    end
   else
    begin
    Items.Add('New position');
    Items.Add('Restored');
    Items.Add('Other');
    end;
   end; 

  if frmRxReason.ShowModal = mrOK then
   begin
   vReason := frmRxReason.RzComboBox1.Text;
   Result := vReason;
   end;
  frmRxReason.Free;

end;

end.
