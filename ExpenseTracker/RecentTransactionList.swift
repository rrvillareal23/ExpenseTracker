//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/19/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // MARK: Hader Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.Text)
                }
            }
            .padding(.top)
            
            // MARK: Recent Tranaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) {index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x:0, y:5)
    }
}

#Preview {
    RecentTransactionList()
        .environmentObject(transactionListVM)
}
