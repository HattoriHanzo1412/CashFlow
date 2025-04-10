//
//  Expense.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
import SwiftData

@Model

class Expense: Identifiable {
    var id: UUID
    var amount: Double
    var date: Date
    var label: String
    var notes: String
    
    init(id: UUID = UUID(), amount: Double, label: String, notes: String) {
        self.id = UUID()
        self.amount = amount
        self.date = Date()
        self.label = label
        self.notes = notes
    }
}
