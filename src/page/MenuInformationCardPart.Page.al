page 50103 "MenuInformationCardPart"
{
    ApplicationArea = All;
    Caption = 'Menu';
    PageType = CardPart;
    SourceTable = MenuInformation;

    layout
    {
        area(content)
        {
            field(Description; Rec.Description)
            {
                Caption = '';
                ToolTip = 'Specifies the value of the Description field.';
            }
            field(Picture; Rec.Picture)
            {
                ToolTip = 'Specifies the value of the Picture field.';
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action("Import Image")
            {
                ToolTip = 'Executes the Import Image action.';
                Image = Import;
                trigger OnAction()
                var
                    FileName: text;
                    Ins: InStream;
                begin
                    if UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FileName, Ins) then begin
                        Rec.Picture.ImportStream(Ins, FileName);
                        Rec.Modify(true);
                    end;
                end;
            }
            action("Remove Image")
            {
                Image = ClearLog;
                ToolTip = 'Executes the Remove Image action.';
                trigger OnAction()
                begin
                    Clear(Rec.Picture);
                    Rec.Modify(true);
                    CurrPage.Update();
                end;
            }
        }
    }
    // actions{
    //     area(Processing){
    //         action(ImportPicture)
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Import';
    //             Image = Import;
    //             ToolTip = 'Import a picture file.';

    //             trigger OnAction()
    //             var
    //                 FileManagement: Codeunit "File Management";
    //                 FileName: Text;
    //                 ClientFileName: Text;
    //             begin
    //                 if Rec.Description = '' then
    //                     Error(MustSpecifyNameErr);

    //                 if Rec.Picture.HasValue() then
    //                     if not Confirm(OverrideImageQst) then
    //                         exit;

    //                 FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
    //                 if FileName = '' then
    //                     exit;
    //             end;
    //         }
    //     }
    // }
    // var
    // SelectPictureTxt: Label 'Select a picture to upload';
    // MustSpecifyNameErr: Label 'You must specify a Item name before you can import a picture.';
    // OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
}