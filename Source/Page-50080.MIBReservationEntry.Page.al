page 50040 "MIBReservation Entry"
{
    ApplicationArea = All;
    Caption = 'MIB Reservation Entry';
    PageType = List;
    SourceTable = "Reservation Entry";
    UsageCategory = Administration;
    Permissions = tabledata "Reservation Entry" = rmdi;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Action Message Adjustment"; Rec."Action Message Adjustment")
                {
                    ToolTip = 'Specifies the value of the Action Message Adjustment field.';
                }
                field("Appl.-from Item Entry"; Rec."Appl.-from Item Entry")
                {
                    ToolTip = 'Specifies the value of the Appl.-from Item Entry field.';
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                    ToolTip = 'Specifies the value of the Appl.-to Item Entry field.';
                }
                field(Binding; Rec.Binding)
                {
                    ToolTip = 'Specifies the value of the Binding field.';
                }
                field("Changed By"; Rec."Changed By")
                {
                    ToolTip = 'Specifies the value of the Changed By field.';
                }
                field(Correction; Rec.Correction)
                {
                    ToolTip = 'Specifies the value of the Correction field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the user who created the traced record.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies when the traced record was created.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the record.';
                }
                field("Disallow Cancellation"; Rec."Disallow Cancellation")
                {
                    ToolTip = 'Specifies the value of the Disallow Cancellation field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number that is assigned to the entry.';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ToolTip = 'Specifies the date on which the reserved items are expected to enter inventory.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ToolTip = 'Specifies the expiration date of the lot or serial number on the item tracking line.';
                }
                field("Item Ledger Entry No."; Rec."Item Ledger Entry No.")
                {
                    ToolTip = 'Specifies the value of the Item Ledger Entry No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value from the same field on the physical inventory tracking line.';
                }
                field("Item Tracking"; Rec."Item Tracking")
                {
                    ToolTip = 'Specifies the value of the Item Tracking field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the Location of the items that have been reserved in the entry.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies the lot number of the item that is being handled with the associated document line.';
                }
                field("New Expiration Date"; Rec."New Expiration Date")
                {
                    ToolTip = 'Specifies the value of the New Expiration Date field.';
                }
                field("New Lot No."; Rec."New Lot No.")
                {
                    ToolTip = 'Specifies the value of the New Lot No. field.';
                }
                field("New Package No."; Rec."New Package No.")
                {
                    ToolTip = 'Specifies the value of the New Package No. field.';
                }
                field("New Serial No."; Rec."New Serial No.")
                {
                    ToolTip = 'Specifies the value of the New Serial No. field.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ToolTip = 'Specifies the package number of the item that is being handled with the associated document line.';
                }
                field("Planning Flexibility"; Rec."Planning Flexibility")
                {
                    ToolTip = 'Specifies the value of the Planning Flexibility field.';
                }
                field(Positive; Rec.Positive)
                {
                    ToolTip = 'Specifies that the difference is positive.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies how many of the base unit of measure are contained in one unit of the item.';
                }
                field("Qty. to Handle (Base)"; Rec."Qty. to Handle (Base)")
                {
                    ToolTip = 'Specifies the quantity of item, in the base unit of measure, to be handled in a warehouse activity.';
                }
                field("Qty. to Invoice (Base)"; Rec."Qty. to Invoice (Base)")
                {
                    ToolTip = 'Specifies the quantity, in the base unit of measure, that remains to be invoiced. It is calculated as Quantity - Qty. Invoiced.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity of the record.';
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                    ToolTip = 'Specifies the quantity of the item that has been reserved in the entry.';
                }
                field("Quantity Invoiced (Base)"; Rec."Quantity Invoiced (Base)")
                {
                    ToolTip = 'Specifies the value of the Quantity Invoiced (Base) field.';
                }
                field("Reservation Status"; Rec."Reservation Status")
                {
                    ToolTip = 'Specifies the status of the reservation.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the serial number of the item that is being handled on the document line.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Source Batch Name"; Rec."Source Batch Name")
                {
                    ToolTip = 'Specifies the journal batch name if the reservation entry is related to a journal or requisition line.';
                }
                field("Source ID"; Rec."Source ID")
                {
                    ToolTip = 'Specifies which source ID the reservation entry is related to.';
                }
                field("Source Prod. Order Line"; Rec."Source Prod. Order Line")
                {
                    ToolTip = 'Specifies the value of the Source Prod. Order Line field.';
                }
                field("Source Ref. No."; Rec."Source Ref. No.")
                {
                    ToolTip = 'Specifies a reference number for the line, which the reservation entry is related to.';
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    ToolTip = 'Specifies which source subtype the reservation entry is related to.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies for which source type the reservation entry is related to.';
                }
                field("Suppressed Action Msg."; Rec."Suppressed Action Msg.")
                {
                    ToolTip = 'Specifies the value of the Suppressed Action Msg. field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field("Transferred from Entry No."; Rec."Transferred from Entry No.")
                {
                    ToolTip = 'Specifies a value when the order tracking entry is for the quantity that remains on a document line after a partial posting.';
                }
                field("Untracked Surplus"; Rec."Untracked Surplus")
                {
                    ToolTip = 'Specifies the value of the Untracked Surplus field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the variant of the item on the line.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ToolTip = 'Specifies the last day of the serial/lot number''s warranty.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin

        IF not  (uppercase(UserId) IN ['LINCOLN\CMOMIRLA', 'LINCOLN\SAMIROUCHEN', 'LINCOLN\MKOSSOW', 'LINCOLN\JSYLVESTRE']) THEN
          error('you are not authorized tp open this page');
    end;

}
