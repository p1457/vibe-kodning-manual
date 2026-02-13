// Power Query M-kod: Kombinera flera Excel-filer från en mapp
// Användning: Klistra in i Power Query Advanced Editor

let
    // ==========================================================================
    // STEG 1: Hämta alla filer från mappen
    // ==========================================================================
    // Ändra sökvägen till din mapp
    Källa = Folder.Files("C:\Data\Månadsrapporter"),

    // ==========================================================================
    // STEG 2: Filtrera till endast Excel-filer
    // ==========================================================================
    FiltreraExcel = Table.SelectRows(
        Källa,
        each Text.EndsWith([Name], ".xlsx") or Text.EndsWith([Name], ".xls")
    ),

    // ==========================================================================
    // STEG 3: Ta bort onödiga kolumner
    // ==========================================================================
    VäljKolumner = Table.SelectColumns(
        FiltreraExcel,
        {"Content", "Name", "Date modified"}
    ),

    // ==========================================================================
    // STEG 4: Lägg till anpassad kolumn för att läsa Excel-innehåll
    // ==========================================================================
    LäggTillData = Table.AddColumn(
        VäljKolumner,
        "Data",
        each Excel.Workbook([Content], true)
    ),

    // ==========================================================================
    // STEG 5: Expandera för att se ark
    // ==========================================================================
    ExpanderaArbetsböcker = Table.ExpandTableColumn(
        LäggTillData,
        "Data",
        {"Name", "Data"},
        {"Arknamn", "ArkData"}
    ),

    // ==========================================================================
    // STEG 6: Filtrera till ett specifikt ark (t.ex. "Data")
    // ==========================================================================
    FiltreraArk = Table.SelectRows(
        ExpanderaArbetsböcker,
        each [Arknamn] = "Data"
    ),

    // ==========================================================================
    // STEG 7: Expandera tabelldata från varje ark
    // ==========================================================================
    // Först: hämta kolumnnamn från första tabellen
    FörstaTabell = FiltreraArk{0}[ArkData],
    Kolumnnamn = Table.ColumnNames(FörstaTabell),

    // Expandera alla rader
    ExpanderaData = Table.ExpandTableColumn(
        FiltreraArk,
        "ArkData",
        Kolumnnamn
    ),

    // ==========================================================================
    // STEG 8: Städa upp - ta bort hjälpkolumner
    // ==========================================================================
    TaBortHjälpkolumner = Table.RemoveColumns(
        ExpanderaData,
        {"Content", "Arknamn"}
    ),

    // ==========================================================================
    // STEG 9: Byt namn på kolumner för tydlighet
    // ==========================================================================
    OmdöptaKolumner = Table.RenameColumns(
        TaBortHjälpkolumner,
        {
            {"Name", "Källfil"},
            {"Date modified", "SenastÄndrad"}
        }
    ),

    // ==========================================================================
    // STEG 10: Sätt datatyper
    // ==========================================================================
    TypadKolumner = Table.TransformColumnTypes(
        OmdöptaKolumner,
        {
            {"SenastÄndrad", type datetime}
            // Lägg till fler kolumner här baserat på din data
        }
    )
in
    TypadKolumner


// =============================================================================
// TIPS FÖR CLAUDE CODE:
// =============================================================================
// Kopiera denna kod och be Claude:
// - "Förklara vad varje steg gör"
// - "Lägg till felhantering om en fil saknar arket 'Data'"
// - "Filtrera bort filer äldre än 30 dagar"
// - "Lägg till en kolumn som extraherar månad från filnamnet"
