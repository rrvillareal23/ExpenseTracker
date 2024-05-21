//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/20/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack {
            List{
                // MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupransationbyMonth()), id: \.key) { month,
                    transactions in
                    Section {
                        // MARK: Tranaction List
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }

                    } header: {
                        // MARK: Tranaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView{
        TransactionList()
    }
    .environmentObject(transactionListVM)
}
