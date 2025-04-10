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
    var notes: String
    
    init(id: UUID, amount: Double, date: Date, label: String, notes: String) {
        self.id = id
        self.amount = amount
        self.date = date
        self.label = label
        self.notes = notes
    }
}
