//
//  BankAccount.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
class BankAccount: Identifiable {
    var id: UUID
    var accountNumber: String
    var bankName: String
    init(accountNumber: String, bankName: String) {
        self.id = UUID()
        self.accountNumber = accountNumber
        self.bankName = bankName
    }
}
