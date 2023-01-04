//
//  TransactionModel.swift
//  Expense Tracker
//
//  Created by Soro on 2023-01-04.
//

import Foundation

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Transaction: Identifiable,Decodable {
    let id: Int
    let date: String
    let institution:String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited : Bool
    
    var dateParsed : Date {
        date.dateParse()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

