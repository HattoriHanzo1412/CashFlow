//
//  AddUserView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import SwiftUI
struct AddUserView: View {
    @Binding var users: [User]
    @State private var name: String = ""
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Benutzerdetails")) {
                    TextField("Name", text: $name)
                    TextField("E-Mail", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                Button("Benutzer hinzufügen") {
                    let newUser = User(name: name, email: email)
                    users.append(newUser)
                    dismiss()
                }
            }
            .navigationTitle("Neuer Benutzer")
            .navigationBarItems(leading: Button("Abbrechen") {
                dismiss()
            })
        }
    }
}
struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView(users: .constant([]))
    }
}
