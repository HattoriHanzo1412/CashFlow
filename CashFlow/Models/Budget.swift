//
//  Budget.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
import Combine
class Budget: Identifiable, ObservableObject { // Implementiere das ObservableObject-Protokoll
    var id: UUID
    @Published var name: String // Verwende @Published für beobachtbare Variablen
    @Published var plannedAmount: Double
    @Published var expenses: [Expense] = []
    init(name: String, plannedAmount: Double) {
        self.id = UUID()
        self.name = name
        self.plannedAmount = plannedAmount
    }
    var totalSpent: Double {
        return expenses.reduce(0) { $0 + $1.amount }
    }
    var availableAmount: Double {
        return plannedAmount - totalSpent
    }
}
