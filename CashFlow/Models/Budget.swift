//
//  Budget.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
import SwiftData
@Model

class Budget: Identifiable {
    var id: UUID = UUID()
    var title: String = ""
    var date = Date()
    var amount: Double
    
    init(id: UUID, title: String, date: Date = Date(), amount: Double) {
        self.id = id
        self.title = title
        self.date = date
        self.amount = amount
    }
    }
