//
//  Expense.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//
import Foundation
import SwiftData
// Expense Model
@Model
class Expense {
    var id: UUID
    var amount: Double
    var date: Date
    init(amount: Double) {
        self.id = UUID()
        self.amount = amount
        self.date = Date()
    }
}
