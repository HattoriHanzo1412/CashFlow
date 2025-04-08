//
//  Expense.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
import SwiftData
import SwiftUI

@Model

class Expense: Identifiable {
    var id: UUID
    var amount: Double
    var date: Date
    var label: String
    init(amount: Double, label: String) {
        self.id = UUID()
        self.amount = amount
        self.date = Date()
        self.label = label
    }
}
