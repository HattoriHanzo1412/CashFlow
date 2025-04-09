//
//  User.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import Foundation
import SwiftData
@Model
class User: Identifiable {
    var id: UUID
    var email: String
    var password: String
    init(email: String, password: String) {
        self.id = UUID()
        self.email = email
        self.password = password
    }
}
