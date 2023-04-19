// report 50100 "MenuInfo"
// {
//     ApplicationArea = All;
//     Caption = 'MenuInfo';
//     UsageCategory = Administration;
//     RDLCLayout = 'Layouts/test.rdl';
//     // WordLayout = 'Layouts/MenuInfoRDLC.docx';
//     DefaultLayout = RDLC;
//     // PreviewMode = PrintLayout;

//     dataset
//     {
//         dataitem(MenuInformation; MenuInformation)
//         {
//             RequestFilterFields = "No.";
//             column(No; "No.") { }
//             column(Menu_Description; Description) { }
//             column(Menu_Picture; Picture) { }
//             column(Price; Price) { }
//             column(NoofServings; "No of Servings") { }
//             column(Menu_Calories; "Calories") { }
//             column(Total_Price; Total_Price) { }

//             dataitem(Ingredients; Ingredients)
//             {
//                 DataItemLinkReference = MenuInformation;
//                 DataItemLink = "Item No" = field("No.");

//                 column(Ing_Line_No_; "Line No.") { }
//                 column(Ing_Item_No; "Item No") { }
//                 column(Ingredient_No_; "Ingredient No.") { }
//                 column(Ing_Description; Description) { }
//                 column(Ing_Picture; Picture) { }
//                 column(Qty__Needed; "Qty. Needed") { }
//                 column(Unit_of_Measure; "Unit of Measure") { }
//                 column(Ing_Calories; Calories) { }
//                 column(Ing_Total_Calories; "Total Calories") { }
//                 column(T_Quantity; T_Quantity) { }
//                 column(T_calories; T_calories) { }

//                 trigger OnAfterGetRecord()
//                 begin
//                     Total_price := MenuInformation.Price * MenuInformation."No of Servings";
//                     T_Quantity := Format(Ingredients."Qty. Needed");
//                     T_calories := Format(Ingredients."Total Calories");
//                 end;

//             }

//             dataitem(PreparationInformation; PreparationInformation)
//             {
//                 DataItemLinkReference = MenuInformation;
//                 DataItemLink = "Item No" = field("No.");

//                 column(Pre_Line_No_; "Line No.") { }
//                 column(Pre_Item_No; "Item No") { }
//                 column(Pre_Description_Title; "Description Title") { }
//                 column(Pre_Description; Description) { }
//                 column(Pre_Picture; Picture) { }

//             }
//         }
//     }

//     labels
//     {
//         CompanyNameLbl = 'Blue Apron';
//         UnitPriceLbl = 'Unit Price: ';
//         NoofServingsLbl = 'No of Servings: ';
//         TotalPriceLbl = 'Total Price: ';
//         CaloriesPerUnitLbl = 'Calories Per Unit: ';
//         IngredientLbl = 'Ingredients Required:';
//         IngredientUOFLbl = 'Unit Of Measure: ';
//         IngredientCaloriesLbl = 'Calories: ';
//         IngredientQuantity = 'Quantity: ';
//     }

//     var
//         Total_Price: Decimal;
//         T_Quantity: Text;
//         T_calories: Text;

// }


// //ToDo - Empty row in report preview
