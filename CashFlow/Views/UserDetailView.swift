//
//  UserDetailView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import SwiftUI
struct UserDetailView: View {
    @ObservedObject var user: User // Hier bleibt es unverändert
    @State private var showingAddAccount = false
    var body: some View {
        VStack {
            Text("Benutzer: \(user.name)")
            Text("E-Mail: \(user.email)")
            List {
                ForEach(user.bankAccounts) { account in
                    HStack {
                        Text(account.bankName)
                        Spacer()
                        Text(account.accountNumber)
                    }
                }
                .onDelete(perform: deleteAccount)
            }
            Button(action: {
                showingAddAccount = true
            }) {
                Text("Bankkonto hinzufügen")
            }
            .sheet(isPresented: $showingAddAccount) {
                AddBankAccountView(user: user)
            }
        }
        .navigationTitle("Benutzerdetails")
    }
    func deleteAccount(at offsets: IndexSet) {
        user.bankAccounts.remove(atOffsets: offsets)
    }
}
struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(name: "Max Mustermann", email: "max@example.com")
        return UserDetailView(user: user)
    }
}
