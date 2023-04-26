page 50100 "IngredientListPart"
{
    AutoSplitKey = true;
    ApplicationArea = All;
    Caption = 'Ingredient Lines';
    PageType = ListPart;
    SourceTable = Ingredients;

    layout
    {
        area(content)
        {
            repeater(General3)
            {
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Item No"; Rec."Item No")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Item No, field.';
                }
                field("Ingredient No."; Rec."Ingredient No.")
                {
                    ToolTip = 'Specifies the value of the Ingredient No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Qty. Needed"; Rec."Qty. Needed")
                {
                    ToolTip = 'Specifies the value of the Qty. Needed field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Calories; Rec.Calories)
                {
                    ToolTip = 'Specifies the value of the Calories field.';
                }
                field("Total Calories"; Rec."Total Calories")
                {
                    ToolTip = 'Specifies the value of the Total Calories field.';
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.Update();
    end;

}