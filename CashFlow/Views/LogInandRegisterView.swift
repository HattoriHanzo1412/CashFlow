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
    
    @AppStorage("savedUsername") private var savedUsername: String = ""
    @AppStorage("savedEmail") private var savedEmail: String = ""
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var isAuthenticated: Bool = false
    @State private var showAlert: Bool = false
    @State private var isRegistering: Bool = false
    @State private var alertMessage: String = ""
    
    // Dummy Daten
    let validUsername = "1234"
    let validPassword = "abcd"
    let validEmail = "syntax@test123.de"
    
    var body: some View {
        ZStack {
            if isAuthenticated {
                MainView()
            } else {
                VStack(spacing: 10) {
                    Text(isRegistering ? "Registrieren" : "Login")
                        .font(.largeTitle)
                        .padding()
                    
                    TextField("Benutzername", text: $username)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("E-Mail", text: $email)
                        .textFieldStyle(.roundedBorder)
                    
                    SecureField("Passwort", text: $password)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        isRegistering ? register() : authenticate()
                    }) {
                        Text(isRegistering ? "Registrieren" : "Anmelden")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Fehler"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                    
                    Button(action: {
                        isRegistering.toggle()
                    }) {
                        Text(isRegistering ? "Bereits registriert? Melden Sie sich hier an." : "Noch keinen Account?")
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                .padding()
            }
        }
    }
    
    private func authenticate() {
        if username == validUsername && email == validEmail && password == validPassword {
            savedUsername = username
            savedEmail = email
            withAnimation {
                isAuthenticated = true
            }
        } else {
            alertMessage = "Ungültiger Benutzername oder Passwort"
            showAlert = true
        }
    }
    
    
    private func register() {
        if username.isEmpty || email.isEmpty || password.isEmpty {
            alertMessage = "Bitte füllen Sie alle Felder aus."
            showAlert = true
            return
        }
        
        // Weitere Validierung kann hier hinzugefügt werden (z.B. E-Mail-Format, Passwortstärke)
        
        // In diesem Beispiel speichern wir einfach die Informationen
        // Man könnte hier auch einen Serveraufruf zur permanenten Speicherung hinzufügen.
        savedUsername = username
        savedEmail = email
        
        // Automatische Anmeldung nach erfolgreicher Registrierung
        withAnimation {
            isAuthenticated = true
        }
    }
}
#Preview {
    LogInandRegisterView()
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
