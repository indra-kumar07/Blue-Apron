page 50101 "MenuInformationList"
{
    ApplicationArea = All;
    Caption = 'Blue Apron Menu';
    PageType = List;
    SourceTable = MenuInformation;
    UsageCategory = Lists;
    CardPageId = MenuInformationCard;
    Editable = false;

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
                field("No of Servings"; Rec."No of Servings")
                {
                    ToolTip = 'Specifies the value of the No of Servings field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field("Calories"; Rec."Calories")
                {
                    ToolTip = 'Specifies the value of the Total Calories field.';
                }
            }
        }
    }
    // views
    // {
    //     view("Gt 1")
    //     {
    //         Filters = where("No of Servings" = filter('>1'));
    //     }
    // }
    // trigger OnOpenPage()
    // begin
    //     Rec.SetFilter("No of Servings",'>%1',1);
    // end;
}
