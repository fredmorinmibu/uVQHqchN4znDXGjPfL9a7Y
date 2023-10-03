codeunit 50003 MIBEventHandling
{
    EventSubscriberInstance = StaticAutomatic;

    /*************** Tables ************/

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Purch.-Post", 'OnAfterPurchRcptLineInsert', '', false, false)]
    local procedure OnafterPurchaseLineInsert(var PurchRcptLine: Record "Purch. Rcpt. Line"; var TempTrackingSpecification: Record "Tracking Specification" temporary);
    var
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        c: Codeunit "MIB Global Specifications";
    begin

        c.ItemCostAdjustement(PurchRcptLine, TempTrackingSpecification);

    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure OnAfterPostPurchaseDoc(PurchCrMemoHdrNo: Code[20]);
    var
        c: Codeunit "MIB Global Specifications";
    begin

    end;

}
