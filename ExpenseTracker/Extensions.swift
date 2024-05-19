//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Ricky Villareal on 5/19/24.
//

import Foundation
import SwiftUI

extension Color {
    static let backGround = Color("Background")
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {return Date() }
        return parsedDate
    }
}
