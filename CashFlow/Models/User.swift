//
//  User.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
import Combine
class User: Identifiable, ObservableObject { // Hier das Protokoll ObservableObject anfügen
    var id: UUID
    @Published var name: String // Verwende @Published für beobachtbare Variablen
    @Published var email: String
    @Published var bankAccounts: [BankAccount] // Auch bankAccounts sollten beobachtbar sein
    init(name: String, email: String) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.bankAccounts = [] // Initialisierung der bankAccounts
    }
}
