//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/19/24.
//

import SwiftUI
import SwiftUICharts

struct MainView: View {
    
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
                    CardView {
                        ChartLabel("$900", type: .title)
                            .background(Color.systemBackground)
                        LineChart()
                            .background(Color.systemBackground)
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.Icon.opacity(0.4), Color.Icon)))
                    .background(Color.systemBackground)
                    .frame(height: 300)
                        
                    
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
