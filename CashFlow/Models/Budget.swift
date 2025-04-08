//
//  Budget.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
import SwiftData
import SwiftUI

@Model

class Budget: Identifiable {
    var id: UUID = UUID()
    var title = ""
    var date = Date()
    var amount: Double
    
    init(title: String, date: Date, amount: Double){
        
        self.title = title
        self.date = Date()
        self.amount = amount
    }
}
