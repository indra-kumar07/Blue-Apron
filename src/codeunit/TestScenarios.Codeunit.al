codeunit 50100 TestScenarios
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure Total_calories_on_menu()
    var
        MenuInformation: Record MenuInformation;
        Ingredients1, Ingredients2, Ingredients3 : Record Ingredients;
        IngredientsList1, IngredientsList2, IngredientsList3 : Record IngredientsList;
        LibraryBlueApron: Codeunit "Library - Blue Apron";
        LibraryAssert: Codeunit "Library Assert";
    begin
        LibraryBlueApron.CreateIngredient(IngredientsList1, 'Potato', 500, 'KG');
        LibraryBlueApron.CreateIngredient(IngredientsList2, 'Tomato', 100, 'KG');
        LibraryBlueApron.CreateIngredient(IngredientsList3, 'oil', 50, 'L');

        LibraryBlueApron.CreateMenu(MenuInformation, 'Potato Fry', 155, 2);

        LibraryBlueApron.CreateIngredientLines(MenuInformation, IngredientsList1, Ingredients1, 2);
        LibraryBlueApron.CreateIngredientLines(MenuInformation, IngredientsList2, Ingredients2, 2);
        LibraryBlueApron.CreateIngredientLines(MenuInformation, IngredientsList3, Ingredients3, 2);

        
        LibraryAssert.AreEqual(1300, MenuInformation.Calories, 'Not Equal');

    end;
}