//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Soro on 2023-01-04.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
