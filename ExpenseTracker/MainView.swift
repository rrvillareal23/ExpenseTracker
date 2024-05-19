//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/19/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title
                    Text("Placeholder")
                }
                
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
    }
}

#Preview {
    MainView()
}
