//
//  AddBankAccountView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import SwiftUI
struct AddBankAccountView: View {
    @State private var accountNumber: String = ""
    @State private var bankName: String = ""
    @Environment(\.dismiss) var dismiss
    var user: User
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Bankkontodetails")) {
                    TextField("Kontonummer", text: $accountNumber)
                    TextField("Bankname", text: $bankName)
                }
                Button("Bankkonto hinzufügen") {
                    let newAccount = BankAccount(accountNumber: accountNumber, bankName: bankName)
                    user.bankAccounts.append(newAccount)
                    dismiss()
                }
            }
            .navigationTitle("Neues Bankkonto")
            .navigationBarItems(leading: Button("Abbrechen") {
                dismiss()
            })
        }
    }
}
struct AddBankAccountView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(name: "Max Mustermann", email: "max@example.com")
        AddBankAccountView(user: user)
    }
}
