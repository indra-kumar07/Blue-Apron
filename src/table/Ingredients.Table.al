table 50101 "Ingredients"
{
    Caption = 'Ingredients';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            // InitValue = 1000;
        }
        field(2; "Item No"; code[20])
        {
            Caption = 'Item No,';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Ingredient No."; Code[20])
        {
            Caption = 'Ingredient No.';
            TableRelation = IngredientsList."No.";

            trigger OnValidate()
            var
                IngredientsList: Record IngredientsList;
            begin
                if IngredientsList.Get("Ingredient No.") then begin
                    Description := IngredientsList.Description;
                    validate(Picture, IngredientsList.Picture);
                    validate("Unit of Measure", IngredientsList."Unit of Measure");
                    Validate(Calories, IngredientsList.Calories);
                end;
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; Picture; Media)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(6; "Qty. Needed"; Decimal)
        {
            Caption = 'Qty. Needed';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if Description = '' then
                    Error('Description field must have a value');
                // "Total Calories" := Calories * "Qty. Needed";
                validate("Total Calories", Calories * "Qty. Needed");
            end;
        }
        field(7; "Unit of Measure"; Code[10])
        {
            Caption = 'Unit of Measure';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; Calories; Decimal)
        {
            Caption = 'Calories';
            DataClassification = CustomerContent;
            Editable = false;
            trigger OnValidate()
            begin
                // "Total Calories" := Calories * "Qty. Needed";
                Validate("Total Calories", Calories * "Qty. Needed");
            end;
        }
        field(9; "Total Calories"; Decimal)
        {
            Caption = 'Total Calories';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Item No", "Line No.")
        {
            Clustered = true;
        }
    }
}
