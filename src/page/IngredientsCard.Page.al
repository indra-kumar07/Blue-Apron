page 50105 IngredientsCard
{
    ApplicationArea = All;
    Caption = 'Ingredients';
    PageType = Card;
    SourceTable = IngredientsList;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Calories; Rec.Calories)
                {
                    ToolTip = 'Specifies the value of the Calories field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
            }
            part("Ingredient Image"; IngredientsCardPart)
            {
                UpdatePropagation = Both;
                SubPageLink = "No." = field("No.");
            }
        }
    }
}
