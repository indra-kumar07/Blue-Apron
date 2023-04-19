page 50108 PrepCardPart
{
    ApplicationArea = All;
    Caption = 'Preperation Image';
    PageType = CardPart;
    SourceTable = PreparationInformation;

    layout
    {
        area(content)
        {
            field("Description Title"; Rec."Description Title")
            {
                ToolTip = 'Specifies the value of the Description Title field.';
            }
            field(Picture; Rec.Picture)
            {
                ToolTip = 'Specifies the value of the Picture field.';
            }
        }
    }
}
