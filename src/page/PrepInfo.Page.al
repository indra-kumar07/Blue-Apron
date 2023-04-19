page 50104 PrepInfo
{
    ApplicationArea = All;
    Caption = 'Preparation Instructions';
    PageType = ListPart;
    SourceTable = PreparationInformation;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    Visible = false;
                }
                field("Item No"; Rec."Item No")
                {
                    ToolTip = 'Specifies the value of the Item No, field.';
                    Visible = false;
                }
                field("Description Title"; Rec."Description Title")
                {
                    ToolTip = 'Specifies the value of the Description Title field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("Upload/Remove Image")
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
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Line No." := xRec."Line No." + 1000;
    end;

}
