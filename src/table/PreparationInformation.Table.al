table 50102 "PreparationInformation"
{
    Caption = 'PreparationInformation';
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
        field(3; Picture; Media)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(4; "Description Title"; Text[100])
        {
            Caption = 'Description Title';
            DataClassification = CustomerContent;
        }
        field(5; Description; Text[2048])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Line No.", "Item No")
        {
            Clustered = true;
        }
    }
}
