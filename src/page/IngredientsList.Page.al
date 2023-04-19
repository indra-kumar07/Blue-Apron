page 50106 IngredientsList
{
    ApplicationArea = All;
    Caption = 'Ingredients';
    PageType = List;
    SourceTable = IngredientsList;
    UsageCategory = Lists;
    CardPageId = IngredientsCard;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Calories; Rec.Calories)
                {
                    ToolTip = 'Specifies the value of the Calories field.';
                }
            }
        }
    }
}
