//
//  Budget.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//
import Foundation
import SwiftData
// Budget Model
@Model
class Budget {
    var id: UUID
    var name: String
    var plannedAmount: Double
    var expenses: [Expense]
    var totalSpent: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
    
    var availableAmount: Double {
        plannedAmount - totalSpent
    }
    init(name: String, plannedAmount: Double) {
        self.id = UUID()
        self.name = name
        self.plannedAmount = plannedAmount
        self.expenses = []
    }
}
