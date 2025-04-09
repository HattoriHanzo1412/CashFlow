//
//  LogInandRegisterView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import SwiftUI
struct LogInandRegisterView: View {
    @Environment(\.modelContext) private var context
   
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false
    @State private var showAlert: Bool = false
    
    let validUsername = "1234"
    let validPassword = "abcd"
    var body: some View {
        NavigationStack {
            ZStack {
                if isAuthenticated {
                   
                  FinanzUebersichtView()
                    
                    
                } else {
                    
                    VStack {
                        
                        Text("Login")
                            .font(.largeTitle)
                            .padding()
                        TextField("Benutzername", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        SecureField("Passwort", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button(action: {
                            authenticate()
                        }) {
                            Text("Anmelden")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Fehler"), message: Text("Ungültiger Benutzername oder Passwort"), dismissButton: .default(Text("OK")))
                        }
                    }
                }
            }
        }
        
    }
    private func authenticate() {
        if username == validUsername && password == validPassword {
            isAuthenticated = true
        } else {
            showAlert = true
        }
    }
}

#Preview {
    LogInandRegisterView()
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
