page 50102 "MenuInformationCard"
{
    ApplicationArea = All;
    Caption = 'Menu';
    PageType = Card;
    SourceTable = MenuInformation;


    layout
    {
        area(content)
        {
            group("Menu Information")
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
                    Importance = Promoted;
                }
                field("Unit Price"; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field("Calories"; Rec."Calories")
                {
                    ToolTip = 'Specifies the value of the Total Calories field.';
                }
                field("No of Servings"; Rec."No of Servings")
                {
                    ToolTip = 'Specifies the value of the No of Servings field.';
                }
            }
            part("Ingredient Lines"; IngredientListPart)
            {
                UpdatePropagation = Both;
                SubPageLink = "Item No" = field("No.");
            }
            part("Preperation Lines"; PrepInfo)
            {
                UpdatePropagation = Both;
                SubPageLink = "Item No" = field("No.");
            }
        }
        area(FactBoxes)
        {
            part("Menu Image"; MenuInformationCardPart)
            {
                SubPageLink = "No." = field("No.");
            }
            part(IngredientImage; IngredientsCardPart)
            {
                Provider = "Ingredient Lines";
                SubPageLink = "No." = field("Ingredient No.");
            }
            part(PreperationImage; PrepCardPart)
            {
                Provider = "Preperation Lines";
                SubPageLink = "Line No." = field("Line No."), "Item No" = field("Item No");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Print Menu")
            {
                Image = Print;
                ToolTip = 'Executes the Print Menu action.';
                trigger OnAction()
                var
                    MenuInformation: Record MenuInformation;
                begin
                    MenuInformation.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Blue Apron Report", true, true, MenuInformation);
                end;
            }
        }
        area(Promoted)
        {
            actionref(p_print; "Print Menu") { }
        }
    }
}
