//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Soro on 2023-01-04.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading,spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    let data = transactionListVM.accumulateTransaction() // chart data
                    
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView{
                            VStack{
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")),type: .title)
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .frame(height: 300.0)
                        .chartStyle(ChartStyle(backgroundColor: Color.background, foregroundColor: [ColorGradient(Color.icon.opacity(0.4), Color.icon)]))
                    }
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon,.primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
}
