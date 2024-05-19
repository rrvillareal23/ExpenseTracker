//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/19/24.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/23/2024", institution: "BankofAmerica", account: "Visa", merchant: "Apple", amount: 999.00, type: "debit", categoryId: 801, category: "Tech", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
