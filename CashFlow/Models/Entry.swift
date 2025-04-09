//
//  Entry.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import Foundation

@Model
class Entry: Identifiable {
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
