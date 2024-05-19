//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/19/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(transactionListVM)
        }
    }
}
