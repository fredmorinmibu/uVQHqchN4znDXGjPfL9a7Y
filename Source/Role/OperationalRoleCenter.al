page 50082 "Operational Role Center"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'Business Manager';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control139; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control16; "O365 Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part("Intercompany Activities"; "Intercompany Activities")
            {
                ApplicationArea = Intercompany;
            }
            part(Control46; "Team Member Activities No Msgs")
            {
                ApplicationArea = Suite;
            }
            part(Control55; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
                Caption = '';
            }
            part("Favorite Accounts"; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Favorite Accounts';
            }
            part(Control9; "Trial Balance")
            {
                AccessByPermission = TableData "G/L Entry" = R;
                ApplicationArea = Basic, Suite;
            }
            part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            {
                AccessByPermission = TableData "Power BI User Configuration" = I;
                ApplicationArea = Basic, Suite;
            }

            part(Control96; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Suite;
            }
            systempart(MyNotes; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Sales Quote")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageMode = Create;
                ToolTip = 'Offer items or services to a customer.';
            }
            action("Sales Order")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
                Image = NewOrder;
                RunObject = Page "Sales Order";
                RunPageMode = Create;
                ToolTip = 'Create a new sales order for items or services.';
            }
            action("Sales Invoice")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
            }
            action("Purchase Quote")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Quote';
                Image = NewSalesQuote;
                RunObject = Page "Purchase Quote";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase quote.';
            }
            action("<Page Purchase Order>")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Order';
                Image = NewOrder;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase order.';
            }
            action("Purchase Invoice")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoice';
                Image = NewPurchaseInvoice;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a purchase invoice to mirror a sales document sent by a vendor.';
            }
        }
        area(processing)
        {
            action("Navigate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find entries...';
                Image = Navigate;
                RunObject = Page Navigate;
                ShortCutKey = 'Ctrl+Alt+Q';
                ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
            group(New)
            {
                Caption = 'New';
                Image = New;
                action(Customer)
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    ToolTip = 'Register a new customer.';
                }
                action(Vendor)
                {
                    AccessByPermission = TableData Vendor = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor';
                    Image = Vendor;
                    RunObject = Page "Vendor Card";
                    RunPageMode = Create;
                    ToolTip = 'Register a new vendor.';
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                action("Payment Reconciliation Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Reconcile Imported Payments';
                    Image = ApplyEntries;
                    RunObject = Codeunit "Pmt. Rec. Journals Launcher";
                    ToolTip = 'Reconcile your bank account by importing transactions and applying them, automatically or manually, to open customer ledger entries, open vendor ledger entries, or open bank account ledger entries.';
                }
                action("Import Bank Transactions")
                {
                    AccessByPermission = TableData "Bank Export/Import Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Import Bank Transactions...';
                    Image = Import;
                    RunObject = Codeunit "Pmt. Rec. Jnl. Import Trans.";
                    ToolTip = 'To start the process of reconciling new payments, import a bank feed or electronic file containing the related bank transactions.';
                }
                action("Register Customer Payments")
                {
                    AccessByPermission = TableData "Payment Registration Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Register Customer Payments';
                    Image = Payment;
                    RunObject = Page "Payment Registration";
                    ToolTip = 'Process your customer payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post the payments.';
                }
                action("Create Vendor Payments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create Vendor Payments';
                    Image = SuggestVendorPayments;
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageView = WHERE("Document Type" = FILTER(Invoice),
                                        "Remaining Amount" = FILTER(< 0),
                                        "Applies-to ID" = FILTER(''));
                    ToolTip = 'Opens vendor ledger entries for all vendors with invoices that have not been paid yet.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Financial Statements")
                {
                    Caption = 'Financial Statements';
                    Image = ReferenceData;
                    action("Balance Sheet")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";
                        RunObject = Report "Balance Sheet";
                        ToolTip = 'View your company''s assets, liabilities, and equity.';
                    }
                    action("Income Statement")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";
                        RunObject = Report "Income Statement";
                        ToolTip = 'View your company''s income and expenses.';
                    }
                    action("Statement of Cash Flows")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Cash Flows';
                        Image = "Report";
                        RunObject = Report "Statement of Cashflows";
                        ToolTip = 'View a financial statement that shows how changes in balance sheet accounts and income affect the company''s cash holdings, displayed for operating, investing, and financing activities respectively.';
                    }
                    action("Statement of Retained Earnings")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Retained Earnings';
                        Image = "Report";
                        RunObject = Report "Retained Earnings Statement";
                        ToolTip = 'View a report that shows your company''s changes in retained earnings for a specified period by reconciling the beginning and ending retained earnings for the period, using information such as net income from the other financial statements.';
                    }
                    action("Sales Taxes Collected")
                    {
                        ApplicationArea = SalesTax;
                        Caption = 'Sales Taxes Collected';
                        Image = "Report";
                        RunObject = Report "Sales Taxes Collected";
                        ToolTip = 'View a report that shows the sales taxes that have been collected on behalf of the authorities.';
                    }
                    action("Customer Statements")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer Statements';
                        Image = "Report";
                        RunObject = Report "Customer Statements";
                        ToolTip = 'View all entries for selected customers for a selected period. You can choose to have all overdue balances displayed, regardless of the period specified. You can also choose to include an aging band. For each currency, the report displays open entries and, if specified in the report, overdue entries. The statement can be sent to customers, for example, at the close of an accounting period or as a reminder of overdue balances.';
                    }
                }
            }
        }
        area(reporting)
        {
            group("Excel Reports")
            {
                Caption = 'Excel Reports';
                Image = Excel;
                action(ExcelTemplatesBalanceSheet)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance Sheet';
                    Image = "Report";
                    RunObject = Codeunit "Run Template Balance Sheet";
                    ToolTip = 'Open a spreadsheet that shows your company''s assets, liabilities, and equity.';
                }
                action(ExcelTemplateIncomeStmt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Income Statement';
                    Image = "Report";
                    RunObject = Codeunit "Run Template Income Stmt.";
                    ToolTip = 'Open a spreadsheet that shows your company''s income and expenses.';
                }
                action(ExcelTemplateCashFlowStmt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Statement';
                    Image = "Report";
                    RunObject = Codeunit "Run Template CashFlow Stmt.";
                    ToolTip = 'Open a spreadsheet that shows how changes in balance sheet accounts and income affect the company''s cash holdings.';
                }
                action(ExcelTemplateRetainedEarn)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Retained Earnings Statement';
                    Image = "Report";
                    RunObject = Codeunit "Run Template Retained Earn.";
                    ToolTip = 'Open a spreadsheet that shows your company''s changes in retained earnings based on net income from the other financial statements.';
                }
                action(ExcelTemplateTrialBalance)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Trial Balance';
                    Image = "Report";
                    RunObject = Codeunit "Run Template Trial Balance";
                    ToolTip = 'Open a spreadsheet that shows a summary trial balance by account.';
                }
                action(ExcelTemplateAgedAccPay)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aged Accounts Payable';
                    Image = "Report";
                    RunObject = Codeunit "Run Template Aged Acc. Pay.";
                    ToolTip = 'Open a spreadsheet that shows a list of aged remaining balances for each vendor by period.';
                }
                action(ExcelTemplateAgedAccRec)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aged Accounts Receivable';
                    Image = "Report";
                    RunObject = Codeunit "Run Template Aged Acc. Rec.";
                    ToolTip = 'Open a spreadsheet that shows when customer payments are due or overdue by period.';
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                RunObject = Page "Customer List";
                ToolTip = 'Open Customers';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                RunObject = Page "Vendor List";
                ToolTip = 'Open Vendors';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                RunObject = Page "Item List";
                ToolTip = 'Open Items';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'Open Bank Accounts';
            }
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open Chart of Accounts';
            }
        }
        area(sections)
        {
            //FINANCE GROUP
            group(Action20039)
            {
                Caption = 'Finance';
                Image = Journals;
                ToolTip = 'Post financial transactions, manage budgets, analyze G/L  data, and prepare financial statements.';
                group(gl)
                {
                    Caption = 'General Ledger';
                    action("Chart of Accounts_2")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Chart of Accounts';
                        RunObject = Page "Chart of Accounts";
                        ToolTip = 'Open Chart of Accounts';
                    }
                    action("G/L Budgets_2")
                    {
                        ApplicationArea = Suite;
                        Caption = 'G/L Budgets';
                        Visible = true;
                        RunObject = Page "G/L Budget Names";
                        ToolTip = 'Open G/L Budgets';
                    }
                    action("Account Schedules_2")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Financial Reporting';
                        Visible = true;
                        RunObject = Page "Financial Reports";
                        ToolTip = 'Open Financial Reporting';
                    }

                    action(analysisByDimensions)
                    {
                        Caption = 'Analysis by Dimensions';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Analysis by Dimensions";
                        Tooltip = 'Open Analysis by Dimensions';
                    }
                    action(ExportGifiInfoToExcel)
                    {
                        Caption = 'Export GIFI Info to Excel';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Export GIFI Info. to Excel";
                        Tooltip = 'Open Export GIFI Info to Excel';
                    }

                    group(VAT)
                    {
                        Caption = 'VAT';
                        group(vatReports)
                        {
                            action(action1)
                            {
                                Caption = 'VAT Exceptions';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "VAT Exceptions";
                                Tooltip = 'Open VAT Exceptions';
                            }
                            action(action2)
                            {
                                Caption = 'VAT Register';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "VAT Register";
                                Tooltip = 'Open VAT Register';
                            }
                            action(action10003)
                            {
                                Caption = 'Batch VAT Registration No. Check';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "VAT Registration No. Check";
                                Tooltip = 'Open Batch VAT Registration No. Check';
                            }
                            action(action10004)
                            {
                                Caption = 'VAT Statement';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "VAT Statement";
                                Tooltip = 'Open VAT Statement';
                            }
                            action(action10005)
                            {
                                Caption = 'VAT - VIES Declaration Tax Auth';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "VAT- VIES Declaration Tax Auth";
                                Tooltip = 'Open VAT - VIES Declaration Tax Auth';
                            }
                            action(action10006)
                            {
                                Caption = 'VAT - VIES Declaration Disk...';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "VAT- VIES Declaration Disk";
                                Tooltip = 'Open VAT - VIES Declaration Disk...';
                            }
                            action(action10007)
                            {
                                Caption = 'Sales Taxes Collected';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Sales Taxes Collected";
                                Tooltip = 'Open Sales Taxes Collected';
                            }
                            action(action10008)
                            {
                                Caption = 'GST/HST Internet File Transfer';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "GST/HST Internet File Transfer";
                                Tooltip = 'Open GST/HST Internet File Transfer';
                            }
                        }
                    }
                    group(Intercompany)
                    {
                        Caption = 'Intercompany';
                        action(action1003)
                        {
                            Caption = 'Intercompany General Journal';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "IC General Journal";
                            tooltip = 'Open Intercompany General Journal';
                        }
                        action(action4)
                        {
                            Caption = 'Intercompany Inbox Transactions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "IC Inbox Transactions";
                            tooltip = 'Open Intercompany Inbox Transactions';
                        }
                        action(action5)
                        {
                            Caption = 'Intercompany Outbox Transactions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "IC Outbox Transactions";
                            tooltip = 'Open Intercompany Outbox Transactions';
                        }
                        action(action6)
                        {
                            Caption = 'Handled Intercompany inbox Transactions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Handled IC inbox Transactions";
                            tooltip = 'Open Handled Intercompany inbox Transactions';
                        }
                        action(action7)
                        {
                            Caption = 'Handled Intercompany Outbox Transactions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Handled IC Outbox Transactions";
                            tooltip = 'Open Handles Intercompany Outbox Transactions';
                        }
                        action(action8)
                        {
                            Caption = 'IC Transaction';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "IC Transactions";
                            tooltip = 'Open IC Transaction';
                        }

                    }
                    group(Consolidation)
                    {
                        Caption = 'Consolidation';
                        action(action9)
                        {
                            Caption = 'Business Units';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Business Unit List";
                            tooltip = 'Open Business Units';
                        }
                        action(action10)
                        {
                            Caption = 'Export Consolidations...';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Export Consolidation";
                            tooltip = 'Open Export Consolidations';
                        }
                        action(action11)
                        {
                            Caption = 'G/L Consolidation Eliminations';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "G/L Consolidation Eliminations";
                            tooltip = 'Open G/L Consolidation Eliminations';
                        }

                    }

                    group(Journals)
                    {
                        Caption = 'Journals';

                        action(action12)
                        {
                            Caption = 'General Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "General Journal";
                            tooltip = 'Open General Journals';
                        }
                        action(action13)
                        {
                            Caption = 'Recurring General Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "General Journal Batches";
                            tooltip = 'Open Recurring General Journals';
                        }
                        action(action14)
                        {
                            Caption = 'Intercompany General Journal';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "General Journal Templates";
                            tooltip = 'Open Intercompany General Journal';
                        }
                    }

                    group(grpRegisterEntries)
                    {
                        Caption = 'Register Entries';
                        action(action15)
                        {
                            Caption = 'G/L Registers';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "G/L Registers";
                            tooltip = 'Open G/L Registers';
                        }
                        action(action16)
                        {
                            Caption = 'Find entries...';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Navigate";
                            tooltip = 'Open Find entries...';
                        }
                        action(action17)
                        {
                            Caption = 'General Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "General Ledger Entries";
                            tooltip = 'Open General Ledger Entries';
                        }
                        action(action18)
                        {
                            Caption = 'G/L Budget Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "G/L Budget Entries";
                            tooltip = 'Open G/L Budget Entries';
                        }
                        action(action19)
                        {
                            Caption = 'VAT Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "VAT Entries";
                            tooltip = 'Open VAT Entries';
                        }
                        action(action20)
                        {
                            Caption = 'Analysis View Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis View Entries";
                            tooltip = 'Open Analysis View Entries';
                        }
                        action(action21)
                        {
                            Caption = 'Analysis View Budget Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis View Budget Entries";
                            tooltip = 'Open Analysis View Budget Entries';
                        }
                        action(action22)
                        {
                            Caption = 'Item Budget Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Item Budget Entries";
                            tooltip = 'Open Item Budget Entries';
                        }

                    }

                    group(Reports2)
                    {
                        Caption = 'Reports';

                        group(reportsEntries)
                        {
                            caption = 'Entries';
                            action(action20023)
                            {
                                Caption = 'G/L Register';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "G/L Register";
                                tooltip = 'Open G/L Register';
                            }
                            action(action24)
                            {
                                Caption = 'Detail Trial Balance';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Detail Trial Balance";
                                tooltip = 'Open Detail Trial Balance';
                            }
                            action(action25)
                            {
                                Caption = 'Dimensions - Detail';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Dimensions - Detail";
                                tooltip = 'Open Dimensions - Detail';
                            }
                            action(action26)
                            {
                                Caption = 'Dimensions - Total';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Dimensions - Total";
                                tooltip = 'Open Dimensions - Total';
                            }
                            action(action20027)
                            {
                                Caption = 'Dimension Check Value Posting';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Check Value Posting";
                                tooltip = 'Open Dimension Check Value Posting';
                            }
                            action(action20028)
                            {
                                Caption = 'Cross Ref. by Source';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cross Reference by Source";
                                tooltip = 'Open Cross Ref. by Source';
                            }
                            action(action20029)
                            {
                                Caption = 'General Ledger Worksheet';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "General Ledger Worksheet";
                                tooltip = 'Open General Ledger Worksheet';
                            }
                            action(action20030)
                            {
                                Caption = 'Item Charges - Specification';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Item Charges - Specification";
                                tooltip = 'Open Item Charges - Specification';
                            }

                        }
                        group(reportFinancialStatement)
                        {
                            caption = 'Financial Statement';
                            action(action20031)
                            {
                                Caption = 'Financial Report (check this one)';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Financial Reports";
                                tooltip = 'Open Financial Report';
                            }
                            action(action20032)
                            {
                                Caption = 'Trial Balance';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Trial Balance";
                                tooltip = 'Open Trial Balance';
                            }
                            action(action20033)
                            {
                                Caption = 'Trial Balance/Budget';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Trial Balance/Budget";
                                tooltip = 'Open Trial Balance/Budget';
                            }
                            action(action20034)
                            {
                                Caption = 'Trial Balance/Previous Year';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Trial Balance/Previous Year";
                                tooltip = 'Open Trial Balance/Previous Year';
                            }
                            action(action20035)
                            {
                                Caption = 'Closing Trial Balance';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Closing Trial Balance";
                                tooltip = 'Open Closing Trial Balance';
                            }
                            action(action20036)
                            {
                                Caption = 'Consolidated Trial Balance';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Consolidated Trial Balance";
                                tooltip = 'Open Consolidated Trial Balance';
                            }
                            action(action20037)
                            {
                                Caption = 'Consolidated Trial Balance (4)';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Consolidated Trial Balance (4)";
                                tooltip = 'Open Consolidated Trial Balance (4)';
                            }
                            action(action20038)
                            {
                                Caption = 'Budget';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Budget";
                                tooltip = 'Open Budget';
                            }
                            action(action39)
                            {
                                Caption = 'Trial Balance by Period';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Trial Balance by Period";
                                tooltip = 'Open Trial Balance by Period';
                            }
                            action(action20040)
                            {
                                Caption = 'Fiscal Year Balance';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fiscal Year Balance";
                                tooltip = 'Open Fiscal Year Balance';
                            }
                            action(action20041)
                            {
                                Caption = 'Balance Comp. - Prev. Year';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Balance Comp. - Prev. Year";
                                tooltip = 'Open Balance Comp. - Prev. Year';
                            }
                            action(action20042)
                            {
                                Caption = 'Balance Sheet';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Balance Sheet";
                                tooltip = 'Open Balance Sheet';
                            }
                            action(action20043)
                            {
                                Caption = 'Income Statement';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Income Statement";
                                tooltip = 'Open Income Statement';
                            }
                            action(action20044)
                            {
                                Caption = 'Cash Flow Statement (Check this one)';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Cash Flow Statement Entity";
                                tooltip = 'Open Cash Flow Statement';
                            }
                            action(action20045)
                            {
                                Caption = 'Retained Earnings Statement';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Retained Earnings Statement";
                                tooltip = 'Open Retained Earnings Statement';
                            }
                            action(action20046)
                            {
                                Caption = 'Account Balances by GIFI Code';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Account Balances by GIFI Code";
                                tooltip = 'Open Account Balances by GIFI Code';
                            }
                            action(action20047)
                            {
                                Caption = 'Trial Balance Detail/Summary';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Trial Balance Detail/Summary";
                                tooltip = 'Open Trial Balance Detail/Summary';
                            }
                            action(action20048)
                            {
                                Caption = 'Trial Balance, per Global Dim.';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Trial Balance, per Global Dim.";
                                tooltip = 'Open Trial Balance, per Global Dim.';
                            }
                            action(action20049)
                            {
                                Caption = 'Trial Balance, Spread G. Dim.';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Trial Balance, Spread G. Dim.";
                                tooltip = 'Open Trial Balance, Spread G. Dim.';
                            }
                        }
                        group(reportsMiscellaneous)
                        {
                            caption = 'Miscellaneous';
                            action(action20050)
                            {
                                Caption = 'Foreign Currency Balance';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Foreign Currency Balance";
                                tooltip = 'Open Foreign Currency Balance';
                            }
                            action(action20051)
                            {
                                Caption = 'XBRL Spec. 2 Instance Document';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "XBRL Export Instance - Spec. 2";
                                tooltip = 'Open XBRL Spec. 2 Instance Document';
                            }
                            action(action20052)
                            {
                                Caption = 'XBRL Mapping of G/L Accounts';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "XBRL Mapping of G/L Accounts";
                                tooltip = 'Open XBRL Mapping of G/L Accounts';
                            }
                            action(action20053)
                            {
                                Caption = 'Reconcile Cust. and Vend. Accs';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Reconcile Cust. and Vend. Accs";
                                tooltip = 'Open Reconcile Cust. and Vend. Accs';
                            }
                        }
                        group(reportSetupList)
                        {
                            caption = 'Setup List';
                            action(action20054)
                            {
                                Caption = 'Chart of Accounts';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Chart of Accounts";
                                tooltip = 'Open Chart of Accounts';
                            }
                            action(action20055)
                            {
                                Caption = 'Change Log Setup List';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Change Log Setup List";
                                tooltip = 'Open Change Log Setup List';
                            }
                        }
                    }
                    group(Setup2)
                    {
                        Caption = 'Setup';
                        action(action27)
                        {
                            Caption = 'General Ledger Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "General Ledger Setup";
                            tooltip = 'Open General Ledger Setup';
                        }
                        action(action28)
                        {
                            Caption = 'Deferral Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Deferral Template List";
                            tooltip = 'Open Deferral Templates';
                        }
                        action(action29)
                        {
                            Caption = 'General Journal Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "General Journal Templates";
                            tooltip = 'Open General Journal Templates';
                        }
                        action(action30)
                        {
                            Caption = 'G/L Account Categories';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "G/L Account Categories";
                            tooltip = 'Open G/L Account Categories';
                        }
                        action(action31)
                        {
                            Caption = 'XBRL Taxonomies';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "XBRL Taxonomies";
                            tooltip = 'Open XBRL Taxonomies';
                        }
                    }



                }
                group(cm)
                {
                    Caption = 'Cash Management';
                    action(BankAccounts)
                    {
                        Caption = 'Bank Accounts';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Bank Account List";
                        ToolTip = 'Open Bank Accounts';
                    }

                    action(ReceivablePayables)
                    {
                        Caption = 'Receivable-Payables';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Receivables-Payables";
                        ToolTip = 'Open Receivable-Payables';

                    }
                    action(BankDeposits)
                    {
                        Caption = 'Bank Deposits';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Deposit List"; //IS THIS ONE MISSING
                        ToolTip = 'Open Bank Deposits';
                    }
                    action(PostedDeposits)
                    {
                        Caption = 'Posted Deposits';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Posted Deposit List";
                        ToolTip = 'Open Posted Deposits';


                    }
                    action(postedBankDeposits)
                    {
                        Caption = 'Posted Bank Deposits';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        //RunObject = Page "Posted Bank Deposit List"; //IS THIS ONE MISSING 
                        //FIX NEEDED
                        ToolTip = 'Open Posted Bank Deposits';

                    }
                    group(CashFlow)
                    {
                        Caption = 'Cash Flow';
                        action(action32)
                        {
                            Caption = 'Cash Flow Forecast';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cash Flow Forecast List";
                            tooltip = 'Open Cash Flow Forecast';

                        }
                        action(action33)
                        {
                            Caption = 'Chart of Cash Flow Accounts';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Chart of Cash Flow Accounts";
                            tooltip = 'Open Chart of Cash Flow Accounts';
                        }
                        action(action34)
                        {
                            Caption = 'Cash Flow Manual Revenues';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cash Flow Manual Revenues";
                            tooltip = 'Open Cash Flow Manual Revenues';
                        }
                        action(action35)
                        {
                            Caption = 'Cash Flow Manual Expenses';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cash Flow Manual Expenses";
                            tooltip = 'Open Cash Flow Manual Expenses';

                        }
                        action(action36)
                        {
                            Caption = 'Cash Flow Worksheet';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cash Flow Worksheet";
                            tooltip = 'Open Cash Flow Worksheet';


                        }


                    }
                    group(Reconciliation)
                    {
                        Caption = 'Reconciliation';
                        action(action37)
                        {
                            Caption = 'Bank Account Reconciliations';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Bank Acc. Reconciliation List";
                            tooltip = 'Open Bank Account Reconciliations';
                        }
                        action(action38)
                        {
                            Caption = 'Posted Payment Reconciliations';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Posted Payment Reconciliations";
                            tooltip = 'Open Posted Payment Reconciliations';

                        }

                    }

                    group(Journals2)
                    {
                        Caption = 'Journals';

                        action(action40)
                        {
                            Caption = 'Cash Receipt Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cash Receipt Journal";
                            tooltip = 'Open Cash Receipt Journals';
                        }
                        action(action41)
                        {
                            Caption = 'Sales Tax Journal';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Sales Tax Journal";
                            tooltip = 'Open Sales Tax Journal';
                        }
                        action(action42)
                        {
                            Caption = 'Payment Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Payment Journal";
                            tooltip = 'Open Payment Journals';
                        }

                    }
                    group(LedgerEntries)
                    {
                        Caption = 'Ledger Entries';
                        action(action44)
                        {
                            Caption = 'Bank Account Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Bank Account Ledger Entries";
                            tooltip = 'Open Bank Account Ledger Entries';
                        }
                        action(action45)
                        {
                            Caption = 'Check Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Check Ledger Entries";
                            tooltip = 'Open Check Ledger Entries';
                        }
                        action(action46)
                        {
                            Caption = 'Cash Flow Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            //RunObject = Page "Cash Flow Ledger Entries"; //IS THIS ONE MISSING
                            //FIX NEEDED
                            tooltip = 'Open Cash Flow Ledger Entries';
                        }

                    }
                    group(Reports3)
                    {
                        Caption = 'Reports';
                        action(action47)
                        {
                            Caption = 'Deposit';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Deposit";
                            tooltip = 'Open Deposit';
                        }
                        action(action48)
                        {
                            Caption = 'Deposit Test Report';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Deposit Test Report";
                            tooltip = 'Open Deposit Test Report';
                        }
                        action(action49)
                        {
                            Caption = 'Bank Account Register';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Bank Account Register";
                            tooltip = 'Open Bank Account Register';
                        }
                        action(action50)
                        {
                            Caption = 'Bank Account - Check Details';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Bank Account - Check Details";
                            tooltip = 'Open Bank Account - Check Details';
                        }
                        action(action51)
                        {
                            Caption = 'Bank Account - Labels';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Bank Account - Labels";
                            tooltip = 'Open Bank Account - Labels';

                        }
                        action(action52)
                        {
                            Caption = 'Bank Account - List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Bank Account - List";
                            tooltip = 'Open Bank Account - List';

                        }
                        action(action53)
                        {
                            Caption = 'Bank Acc. - Detail Trial Bal.';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Bank Acc. - Detail Trial Bal.";
                            tooltip = 'Open Bank Acc. - Detail Trial Bal.';

                        }
                        action(action54)
                        {
                            Caption = 'Receivables-Payables';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Receivables-Payables";
                            tooltip = 'Open Receivables-Payables';

                        }
                        action(action55)
                        {
                            Caption = 'Cash Flow Date List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Cash Flow Date List";
                            tooltip = 'Open Cash Flow Date List';

                        }
                        action(action56)
                        {
                            Caption = 'Cash Flow Dimensions - Detail';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Cash Flow Dimensions - Detail";
                            tooltip = 'Open Cash Flow Dimensions - Detail';

                        }

                    }
                    group(Setup3)
                    {
                        Caption = 'Setup';
                        action(action57)
                        {
                            Caption = 'Payment Application Rules';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Payment Application Rules";
                            tooltip = 'Open Payment Application Rules';

                        }
                        action(action58)
                        {
                            Caption = 'Cash Flow Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cash Flow Setup";
                            tooltip = 'Open Cash Flow Setup';
                        }
                        action(action59)
                        {
                            Caption = 'Cash Flow Report Selections';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            //RunObject = Page "Cash Flow Report Selections"; //IS THIS ONE MISSING
                            //FIX NEEDED
                            tooltip = 'Open Cash Flow Report Selections';
                        }
                        action(action60)
                        {
                            Caption = 'Report Selections Bank Account';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Report Selection - Bank Acc.";
                            tooltip = 'Open Report Selections Bank Account';
                        }
                        action(action61)
                        {
                            Caption = 'Payment Terms';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Payment Terms";
                            tooltip = 'Open Payment Terms';
                        }
                        action(action62)
                        {
                            Caption = 'Payment Methods';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Payment Methods";
                            tooltip = 'Open Payment Methods';
                        }
                        action(action63)
                        {
                            Caption = 'Currencies';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Currencies";
                            tooltip = 'Open Currencies';
                        }

                    }

                }

                group(ca)
                {
                    Caption = 'Cost Accounting';

                    action(ChartOfCostCenters)
                    {
                        Caption = 'Chart of Cost Centers';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Chart of Cost Centers";
                        tooltip = 'Open Chart of Cost Centers';
                    }

                    action(ChartOfCostObjects)
                    {
                        Caption = 'Chart of Cost Objects';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Chart of Cost Objects";
                        tooltip = 'Open Chart of Cost Objects';
                    }


                    action(ChartOfCostTypes)
                    {
                        Caption = 'Chart of Cost Types';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Chart of Cost Types";
                        tooltip = 'Open Chart of Cost Types';
                    }
                    action(CostAllocations)
                    {
                        Caption = 'Cost Allocations';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Cost Allocation";
                        tooltip = 'Open Cost Allocations';
                    }
                    action(CostBudgets)
                    {
                        caption = 'Cost Budgets';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Cost Budget Entries";
                        tooltip = 'Open Cost Budgets';
                    }

                    action(CostJournals)
                    {
                        Caption = 'Cost Journals';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Cost Journal";
                        tooltip = 'Open Cost Journals';
                    }

                    group(Registers)
                    {
                        Caption = 'Registers';

                        action(action64)
                        {
                            Caption = 'Cost Registers';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cost Registers";
                            tooltip = 'Open Cost Registers';
                        }
                        action(action65)
                        {
                            Caption = 'Cost Budget Registers';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cost Budget Registers";
                            tooltip = 'Open Cost Budget Registers';
                        }
                    }

                    group(Reports4)
                    {
                        Caption = 'Reports';
                        group(reportSetupInformation)
                        {
                            caption = 'Setup Information';
                            action(action66)
                            {
                                Caption = 'Cost Allocations';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cost Allocations";
                                tooltip = 'Open Cost Allocations';
                            }
                        }
                        group(reportEntries)
                        {
                            caption = 'Entries';
                            action(action67)
                            {
                                Caption = 'Cost Acctg. Journal';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cost Acctg. Journal";
                                tooltip = 'Open Cost Acctg. Journal';
                            }
                            action(action68)
                            {
                                Caption = 'Cost Budget Registers';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Cost Budget Registers";
                                tooltip = 'Open Cost Budget Registers';
                            }
                        }

                        group(reportsCostRevenues)
                        {
                            caption = 'Cost & Revenues';
                            action(action69)
                            {
                                Caption = 'Cost Acctg. Statement';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cost Acctg. Statement";
                                tooltip = 'Open Cost Acctg. Statement';
                            }
                            action(action20070)
                            {
                                Caption = 'Cost Acctg. Stmt. per Period';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cost Acctg. Stmt. per Period";
                                tooltip = 'Open Cost Acctg. Stmt. per Period';
                            }
                            action(action20071)
                            {
                                Caption = 'Cost Acctg. Analysis';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cost Acctg. Analysis";
                                tooltip = 'Open Cost Acctg. Analysis';
                            }
                        }

                        group(reportCostBudget)
                        {
                            caption = 'Cost Budget';
                            action(action20072)
                            {
                                Caption = 'Cost Acctg. Statement/Budget';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cost Acctg. Statement/Budget";
                                tooltip = 'Open Cost Acctg. Statement/Budget';
                            }
                            action(action20073)
                            {
                                Caption = 'Cost Acctg. Balance/Budget';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Cost Acctg. Balance/Budget";
                                tooltip = 'Open Cost Acctg. Balance/Budget';
                            }
                        }

                    }
                    group(Setup4)
                    {
                        Caption = 'Setup';

                        action(action70)
                        {
                            Caption = 'Cost Accounting Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cost Accounting Setup";
                            tooltip = 'Open Cost Accounting Setup';
                        }
                        action(action71)
                        {
                            Caption = 'Cost Journal Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cost Journal Templates";
                            tooltip = 'Open Cost Journal Templates';
                        }
                    }
                }
                group(recv)
                {
                    Caption = 'Receivables';
                    action(Customers5)
                    {
                        Caption = 'Customers';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Customer List";
                        tooltip = 'Open Customers';

                    }
                    action(CreditManagement)
                    {
                        Caption = 'Credit Management';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Customer List - Credit Mgmt.";
                        tooltip = 'Open Credit Management';

                    }
                    action(SalesInvoices)
                    {
                        Caption = 'Sales Invoices';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Sales Invoice";
                        tooltip = 'Open Sales Invoices';

                    }
                    action(SalesCreditMemo)
                    {
                        Caption = 'Sales Credit Memo';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Sales Credit Memo";
                        tooltip = 'Open Sales Credit Memo';

                    }
                    action(DirectDebitCollections)
                    {
                        Caption = 'Direct Debit Collections';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Direct Debit Collections";
                        tooltip = 'Open Direct Debit Collections';

                    }
                    action(CreateRecurringSalesInvoice)
                    {
                        Caption = 'Create Recurring Sales Invoice';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Create Recurring Sales Inv.";//IS THIS ONE MISSING
                        tooltip = 'Open Create Recurring Sales Invoice';

                    }
                    action(RegisterCustomerPayments)
                    {
                        Caption = 'Register Customer Payments';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Payment Registration";//is this one missing
                        tooltip = 'Open Register Customer Payments';

                    }
                    group(Combine)
                    {
                        Caption = 'Combine';

                        action(action72)
                        {
                            Caption = 'Combine Shipments';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Combine Shipments"; //IS THIS ONE MISSING
                            tooltip = 'Open Combine Shipments';
                        }
                        action(action73)
                        {
                            Caption = 'Combine Return Receipts...';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Combine Return Receipts"; //IS THIS ONE MISSING
                            tooltip = 'Open Combine Return Receipts...';
                        }

                    }
                    group(ReminderFinChargeMemos)
                    {
                        Caption = 'Reminder Fin. Charge Memos';
                        action(action74)
                        {
                            Caption = 'Reminders';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Reminder";
                            tooltip = 'Open Reminders';
                        }
                        action(action75)
                        {
                            Caption = 'Issued Reminders';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Issued Reminder";
                            tooltip = 'Open Issued Reminders';
                        }
                        action(action76)
                        {
                            Caption = 'Finance Charge Memos';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Finance Charge Memo";
                            tooltip = 'Open Finance Charge Memos';
                        }
                        action(action77)
                        {
                            Caption = 'Issued Finance Charge Memos';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Issued Finance Charge Memo";
                            tooltip = 'Open Issued Finance Charge Memos';
                        }


                    }
                    group(Journals3)
                    {
                        Caption = 'Journals';

                        action(action78)
                        {
                            Caption = 'Sales Journal';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Sales Journal";
                            tooltip = 'Open Sales Journal';
                        }
                        action(action79)
                        {
                            Caption = 'Cash Receipt Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Cash Receipt Journal";
                            tooltip = 'Open Cash Receipt Journals';
                        }

                    }
                    group(PostedDocuments)
                    {
                        Caption = 'Posted Documents';

                        action(action80)
                        {
                            Caption = 'Posted Sales Invoices';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Posted Sales Invoices";
                            tooltip = 'Open Posted Sales Invoices';
                        }

                        action(action82)
                        {
                            Caption = 'Posted Sales Shipments';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Posted Sales Shipments";
                            tooltip = 'Open Posted Sales Shipments';
                        }
                        action(action81)
                        {
                            Caption = 'Posted Sales Credit Memos';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Posted Sales Credit Memos";
                            tooltip = 'Open Posted Sales Credit Memos';
                        }

                        action(action83)
                        {
                            Caption = 'Posted Return Receipts';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Posted Return Receipts";
                            tooltip = 'Open Posted Return Receipts';
                        }

                    }
                    group(RegisterEntries2)
                    {
                        Caption = 'Register Entries';
                        action(action84)
                        {
                            Caption = 'G/L Registers';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "G/L Registers";
                            tooltip = 'Open G/L Registers';

                        }
                        action(action85)
                        {
                            Caption = 'Customer Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Customer Ledger Entries";
                            tooltip = 'Open Customer Ledger Entries';

                        }
                        action(action86)
                        {
                            Caption = 'Reminder/Fin. Charge Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Reminder/Fin. Charge Entries";
                            tooltip = 'Open Reminder/Fin. Charge Entries';

                        }
                        action(action87)
                        {
                            Caption = 'Detailed Customer Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Customer Ledger Entries";
                            tooltip = 'Open Detailed Customer Ledger Entries';

                        }


                    }
                    group(Reports5)
                    {
                        Caption = 'Reports';
                        action(action88)
                        {
                            Caption = 'Customer Account Detail';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer Account Detail";
                            tooltip = 'Open Customer Account Detail';
                        }
                        action(action89)
                        {
                            Caption = 'Customer Statement';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer Statement";
                            tooltip = 'Open Customer Statement';
                        }
                        action(action90)
                        {
                            Caption = 'Customer Register';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer Register";
                            tooltip = 'Open Customer Register';
                        }
                        action(action91)
                        {
                            Caption = 'Customer - Balance to Date';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Balance to Date";
                            tooltip = 'Open Customer - Balance to Date';
                        }
                        action(action10091)
                        {
                            Caption = 'Customer - Detail Trial Bal.';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Detail Trial Bal.";
                            tooltip = 'Open Customer - Detail Trial Bal.';
                        }
                        action(action92)
                        {
                            Caption = 'Customer Listing';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer Listing";
                            tooltip = 'Open Customer Listing';
                        }
                        action(action93)
                        {
                            Caption = 'Customer - Summary Aging Simp.';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Summary Aging Simp.";
                            tooltip = 'Open Customer - Summary Aging Simp.';
                        }
                        action(action94)
                        {
                            Caption = 'Customer - Order Summary';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Order Summary";
                            tooltip = 'Open Customer - Order Summary';
                        }
                        action(action95)
                        {
                            Caption = 'Customer - Order Detail';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Order Detail";
                            tooltip = 'Open Customer - Order Detail';
                        }
                        action(action96)
                        {
                            Caption = 'Customer Labels';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Labels";
                            tooltip = 'Open Customer Labels';
                        }
                        action(action97)
                        {
                            Caption = 'Customer Top 10 List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Top 10 List";
                            tooltip = 'Open Customer Top 10 List';
                        }
                        action(action98)
                        {
                            Caption = 'Customer - Sales List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Sales List";
                            tooltip = 'Open Customer - Sales List';
                        }
                        action(action99)
                        {
                            Caption = 'Aged Accounts Receivable';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Aged Accounts Receivable";
                            tooltip = 'Open Aged Accounts Receivable';
                        }
                        action(action100)
                        {
                            Caption = 'Customer Trial Balance';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer - Trial Balance";
                            tooltip = 'Open Customer Trial Balance';
                        }
                        action(action101)
                        {
                            Caption = 'Customer Sales Statistics';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer Sales Statistics";
                            tooltip = 'Open Customer Sales Statistics';
                        }
                        action(action102)
                        {
                            Caption = 'Customer Listing';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer Listing";
                            tooltip = 'Open Customer Listing';


                        }
                        action(action103)
                        {
                            Caption = 'Customer/Item Statistics';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Customer/Item Statistics";
                            tooltip = 'Open Customer/Item Statistics';
                        }
                        action(action104)
                        {
                            Caption = 'Cust./Item Stat. by Salespers.';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Cust./Item Stat. by Salespers.";
                            tooltip = 'Open Cust./Item Stat. by Salespers.';
                        }
                        action(action105)
                        {
                            Caption = 'Daily Invoicing Report';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Daily Invoicing Report";
                            tooltip = 'Open Daily Invoicing Report';
                        }
                        action(action106)
                        {
                            Caption = 'Open Customer Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Open Customer Entries";
                            tooltip = 'Open Open Customer Entries';
                        }
                        action(action107)
                        {
                            Caption = 'Outstanding Sales Order Aging';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Outstanding Sales Order Aging";
                            tooltip = 'Open Outstanding Sales Order Aging';
                        }
                        action(action108)
                        {
                            Caption = 'Outstanding Sales Order Status';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Outstanding Sales Order Status";
                            tooltip = 'Open Outstanding Sales Order Status';
                        }
                        action(action109)
                        {
                            Caption = 'Sales Tax Area List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Sales Tax Area List";
                            tooltip = 'Open Sales Tax Area List';
                        }
                        action(action110)
                        {
                            Caption = 'Sales Tax Detail by Area';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Sales Tax Detail by Area";
                            tooltip = 'Open Sales Tax Detail by Area';
                        }
                        action(action111)
                        {
                            Caption = 'Sales Tax Detail List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Sales Tax Detail List";
                            tooltip = 'Open Sales Tax Detail List';
                        }
                        action(action112)
                        {
                            Caption = 'Sales Tax Group List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Sales Tax Group List";
                            tooltip = 'Open Sales Tax Group List';
                        }
                        action(action113)
                        {
                            Caption = 'Sales Tax Jurisdiction List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Sales Tax Jurisdiction List";
                            tooltip = 'Open Sales Tax Jurisdiction List';
                        }
                        action(action114)
                        {
                            Caption = 'Projected Cash Receipts';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Projected Cash Receipts";
                            tooltip = 'Open Projected Cash Receipts';
                        }



                    }
                    group(Setup5)
                    {
                        Caption = 'Setup';

                        action(action127)
                        {
                            Caption = 'Sales & Receivables Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Sales & Receivables Setup";
                            tooltip = 'Open Sales & Receivables Setup';

                        }
                        action(action128)
                        {
                            Caption = 'Report Selectio..der/Fin. Charge';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Report Selection - Reminder";
                            tooltip = 'Open Report Selectio..der/Fin. Charge';

                        }
                        action(action129)
                        {
                            Caption = 'Finance Charge Terms';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Finance Charge Terms";
                            tooltip = 'Open Finance Charge Terms';
                        }


                    }

                }
                group(pay)
                {
                    Caption = 'Payables';
                    action(Vendors5)
                    {
                        Caption = 'Vendors';
                        Visible = true;
                        ApplicationArea = basic, suite;
                        RunObject = Page "Vendor List";
                        tooltip = 'Open Vendors';

                    }
                    action(Purchaseinvoices)
                    {
                        Caption = 'Purchase Invoices';
                        Visible = true;
                        ApplicationArea = basic, suite;
                        RunObject = Page "Purchase Invoices";
                        tooltip = 'Open Purchase Invoices';

                    }

                    action(PurchaseCreditMemo)
                    {
                        Caption = 'Purchase Credit Memo';
                        Visible = true;
                        ApplicationArea = basic, suite;
                        RunObject = Page "Purchase Credit Memo";
                        tooltip = 'Open Purchase Credit Memo';

                    }

                    action(IncomingDocuments)
                    {
                        Caption = 'Incoming Documents';
                        Visible = true;
                        ApplicationArea = basic, suite;
                        RunObject = Page "Incoming Documents";
                        tooltip = 'Open Incoming Documents';

                    }

                    action(GeneralEFTFiles)
                    {
                        Caption = 'Generate EFT Files';
                        Visible = true;
                        ApplicationArea = basic, suite;
                        RunObject = Page "Generate EFT Files";
                        tooltip = 'Open Generate EFT Files';

                    }

                    group(Journals4)
                    {
                        Caption = 'Journals';

                        action(action132)
                        {
                            Caption = 'Purchase Journals';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Purchase Journal";
                            tooltip = 'Open Purchase Journals';
                        }
                        action(action133)
                        {
                            Caption = 'Payment Journals';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Payment Journal";
                            tooltip = 'Open Payment Journals';
                        }

                    }

                    group(PostedDocuments2)
                    {
                        Caption = 'Posted Documents';

                        action(action135)
                        {
                            Caption = 'Posted Purchase Credit Memos';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Posted Purchase Credit Memos";
                            tooltip = 'Open Posted Purchase Credit Memos';
                        }
                        action(action134)
                        {
                            Caption = 'Posted Purchase Invoices';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Posted Purchase Invoices";
                            tooltip = 'Open Posted Purchase Invoices';
                        }
                        action(action137)
                        {
                            Caption = 'Posted Purchase Receipts';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Posted Purchase Receipts";
                            tooltip = 'Open Posted Purchase Receipts';

                        }
                        action(action136)
                        {
                            Caption = 'Posted Purchase Return Shipments';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Posted Return Shipments";
                            tooltip = 'Open Posted Purchase Return Shipments';
                        }



                    }

                    group(RegisterEntries3)
                    {
                        Caption = 'Register Entries';

                        action(action138)
                        {
                            Caption = 'G/L Registers';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "G/L Registers";
                            tooltip = 'Open G/L Registers';

                        }
                        action(action139)
                        {
                            Caption = 'Vendor Ledger Entries';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Vendor Ledger Entries";
                            tooltip = 'Open Vendor Ledger Entries';
                        }
                        action(action140)
                        {
                            Caption = 'Detailed Vendor Ledger Entries';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Detailed Vendor Ledg. Entries";
                            tooltip = 'Open Details Vendor Ledger Entries';
                        }
                        action(action141)
                        {
                            Caption = 'Credit Transfer Registers';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Credit Transfer Registers";
                            tooltip = 'Open Credit Transfer Registers';
                        }
                        action(action142)
                        {
                            Caption = 'Employee Ledger Entries';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Employee Ledger Entries";
                            tooltip = 'Open Employee Ledger Entries';
                        }

                    }

                    group(Reports6)
                    {
                        Caption = 'Reports';

                        action(action143)
                        {
                            Caption = 'Aged Accounts Payable';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Aged Accounts Payable";
                            tooltip = 'Open Aged Accounts Payable';
                        }

                        action(action144)
                        {
                            Caption = 'Item/Vendor Catalog';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Item/Vendor Catalog";
                            tooltip = 'Open Item/Vendor Catalog';
                        }

                        action(action145)
                        {
                            Caption = 'Vendor - Balance to Date';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor - Balance to Date";
                            tooltip = 'Open Vendor - Balance to Date';
                        }

                        action(action146)
                        {
                            Caption = 'Vendor Labels';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor Labels";
                            tooltip = 'Open Vendor Labels';
                        }

                        action(action147)
                        {
                            Caption = 'Vendor - List';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor - List";
                            tooltip = 'Open Vendor - List';
                        }

                        action(action148)
                        {
                            Caption = 'Vendor - Purchase List';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor - Purchase List";
                            tooltip = 'Open Vendor - Purchase List';
                        }

                        action(action149)
                        {
                            Caption = 'Vendor - Trial Balance';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor - Trial Balance";
                            tooltip = 'Open Vendor - Trial Balance';
                        }

                        action(action150)
                        {
                            Caption = 'Cash Application';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Cash Application";
                            tooltip = 'Open Cash Application';
                        }

                        action(action151)
                        {
                            Caption = 'Cash Requirem. by Due Date';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Cash Requirements by Due Date";
                            tooltip = 'Open Cash Requirem. by Due Date';
                        }

                        action(action152)
                        {
                            Caption = 'Item Statistics by Purchaser';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Item Statistics by Purchaser";
                            tooltip = 'Open Item Statistics by Purchaser';
                        }

                        action(action153)
                        {
                            Caption = 'Open Vendor Entries';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Open Vendor Entries";
                            tooltip = 'Open Open Vendor Entries';
                        }

                        action(action154)
                        {
                            Caption = 'Projected Cash Payments';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Projected Cash Payments";
                            tooltip = 'Open Projected Cash Payments';
                        }

                        action(action155)
                        {
                            Caption = 'Purchaser Stat. by Invoice';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Purchaser Stat. by Invoice";
                            tooltip = 'Open Purchaser Stat. by Invoice';
                        }

                        action(action156)
                        {
                            Caption = 'Top __ Vendor List';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Top __ Vendor List";
                            tooltip = 'Open Top __ Vendor List';
                        }

                        action(action157)
                        {
                            Caption = 'Vendor Account Detail';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor Account Detail";
                            tooltip = 'Open Vendor Account Detail';
                        }
                        action(action158)
                        {
                            Caption = 'Vendor Purchase Statistics';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor Purchase Statistics";
                            tooltip = 'Open Vendor Purchase Statistics';
                        }
                        action(action159)
                        {
                            Caption = 'Vendor - Listing';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor - Listing";
                            tooltip = 'Open Vendor - Listing';
                        }
                        action(action160)
                        {
                            Caption = 'Vendor/Item Statistics';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Report "Vendor/Item Statistics";
                            tooltip = 'Open Vendor/Item Statistics';
                        }


                    }
                    group(Setup6)
                    {
                        Caption = 'Setup';

                        action(action174)
                        {
                            Caption = 'Purchase & Payables Setup';
                            Visible = true;
                            ApplicationArea = basic, suite;
                            RunObject = Page "Purchases & Payables Setup";
                            tooltip = 'Open Purchase & Payables Setup';
                        }


                    }
                }
                group(fa)
                {
                    Caption = 'Fixed Assets';
                    action(FixedAssets)
                    {
                        Caption = 'Fixed Assets';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Fixed Asset List";
                        tooltip = 'Open Fixed Assets';
                    }

                    action(Insurance)
                    {
                        Caption = 'Insurance';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Insurance List";
                        tooltip = 'Open Insurance';
                    }

                    action(CalculateDepreciation)
                    {
                        Caption = 'Calculate Depreciation...';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Calculate Depreciation";
                        tooltip = 'Open Calculate Depreciation...';
                    }

                    action(IndexFixedAssets)
                    {
                        Caption = 'Index Fixed Assets...';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Index Fixed Assets";
                        tooltip = 'Open Index Fixed Assets...';
                    }

                    action(IndexInsurance)
                    {
                        Caption = 'Index Insurance...';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Index Insurance";
                        tooltip = 'Open Index Insurance...';
                    }

                    group(Journals5)
                    {
                        Caption = 'Journals';

                        action(action176)
                        {
                            Caption = 'FA G/L Journal';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Fixed Asset G/L Journal";
                            tooltip = 'Open FA G/L Journal';
                        }
                        action(action177)
                        {
                            Caption = 'FA Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Fixed Asset Journal";
                            tooltip = 'Open FA Journals';
                        }
                        action(action178)
                        {
                            Caption = 'FA Reclassification Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Reclass. Journal";
                            tooltip = 'Open FA Reclassification Journals';
                        }
                        action(action179)
                        {
                            Caption = 'Insurance Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Insurance Journal";
                            tooltip = 'Open Insurance Journals';
                        }
                        action(action180)
                        {
                            Caption = 'Recurring General Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Recurring General Journal";
                            tooltip = 'Open Recurring General Journals';
                        }
                        action(action181)
                        {
                            Caption = 'Recurring Fixed Asset Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Recurring Fixed Asset Journal";
                            tooltip = 'Open Recurring Fixed Asset Journals';
                        }

                    }

                    group(Reports7)
                    {
                        Caption = 'Reports';

                        group(reportFixedAssets)
                        {
                            caption = 'Fixed Assets';
                            action(action182)
                            {
                                Caption = 'FA Posting Group - Net Change';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "FA Posting Group - Net Change";
                                tooltip = 'Open FA Posting Group - Net Change';

                            }
                            action(action183)
                            {
                                Caption = 'FA Register';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset Register";
                                tooltip = 'Open FA Register';

                            }
                            action(action184)
                            {
                                Caption = 'FA Acquisition List';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Fixed Asset Acquisition Wizard";
                                tooltip = 'Open FA Acquisition List';
                            }
                            action(action20185)
                            {
                                Caption = 'FA Analysis';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset - Analysis";
                                tooltip = 'Open FA Analysis';
                            }
                            action(action20186)
                            {
                                Caption = 'FA Book Value 01';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset - Book Value 01";
                                tooltip = 'Open FA Book Value 01';
                            }
                            action(action20187)
                            {
                                Caption = 'FA Book Value 02';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset - Book Value 02";
                                tooltip = 'Open FA Book Value 02';
                            }
                            action(action20188)
                            {
                                Caption = 'FA Details';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset - Details";
                                tooltip = 'Open FA Details';
                            }
                            action(action20189)
                            {
                                Caption = 'FA G/L Analysis';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset - G/L Analysis";
                                tooltip = 'Open FA G/L Analysis';
                            }
                            action(action20190)
                            {
                                Caption = 'FA List';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset - List";
                                tooltip = 'Open FA List';
                            }
                            action(action20191)
                            {
                                Caption = 'FA Projected Value';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Fixed Asset - Projected Value";
                                tooltip = 'Open FA Projected Value';
                            }

                        }
                        group(reportInsurance)
                        {
                            caption = 'Insurance';
                            action(action20192)
                            {
                                Caption = 'Uninsured FAs';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Insurance - Uninsured FAs";
                                tooltip = 'Open Uninsured FAs';
                            }
                            action(action20193)
                            {
                                Caption = 'Insurance Register';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Insurance Register";
                                tooltip = 'Open Insurance Register';
                            }
                            action(action20194)
                            {
                                Caption = 'Insurance Analysis';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Insurance - Analysis";
                                tooltip = 'Open Insurance Analysis';
                            }
                            action(action20195)
                            {
                                Caption = 'Insurance Coverage Details';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Insurance - Coverage Details";
                                tooltip = 'Open Insurance Coverage Details';
                            }
                            action(action20196)
                            {
                                Caption = 'Insurance List';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Insurance - List";
                                tooltip = 'Open Insurance List';
                            }
                            action(action20197)
                            {
                                Caption = 'FA Total Value Insured';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = page "Total Value Insured per FA";
                                tooltip = 'Open FA Total Value Insured';
                            }

                        }

                        group(reportMaintenance)
                        {
                            caption = 'Maintenance';
                            action(action20198)
                            {
                                Caption = 'Maintenance Register';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Maintenance Register";
                                tooltip = 'Open Maintenance Register';
                            }
                            action(action20199)
                            {
                                Caption = 'Maintenance Analysis';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Maintenance - Analysis";
                                tooltip = 'Open Maintenance Analysis';
                            }
                            action(action20200)
                            {
                                Caption = 'Maintenance Details';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Maintenance - Details";
                                tooltip = 'Open Maintenance Details';
                            }
                            action(action20201)
                            {
                                Caption = 'Maintenance Next Service';
                                Visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Maintenance - Next Service";
                                tooltip = 'Open Maintenance Next Service';
                            }
                        }
                    }

                    group(RegisterEntries4)
                    {
                        Caption = 'Register Entries';

                        action(action185)
                        {
                            Caption = 'FA Registers';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Registers";
                            tooltip = 'Open FA Registers';

                        }
                        action(action186)
                        {
                            Caption = 'Insurance Registers';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Insurance Registers";
                            tooltip = 'Open Insurance Registers';
                        }
                        action(action187)
                        {
                            Caption = 'FA Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Ledger Entries";
                            tooltip = 'Open FA Ledger Entries';
                        }
                        action(action188)
                        {
                            Caption = 'Maintenance Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Maintenance Ledger Entries";
                            tooltip = 'Open Maintenance Ledger Entries';
                        }
                        action(action189)
                        {
                            Caption = 'Insurance Coverage Ledger Entries';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Ins. Coverage Ledger Entries";
                            tooltip = 'Open Insurance Coverage Ledger Entries';
                        }
                    }

                    group(Setup7)
                    {
                        Caption = 'Setup';
                        action(action190)
                        {
                            Caption = 'FA Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Fixed Asset Setup";
                            tooltip = 'Open FA Setup';
                        }
                        action(action191)
                        {
                            Caption = 'FA Classes';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Classes";
                            tooltip = 'Open FA Classes';
                        }
                        action(action192)
                        {
                            Caption = 'FA Subclasses';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Subclasses";
                            tooltip = 'Open FA Subclasses';
                        }
                        action(action193)
                        {
                            Caption = 'FA Locations';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Locations";
                            tooltip = 'Open FA Locations';
                        }
                        action(action194)
                        {
                            Caption = 'Insurance Types';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Insurance Types";
                            tooltip = 'Open Insurance Types';
                        }
                        action(action195)
                        {
                            Caption = 'Maintenance';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Maintenance";
                            tooltip = 'Open Maintenance';

                        }
                        action(action196)
                        {
                            Caption = 'Depreciation Books';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Depreciation Book List";
                            tooltip = 'Open Depreciation Books';
                        }
                        action(action197)
                        {
                            Caption = 'Depreciation Tables';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Depreciation Table List";
                            tooltip = 'Open Depreciation Tables';
                        }
                        action(action198)
                        {
                            Caption = 'FA Journal Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Journal Templates";
                            tooltip = 'Open FA Journal Templates';
                        }
                        action(action199)
                        {
                            Caption = 'FA Reclass. Journal Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Reclass. Journal Templates";
                            tooltip = 'Open FA Reclass. Journal Templates';
                        }
                        action(action200)
                        {
                            Caption = 'Insurance Journal Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Insurance Journal Templates";
                            tooltip = 'Open Insurance Journal Templates';
                        }
                    }
                }
                group(inv1212)
                {
                    Caption = 'Inventory';
                    Visible = true;
                    action(InventoryPeriods)
                    {
                        Caption = 'Inventory Periods';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Inventory Periods";
                        tooltip = 'Open Inventory Periods';
                    }

                    action(PhysInvCountPeriod)
                    {
                        Caption = 'Physical Invent...Counting Periods';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Physical Inventory Count";
                        tooltip = 'Open Physical Invent...Counting Periods';
                    }

                    action(ApplicationWorksheet)
                    {
                        Caption = 'Application Worksheet';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Application Worksheet";
                        tooltip = 'Open Application Worksheet';
                    }

                    group(Costing)//4 actions
                    {
                        Caption = 'Costing';

                        action(action201)
                        {
                            Caption = 'Adjust Item Costs/Prices';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Adjust Item Costs/Prices";
                            tooltip = 'Open Adjust Item Costs/Prices';
                        }
                        action(action202)
                        {
                            Caption = 'Adjust Cost - Item Entries...';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Adjust Cost - Item Entries";
                            tooltip = 'Open Adjust Cost - Item Entries...';
                        }
                        action(action203)
                        {
                            Caption = 'Post Inventory Cost to G/L';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Post Inventory Cost to G/L";
                            tooltip = 'Open Post Inventory Cost to G/L';
                        }

                    }

                    group(Journals6) //4 actions
                    {
                        Caption = 'Journals';
                        action(action205)
                        {
                            Caption = 'Item Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Item Journal";
                            tooltip = 'Open Item Journals';
                        }
                        action(action206)
                        {
                            Caption = 'Item Reclassification Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Item Reclass. Journal";
                            tooltip = 'Open Item Reclassification Journals';
                        }
                        action(action207)
                        {
                            Caption = 'Physical Inventory Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Phys. Inventory Journal";
                            tooltip = 'Open Physical Inventory Journals';
                        }
                        action(action208)
                        {
                            Caption = 'Revaluation Journals';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Revaluation Journal";
                            tooltip = 'Open Revaluation Journals';
                        }

                    }

                    group(Reports8) //26 actions
                    {
                        Caption = 'Reports';
                        action(action209)
                        {
                            Caption = 'Inventory Transaction Detail';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Transaction Detail";
                            tooltip = 'Open Inventory Transaction Detail';
                        }
                        action(action210)
                        {
                            Caption = 'Inventory Reorders';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Inventory - Reorders";
                            tooltip = 'Open Inventory Reorders';
                        }
                        action(action211)
                        {
                            Caption = 'Item Substitutions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Substitutions";
                            tooltip = 'Open Item Substitutions';
                        }
                        action(action212)
                        {
                            Caption = 'Inventory - Vendor Purchases';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Vendor Purchases by Item";
                            tooltip = 'Open Inventory - Vendor Purchases';
                        }
                        action(action213)
                        {
                            Caption = 'Invt. Valuation - Cost Spec.';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Invt. Valuation - Cost Spec.";
                            tooltip = 'Open Invt. Valuation - Cost Spec.';
                        }
                        action(action214)
                        {
                            Caption = 'Item Age Composition - Value';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Age Composition - Value";
                            tooltip = 'Open Item Age Composition - Value';
                        }
                        action(action215)
                        {
                            Caption = 'Item Register - Value';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Register - Value";
                            tooltip = 'Open Item Register - Value';
                        }
                        action(action216)
                        {
                            Caption = 'Physical Inventory List';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Phys. Inventory List";
                            tooltip = 'Open Physical Inventory List';
                        }
                        action(action217)
                        {
                            Caption = 'Status';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Status";
                            tooltip = 'Open Status';
                        }
                        action(action218)
                        {
                            Caption = 'Item Dimensions - Detail';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Dimensions - Detail";
                            tooltip = 'Open Item Dimensions - Detail';
                        }
                        action(action219)
                        {
                            Caption = 'Item Dimensions - Total';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Dimensions - Total";
                            tooltip = 'Open Item Dimensions - Total';
                        }
                        action(action220)
                        {
                            Caption = 'Inventory - G/L Reconciliation';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Inventory - G/L Reconciliation";
                            tooltip = 'Open Inventory - G/L Reconciliation';
                        }

                    }

                    group(Setup8) //10 actions
                    {
                        Caption = 'Setup';
                        action(action235)
                        {
                            Caption = 'Inventory Posting Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Inventory Posting Setup";
                            tooltip = 'Open Inventory Posting Setup';
                        }
                        action(action236)
                        {
                            Caption = 'Inventory Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Inventory Setup";
                            tooltip = 'Open Inventory Setup';
                        }
                        action(action237)
                        {
                            Caption = 'Item Charges';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Item Charges";
                            tooltip = 'Open Item Charges';
                        }
                        action(action238)
                        {
                            Caption = 'Item Categories';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Item Categories";
                            tooltip = 'Open Item Categories';
                        }
                        action(action239)
                        {
                            Caption = 'Rounding Methods';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Rounding Methods";
                            tooltip = 'Open Rounding Methods';
                        }
                        action(action240)
                        {
                            Caption = 'Analysis Types';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis Types";
                            tooltip = 'Open Analysis Types';
                        }
                        action(action241)
                        {
                            Caption = 'Inventory Analysis Reports';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Inventory Analysis Report";
                            tooltip = 'Open Inventory Analysis Reports';
                        }
                        action(action242)
                        {
                            Caption = 'Inventory Analysis by Dimensions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Invt. Analysis by Dimensions";
                            tooltip = 'Open Inventory Analysis by Dimensions';
                        }
                        action(action243)
                        {
                            Caption = 'Invt. Analysis Column Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis Column Templates";
                            tooltip = 'Open Invt. Analysis Column Templates';
                        }
                        action(action244)
                        {
                            Caption = 'Invt. Analysis Line Templates';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis Line Templates";
                            tooltip = 'Open Invt. Analysis Line Templates';
                        }

                    }

                }
                group(setup)
                {
                    Caption = 'Setup';
                    Visible = true;

                    action(GeneralPostingSetup)
                    {
                        Caption = 'General Posting Setup';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "General Posting Setup";
                        tooltip = 'Open General Posting Setup';
                    }

                    action(IncomingDocumentSetup)
                    {
                        Caption = 'Incoming Document Setup';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Incoming Documents Setup";
                        tooltip = 'Open Incoming Document Setup';
                    }

                    action(AccountingPeriods)
                    {
                        Caption = 'Accounting Periods';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Accounting Periods";
                        Tooltip = 'Open Accounting Periods';
                    }

                    action(StandardTextCodes)
                    {
                        Caption = 'Standard Text Codes';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Standard Text Codes";
                        Tooltip = 'Open Standard Text Codes';
                    }

                    action(NoSeries)
                    {
                        Caption = 'No. Series';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "No. Series";
                        Tooltip = 'Open No. Series';
                    }
                    action(GifiCodes)
                    {
                        Caption = 'GIFI Codes';
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "GIFI Codes";
                        Tooltip = 'Open GIFI Codes';
                    }

                    group(SalesTax) // 6 actions
                    {
                        Caption = 'Sales Tax';
                        action(action245)
                        {
                            Caption = 'Tax Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Tax Groups";
                            tooltip = 'Open Tax Groups';
                        }
                        action(action246)
                        {
                            Caption = 'Tax Jurisdictions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Tax Jurisdictions";
                            tooltip = 'Open Tax Jurisdictions';
                        }
                        action(action247)
                        {
                            Caption = 'Tax Areas';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Tax Area";
                            tooltip = 'Open Tax Areas';
                        }
                        action(action248)
                        {
                            Caption = 'Tax Details';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Tax Details";
                            tooltip = 'Open Tax Details';
                        }
                        action(action249)
                        {
                            Caption = 'Tax Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Tax Setup";
                            tooltip = 'Open Tax Setup';
                        }


                    }

                    group(VAT3) //4 actions
                    {
                        Caption = 'VAT';
                        action(action251)
                        {
                            Caption = 'VAT Posting Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "VAT Posting Setup";
                            tooltip = 'Open VAT Posting Setup';
                        }
                        action(action252)
                        {
                            Caption = 'VAT Clauses';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "VAT Clauses";
                            tooltip = 'Open VAT Clauses';
                        }
                        action(action253)
                        {
                            Caption = 'VAT Rate Change Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "VAT Rate Change Setup";
                            tooltip = 'Open VAT Rate Change Setup';
                        }
                    }
                    group(Intercompany5)
                    {
                        Caption = 'Intercompany';
                        action(action256)
                        {
                            Caption = 'Intercompany Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Intercompany Setup";
                            tooltip = 'Open Intercompany Setup';
                        }
                        action(action257)
                        {
                            Caption = 'Intercompany Partners';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            runobject = page "IC Partner List";
                            tooltip = 'Open Intercompany Partners';
                        }
                        action(action258)
                        {
                            Caption = 'Intercompany Chart of Accounts';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "IC Chart of Accounts";
                            tooltip = 'Open Intercompany Chart of Accounts';
                        }
                        action(action259)
                        {
                            Caption = 'Intercompany Dimensions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "IC Dimensions";
                            tooltip = 'Open Intercompany Dimensions';
                        }

                    }
                    group(Dimensions3)
                    {
                        Caption = 'Dimensions';

                        action(action260)
                        {
                            Caption = 'Dimensions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Dimensions";
                            tooltip = 'Open Dimensions';
                        }
                        action(action261)
                        {
                            Caption = 'Analysis by Dimensions';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis by Dimensions";
                            tooltip = 'Open Analysis by Dimensions';
                        }
                        action(action262)
                        {
                            Caption = 'Dimension Combinations';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Dimension Combinations";
                            tooltip = 'Open Dimension Combinations';
                        }
                        action(action263)
                        {
                            Caption = 'Default Dimension Priorities';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Default Dimension Priorities";
                            tooltip = 'Open Default Dimension Priorities';
                        }
                    }

                    group(TrailCodes)
                    {
                        Caption = 'Trail Codes';
                        action(action264)
                        {
                            Caption = 'Source Codes';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Source Codes";
                            tooltip = 'Open Source Codes';

                        }
                        action(action265)
                        {
                            Caption = 'Reason Codes';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Reason Codes";
                            tooltip = 'Open Reason Codes';
                        }
                        action(action266)
                        {
                            Caption = 'Source Code Setup';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Source Code Setup";
                            tooltip = 'Open Source Code Setup';
                        }

                    }

                    group(PostingGroups)
                    {
                        Caption = 'Posting Groups';

                        action(action267)
                        {
                            Caption = 'Gen. Bus. Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Gen. Business Posting Groups";
                            tooltip = 'Open Gen. Bus. Posting Groups';
                        }
                        action(action268)
                        {
                            Caption = 'General Product Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Gen. Product Posting Groups";
                            tooltip = 'Open General Product Posting Groups';
                        }
                        action(action269)
                        {
                            Caption = 'Customer Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Customer Posting Groups";
                            tooltip = 'Open Customer Posting Groups';
                        }
                        action(action270)
                        {
                            Caption = 'Vendor Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Vendor Posting Groups";
                            tooltip = 'Open Vendor Posting Groups';
                        }
                        action(action271)
                        {
                            Caption = 'Bank Account Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Bank Account Posting Groups";
                            tooltip = 'Open Bank Account Posting Groups';
                        }
                        action(action272)
                        {
                            Caption = 'Inventory Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Inventory Posting Groups";
                            tooltip = 'Open Inventory Posting Groups';
                        }
                        action(action273)
                        {
                            Caption = 'FA Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "FA Posting Groups";
                            tooltip = 'Open FA Posting Groups';
                        }
                        action(action274)
                        {
                            Caption = 'VAT Business Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "VAT Business Posting Groups";
                            tooltip = 'Open VAT Business Posting Groups';
                        }
                        action(action275)
                        {
                            Caption = 'VAT Product Posting Groups';
                            Visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "VAT Product Posting Groups";
                            tooltip = 'Open VAT Product Posting Groups';
                        }
                    }
                }
            }

            //PURCHASING GROUP
            group(Action1041)
            {
                Caption = 'Purchasing';
                Image = AdministrationSalesPurchases;
                ToolTip = 'Manage purchase invoices and credit memos. Maintain vendors and their history.';


                group(Purchasing)
                {
                    Caption = 'Purchasing';
                    action(Purchase_VendorList)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Vendors';
                        Visible = true;
                        RunObject = Page "Vendor List";
                        ToolTip = 'Open Vendors';
                    }

                    action(Purchase_Contacts)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Contacts';
                        Visible = true;
                        RunObject = Page "Contact List";
                        ToolTip = 'Open Contacts';
                    }

                    action(Purchase_PurchaseQuotes)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Quotes';
                        Visible = true;
                        RunObject = Page "Purchase Quotes";
                        ToolTip = 'Open Purchase Quotes';
                    }

                    action(Purchase_PurchaseOrders)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Orders';
                        RunObject = Page "Purchase Order List";
                        ToolTip = 'Open Purchase Orders';
                    }

                    action(Purchase_BlanketPurchaseOrders)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Blanket Purchase Orders';
                        RunObject = Page "Blanket Purchase Orders";
                        ToolTip = 'Open Blanket Purchase Orders';
                    }

                    action(Purchase_TransferOrders)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Return Orders';
                        RunObject = Page "Purchase Return Order List";
                        ToolTip = 'Open Purchase Return Orders';
                    }
                    action(Purchase_PurchaseInvoices)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Invoices';
                        RunObject = Page "Purchase Invoices";
                        ToolTip = 'Open Purchase Invoices';
                    }

                    action(Purchase_PurchaseCreditMemos)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Credit Memos';
                        RunObject = Page "Purchase Credit Memos";
                        ToolTip = 'Open Purchase Credit Memos';

                    }

                    action(Purchase_CertificateOfSupply)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Certificate of Supply';
                        RunObject = Report "Certificate of Supply";
                        ToolTip = 'Open Certificate of Supply';
                    }
                    action(Purchase_SubcontractingWorksheets)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Subcontracting Worksheets';
                        RunObject = Page "Subcontracting Worksheet";
                        ToolTip = 'Open Subcontracting Worksheets';
                    }

                    action(Purchase_PurchaseJournals)
                    {
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Journals';
                        RunObject = Page "Purchase Journal";
                        ToolTip = 'Open Purchase Journals';
                    }

                    group(Purchase_BudgetAndAnalysis)
                    {
                        visible = true;
                        Caption = 'Budget & Analysis';
                        action(PurchaseBudgets)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Budgets';
                            RunObject = Page "Purchase Budget Overview";
                            ToolTip = 'Open Purchase Budgets';
                        }
                        action(Purchase_AnalysisReports)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Analysis Reports';
                            RunObject = Page "Purchase Analysis Report";
                            ToolTip = 'Open Purchase Analysis Reports';
                        }

                        action(PurchaseReports)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Analysis by Dimensions';
                            RunObject = Page "Purch. Analysis by Dimensions";
                            ToolTip = 'Open Purchase Analysis by Dimensions';
                        }
                        action(Purchase_Statistics)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Dimensions - Detail';
                            RunObject = Report "Item Dimensions - Detail";
                            ToolTip = 'Open Item Dimensions - Detail';
                        }
                        action(Purchase_StatisticsMatrix)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Dimensions - Total';
                            RunObject = Report "Item Dimensions - Total";
                            ToolTip = 'Open Item Dimensions - Total';
                        }
                    }
                    group(purchasingregisterentries)
                    {
                        Caption = 'Register/Entries';
                        action(PurchaseQuoteArchives)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Quote Archives';
                            RunObject = Page "Purchase Quote Archives";
                            ToolTip = 'Open Purchase Quote Archives';
                        }

                        action(PurchaseOrderArchives)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Order Archives';
                            RunObject = Page "Purchase Order Archives";
                            ToolTip = 'Open Purchase Order Archives';
                        }

                        action(PostedPurchasesInvoices)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Purchases Invoices';
                            RunObject = Page "Posted Purchase Invoice";
                            ToolTip = 'Open Posted Purchases Invoices';
                        }

                        action(PostedPurchaseReturnShipments)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Purchase Return Shipments';
                            RunObject = Page "Posted Return Shipments";
                            ToolTip = 'Open Posted Purchase Return Shipments';
                        }

                        action(PostedPurchaseCreditMemos)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Purchase Credit Memos';
                            RunObject = Page "Posted Purchase Credit Memos";
                            ToolTip = 'Open Posted Purchase Credit Memos';
                        }

                        action(PostedPurchaseReceipts333)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Purchase Receipts';
                            RunObject = Page "Posted Purchase Receipts";
                            ToolTip = 'Open Posted Purchase Receipts';
                        }

                        action(GLRegisters)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'G/L Registers';
                            RunObject = Page "G/L Registers";
                            ToolTip = 'Open G/L Registers';
                        }

                        action(ItemTracing)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Tracing';
                            RunObject = Page "Item Tracing";
                            ToolTip = 'Open Item Tracing';
                        }

                        action(PurchaseReturnOrderArchives)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Return Order Archives';
                            RunObject = Page "Purchase Order Archives";
                            ToolTip = 'Open Purchase Return Order Archives';
                        }

                        action(VendorLedgerEntries)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Vendor Ledger Entries';
                            RunObject = Page "Vendor Ledger Entries";
                            ToolTip = 'Open Vendor Ledger Entries';
                        }

                        action(DetailedVendorLedgerEntries)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Detailed Vendor Ledger Entries';
                            RunObject = Page "Detailed Vendor Ledg. Entries";
                            ToolTip = 'Open Detailed Vendor Ledger Entries';
                        }

                        action(ValueEntries333)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Value Entries';
                            RunObject = Page "Value Entries";
                            ToolTip = 'Open Value Entries';
                        }

                        action(FindEntries333)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Find Entries...';
                            RunObject = Page "Navigate";
                            ToolTip = 'Open Find Entries...';
                        }

                    }
                    group(Purchase_RegisterEntries)
                    {
                        Caption = 'Reports';
                        action(PurchaseAdvice2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Advice';
                            RunObject = Report "Purchase Advice";
                            ToolTip = 'Open Purchase Advice';
                        }

                        action(InventoryTransactionDetail2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Inventory Transaction Detail';
                            RunObject = Report "Item Transaction Detail";
                            ToolTip = 'Open Inventory Transaction Detail';
                        }

                        action(InventoryReorders2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Inventory Reorders';
                            RunObject = Report "Inventory - Reorders";
                            ToolTip = 'Open Inventory Reorders';
                        }

                        action(ItemVendorCatalog2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item/Vendor Catalog';
                            RunObject = Page "Item Vendor Catalog";
                            ToolTip = 'Open Item/Vendor Catalog';
                        }

                        action(AgedAccountsPayable2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Aged Accounts Payable';
                            RunObject = Report "Aged Accounts Payable";
                            ToolTip = 'Open Aged Accounts Payable';
                        }

                        action(VendorPurchasesByItem2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Vendor Purchases by Item';
                            RunObject = Report "Vendor Purchases by Item";
                            ToolTip = 'Open Vendor Purchases by Item';
                        }

                        action(ListPriceSheet2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'List Price Sheet';
                            RunObject = Report "List Price Sheet";
                            ToolTip = 'Open List Price Sheet';
                        }

                        action(ItemChargesSpecification2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Charges - Specification';
                            RunObject = Report "Item Charges - Specification";
                            ToolTip = 'Open Item Charges - Specification';
                        }

                        action(InventoryVendorPurchases2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Inventory - Vendor Purchases';
                            RunObject = Page "Vendor Purchases";
                            ToolTip = 'Open Inventory - Vendor Purchases';
                        }

                        action(ItemSubstitutions2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Substitutions';
                            RunObject = Page "Item Substitutions";
                            ToolTip = 'Open Item Substitutions';
                        }

                        action(PurchaseAdvices)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Advices';
                            RunObject = Report "Purchase Advice";
                            ToolTip = 'Open Purchase Advices';
                        }

                        action(PurchaseOrderStatus2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchase Order Status';
                            RunObject = Report "Purchase Order Status";
                            ToolTip = 'Open Purchase Order Status';
                        }

                        action(PurchasingDeferralSummary2)
                        {
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Purchasing Deferral Summary';
                            RunObject = Report "Deferral Summary - Purchasing";
                            ToolTip = 'Open Purchasing Deferral Summary';
                        }

                    }
                }


                group(Planning)
                {
                    Caption = 'Planning';
                    action(planning_Items)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Items';
                        Visible = true;
                        RunObject = Page "Item List";
                        ToolTip = 'Open Items';
                    }

                    action(planning_vendors)
                    {
                        caption = 'Vendors';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Vendor List";
                        ToolTip = 'Open Vendors';

                    }
                    action(planning_PurchaseOrders)
                    {
                        caption = 'Purchase Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Purchase Order List";
                        ToolTip = 'Open Purchase Orders';
                    }
                    action(planning_SalesOrders)
                    {
                        caption = 'Sales Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Sales Order List";
                        ToolTip = 'Open Sales Orders';
                    }
                    action(planning_BlanketSalesOrders)
                    {
                        caption = 'Blanket Sales Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Blanket Sales Orders";
                        ToolTip = 'Open Blanket Sales Orders';
                    }
                    action(planning_AssemblyOrders)
                    {
                        caption = 'Assembly Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Assembly Orders";
                        ToolTip = 'Open Assembly Orders';
                    }
                    action(planning_ServiceOrders)
                    {
                        caption = 'Service Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Service Orders";
                        ToolTip = 'Open Service Orders';
                    }
                    action(planning_Jobs)
                    {
                        caption = 'Jobs';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Job List";
                        ToolTip = 'Open Jobs';
                    }
                    action(planning_PlannedProductionOrders)
                    {
                        caption = 'Planned Production Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Planned Production Orders";
                        ToolTip = 'Open Planned Production Orders';
                    }
                    action(planning_FirmPlannedProdOrders)
                    {
                        caption = 'Firm Planned Prod. Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Firm Planned Prod. Orders";
                        ToolTip = 'Open Firm Planned Prod. Orders';
                    }
                    action(planning_TransferOrders)
                    {
                        caption = 'Transfer Orders';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Transfer Orders";
                        ToolTip = 'Open Transfer Orders';
                    }
                    action(planning_RequisitionWorksheets)
                    {
                        caption = 'Requisition Worksheets';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Req. Worksheet";
                        ToolTip = 'Open Requisition Worksheets';
                    }
                    action(planning_RecurringRequisitionWorksheets)
                    {
                        caption = 'Recurring Requisition Worksheets';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Recurring Req. Worksheet";
                        ToolTip = 'Open Recurring Requisition Worksheets';
                    }
                    action(planning_OrderPlanning)
                    {
                        caption = 'Order Planning';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Order Planning";
                        ToolTip = 'Open Order Planning';
                    }
                    group(planning_Reports)
                    {
                        caption = 'Reports';
                        action(purchaseReservationAvail)
                        {
                            caption = 'Purchase Reservation Avail.';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Purchase Reservation Avail.";
                            ToolTip = 'Open Purchase Reservation Avail.';
                        }
                        action(nonstockItemSales)
                        {
                            caption = 'Nonstock Item Sales';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Catalog Item Sales";
                            ToolTip = 'Open Nonstock Item Sales';
                        }
                        action(itemVendorCatalog)
                        {
                            caption = 'Item/Vendor Catalog';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item/Vendor Catalog";
                            ToolTip = 'Open Item/Vendor Catalog';
                        }
                        action(prodOrderShortageList)
                        {
                            caption = 'Prod. Order - Shortage List';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Prod. Order - Shortage List";
                            ToolTip = 'Open Prod. Order - Shortage List';
                        }
                        action(prodOrderMatRequisition333)
                        {
                            caption = 'Prod. Order - Mat. Requisition';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Prod. Order - Mat. Requisition";
                            ToolTip = 'Open Prod. Order - Mat. Requisition';
                        }
                        action(vendorPurchasesStatistics)
                        {
                            caption = 'Vendor Purchases Statistics';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Vendor Purchase Statistics";
                            ToolTip = 'Open Vendor Purchases Statistics';
                        }
                        group(planningreportsvendor)
                        {
                            caption = 'Vendor';
                            action(vendorBalanceToDate)
                            {
                                caption = 'Vendor Balance to Date';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Vendor - Balance to Date";
                                ToolTip = 'Open Vendor Balance to Date';
                            }
                            action(vendorPurchaseByItem)
                            {
                                caption = 'Vendor Purchase by Item';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Vendor Purchases by Item";
                                ToolTip = 'Open Vendor Purchase by Item';
                            }
                            action(vendorPurchaseList)
                            {
                                caption = 'Vendor Purchase List';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Vendor Purchases";
                                ToolTip = 'Open Vendor Purchase List';
                            }
                            action(vendorTrialBalance)
                            {
                                caption = 'Vendor Trial Balance';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Vendor - Trial Balance";
                                ToolTip = 'Open Vendor Trial Balance';
                            }
                            action(topVendorList)
                            {
                                caption = 'Top Vendor List';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Top __ Vendor List";
                                ToolTip = 'Open Top Vendor List';
                            }
                            action(vendorListing)
                            {
                                caption = 'Vendor Listing';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Vendor List";
                                ToolTip = 'Open Vendor Listing';
                            }
                            action(agedAccountsPayable)
                            {

                                caption = 'Aged Accounts Payable';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Aged Accounts Payable";
                                ToolTip = 'Open Aged Accounts Payable';
                            }
                            action(vendorPurchaseStatistics)
                            {
                                caption = 'Vendor Purchase Statistics';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Vendor Purchase Statistics";
                                ToolTip = 'Open Vendor Purchase Statistics';
                            }
                        }
                        group(planningReportsInventory)
                        {
                            caption = 'Inventory';
                            action(inventoryCostVariance1)
                            {
                                caption = 'Inventory - Cost Variance';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Inventory - Cost Variance";
                                ToolTip = 'Open Inventory - Cost Variance';
                            }
                            action(inventoryVendorPurchases)
                            {
                                caption = 'Inventory - Vendor Purchases';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Vendor Purchases";
                                ToolTip = 'Open Inventory - Vendor Purchases';
                            }
                            action(inventoryAvailabilityPlan)
                            {
                                caption = 'Inventory - Availability Plan';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Inventory - Availability Plan";
                                ToolTip = 'Open Inventory - Availability Plan';
                            }
                            action(purchaseAdvice333)
                            {
                                caption = 'Purchase Advice';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Purchase Advice";
                                ToolTip = 'Open Purchase Advice';
                            }
                            action(inventoryInboundTransfer333)
                            {
                                caption = 'Inventory - Inbound Transfer';
                                visible = true;
                                ApplicationArea = Basic, Suite;
                                RunObject = Report "Inventory - Inbound Transfer";
                                ToolTip = 'Open Inventory - Inbound Transfer';
                            }
                        }
                    }



                }


                group(inventoryAndCosting)
                {
                    caption = 'Inventory & Costing';
                    action(InventoryAndCosting_Items)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Items';
                        Visible = true;
                        RunObject = Page "Item List";
                        ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
                    }
                    action(InventoryAndCosting_NonStockItems)
                    {
                        caption = 'Nonstock Items';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Catalog Item List";
                        Tooltip = 'Open Nonstock Items';
                    }

                    action(InventoryAndCosting_StockkeepingUnits)
                    {
                        caption = 'Stockkeeping Units';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Stockkeeping Unit List";
                        Tooltip = 'Open Stockkeeping Units';
                    }
                    action(InventoryAndCosting_AdjustCostItemEntries)
                    {
                        caption = 'Adjust Cost - Item Entries';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Adjust Cost - Item Entries";
                        Tooltip = 'Open Adjust Cost - Item Entries';
                    }
                    action(InventoryAndCosting_StandardCostsWorksheet)
                    {
                        caption = 'Standard Costs Worksheet';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Standard Cost Worksheet";
                        Tooltip = 'Open Standard Costs Worksheet';
                    }
                    action(InventoryAndCosting_AdjustItemCostsPrices)
                    {
                        caption = 'Adjust Item Costs/Prices';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Report "Adjust Item Costs/Prices";
                        Tooltip = 'Open Adjust Item Costs/Prices';
                    }
                    group(InventoryAndCosting_Journals)
                    {
                        caption = 'Journals';
                        visible = true;
                        action(InventoryAndCosting_ItemJournals)
                        {
                            caption = 'Item Journals';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Item Journal";
                            Tooltip = 'Open Item Journals';
                        }
                        action(InventoryAndCosting_ItemReclassifications)
                        {
                            caption = 'Item Reclassification Journals';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Item Reclass. Journal";
                            Tooltip = 'Open Item Reclassification Journals';
                        }
                        action(InventoryAndCosting_ItemLedgerEntries)
                        {
                            caption = 'Recurring Item Journals';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Recurring Item Jnl.";
                            Tooltip = 'Open Recurring Item Journals';
                        }

                    }
                    group(InventoryAndCosting_Reports)
                    {
                        caption = 'Reports';
                        action(itemAgeCompositionQty)
                        {
                            caption = 'Item Age Composition - Qty.';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Age Composition - Qty.";
                            Tooltip = 'Open Item Age Composition - Qty.';
                        }
                        action(inventoryCostVariance)
                        {
                            caption = 'Inventory - Cost Variance';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Inventory - Cost Variance";
                            Tooltip = 'Open Inventory - Cost Variance';
                        }
                        action(itemChargesSpecification)
                        {
                            caption = 'Item Charges - Specification';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Charges - Specification";
                            Tooltip = 'Open Item Charges - Specification';
                        }
                        action(inventoryInboundTransfer)
                        {
                            caption = 'Inventory - Inbound Transfer';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Inventory - Inbound Transfer";
                            Tooltip = 'Open Inventory - Inbound Transfer';
                        }
                        action(invtValuationCostSpec)
                        {
                            caption = 'Invt. Valuation - Cost Spec.';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Invt. Valuation - Cost Spec.";
                            Tooltip = 'Open Invt. Valuation - Cost Spec.';
                        }
                        action(itemAgeCompositionValue)
                        {
                            caption = 'Item Age Composition - Value';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Age Composition - Value";
                            Tooltip = 'Open Item Age Composition - Value';
                        }
                        action(itemRegisterValue)
                        {
                            caption = 'Item Register - Value';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Register - Value";
                            Tooltip = 'Open Item Register - Value';
                        }
                        action(itemExpirationQuantity333)
                        {
                            caption = 'Item Expiration - Quantity';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Item Expiration - Quantity";
                            Tooltip = 'Open Item Expiration - Quantity';
                        }

                        action(purchaseAdvice)
                        {
                            caption = 'Purchase Advice';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Report "Purchase Advice";
                            Tooltip = 'Open Purchase Advice';
                        }


                    }

                }

                group(Setup9)
                {
                    Caption = 'Setup';
                    action(Setup_PurchaseAndPayablesSetup)
                    {
                        caption = 'Purchase & Payables Setup';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Purchases & Payables Setup";
                        tooltip = 'Open Purchase & Payables Setup';
                    }
                    action(Setup_StandardPurchaseCodes)
                    {
                        caption = 'Standard Purchase Codes';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Standard Purchase Codes";
                        tooltip = 'Open Standard Purchase Codes';
                    }
                    action(Setup_PurchasingCodes)
                    {
                        caption = 'Purchasing Codes';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Purchasing Codes";
                        tooltip = 'Open Purchasing Codes';
                    }
                    action(Setup_ShipmentMethods)
                    {
                        caption = 'Shipment Methods';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Shipment Methods";
                        tooltip = 'Open Shipment Methods';
                    }
                    action(Setup_ReturnReasons)
                    {
                        caption = 'Return Reasons';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Return Reasons";
                        tooltip = 'Open Return Reasons';
                    }
                    action(Setup_ReportSelectionsPurchase)
                    {
                        caption = 'Report Selections - Purchase';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Report Selection - Purchase";
                        tooltip = 'Open Report Selections - Purchase';
                    }
                    action(Setup_RequisitionWorksheetTemplates)
                    {
                        caption = 'Requisition Worksheet Templates';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Req. Worksheet Templates";
                        tooltip = 'Open Requisition Worksheet Templates';
                    }
                    action(Setup_UnitsOfMeasure)
                    {
                        caption = 'Units of Measure';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Units of Measure";
                        tooltip = 'Open Units of Measure';
                    }
                    action(Setup_Manufacturers)
                    {
                        caption = 'Manufacturers';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Manufacturers";
                        tooltip = 'Open Manufacturers';
                    }
                    action(Setup_NonstockItemSetup)
                    {
                        caption = 'Nonstock Item Setup';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Catalog Item Setup";
                        tooltip = 'Open Nonstock Item Setup';
                    }
                    action(Setup_ItemJournalTemplates)
                    {
                        caption = 'Item Journal Templates';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Item Journal Templates";
                        tooltip = 'Open Item Journal Templates';
                    }
                    action(Setup_SalesPeoplePurchasers)
                    {
                        caption = 'Salespeople/Purchasers';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Salespersons/Purchasers";
                        tooltip = 'Open Salespeople/Purchasers';
                    }
                    action(Setup_ItemDiscountGroups)
                    {
                        caption = 'Item Discount Groups';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Item Disc. Groups";
                        tooltip = 'Open Item Discount Groups';
                    }
                    action(Setup_ItemTrackingCodes)
                    {
                        caption = 'Item Tracking Codes';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Item Tracking Codes";
                        tooltip = 'Open Item Tracking Codes';
                    }
                    action(Setup_InventorySetup)
                    {
                        caption = 'Inventory Setup';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Inventory Setup";
                        tooltip = 'Open Inventory Setup';
                    }
                    action(Setup_RequisitionWorksheets)
                    {
                        caption = 'Requisition Worksheets';
                        visible = true;
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Req. Worksheet";
                        tooltip = 'Open Requisition Worksheets';
                    }
                    group(Setup_PurchaseAnalysis)
                    {
                        caption = 'Purchase Analysis';
                        action(analysisTypes)
                        {
                            caption = 'Analysis Types';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis Types";
                            tooltip = 'Open Analysis Types';
                        }
                        action(purchaseAnalysisByDimensions)
                        {
                            caption = 'Purchase Analysis by Dimensions';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Purch. Analysis by Dimensions";
                            tooltip = 'Open Purchase Analysis by Dimensions';
                        }
                        action(purchAnalysisColumnTemplates)
                        {
                            caption = 'Purch. Analysis Column Templates';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis Column Templates";
                            tooltip = 'Open Purch. Analysis Column Templates';
                        }
                        action(purchAnalysisLineTemplates)
                        {
                            caption = 'Purch. Analysis Line Templates';
                            visible = true;
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Analysis Line Templates";
                            tooltip = 'Open Purch. Analysis Line Templates';
                        }
                    }


                }



                //SALES GROUP


            }





            group("Warehouse2")
            {
                Caption = 'Warehouse';



                group("Order & Contacts")
                {
                    Caption = 'Orders & Contacts';

                    action("OrdersContacts_Vendors")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Vendors';
                        RunObject = Page "Vendor List";
                        Tooltip = 'Open Vendors';
                    }
                    action("Purchase Orders")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Orders';
                        RunObject = Page "Purchase Order List";
                        Visible = true;
                        ToolTip = 'Open Purchase Orders';
                    }
                    action("Purchase Return Orders1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Return Orders';
                        RunObject = Page "Purchase Return Order List";
                        Visible = true;
                        ToolTip = 'Open Purchase Return Orders';
                    }
                    action("Customers1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customers';
                        RunObject = Page "Customer List";
                        Visible = true;
                        ToolTip = 'Open Customers';

                    }
                    action("Sales Orders1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Sales Orders';
                        RunObject = Page "Sales Order List";
                        Visible = true;
                        ToolTip = 'Open Sales Orders';
                    }
                    action("Sales Return Orders1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Sales Return Orders';
                        RunObject = Page "Sales Return Order List";
                        Visible = true;
                        ToolTip = 'Open Sales Return Orders';

                    }
                    action("Transfer Orders")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Transfer Orders';
                        Visible = true;
                        RunObject = Page "Transfer Orders";
                        ToolTip = 'Open Transfer Orders';
                    }
                    action("Assembly Orders")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Assembly Orders';
                        Visible = true;
                        RunObject = Page "Assembly Orders";
                        ToolTip = 'Open Assembly Orders';
                    }
                    action("Released Prod. Orders")
                    {
                        ApplicationArea = Basic, Suite;
                        caption = 'Released Prod. Orders';
                        RunObject = Page "Released Production Orders";
                        Visible = true;
                        ToolTip = 'Open Released Prod. Orders';
                    }

                    group("Posted Documents")
                    {
                        caption = 'Posted Documents';
                        action("_Action1")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Purchase Invoices';
                            Visible = true;
                            RunObject = Page "Posted Purchase Invoices";
                            ToolTip = 'Open Posted Purchase Invoices';
                        }
                        action("_Action2")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Purchase Credit Memos';
                            Visible = true;
                            RunObject = Page "Posted Purchase Credit Memos";
                            ToolTip = 'Open Posted Purchase Credit Memos';
                        }

                        action("_Action3")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Sales Invoices';
                            Visible = true;
                            RunObject = Page "Posted Sales Invoices";
                            ToolTip = 'Open Posted Sales Invoices';
                        }

                        action("_Action4")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Sales Credit Memos';
                            Visible = true;
                            RunObject = Page "Posted Sales Credit Memos";
                            ToolTip = 'Open Posted Sales Credit Memos';
                        }

                    }

                    group("Reports1")
                    {
                        Caption = 'Reports';
                        action("_Action5")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Return Order Confirmation';
                            Visible = true;
                            RunObject = Report "Return Order Confirmation";
                            ToolTip = 'Open Return Order Confirmation';
                        }

                    }
                }


                group(PlanningOperations)
                {

                    caption = 'Planning & Operations';
                    Visible = true;
                    action(planningOperations_items)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Items';
                        RunObject = Page "Item List";
                        ToolTip = 'Open Items';
                    }
                    action(planningOperations_nonstock_items)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Nonstock Items';
                        RunObject = Page "Catalog Item List"; //weird one
                        ToolTip = 'Open Nonstock Items';
                    }
                    action(planningOperations_stockkeeping_units)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Stockkeeping Units';
                        RunObject = Page "Stockkeeping Unit List";
                        ToolTip = 'Open Stockkeeping Units';
                    }
                    action(planningOperations_binContents)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Bin Contents';
                        RunObject = Page "Bin Contents";
                        ToolTip = 'Open Bin Contents';
                    }
                    action(planningOperations_createInvPutawayPick)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Create Inv. Put-away/Pick';
                        RunObject = Report "Create Invt Put-away/Pick/Mvmt";
                        ToolTip = 'Open Create Inv. Put-away/Pick';
                    }
                    action(planningOperations_pickWorksheets)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Pick Worksheets';
                        RunObject = Page "Pick Worksheet";
                        ToolTip = 'Open Pick Worksheets';
                    }
                    action(planningOperations_putawayWorksheets)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Put-away Worksheets';
                        RunObject = Page "Put-away Worksheet";
                        ToolTip = 'Open Put-away Worksheets';
                    }
                    action(planningOperations_movementWorksheets)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Movement Worksheets';
                        RunObject = Page "Movement Worksheet";
                        ToolTip = 'Open Movement Worksheets';
                    }
                    action(planningOperations_internalMovements)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Internal Movements';
                        RunObject = Page "Internal Movement List";
                        ToolTip = 'Open Internal Movements';
                    }
                    action(planningOperations_itemReclassificationJournals)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Item Reclassification Journals';
                        RunObject = Page "Item Reclass. Journal";
                        ToolTip = 'Open Item Reclassification Journals';
                    }
                    action(planningOperations_itemTracing)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Item Tracing';
                        RunObject = Page "Item Tracing";
                        ToolTip = 'Open Item Tracing';
                    }
                    action(planningOperations_inventoryReceipts)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Inventory Receipts';
                        RunObject = Page "Invt. Receipt";
                        ToolTip = 'Open Inventory Receipts';
                    }
                    action(planningOperations_InventoryShipments)
                    {
                        applicationarea = basic, suite;
                        Visible = true;
                        caption = 'Inventory Shipments';
                        RunObject = Page "Invt. Shipment";
                        ToolTip = 'Open Inventory Shipments';
                    }
                    group(planningOperations_warehouseDocuments)
                    {
                        caption = 'Warehouse Documents';
                        action(planningOperations_warehouseDocuments_pick)
                        {
                            applicationarea = basic, suite;
                            Visible = true;
                            caption = 'Transfer Orders';
                            RunObject = Page "Transfer Orders";
                            ToolTip = 'Open Transfer Orders';
                        }
                        action(planningOperations_warehouseDocuments_putaway)
                        {
                            applicationarea = basic, suite;
                            Visible = true;
                            caption = 'Warehouse Receipts';
                            RunObject = Page "Warehouse Receipts";
                            ToolTip = 'Open Warehouse Receipts';
                        }
                        action(planningOperations_warehouseDocuments_movement)
                        {
                            applicationarea = basic, suite;
                            Visible = true;
                            caption = 'Warehouse Shipments';
                            RunObject = Page "Warehouse Shipment";
                            ToolTip = 'Open Warehouse Shipments';
                        }
                        action(planningOperations_warehouseDocuments_internalMovement)
                        {
                            applicationarea = basic, suite;
                            Visible = true;
                            caption = 'Assembly Orders';
                            RunObject = Page "Assembly Orders";
                            ToolTip = 'Open Assembly Orders';
                        }
                        action(planningOperations_warehouseDocuments_inventoryReceipt)
                        {
                            applicationarea = basic, suite;
                            Visible = true;
                            caption = 'Inventory Receipt';
                            RunObject = Page "Invt. Receipt";
                            ToolTip = 'Open Inventory Receipt';
                        }


                    }
                    group(planningOperations_postedDocuments)
                    {
                        caption = 'Posted Documents';
                        action(postedPurchaseReceipts)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Purchase Receipts';
                            Visible = true;
                            RunObject = Page "Posted Purchase Receipts";
                            Tooltip = 'Open Posted Purchase Receipts';
                        }

                        action(postedPurchaseReturnShipment)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Purchase Return Shipment';
                            Visible = true;
                            RunObject = Page "Posted Return Shipment";
                            Tooltip = 'Open Posted Purchase Return Shipment';
                        }

                        action(postedSalesShipments)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Sales Shipments';
                            Visible = true;
                            RunObject = Page "Posted Sales Shipments";
                            Tooltip = 'Open Posted Sales Shipments';
                        }

                        action(postedReturnReceipts)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Return Receipts';
                            Visible = true;
                            RunObject = Page "Posted Return Receipts";
                            ToolTip = 'Open Posted Return Receipts';
                        }

                        action(postedAssemblyOrders)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Assembly Orders';
                            Visible = true;
                            RunObject = Page "Posted Assembly Orders";
                            ToolTip = 'Open posted assembly orders.';
                        }

                        action(postedTransferReceipts)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Transfer Receipts';
                            Visible = true;
                            RunObject = Page "Posted Transfer Receipts";
                            ToolTip = 'Open posted transfer receipts.';
                        }

                        action(postedTransferShipments)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Transfer Shipments';
                            Visible = true;
                            RunObject = Page "Posted Transfer Shipments";
                            ToolTip = 'Open posted transfer shipments.';
                        }

                        action(postedDirectTransfers)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Direct Transfers';
                            Visible = true;
                            RunObject = Page "Posted Direct Transfers";
                            ToolTip = 'Open posted direct transfers.';
                        }

                        action(postedWhseReceipts)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Whse. Receipts';
                            Visible = true;
                            RunObject = Page "Posted Whse. Receipt List";
                            ToolTip = 'Open posted warehouse receipts.';
                        }

                        action(postedWhseShipments)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Whse. Shipments';
                            Visible = true;
                            RunObject = Page "Posted Whse. Shipment List";
                            ToolTip = 'Open posted warehouse shipments.';
                        }

                        action(postedInvtPutaway)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Invt. Put-away';
                            Visible = true;
                            RunObject = Page "Posted Invt. Put-away";
                            ToolTip = 'Open posted inventory put-aways.';
                        }

                        action(postedInvtPick)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Invt. Pick';
                            Visible = true;
                            RunObject = Page "Posted Invt. Pick";
                            ToolTip = 'Open posted inventory picks.';
                        }

                        action(postedInventoryReceipts)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Inventory Receipts';
                            Visible = true;
                            RunObject = Page "Posted Invt. Receipts";
                            ToolTip = 'Open posted inventory receipts.';
                        }

                        action(postedInventoryShipments)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Inventory Shipments';
                            Visible = true;
                            RunObject = Page "Posted Invt. Shipments";
                            ToolTip = 'Open posted inventory shipments.';
                        }





                    }

                    group(grtoupregisterEntries)
                    {
                        caption = 'Register Entries';

                        action(registeredPutaways)
                        {
                            applicationarea = basic, suite;
                            caption = 'Registered Put-aways';
                            Visible = true;
                            RunObject = Page "Registered Put-away";
                            ToolTip = 'Open registered put-aways.';
                        }

                        action(registeredPicks)
                        {
                            applicationarea = basic, suite;
                            caption = 'Registered Picks';
                            Visible = true;
                            RunObject = Page "Registered Pick";
                            ToolTip = 'Open registered picks.';
                        }

                        action(registeredMovements)
                        {
                            applicationarea = basic, suite;
                            caption = 'Registered Movements';
                            Visible = true;
                            RunObject = Page "Registered Movement";
                            ToolTip = 'Open registered movements.';
                        }

                        action(registeredInvtMovements)
                        {
                            applicationarea = basic, suite;
                            caption = 'Registered Invt. Movements';
                            Visible = true;
                            RunObject = Page "Registered Invt. Movement List";
                            ToolTip = 'Open registered inventory movements.';
                        }

                        action(warehouseRegisters)
                        {
                            applicationarea = basic, suite;
                            caption = 'Warehouse Registers';
                            Visible = true;
                            RunObject = Page "Warehouse Registers";
                            ToolTip = 'Open warehouse registers.';
                        }

                        action(itemRegisters)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Registers';
                            Visible = true;
                            RunObject = Page "Item Registers";
                            ToolTip = 'Open item registers.';
                        }

                        action(itemLedgerEntries)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Ledger Entries';
                            Visible = true;
                            RunObject = Page "Item Ledger Entries";
                            ToolTip = 'Open item ledger entries.';
                        }

                        action(physicalInventoryLedgerEntries)
                        {
                            applicationarea = basic, suite;
                            caption = 'Physical Inventory Ledger Entries';
                            Visible = true;
                            RunObject = Page "Phys. Inventory Ledger Entries";
                            ToolTip = 'Open physical inventory ledger entries.';
                        }

                        action(valueEntries)
                        {
                            applicationarea = basic, suite;
                            caption = 'Value Entries';
                            Visible = true;
                            RunObject = Page "Value Entries";
                            ToolTip = 'Open value entries.';
                        }

                        action(warehouseEntries)
                        {
                            applicationarea = basic, suite;
                            caption = 'Warehouse Entries';
                            Visible = true;
                            RunObject = Page "Warehouse Entries";
                            ToolTip = 'Open warehouse entries.';
                        }

                        action(findEntries)
                        {
                            applicationarea = basic, suite;
                            caption = 'Find Entries...';
                            Visible = true;
                            RunObject = Page "Navigate";
                            ToolTip = 'Search and open entries.';
                        }
                    }


                    group(planningOperations_reports)
                    {
                        caption = 'Reports';
                        action(whseShipmentStatus)
                        {
                            applicationarea = basic, suite;
                            caption = 'Whse. Shipment Status';
                            Visible = true;
                            RunObject = Report "Whse. Shipment Status";
                            ToolTip = 'Open the warehouse shipment status report.';
                        }

                        action(prodOrderMatRequisition)
                        {
                            applicationarea = basic, suite;
                            caption = 'Prod. Order - Mat. Requisition';
                            Visible = true;
                            RunObject = Report "Prod. Order - Mat. Requisition";
                            ToolTip = 'Open the production order material requisition report.';
                        }

                        action(prodOrderPickingList)
                        {
                            caption = 'Prod. Order Picking List';
                            applicationarea = basic, suite;
                            Visible = true;
                            RunObject = Report "Prod. Order - Picking List";
                            ToolTip = 'Open the production order picking list report.';
                        }

                        action(customerListing)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer Listing';
                            Visible = true;
                            RunObject = Report "Customer Listing";
                            ToolTip = 'Open the customer listing report.';
                        }

                        action(subcontractorDispatchList)
                        {
                            applicationarea = basic, suite;
                            caption = 'Subcontractor Dispatch List';
                            Visible = true;
                            RunObject = Report "Subcontractor - Dispatch List";
                            ToolTip = 'Open the subcontractor dispatch list report.';
                        }

                        action(inventoryPickingList)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Picking List';
                            Visible = true;
                            RunObject = Report "Inventory Picking List";
                            ToolTip = 'Open the inventory picking list report.';
                        }

                        action(itemExpirationQuantity)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Expiration - Quantity';
                            Visible = true;
                            RunObject = Report "Item Expiration - Quantity";
                            ToolTip = 'Open the item expiration by quantity report.';
                        }

                        action(inventoryLabels)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Labels';
                            Visible = true;
                            RunObject = Report "Inventory Labels";
                            ToolTip = 'Open the inventory labels report.';
                        }


                    }
                }

                group(goodHandling)
                {
                    caption = 'Goods Handling';
                    group(goodHandling_orderByOrder)
                    {
                        caption = 'Order by Order';
                        action(inventoryPutaways)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Put-aways';
                            Visible = true;
                            RunObject = Page "Inventory Put-aways";
                            ToolTip = 'Open inventory put-aways.';
                        }

                        action(inventoryPicks)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Picks';
                            Visible = true;
                            RunObject = Page "Inventory Picks";
                            ToolTip = 'Open inventory picks.';
                        }

                        action(inventoryMovements)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Movements';
                            Visible = true;
                            RunObject = Page "Inventory Movements";
                            ToolTip = 'Open inventory movements.';
                        }

                    }
                    group(goodHandling_multipleOrders)
                    {
                        caption = 'Multiple Orders';
                        action(putaways)
                        {
                            applicationarea = basic, suite;
                            caption = 'Put-aways';
                            Visible = true;
                            RunObject = Page "Warehouse Put-aways";
                            ToolTip = 'Open put-aways.';
                        }

                        action(picks)
                        {
                            applicationarea = basic, suite;
                            caption = 'Picks';
                            Visible = true;
                            RunObject = Page "Warehouse Picks";
                            ToolTip = 'Open picks.';
                        }

                        action(movements)
                        {
                            applicationarea = basic, suite;
                            caption = 'Movements';
                            Visible = true;
                            RunObject = Page "Warehouse Movements";
                            ToolTip = 'Open movements.';
                        }

                        action(whseInternalPicks)
                        {
                            applicationarea = basic, suite;
                            caption = 'Whse. Internal Picks';
                            Visible = true;
                            RunObject = Page "Whse. Internal Pick List";
                            ToolTip = 'Open warehouse internal picks.';
                        }

                        action(whseInternalPutaways)
                        {
                            applicationarea = basic, suite;
                            caption = 'Whse. Internal Put-aways';
                            Visible = true;
                            RunObject = Page "Whse. Internal Put-away List";
                            ToolTip = 'Open warehouse internal put-aways.';
                        }


                    }
                    group(goodHandling_bins)
                    {
                        caption = 'Bins';
                        action(binContents)
                        {
                            applicationarea = basic, suite;
                            caption = 'Bin Contents';
                            Visible = true;
                            RunObject = Page "Bin Contents";
                            ToolTip = 'Open bin contents.';
                        }
                        action(binSetup)
                        {
                            applicationarea = basic, suite;
                            caption = 'Bin Creation Worksheet';
                            Visible = true;
                            RunObject = Page "Bin Creation Worksheet";
                            ToolTip = 'Open bin creation worksheet.';
                        }
                        action(binTypes)
                        {
                            applicationarea = basic, suite;
                            caption = 'Bin Content Creation Worksheet';
                            Visible = true;
                            RunObject = Page "Bin Content Creation Worksheet";
                            ToolTip = 'Open bin content creation worksheet.';
                        }

                    }
                    group(goodHandling_journals)
                    {
                        caption = 'Journals';
                        //whse. item journals
                        action(whseitemjournals)
                        {
                            applicationarea = basic, suite;
                            caption = 'Whse. Item Journals';
                            Visible = true;
                            RunObject = Page "Whse. Item Journal";

                            ToolTip = 'Open warehouse item journals.';
                        }

                        //item reclassification journals
                        action(itemreclassificationjournals)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Reclassification Journals';
                            Visible = true;
                            RunObject = Page "Item Reclass. Journal";
                            ToolTip = 'Open item reclassification journals.';
                        }

                        action(whsereclassjournals)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Reclass. Journals';
                            Visible = true;
                            RunObject = Page "Whse. Reclassification Journal";
                            ToolTip = 'Open warehouse reclassification journals.';
                        }



                        //Whse. Phys. Invt. Journals

                        action(whsephysinvtjournals)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Phys. Invt. Journals';
                            Visible = true;
                            RunObject = Page "Whse. Phys. Invt. Journal";
                            ToolTip = 'Open warehouse physical inventory journals.';
                        }


                    }
                    group(goodHandling_reports)
                    {
                        caption = 'Reports';
                        //wh                se. shipment status
                        action(reportswhseshipmentstatus)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Shipment Status';
                            Visible = true;
                            RunObject = Report "Whse. Shipment Status";
                            ToolTip = 'Open the warehouse shipment status report.';
                        }

                        //cu                stomer listing
                        action(reportscustomerlisting)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Customer Listing';
                            Visible = true;
                            RunObject = Report "Customer Listing";
                            ToolTip = 'Open the customer listing report.';
                        }

                        //prod. order picking list
                        action(reportsprodorderpickinglist)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Prod. Order Picking List';
                            Visible = true;
                            RunObject = Report "Prod. Order - Picking List";
                            ToolTip = 'Open the production order picking list report.';
                        }


                        //customer labels
                        action(reportscustomerlabels)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Customer Labels';
                            Visible = true;
                            RunObject = Report "Customer - Labels";
                            ToolTip = 'Open the customer labels report.';
                        }

                        //whse. phys. inventory list
                        action(reportswhsephysinventorylist)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Phys. Inventory List';
                            Visible = true;
                            RunObject = Report "Whse. Phys. Inventory List";
                            ToolTip = 'Open the warehouse physical inventory list report.';
                        }

                        //wa                rehouse register - quantity
                        action(reportswarehouseregisterquantity)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Warehouse Register - Quantity';
                            Visible = true;
                            RunObject = Report "Warehouse Register - Quantity";
                            ToolTip = 'Open the warehouse register by quantity report.';
                        }

                        //warehouse bin list
                        action(reportswarehousebinlist)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Warehouse Bin List';
                            Visible = true;
                            RunObject = Report "Warehouse Bin List";
                            ToolTip = 'Open the warehouse bin list report.';
                        }

                        //whse. adjustement bin
                        action(reportswhseadjustementbin)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Adjustment Bin';
                            Visible = true;
                            RunObject = Report "Whse. Adjustment Bin";
                            ToolTip = 'Open the warehouse adjustment bin report.';
                        }

                        //in                ventory put-away list
                        action(reportsinventoryputawaylist)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Inventory Put-away List';
                            Visible = true;
                            RunObject = Report "Inventory Put-away List";
                            ToolTip = 'Open the inventory put-away list report.';
                        }

                        //warehouse movement
                        action(reportswarehousemovement)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Warehouse Movement';
                            Visible = true;
                            RunObject = Page "Warehouse Movements";
                            ToolTip = 'Open the warehouse movement report.';
                        }

                        //whse. posted receipts
                        action(reportswhsepostedreceipts)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Posted Receipts';
                            Visible = true;
                            RunObject = Page "Warehouse Receipts";
                            ToolTip = 'Open the warehouse posted receipts report.';
                        }

                        //whse. posted shipment
                        action(reportswhsepostedshipment)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Posted Shipment';
                            Visible = true;
                            RunObject = Report "Whse. - Posted Shipment";
                            ToolTip = 'Open the warehouse posted shipment report.';
                        }

                        //whse. receipts
                        action(reportswhsereceipts)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Receipts';
                            Visible = true;
                            RunObject = Report "Whse. - Receipt";
                            ToolTip = 'Open the warehouse receipts report.';
                        }

                        //whse. shipment
                        action(reportswhseshipment)
                        {
                            applicationarea = basic, suite;
                            Caption = 'Whse. Shipment';
                            Visible = true;
                            RunObject = Report "Whse. - Shipment";
                            ToolTip = 'Open the warehouse shipment report.';
                        }

                    }

                }

                group(inventory)
                {
                    caption = 'Inventory';
                    action(inventory_physicalInvCountPer)
                    {
                        applicationarea = basic, suite;
                        caption = 'Physical Inv...Counting Periods';
                        Visible = true;
                        RunObject = Report "Physical Inventory Count";
                        ToolTip = 'Open Physical Inventory Counting Periods';
                    }
                    action(inventory_itemJournals)
                    {
                        applicationarea = basic, suite;
                        caption = 'Item Journals';
                        Visible = true;
                        RunObject = Page "Item Journal";
                        ToolTip = 'Open Item Journals';
                    }
                    action(inventory_itemReclassJourn)
                    {
                        applicationarea = basic, suite;
                        caption = 'Item Reclassification Journals';
                        Visible = true;
                        RunObject = Page "Item Reclass. Journal";
                        ToolTip = 'Open Item Reclassification Journals';
                    }
                    action(inventory_PhysInvJourn)
                    {
                        applicationarea = basic, suite;
                        caption = 'Physical Inventory Journals';
                        Visible = true;
                        RunObject = Page "Phys. Inventory Journal";
                        ToolTip = 'Open Physical Inventory Journals';
                    }
                    action(inventory_revJourn)
                    {
                        applicationarea = basic, suite;
                        caption = 'Revaluation Journals';
                        Visible = true;
                        RunObject = Page "Revaluation Journal";
                        ToolTip = 'Open Revaluation Journals';
                    }
                    group(inventory_setup)
                    {
                        caption = 'Setup';
                        action(inventory_setup_inventorySetup)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Setup';
                            Visible = true;
                            RunObject = Page "Inventory Setup";
                            ToolTip = 'Open Inventory Setup';
                        }
                        action(action21000)
                        {
                            applicationarea = basic, suite;
                            caption = 'Assembly Setup';
                            Visible = true;
                            RunObject = Page "Assembly Setup";
                            ToolTip = 'Open Assembly Setup';
                        }
                        action(action21001)
                        {
                            applicationarea = basic, suite;
                            caption = 'Locations';
                            Visible = true;
                            RunObject = Page "Location List";
                            ToolTip = 'Open Locations';
                        }
                        action(action21002)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Tracking Codes';
                            Visible = true;
                            RunObject = Page "Item Tracking Codes";
                            ToolTip = 'Open Item Tracking Codes';
                        }
                        action(action21003)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Journal Templates';
                            Visible = true;
                            RunObject = Page "Item Journal Templates";
                            ToolTip = 'Open Item Journal Templates';
                        }
                        action(action21004)
                        {
                            applicationarea = basic, suite;
                            caption = 'Nonstock Item Setup';
                            Visible = true;
                            RunObject = Page "Catalog Item Setup";
                            ToolTip = 'Open Nonstock Item Setup';
                        }
                        action(action21005)
                        {
                            applicationarea = basic, suite;
                            caption = 'Transfer Routes';
                            Visible = true;
                            RunObject = Page "Transfer Routes";
                            ToolTip = 'Open Transfer Routes';
                        }
                        action(action21006)
                        {
                            applicationarea = basic, suite;
                            caption = 'Create Stockkeeping Unit';
                            Visible = true;
                            RunObject = report "Create Stockkeeping Unit";
                            ToolTip = 'Open Create Stockkeeping Unit';
                        }
                        action(action21007)
                        {
                            applicationarea = basic, suite;
                            caption = 'Report Selections Inventory';
                            Visible = true;
                            RunObject = Page "Report Selection - Inventory";
                            ToolTip = 'Open Report Selections Inventory';
                        }
                    }
                }

                group(assembly)
                {
                    Caption = 'Assembly';
                    action(assembly_items)
                    {
                        applicationarea = basic, suite;
                        caption = 'Items';
                        Visible = true;
                        RunObject = Page "Item List";
                        ToolTip = 'Open Items';
                    }
                    action(assembly_resources)
                    {
                        applicationarea = basic, suite;
                        caption = 'Resources';
                        Visible = true;
                        RunObject = Page "Resource List";
                        ToolTip = 'Open Resources';
                    }
                    action(assembly_assemblyOrders)
                    {
                        applicationarea = basic, suite;
                        caption = 'Assembly Orders';
                        Visible = true;
                        RunObject = Page "Assembly Orders";
                        ToolTip = 'Open Assembly Orders';
                    }
                    action(assembly_salesOrders)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales Orders';
                        Visible = true;
                        RunObject = Page "Sales Orders";
                        ToolTip = 'Open Sales Orders';
                    }
                    action(assembly_orderPlanning)
                    {
                        applicationarea = basic, suite;
                        caption = 'Order Planning';
                        Visible = true;
                        RunObject = Page "Order Planning";
                        ToolTip = 'Open Order Planning';
                    }
                    action(assembly_planningWorksheets)
                    {
                        applicationarea = basic, suite;
                        caption = 'Planning Worksheets';
                        Visible = true;
                        RunObject = Page "Planning Worksheet";
                        ToolTip = 'Open Planning Worksheets';
                    }
                    action(assembly_setup)
                    {
                        applicationarea = basic, suite;
                        caption = 'Assembly Setup';
                        Visible = true;
                        RunObject = Page "Assembly Setup";
                        ToolTip = 'Open Assembly Setup';
                    }
                    group(assembly_postingDocuments)
                    {
                        caption = 'Posted Documents';
                        action(assembly_postedAssemblyOrders)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Assembly Orders';
                            Visible = true;
                            RunObject = Page "Posted Assembly Orders";
                            ToolTip = 'Open Posted Assembly Orders';
                        }
                    }
                    group(assembly_reports)
                    {

                        caption = 'Reports';
                        action(assembly_reports_assemblyOrder)
                        {
                            applicationarea = basic, suite;
                            caption = 'Assembly to Order - Sales';
                            Visible = true;
                            RunObject = Report "Assemble to Order - Sales";
                            ToolTip = 'Open Assembly to Order - Sales';
                        }
                        action(assembly_reports_assemblyOrder1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item - Able to Make (Timeline)';
                            Visible = true;
                            RunObject = Report "Item - Able to Make (Timeline)";
                            ToolTip = 'Open Item - Able to Make (Timeline)';
                        }
                        action(assembly_reports_assemblyOrder2)
                        {
                            applicationarea = basic, suite;
                            caption = 'BOM Cost Share Distribution';
                            Visible = true;
                            RunObject = Report "BOM Cost Share Distribution";
                            ToolTip = 'Open BOM Cost Share Distribution';
                        }
                        group(assembly_reports_assemblyOrder3)
                        {
                            caption = 'Assembly BOM';
                            action(assembly_reports_assemblyOrder4)
                            {
                                applicationarea = basic, suite;
                                caption = 'Where-Used List';
                                visible = true;
                                RunObject = Report "Where-Used List";
                                ToolTip = 'Open Where-Used List';
                            }
                            action(assembly_reports_assemblyOrder5)
                            {
                                applicationarea = basic, suite;
                                caption = 'Assenbly BOMs';
                                visible = true;
                                RunObject = Report "Assembly BOMs";
                                ToolTip = 'Open Assembly BOMs';
                            }
                            action(assembly_reports_assemblyOrder6)
                            {
                                applicationarea = basic, suite;
                                caption = 'Assembly BOMs - Raw Materials';
                                visible = true;
                                RunObject = Report "Assembly BOM - Raw Materials";
                                ToolTip = 'Open Assembly BOMs - Raw Materials';
                            }
                            action(assembly_reports_assemblyOrder7)
                            {
                                applicationarea = basic, suite;
                                caption = 'Assembly BOMs - Subassemblies';
                                visible = true;
                                RunObject = Report "Assembly BOM - Subassemblies";
                                ToolTip = 'Open Assembly BOMs - Subassemblies';
                            }
                            action(assembly_reports_assemblyOrder8)
                            {
                                applicationarea = basic, suite;
                                caption = 'Assembly BOMs - End Items';
                                visible = true;
                                RunObject = Report "Assembly BOM - End Items";
                                ToolTip = 'Open Assembly BOMs - End Items';
                            }
                        }
                    }
                }

                group(warehouse)
                {
                    caption = 'Warehouse';
                    action(warehouse_binTypes)
                    {
                        applicationarea = basic, suite;
                        caption = 'Bin Types';
                        Visible = true;
                        RunObject = Page "Bin Types";
                        ToolTip = 'Open Bin Types';
                    }
                    action(warehouse_warehouseClasses)
                    {
                        applicationarea = basic, suite;
                        caption = 'Warehouse Classes';
                        Visible = true;
                        RunObject = Page "Warehouse Classes";
                        ToolTip = 'Open Warehouse Classes';
                    }
                    action(warehouse_specialEquipment)
                    {
                        applicationarea = basic, suite;
                        caption = 'Special Equipment';
                        Visible = true;
                        RunObject = Page "Special Equipment";
                        ToolTip = 'Open Special Equipment';
                    }
                    action(warehouse_warehouseEmployees)
                    {
                        applicationarea = basic, suite;
                        caption = 'Warehouse Employees';
                        Visible = true;
                        RunObject = Page "Warehouse Employees";
                        ToolTip = 'Open Warehouse Employees';
                    }
                    action(warehouse_warehouseSetup)
                    {
                        applicationarea = basic, suite;
                        caption = 'Warehouse Setup';
                        Visible = true;
                        RunObject = Page "Warehouse Setup";
                        ToolTip = 'Open Warehouse Setup';
                    }
                    action(warehouse_locations)
                    {
                        applicationarea = basic, suite;
                        caption = 'Locations';
                        Visible = true;
                        RunObject = Page "Location List";
                        ToolTip = 'Open Locations';
                    }
                    group(warehouse_templates)
                    {
                        caption = 'Templates';
                        action(warehouse_templates_putaway)
                        {
                            applicationarea = basic, suite;
                            caption = 'Bin Templates';
                            Visible = true;
                            RunObject = Page "Bin Templates";
                            ToolTip = 'Open Bin Templates';
                        }
                        action(warehouse_templates_pick)
                        {
                            applicationarea = basic, suite;
                            caption = 'Put-away Templates';
                            Visible = true;
                            RunObject = Page "Put-away Template";
                            ToolTip = 'Open Put-away Templates';
                        }
                        action(warehouse_templates_movement)
                        {
                            applicationarea = basic, suite;
                            caption = 'Bin Creation Worksheet Templates';
                            Visible = true;
                            RunObject = Page "Bin Creation Wksh. Templates";
                            ToolTip = 'Open Bin Creation Worksheet Templates';
                        }
                        action(warehouse_templates_internalMovement)
                        {
                            applicationarea = basic, suite;
                            caption = 'Whse. Journal Templates';
                            Visible = true;
                            RunObject = Page "Whse. Journal Templates";
                            ToolTip = 'Open Warehouse Journal Templates';
                        }
                        action(warehouse_templates_inventoryReceipt)
                        {
                            applicationarea = basic, suite;
                            caption = 'Whse. Worksheet Templates';
                            Visible = true;
                            RunObject = Page "Whse. Worksheet Templates";
                            ToolTip = 'Open Warehouse Worksheet Templates';
                        }
                    }
                    group(warehouse_adcs)
                    {

                        caption = 'ADCS';
                        action(warehouse_adcs_setup)
                        {
                            applicationarea = basic, suite;
                            caption = 'ADCS Users';
                            Visible = true;
                            RunObject = Page "ADCS Users";
                            ToolTip = 'Open ADCS Users';
                        }
                        action(warehouse_adcs_setup1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Miniforms';
                            Visible = true;
                            RunObject = Page "Miniforms";
                            ToolTip = 'Open Miniforms';
                        }
                        action(warehouse_adcs_setup2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Miniform Functions Group';
                            Visible = true;
                            RunObject = Page "Miniform Functions";
                            ToolTip = 'Open Miniform Functions Group';
                        }
                    }
                }


            }


            group(Action1040)
            {
                Caption = 'Sales & Mkt';
                Image = Sales;
                ToolTip = 'Make quotes, orders, and credit memos to customers. Manage customers and view transaction history.';

                group(sales)
                {
                    caption = 'Sales';
                    action(sales_Customers)
                    {
                        applicationarea = basic, suite;
                        caption = 'Customers';
                        Visible = true;
                        RunObject = Page "Customer List";
                        ToolTip = 'Open Customers';
                    }
                    action(sales_Contacts)
                    {
                        applicationarea = basic, suite;
                        caption = 'Contacts';
                        Visible = true;
                        RunObject = Page "Contact List";
                        ToolTip = 'Open Contacts';
                    }
                    action(sales_SalespeoplePurchasers)
                    {
                        applicationarea = basic, suite;
                        caption = 'Salespeople/Purchasers';
                        Visible = true;
                        RunObject = Page "Salespersons/Purchasers";
                        ToolTip = 'Open Salespeople/Purchasers';
                    }
                    action(sales_Teams)
                    {
                        applicationarea = basic, suite;
                        caption = 'Teams';
                        Visible = true;
                        RunObject = Page "Teams";
                        ToolTip = 'Open Teams';
                    }
                    action(sales_Tasks)
                    {
                        applicationarea = basic, suite;
                        caption = 'Tasks';
                        Visible = true;
                        RunObject = Page "Tasks";
                        ToolTip = 'Open Tasks';
                    }
                    action(sales_Opportunities)
                    {
                        applicationarea = basic, suite;
                        caption = 'Opportunities';
                        Visible = true;
                        RunObject = Page "Opportunities";
                        ToolTip = 'Open Opportunities';
                    }
                    group(sales_BudgetAnalysis)
                    {

                        caption = 'Budget Analysis';
                        action(sales_BudgetAnalysis_Salespeople)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Budget';
                            Visible = true;
                            RunObject = Page "Sales Budget Overview";
                            ToolTip = 'Open Sales Budget';
                        }
                        action(sales_BudgetAnalysis_Salesperson)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Analysis Report';
                            Visible = true;
                            RunObject = Page "Sales Analysis Report";
                            ToolTip = 'Open Sales Analysis Report';
                        }
                        action(sales_BudgetAnalysis_Salesperson1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Analysis by Dimensions';
                            Visible = true;
                            RunObject = Page "Sales Analysis by Dimensions";
                            ToolTip = 'Open Sales Analysis by Dimensions';
                        }
                        action(sales_BudgetAnalysis_Salesperson2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Dimensions - Detail';
                            Visible = true;
                            RunObject = Report "Item Dimensions - Detail";
                            ToolTip = 'Open Item Dimensions - Detail';
                        }
                        action(sales_BudgetAnalysis_Salesperson3)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Dimensions - Total';
                            Visible = true;
                            RunObject = Report "Item Dimensions - Total";
                            ToolTip = 'Open Item Dimensions - Total';
                        }
                        action(sales_BudgetAnalysis_Salesperson4)
                        {
                            applicationarea = basic, suite;
                            caption = 'Opportunity Analysis';
                            Visible = true;
                            RunObject = Page "Opportunity Statistics";
                            ToolTip = 'Open Opportunity Analysis';
                        }

                    }
                    group(sales_Reports)
                    {

                        caption = 'Reports';
                        action(sales_Reports_Sales)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Deferral Summary';
                            Visible = true;
                            RunObject = Report "Deferral Summary - Sales";
                            ToolTip = 'Open Sales Deferral Summary';
                        }
                        group(sales_people_teams)
                        {
                            caption = 'Salespeople/Teams';
                            action(sales_people_teams_Sales)
                            {
                                applicationarea = basic, suite;
                                caption = 'Salesperson Tasks';
                                visible = true;
                                RunObject = Report "Salesperson - Tasks";
                                ToolTip = 'Open Salesperson Tasks';
                            }
                            action(sales_people_teams_Sales1)
                            {
                                applicationarea = basic, suite;
                                caption = 'Salesperson Commission';
                                visible = true;
                                RunObject = Report "Salesperson Commissions";
                                ToolTip = 'Open Salesperson Commission';
                            }
                            action(sales_people_teams_Sales2)
                            {
                                applicationarea = basic, suite;
                                caption = 'Salesperson Opportunities';
                                visible = true;
                                RunObject = Report "Salesperson - Opportunities";
                                ToolTip = 'Open Salesperson Opportunities';
                            }
                            action(sales_people_teams_Sales3)
                            {
                                applicationarea = basic, suite;
                                caption = 'Team Tasks';
                                visible = true;
                                RunObject = Report "Team - Tasks";
                                ToolTip = 'Open Team Tasks';
                            }
                            action(sales_people_teams_Sales4)
                            {
                                applicationarea = basic, suite;
                                caption = 'Salesperson Statistics by Inv.';
                                visible = true;
                                RunObject = Report "Salesperson Statistics by Inv.";
                                ToolTip = 'Open Salesperson Statistics by Inv.';
                            }
                            action(sales_people_teams_Sales5)
                            {
                                applicationarea = basic, suite;
                                caption = 'Salesperson Statistics by Inv.';
                                visible = true;
                                RunObject = Report "Salesperson Statistics by Inv.";
                                ToolTip = 'Open Salesperson Statistics by Inv.';
                            }
                        }
                        group(reports_contacts)
                        {
                            Caption = 'Contacts';
                            action(reports_contacts_Sales)
                            {
                                applicationarea = basic, suite;
                                caption = 'Contact Labels';
                                visible = true;
                                RunObject = Report "Contact - Labels";
                                ToolTip = 'Open Contact Labels';
                            }
                            action(reports_contacts_Sales1)
                            {
                                applicationarea = basic, suite;
                                caption = 'Contact - Company Summary';
                                visible = true;
                                RunObject = Report "Contact - Company Summary";
                                ToolTip = 'Open Contact - Company Summary';
                            }
                            action(reports_contacts_Sales2)
                            {
                                applicationarea = basic, suite;
                                caption = 'Questionnaire - Handouts';
                                visible = true;
                                RunObject = Report "Questionnaire - Handouts";
                                ToolTip = 'Open Questionnaire - Handouts';
                            }
                            action(reports_contacts_Sales3)
                            {
                                applicationarea = basic, suite;
                                caption = 'Contact List';
                                visible = true;
                                RunObject = Report "Contact - List";
                                ToolTip = 'Open Contact List';
                            }
                            action(reports_contacts_Sales4)
                            {
                                applicationarea = basic, suite;
                                caption = 'Contact - Person Summary';
                                visible = true;
                                RunObject = Report "Contact - Person Summary";
                                ToolTip = 'Open Contact - Person Summary';
                            }
                            action(reports_contacts_Sales5)
                            {
                                applicationarea = basic, suite;
                                caption = 'Contact - Cover Sheet';
                                visible = true;
                                RunObject = Report "Contact - Cover Sheet";
                                ToolTip = 'Open Contact - Cover Sheet';
                            }

                        }
                        group(reports_customers)
                        {
                            caption = 'Customers';
                            action(reports_customers_Sales)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer Listing';
                                visible = true;
                                RunObject = Report "Customer Listing";
                                ToolTip = 'Open Customer Listing';
                            }
                            action(reports_customers_Sales1)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer Labels';
                                visible = true;
                                RunObject = Report "Customer - Labels";
                                ToolTip = 'Open Customer Labels';

                            }
                            action(reports_customers_Sales2)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer - Balance to Date';
                                visible = true;
                                RunObject = Report "Customer - Balance to Date";
                                ToolTip = 'Open Customer - Balance to Date';
                            }
                            action(reports_customers_Sales3)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer - Order Summary';
                                visible = true;
                                RunObject = Report "Customer - Order Summary";
                                ToolTip = 'Open Customer - Order Summary';
                            }
                            action(reports_customers_Sales4)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer/Item Statistics';
                                visible = true;
                                RunObject = Report "Customer/Item Statistics";
                                ToolTip = 'Open Customer/Item Statistics';
                            }
                            action(reports_customers_Sales5)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer Register';
                                visible = true;
                                RunObject = Report "Customer Register";
                                ToolTip = 'Open Customer Register';
                            }
                            action(reports_customers_Sales6)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer - Order Detail';
                                visible = true;
                                RunObject = Report "Customer - Order Detail";
                                ToolTip = 'Open Customer - Order Detail';
                            }
                            action(reports_customers_Sales7)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer Top 10 List';
                                visible = true;
                                RunObject = Report "Customer - Top 10 List";
                                ToolTip = 'Open Customer Top 10 List';
                            }
                            action(reports_customers_Sales8)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer/Item Statistics';
                                visible = true;
                                RunObject = Report "Customer/Item Statistics";
                                ToolTip = 'Open Customer/Item Statistics';
                            }
                            action(reports_customers_Sales9)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer Trial Balance';
                                visible = true;
                                RunObject = Report "Customer - Trial Balance";
                                ToolTip = 'Open Customer Trial Balance';
                            }
                            action(reports_customers_Sales10)
                            {
                                applicationarea = basic, suite;
                                caption = 'Customer - Sales List';
                                visible = true;
                                RunObject = Report "Customer - Sales List";
                                ToolTip = 'Open Customer - Sales List';
                            }
                        }
                        group(reports_opportunities)
                        {
                            Caption = 'Opportunities';
                            action(reports_opportunities_Sales)
                            {
                                applicationarea = basic, suite;
                                caption = 'Opportunity - List';
                                visible = true;
                                RunObject = Report "Opportunity - List";
                                ToolTip = 'Open Opportunity - List';
                            }
                            action(reports_opportunities_Sales1)
                            {
                                applicationarea = basic, suite;
                                caption = 'Opportunity - Details';
                                visible = true;
                                RunObject = Report "Opportunity - Details";
                                ToolTip = 'Open Opportunity - Details';
                            }
                            action(reports_opportunities_Sales2)
                            {
                                applicationarea = basic, suite;
                                caption = 'Sales Cycle - Analysis';
                                visible = true;
                                RunObject = Report "Sales Cycle - Analysis";
                                ToolTip = 'Open Sales Cycle - Analysis';
                            }
                        }
                    }
                }
                group(orderProcessing)
                {
                    caption = 'Order Processing';
                    action(orderProcessing_Customers)
                    {
                        applicationarea = basic, suite;
                        caption = 'Customers';
                        Visible = true;
                        RunObject = Page "Customer List";
                        ToolTip = 'Open Customers';
                    }
                    action(orderProcessing_Contacts)
                    {
                        applicationarea = basic, suite;
                        caption = 'Contacts';
                        Visible = true;
                        RunObject = Page "Contact List";
                        ToolTip = 'Open Contacts';
                    }
                    action(orderProcessing_SalesQuotes)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales Quotes';
                        Visible = true;
                        RunObject = Page "Sales Quotes";
                        ToolTip = 'Open Sales Quotes';
                    }
                    action(orderProcessing_SalesOrders)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales Orders';
                        Visible = true;
                        RunObject = Page "Sales Orders";
                        ToolTip = 'Open Sales Orders';
                    }
                    action(orderProcessing_BlanketSalesOrders)
                    {
                        applicationarea = basic, suite;
                        caption = 'Blanket Sales Orders';
                        Visible = true;
                        RunObject = Page "Blanket Sales Orders";
                        ToolTip = 'Open Blanket Sales Orders';
                    }
                    action(orderProcessing_SalesReturnOrders)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales Return Orders';
                        Visible = true;
                        RunObject = Page "Sales Return Orders";
                        ToolTip = 'Open Sales Return Orders';
                    }
                    action(orderProcessing_SalesInvoices)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales Invoices';
                        Visible = true;
                        RunObject = Page "Sales Invoice";
                        ToolTip = 'Open Sales Invoices';
                    }
                    action(orderProcessing_SalesCreditMemos)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales Credit Memos';
                        Visible = true;
                        RunObject = Page "Sales Credit Memos";
                        ToolTip = 'Open Sales Credit Memos';
                    }
                    action(orderProcessing_CertificateOfSupply)
                    {
                        applicationarea = basic, suite;
                        caption = 'Certificate of Supply';
                        Visible = true;
                        RunObject = Report "Certificate of Supply";
                        ToolTip = 'Open Certificate of Supply';
                    }
                    action(orderProcessing_OrderPlanning)
                    {
                        applicationarea = basic, suite;
                        caption = 'Order Planning';
                        Visible = true;
                        RunObject = Page "Order Planning";
                        ToolTip = 'Open Order Planning';
                    }
                    action(orderProcessing_CustomerOrderStatus)
                    {
                        applicationarea = basic, suite;
                        caption = 'Customer Order Status';
                        Visible = true;
                        RunObject = Page "Customer Order Status";
                        ToolTip = 'Open Customer Order Status';
                    }



                    group(orderProcessing_PostedDocuments)
                    {
                        caption = 'Posted Documents';
                        action(orderProcessing_PostedDocuments_SalesInvoices)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Sales Invoices';
                            visible = true;
                            RunObject = Page "Posted Sales Invoices";
                            ToolTip = 'Open Posted Sales Invoices';
                        }
                        action(orderProcessing_PostedDocuments_SalesOrders)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Sales Shipments';
                            visible = true;
                            RunObject = Page "Posted Sales Shipments";
                            ToolTip = 'Open Posted Sales Shipments';
                        }
                        action(orderProcessing_PostedDocuments_SalesCreditMemos)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Sales Credit Memos';
                            visible = true;
                            RunObject = Page "Posted Sales Credit Memos";
                            ToolTip = 'Open Posted Sales Credit Memos';
                        }
                        action(orderProcessing_PostedDocuments_SalesReturnOrders)
                        {
                            applicationarea = basic, suite;
                            caption = 'Posted Return Receipts';
                            visible = true;
                            RunObject = Page "Posted Return Receipts";
                            ToolTip = 'Open Posted Return Receipts';
                        }

                    }

                    group(orderProcessing_RegistrersEntries)
                    {
                        caption = 'Registers Entries';
                        action(orderProcessing_RegistrersEntries_Sales)
                        {
                            applicationarea = basic, suite;
                            caption = 'G/L Registers';
                            visible = true;
                            RunObject = Page "G/L Registers";
                            ToolTip = 'Open G/L Registers';
                        }
                        action(orderProcessing_RegistrersEntries_Sales1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Tracing';
                            visible = true;
                            RunObject = Page "Item Tracing";
                            ToolTip = 'Open Item Tracing';
                        }
                        action(orderProcessing_RegistrersEntries_Sales2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Quote Archives';
                            visible = true;
                            RunObject = Page "Sales Quote Archives";
                            ToolTip = 'Open Sales Quote Archives';
                        }
                        action(orderProcessing_RegistrersEntries_Sales3)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Order Archives';
                            visible = true;
                            RunObject = Page "Sales Order Archive";
                            ToolTip = 'Open Sales Order Archives';
                        }
                        action(orderProcessing_RegistrersEntries_Sales4)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Return Order Archives';
                            visible = true;
                            RunObject = Page "Sales Return Order Archive";
                            ToolTip = 'Open Sales Return Order Archives';
                        }
                        action(orderProcessing_RegistrersEntries_Sales5)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer Ledger Entries';
                            visible = true;
                            RunObject = Page "Customer Ledger Entries";
                            ToolTip = 'Open Customer Ledger Entries';
                        }
                        action(orderProcessing_RegistrersEntries_Sales6)
                        {
                            applicationarea = basic, suite;
                            caption = 'Detailed Customer Ledger Entries';
                            Visible = true;
                            RunObject = Page "Detailed Cust. Ledg. Entries";
                            ToolTip = 'Open Detailed Customer Ledger Entries';
                        }
                        action(orderProcessing_RegistrersEntries_Sales7)
                        {
                            applicationarea = basic, suite;
                            caption = 'Value Entries';
                            visible = true;
                            RunObject = Page "Value Entries";
                            ToolTip = 'Open Value Entries';
                        }
                        action(orderProcessing_RegistrersEntries_Sales8)
                        {
                            applicationarea = basic, suite;
                            caption = 'Find entries...';
                            visible = true;
                            RunObject = Page "Navigate";
                            ToolTip = 'Open Find entries...';
                        }


                    }


                    group(orderProcessing_Reports)
                    {
                        caption = 'Reports';
                        action(orderProcessing_Reports_Sales)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer - Order Detail';
                            Visible = true;
                            RunObject = Report "Customer - Order Detail";
                            ToolTip = 'Open Customer - Order Detail';
                        }
                        action(orderProcessing_Reports_Sales1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Reservation Avail.';
                            Visible = true;
                            RunObject = Report "Sales Reservation Avail.";
                            ToolTip = 'Open Sales Reservation Avail.';
                        }
                        action(orderProcessing_Reports_Sales2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer - Sales List';
                            Visible = true;
                            RunObject = Report "Customer - Sales List";
                            ToolTip = 'Open Customer - Sales List';
                        }
                        action(orderProcessing_Reports_Sales3)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer/Item Statistics';
                            visible = true;
                            RunObject = Report "Customer/Item Statistics";
                            ToolTip = 'Open Customer/Item Statistics';
                        }
                        action(orderProcessing_Reports_Sales4)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer - Order Summary';
                            visible = true;
                            RunObject = Report "Customer - Order Summary";
                            ToolTip = 'Open Customer - Order Summary';
                        }
                        action(orderProcessing_Reports_Sales5)
                        {
                            applicationarea = basic, suite;
                            caption = 'Shipping Labels';
                            Visible = true;
                            RunObject = Report "Shipping Labels";
                            ToolTip = 'Open Shipping Labels';
                        }
                        action(orderProcessing_Reports_Sales6)
                        {
                            applicationarea = basic, suite;
                            caption = 'UPS COD Tags';
                            Visible = true;
                            RunObject = Report "UPS COD Tags";
                            ToolTip = 'Open UPS COD Tags';
                        }
                        action(orderProcessing_Reports_Sales7)
                        {
                            applicationarea = basic, suite;
                            caption = 'Return Authorization';
                            Visible = true;
                            RunObject = Report "Return Authorization";
                            ToolTip = 'Open Return Authorization';
                        }
                    }
                }
                group(marketing)
                {
                    caption = 'Marketing';
                    action(marketing_Contacts)
                    {
                        applicationarea = basic, suite;
                        caption = 'Contacts';
                        Visible = true;
                        RunObject = Page "Contact List";
                        ToolTip = 'Open Contacts';
                    }
                    action(marketing_Campaigns)
                    {
                        applicationarea = basic, suite;
                        caption = 'Campaigns';
                        Visible = true;
                        RunObject = Page "Campaign List";
                        ToolTip = 'Open Campaigns';
                    }
                    action(marketing_Segments)
                    {
                        applicationarea = basic, suite;
                        caption = 'Segments';
                        Visible = true;
                        RunObject = Page "Segment";
                        ToolTip = 'Open Segments';
                    }
                    action(marketing_LoggedSegments)
                    {
                        applicationarea = basic, suite;
                        caption = 'Logged Segments';
                        visible = true;
                        RunObject = Page "Logged Segments";
                        ToolTip = 'Open Logged Segments';
                    }
                    action(marketing_Opportunities)
                    {
                        applicationarea = basic, suite;
                        caption = 'Opportunities';
                        visible = true;
                        RunObject = Page "Opportunities";
                        ToolTip = 'Open Opportunities';
                    }
                    action(marketing_Tasks)
                    {
                        applicationarea = basic, suite;
                        caption = 'Tasks';
                        Visible = true;
                        RunObject = Page "Tasks";
                        ToolTip = 'Open Tasks';
                    }
                    action(marketing_Reports)
                    {
                        applicationarea = basic, suite;
                        caption = 'Campaign - Details';
                        visible = true;
                        RunObject = Report "Campaign - Details";
                        ToolTip = 'Open Campaign - Details';
                    }
                    group(marketing_register_Entries)
                    {
                        Caption = 'Registers Entries';
                        action(marketing_register_Entries_Sales)
                        {
                            applicationarea = basic, suite;
                            caption = 'Campaign Entries';
                            visible = true;
                            RunObject = Page "Campaign Entries";
                            ToolTip = 'Open Campaign Entries';
                        }
                        action(marketing_register_Entries_Sales1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Opportunity Entries';
                            visible = true;
                            RunObject = Page "Opportunity Entries";
                            ToolTip = 'Open Opportunity Entries';
                        }
                        action(marketing_register_Entries_Sales2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Interaction Log Entries';
                            visible = true;
                            RunObject = Page "Interaction Log Entries";
                            ToolTip = 'Open Interaction Log Entries';
                        }
                    }

                }
                group(inventoryAndPricing)
                {
                    caption = 'Inventory & Pricing';
                    action(inventoryAndPricing_Items)
                    {
                        applicationarea = basic, suite;
                        caption = 'Items';
                        tooltip = 'Open Items';
                        runobject = page "Item List";
                        Visible = true;
                    }
                    action(inventoryAndPricing_NonstockItems)
                    {
                        applicationarea = basic, suite;
                        caption = 'Nonstock Items';
                        tooltip = 'Open Nonstock Items';
                        RunObject = Page "Catalog Item List";
                        Visible = true;
                    }
                    action(inventoryAndPricing_ItemAttributes)
                    {
                        applicationarea = basic, suite;
                        caption = 'Item Attributes';
                        tooltip = 'Open Item Attributes';
                        runobject = page "Item Attributes";
                    }
                    action(inventoryAndPricing_SalesPriceWorksheet)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales Price Worksheet';
                        tooltip = 'Open Sales Price Worksheet';
                        runobject = page "Sales Price Worksheet";
                    }
                    action(inventoryAndPricing_AdjustItemCostPrices)
                    {
                        applicationarea = basic, suite;
                        caption = 'Adjust Item Costs/Prices';
                        tooltip = 'Open Adjust Item Costs/Prices';
                        runobject = report "Adjust Item Costs/Prices";
                        visible = true;
                    }
                    group(inventoryAndPricing_Reports)
                    {
                        caption = 'Reports';
                        action(inventoryAndPricing_Reports_Sales)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Charges - Specification';
                            tooltip = 'Open Item Charges - Specification';
                            runobject = report "Item Charges - Specification";
                        }
                        action(inventoryAndPricing_Reports_Sales1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Nonstock Item Sales';
                            tooltip = 'Open Nonstock Item Sales';
                            runobject = report "Catalog Item Sales";
                        }
                        action(inventoryAndPricing_Reports_Sales2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Order Details';
                            tooltip = 'Open Inventory Order Details';
                            runobject = report "Inventory Order Details";
                        }
                        action(inventoryAndPricing_Reports_Sales3)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory - Sales Back Order';
                            tooltip = 'Open Inventory - Sales Back Order';
                            runobject = report "Inventory - Sales Back Orders";
                        }
                        action(inventoryAndPricing_Reports_Sales4)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Substitutions';
                            tooltip = 'Open Item Substitutions';
                            runobject = report "Item Substitutions";
                        }
                        action(inventoryAndPricing_Reports_Sales5)
                        {
                            applicationarea = basic, suite;
                            caption = 'Assemble to Order - Sales';
                            tooltip = 'Open Assemble to Order - Sales';
                            runobject = report "Assemble to Order - Sales";
                        }
                        action(inventoryAndPricing_Reports_Sales6)
                        {
                            applicationarea = basic, suite;
                            caption = 'Availability Projection';
                            tooltip = 'Open Availability Projection';
                            runobject = report "Availability Projection";
                        }
                        action(inventoryAndPricing_Reports_Sales7)
                        {
                            applicationarea = basic, suite;
                            caption = 'List Price Sheet';
                            tooltip = 'Open List Price Sheet';
                            runobject = report "List Price Sheet V16";
                        }
                        action(inventoryAndPricing_Reports_Sales8)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales History';
                            tooltip = 'Open Sales History';
                            runobject = report "Sales History";
                        }

                    }
                }

                group(setup19)
                {
                    caption = 'Setup';
                    action(setup19_SalesAndReceivablesSetup)
                    {
                        applicationarea = basic, suite;
                        caption = 'Order Promising Setup';
                        tooltip = 'Open Order Promising Setup';
                        runobject = page "Order Promising Setup";
                        runpagemode = edit;
                        visible = true;
                    }
                    action(setup19_SalesAndReceivablesSetup1)
                    {
                        applicationarea = basic, suite;
                        caption = 'Sales & Receivables Setup';
                        tooltip = 'Open Sales & Receivables Setup';
                        runobject = page "Sales & Receivables Setup";
                        runpagemode = edit;
                        visible = true;

                    }
                    action(setup19_SalesAndReceivablesSetup2)
                    {
                        applicationarea = basic, suite;
                        caption = 'Report Selections Sales';
                        tooltip = 'Open Report Selections Sales';
                        runobject = page "Report Selection - Sales";
                        runpagemode = edit;
                        visible = true;
                    }
                    action(setup19_SalesAndReceivablesSetup3)
                    {
                        applicationarea = basic, suite;
                        caption = 'Payment Terms';
                        tooltip = 'Open Payment Terms';
                        runobject = page "Payment Terms";
                        runpagemode = create;
                        visible = true;
                    }
                    action(setup19_SalesAndReceivablesSetup4)
                    {
                        applicationarea = basic, suite;
                        caption = 'Payment Methods';
                        tooltip = 'Open Payment Methods';
                        runobject = page "Payment Methods";
                        runpagemode = create;
                        visible = true;
                    }
                    action(setup19_SalesAndReceivablesSetup5)
                    {
                        applicationarea = basic, suite;
                        caption = 'Item Discount Groups';
                        tooltip = 'Open Item Discount Groups';
                        runobject = page "Item Disc. Groups";
                        runpagemode = create;
                        visible = true;

                    }
                    action(setup19_SalesAndReceivablesSetup6)
                    {
                        applicationarea = basic, suite;
                        caption = 'Shipment Methods';
                        tooltip = 'Open Shipment Methods';
                        runobject = page "Shipment Methods";
                        runpagemode = create;
                        visible = true;

                    }
                    action(setup19_SalesAndReceivablesSetup7)
                    {
                        applicationarea = basic, suite;
                        caption = 'Shipping Agents';
                        tooltip = 'Open Shipping Agents';
                        runobject = page "Shipping Agents";
                        runpagemode = create;
                        visible = true;


                    }
                    action(setup19_SalesAndReceivablesSetup8)
                    {
                        applicationarea = basic, suite;
                        caption = 'Return Reasons';
                        tooltip = 'Open Return Reasons';
                        runobject = page "Return Reasons";
                        runpagemode = create;
                        visible = true;
                    }
                    action(setup19_SalesAndReceivablesSetup9)
                    {
                        applicationarea = basic, suite;
                        caption = 'Customer Templates';
                        tooltip = 'Open Customer Templates';
                        runobject = page "Customer Templ. List";
                        runpagemode = create;
                        visible = true;

                    }
                    action(setup19_SalesAndReceivablesSetup10)
                    {
                        applicationarea = basic, suite;
                        caption = 'Mexican CFDI Setup';
                        tooltip = 'Open Mexican CFDI Setup';
                        runobject = page "Mexican CFDI Wizard";
                        runpagemode = create;
                        visible = true;

                    }
                    group(setup_sales_analysis)
                    {
                        caption = 'Sales Analysis';
                        action(setup_sales_analysis_SalesAndReceivablesSetup)
                        {
                            applicationarea = basic, suite;
                            caption = 'Analysis Types';
                            tooltip = 'Open Analysis Types';
                            runobject = page "Analysis Types";
                            runpagemode = create;
                            visible = true;
                        }
                        action(setup_sales_analysis_SalesAndReceivablesSetup1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Analysis by Dimensions';
                            tooltip = 'Open Sales Analysis by Dimensions';
                            runobject = page "Sales Analysis by Dimensions";
                            runpagemode = create;
                            visible = true;

                        }
                        action(setup_sales_analysis_SalesAndReceivablesSetup2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Analysis Column Templates';
                            tooltip = 'Open Sales Analysis Column Templates';
                            runobject = page "Analysis Column Templates";
                            runpagemode = edit;
                            visible = true;

                        }
                        action(setup_sales_analysis_SalesAndReceivablesSetup3)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Analysis Line Templates';
                            tooltip = 'Open Sales Analysis Line Templates';
                            runobject = page "Analysis Line Templates";
                            runpagemode = edit;
                            visible = true;
                        }
                    }
                    group(setup_customer)
                    {
                        caption = 'Customer';
                        action(setup_customer_SalesAndReceivablesSetup)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer Posting Groups';
                            tooltip = 'Open Customer Posting Groups';
                            runobject = page "Customer Posting Groups";
                            runpagemode = create;
                            visible = true;
                        }
                        action(setup_customer_SalesAndReceivablesSetup1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Customer Posting Groups';
                            tooltip = 'Open Customer Posting Groups';
                            runobject = page "Customer Posting Groups";
                            runpagemode = create;
                            visible = true;

                        }

                    }
                    group(setup_item)
                    {
                        caption = 'Item';
                        action(setup_item_SalesAndReceivablesSetup)
                        {
                            applicationarea = basic, suite;
                            caption = 'Nonstock Item Setup';
                            ToolTip = 'Open Nonstock Item Setup';
                            RunObject = Page "Catalog Item Setup";
                            RunPageMode = Create;
                            Visible = true;

                        }
                        action(setup_item_SalesAndReceivablesSetup1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Charges';
                            ToolTip = 'Open Item Charges';
                            RunObject = Page "Item Charges";
                            RunPageMode = Create;
                            Visible = true;

                        }
                        action(setup_item_SalesAndReceivablesSetup2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Item Discount Groups';
                            ToolTip = 'Open Item Discount Groups';
                            runobject = Page "Item Disc. Groups";
                            runpagemode = create;
                            visible = true;

                        }
                        action(setup_item_SalesAndReceivablesSetup3)
                        {
                            applicationarea = basic, suite;
                            caption = 'Inventory Setup';
                            ToolTip = 'Open Inventory Setup';
                            runobject = page "Inventory Setup";
                            runpagemode = create;
                            visible = true;
                        }
                    }
                    group(setup_marketing)
                    {
                        caption = 'Marketing';
                        action(setup_marketing_SalesAndReceivablesSetup)
                        {
                            applicationarea = basic, suite;
                            caption = 'Marketing Setup';
                            tooltip = 'Open Marketing Setup';
                            runobject = page "Marketing Setup";
                            runpagemode = create;
                            visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup1)
                        {
                            applicationarea = basic, suite;
                            caption = 'Interaction Template Setup';
                            tooltip = 'Open Interaction Template Setup';
                            runobject = page "Interaction Template Setup";
                            runpagemode = create;
                            visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup2)
                        {
                            applicationarea = basic, suite;
                            caption = 'Business Relations';
                            tooltip = 'Open Business Relations';
                            RunObject = Page "Business Relations";
                            RunPageMode = Create;
                            Visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup3)
                        {
                            applicationarea = basic, suite;
                            caption = 'Industry Groups';
                            tooltip = 'Open Industry Groups';
                            RunObject = Page "Industry Groups";
                            RunPageMode = Create;
                            Visible = true;

                        }
                        action(setup_marketing_SalesAndReceivablesSetup4)
                        {
                            applicationarea = basic, suite;
                            caption = 'Web Sources';
                            tooltip = 'Open Web Sources';
                            RunObject = Page "Web Sources";
                            RunPageMode = Create;
                            Visible = true;

                        }
                        action(setup_marketing_SalesAndReceivablesSetup5)
                        {
                            applicationarea = basic, suite;
                            caption = 'Job Responsibilities';
                            tooltip = 'Open Job Responsibilities';
                            runobject = page "Job Responsibilities";
                            runpagemode = create;
                            visible = true;


                        }
                        action(setup_marketing_SalesAndReceivablesSetup6)
                        {
                            applicationarea = basic, suite;
                            caption = 'Organizational Levels';
                            tooltip = 'Open Organizational Levels';
                            runobject = page "Organizational Levels";
                            runpagemode = create;
                            visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup7)
                        {
                            applicationarea = basic, suite;
                            caption = 'Interaction Groups';
                            tooltip = 'Open Interaction Groups';
                            RunObject = Page "Interaction Groups";
                            RunPageMode = Create;
                            Visible = true;

                        }
                        action(setup_marketing_SalesAndReceivablesSetup8)
                        {
                            applicationarea = basic, suite;
                            caption = 'Interaction Templates';
                            ToolTip = 'Open Interaction Templates';
                            RunObject = Page "Interaction Templates";
                            RunPageMode = Create;
                            Visible = true;

                        }
                        action(setup_marketing_SalesAndReceivablesSetup9)
                        {
                            applicationarea = basic, suite;
                            caption = 'Salutations';
                            tooltip = 'Open Salutations';
                            RunObject = Page "Salutations";
                            RunPageMode = Create;
                            Visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup10)
                        {
                            applicationarea = basic, suite;
                            caption = 'Mailing Groups';
                            tooltip = 'Open Mailing Groups';
                            RunObject = Page "Mailing Groups";
                            RunPageMode = Create;
                            Visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup11)
                        {
                            applicationarea = basic, suite;
                            caption = 'Campaign Status';
                            tooltip = 'Open Campaign Status';
                            RunObject = Page "Campaign Status";
                            RunPageMode = Create;
                            Visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup12)
                        {
                            applicationarea = basic, suite;
                            caption = 'Sales Cycles';
                            tooltip = 'Open Sales Cycles';
                            RunObject = Page "Sales Cycles";
                            RunPageMode = Create;
                            Visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup13)
                        {
                            applicationarea = basic, suite;
                            caption = 'Close Opportunity Codes';
                            tooltip = 'Open Close Opportunity Codes';
                            RunObject = Page "Close Opportunity Codes";
                            RunPageMode = Create;
                            Visible = true;
                        }
                        action(setup_marketing_SalesAndReceivablesSetup14)
                        {
                            applicationarea = basic, suite;
                            caption = 'Questionnaire Setup';
                            tooltip = 'Open Questionnaire Setup';
                            RunObject = Page "Profile Questionnaires";
                            RunPageMode = Create;
                            Visible = true;
                        }

                        action(setup_marketing_SalesAndReceivablesSetup15)
                        {
                            applicationarea = basic, suite;
                            caption = 'Activities';
                            RunObject = Page "Activity List";
                            RunPageMode = Create;
                            visible = true;
                            ToolTip = 'Open Activities';
                        }
                    }
                }
            }
        }
    }
}