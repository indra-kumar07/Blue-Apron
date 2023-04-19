page 50107 IngredientsCardPart
{
    ApplicationArea = All;
    Caption = 'Ingredients Image';
    PageType = CardPart;
    SourceTable = IngredientsList;

    layout
    {
        area(content)
        {
            field(Description; Rec.Description)
            {
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
}
