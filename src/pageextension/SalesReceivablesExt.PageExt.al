pageextension 50100 "Sales&ReceivablesExt" extends "Sales & Receivables Setup"
{
    layout
    {
        addbefore("Customer Nos.")
        {
            field("Menu Nos."; Rec."Menu Nos.")
            {
                ToolTip = 'Specifies the value of the Menu Nos. field.';
            }
            field("Ingredient Nos."; Rec."Ingredient Nos.")
            {
                ToolTip = 'Specifies the value of the Ingredient Nos. field.';
            }
        }
    }
}
