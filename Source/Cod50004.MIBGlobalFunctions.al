codeunit 50004 "MIB Global Specifications"
{
    Procedure ItemCostAdjustement(var PurchRcptLine: record "Purch. Rcpt. Line"; var TempTrackingSpecification: Record "Tracking Specification" temporary)
    var
        Item: record Item;
        ItemJournalLine: RECORD "Item Journal Line";
        PurchaseSetup: record "Purchases & Payables Setup";
        LastLineNo: integer;
        Component: Record "BOM Component";
        TotalCost: Decimal;
        c: Codeunit "Item Tracking Data Collection";
        TempTrackingSpecificationComp: Record "Tracking Specification" temporary;

    begin
        if PurchRcptLine.type <> PurchRcptLine.type::Item then
            exit;
        PurchaseSetup.get;
        if not PurchaseSetup."MIBAutomatic FG Cost Adj" then
            exit;

        PurchRcptLine.TestField("Direct Unit Cost");
        PurchaseSetup.TestField("MIBDefault Template Name");
        PurchaseSetup.TestField("MIBDefault Batch Name");

        Item.get(PurchRcptLine."No.");
        Item.CalcFields("Assembly BOM");
        if not Item."Assembly BOM" then
            exit;

        ItemJournalLine.reset;
        ItemJournalLine.setrange("Journal Template Name", PurchaseSetup."MIBDefault Template Name");
        ItemJournalLine.setrange("Journal Batch Name", PurchaseSetup."MIBDefault Batch Name");
        if ItemJournalLine.FindLast() then
            LastLineNo := ItemJournalLine."Line No." + 10000
        else
            LastLineNo := 10000;

        ItemJournalLine.init;
        ItemJournalLine.validate("Journal Template Name", PurchaseSetup."MIBDefault Template Name");
        ItemJournalLine.validate("Journal Batch Name", PurchaseSetup."MIBDefault Batch Name");
        ItemJournalLine."Line No." := LastLineNo;
        ItemJournalLine.validate("Document No.", PurchRcptLine."Document No.");
        ItemJournalLine.validate("Posting Date", PurchRcptLine."Posting Date");
        ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"Negative Adjmt.");
        ItemJournalLine.Validate("Item No.", PurchRcptLine."No.");
        ItemJournalLine.validate("Variant Code", PurchRcptLine."Variant Code");
        ItemJournalLine.validate("Unit of Measure Code", PurchRcptLine."Unit of Measure Code");
        ItemJournalLine.validate("Location Code", PurchRcptLine."Location Code");
        ItemJournalLine.Validate(Quantity, PurchRcptLine.Quantity);
        ItemJournalLine.validate("Unit Amount", PurchRcptLine."Direct Unit Cost");
        ItemJournalLine.insert(true);
        FillItemTrackingLine(ItemJournalLine, TempTrackingSpecification, 3);

        LastLineNo := LastLineNo + 10000;
        Component.reset;
        Component.setrange("Parent Item No.", item."No.");
        Component.SetRange(Type, Component.Type::Item);
        TotalCost := ItemJournalLine."Unit Amount";
        if Component.findset then
            repeat
                component.testfield("MIBLocation Code");
                ItemJournalLine.init;
                ItemJournalLine.validate("Journal Template Name", PurchaseSetup."MIBDefault Template Name");
                ItemJournalLine.validate("Journal Batch Name", PurchaseSetup."MIBDefault Batch Name");
                ItemJournalLine."Line No." := LastLineNo;
                ItemJournalLine.validate("Document No.", PurchRcptLine."Document No.");
                ItemJournalLine.validate("Posting Date", PurchRcptLine."Posting Date");
                ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"Negative Adjmt.");
                ItemJournalLine.Validate("Item No.", Component."No.");
                ItemJournalLine.validate("Location Code", component."MIBLocation Code");
                ItemJournalLine.Validate(Quantity, Component."Quantity per" * PurchRcptLine.Quantity);
                ItemJournalLine.Validate("Unit of Measure Code", Component."Unit of Measure Code");
                ItemJournalLine.insert(true);
                LastLineNo := LastLineNo + 10000;
                TotalCost := TotalCost + (ItemJournalLine."Unit Amount" * Component."Quantity per");
                AutomaticGetTrackingLine(TempTrackingSpecificationComp, ItemJournalLine);
                FillItemTrackingLine(ItemJournalLine, TempTrackingSpecificationcomp, 3);
            until Component.next = 0;

        ItemJournalLine.init;
        ItemJournalLine.validate("Journal Template Name", PurchaseSetup."MIBDefault Template Name");
        ItemJournalLine.validate("Journal Batch Name", PurchaseSetup."MIBDefault Batch Name");
        ItemJournalLine."Line No." := LastLineNo;
        ItemJournalLine.validate("Document No.", PurchRcptLine."Document No.");
        ItemJournalLine.validate("Posting Date", PurchRcptLine."Posting Date");
        ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"positive Adjmt.");
        ItemJournalLine.Validate("Item No.", PurchRcptLine."No.");
        ItemJournalLine.validate("Location Code", PurchRcptLine."Location Code");
        ItemJournalLine.Validate(Quantity, PurchRcptLine.Quantity);
        ItemJournalLine.validate("Unit Amount", TotalCost);
        ItemJournalLine.insert(true);
        LastLineNo := LastLineNo + 10000;
        FillItemTrackingLine(ItemJournalLine, TempTrackingSpecification, 2);

    end;

    Local Procedure FillItemTrackingLine(var ItemJournalLine: record "Item Journal Line"; var TempTrackingSpecification: Record "Tracking Specification" temporary; SubType: integer)
    var

        ItemTrackingCode: record "Item Tracking Code";
        c: Codeunit "Item Tracking Doc. Management";
        ReservationEntry: record "Reservation Entry";
        NextLine: integer;
        Item: record Item;

    begin

        //c.RetrieveEntriesFromShptRcpt(TempItemLedgEntry, DATABASE::"Transfer Receipt Line", 0, ItemJournalLine."Document No.", '', 0, ItemJournalLine."Line No.");        
        item.get(ItemJournalLine."Item No.");
        if not ItemTrackingCode.get(item."Item Tracking Code") then
            exit;

        ReservationEntry.LockTable();
        ReservationEntry.reset;
        if ReservationEntry.FindLast() then
            NextLine := ReservationEntry."Entry No."
        else
            NextLine := 0;

        if TempTrackingSpecification.findset then begin
            repeat
                NextLine := NextLine + 1;
                ReservationEntry.init;
                ReservationEntry."Entry No." := 0;
                ReservationEntry.validate("Source Type", 83);
                ReservationEntry.validate("Source Subtype", SubType);
                ReservationEntry.validate("Source ID", ItemJournalLine."Journal Template Name");
                ReservationEntry.validate("Source Batch Name", ItemJournalLine."Journal Batch Name");
                ReservationEntry.validate("Source Ref. No.", ItemJournalLine."Line No.");
                ReservationEntry.validate("Item No.", TempTrackingSpecification."Item No.");
                ReservationEntry.Validate("Location Code", TempTrackingSpecification."Location Code");
                Case SubType of
                    2:
                        ReservationEntry.Validate("Qty. to Handle (Base)", TempTrackingSpecification."Quantity (Base)");
                    3:
                        ReservationEntry.Validate("Qty. to Handle (Base)", -TempTrackingSpecification."Quantity (Base)");
                end;
                ReservationEntry.validate("Quantity (Base)", ReservationEntry."Qty. to Handle (Base)");
                ReservationEntry.validate("Qty. per Unit of Measure", TempTrackingSpecification."Qty. per Unit of Measure");
                ReservationEntry.validate("Reservation Status", ReservationEntry."Reservation Status"::Prospect);
                ReservationEntry."Expected Receipt Date" := ItemJournalLine."Posting Date";
                cASE true OF
                    ItemTrackingCode."SN Specific Tracking":
                        ReservationEntry.validate("Item Tracking", ReservationEntry."Item Tracking"::"Serial No.");
                    ItemTrackingCode."lot Specific Tracking":
                        ReservationEntry.validate("Item Tracking", ReservationEntry."Item Tracking"::"lot No.");
                END;

                ReservationEntry."Serial No." := TempTrackingSpecification."Serial No.";
                ReservationEntry."lot No." := TempTrackingSpecification."lot No.";
                ReservationEntry."Created By" := userid;
                ReservationEntry."Creation Date" := today;
                ReservationEntry."Expiration Date" := TempTrackingSpecification."Expiration Date";
                ReservationEntry.insert(true);

            until (TempTrackingSpecification.next = 0);
        end;
    end;

    Local Procedure AutomaticGetTrackingLine(Var TempTrackingSpecification: Record "Tracking Specification" temporary; var ItemJournalLine: record "Item Journal Line")
    var
        Item: record Item;
        IJl: page "Item journal";
        ItemTrackingDataCollection: Codeunit "Item Tracking Data Collection";
        ItemTrackingCode: record "Item Tracking Code";
        TrackingType: enum "Item Tracking Type";

    begin
        TempTrackingSpecification.reset;
        TempTrackingSpecification.deleteall;
        exit;
        item.get(ItemJournalLine."Item No.");
        if not ItemTrackingCode.Get(Item."Item Tracking Code") then
            exit;

        Case true of
            ItemTrackingCode."SN Specific Tracking":
                TrackingType := TrackingType::"Serial No.";
            ItemTrackingCode."Lot Specific Tracking":
                TrackingType := TrackingType::"Lot No."
            else
                exit;
        end;

        TempTrackingSpecification.InitFromItemJnlLine(ItemJournalLine);
        ItemTrackingDataCollection.SetCurrentBinAndItemTrkgCode('', ItemTrackingCode);
        ItemTrackingDataCollection.RetrieveLookupData(TempTrackingSpecification, true);
    end;

    Procedure PostBatch(DocumentNo: code[20])
    var
        ItemJnlLine: Record "Item Journal Line";
        PurchaseSetup: record "Purchases & Payables Setup";
        NextLine: Integer;
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        TemplateName: code[10];
        TemplateBatch: code[10];
        c: Codeunit "Item Jnl.-Post Batch";

    begin
        PurchaseSetup.get;
        if not PurchaseSetup."MIBAutomatic FG Post Cost Adj" THEN
            exit;
        PurchaseSetup.TestField("MIBDefault Template Name");
        PurchaseSetup.TestField("MIBDefault bATCH Name");
        TemplateName := PurchaseSetup."MIBDefault Template Name";
        TemplateBatch := PurchaseSetup."MIBDefault Batch Name";
        ItemJnlLine.reset;
        ItemJnlLine.setrange(ItemJnlLine."Journal Template Name", TemplateName);
        ItemJnlLine.setrange(ItemJnlLine."Journal Batch Name", TemplateBatch);
        ItemJnlLine.setrange(ItemJnlLine."Document No.", DocumentNo);
        if ItemJnlLine.FindSet() then
            c.Run(ItemJnlLine);
    end;


}
