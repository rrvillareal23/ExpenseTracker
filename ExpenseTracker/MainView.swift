//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/19/24.
//

import SwiftUI
import SwiftUICharts

struct MainView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title                    LineView(data: demoData)

                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: Chart
                    let data = transactionListVM.accumulateTransaction()
                    
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            
                            VStack(alignment: .leading){
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.Icon.opacity(0.4), Color.Icon)))
                        .background(Color.systemBackground)
                        .frame(height: 300)
                    }
                   
                    // MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.backGround)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { 
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.Icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

let transactionListVM: TransactionListViewModel = {
    let transactionListVM = TransactionListViewModel()
    transactionListVM.transactions = transactionListPreviewData
    return transactionListVM
}()

#Preview {
    MainView()
        .environmentObject(transactionListVM)
}
