//
//  PreviewData.swift
//  Expense Tracker
//
//  Created by Soro on 2023-01-04.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "01/01/2023", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 15.0, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
