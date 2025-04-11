//
//  SettingsView.swift
//  Projektwoche1
//
//  Created by Denny Sprenger on 10.04.25.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    
    @AppStorage("savedUsername") private var savedUsername: String = ""
    @AppStorage("savedEmail") private var savedEmail: String = ""
    @AppStorage("birthdate") private var birthdate: Date = Date()
    @AppStorage("city") private var city: String = ""
    @AppStorage("notificationsEnabled") private var notificationOn: Bool = false
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "Deutsch"
    @AppStorage("currency") private var currency: String = "EUR"
    @AppStorage("budgetAlertsEnabled") private var budgetAlertsEnabled: Bool = false
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("fontSize") private var fontSize: Double = 13.0
    @State private var showNotificationSheet = false
    @State private var showLogOutAlert = false
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Benutzereinstellungen")) {
                    TextField("Benutzername", text: $savedUsername)
                    TextField("E-Mail-Adresse", text: $savedEmail)
                    DatePicker("Geburtsdatum", selection: $birthdate, displayedComponents: .date)
                    TextField("Stadt", text: $city)
                }
                
                Section(header: Text("Finanzielle Einstellungen")) {
                    Picker("Währung", selection: $currency) {
                        Text("Euro").tag("EUR")
                        Text("US-Dollar").tag("USD")
                        Text("Schweizer Franken").tag("CHF")
                    }
                    
                    Toggle("Budgetwarnungen aktivieren", isOn: $budgetAlertsEnabled)
                }
                Section(header: Text("Benachrichtigungen")) {
                    Toggle("Benachrichtigungen aktivieren", isOn: $notificationOn)
                    Button("Benachrichtigungen einstellen") {
                        showNotificationSheet = true
                    }
                    .actionSheet(isPresented: $showNotificationSheet) {
                        ActionSheet(title: Text("Detailierte Benachrichtigung"),
                                    message: Text("Wählen, welche Benachrichtigungen Sie wollen."),
                                    buttons: [
                                        .default(Text("Bei Ausgaben über 2000€")),
                                        .default(Text("Wichtige Benachrichtigungen")),
                                        .cancel()
                                    ])
                    }
                }
                Section(header: Text("Sprache und Design")) {
                    Picker("Sprache", selection: $selectedLanguage) {
                        Text("Englisch").tag("English")
                        Text("Deutsch").tag("Deutsch")
                    }
                    
                    Toggle("Darkmode", isOn: $isDarkMode)
                    
                    Stepper("Schriftgröße: \(Int(fontSize))", value: $fontSize, in: 10...30)
                }
                Section(header: Text("Backup & Wiederherstellung")) {
                    Button("Daten sichern") {
                        
                    }
                    Button("Daten wiederherstellen") {
                        
                    }
                }
                
                
                Button("Abmelden") {
                    showLogOutAlert = true
                }
                .alert(isPresented: $showLogOutAlert) {
                    Alert(title: Text("Abmelden"),
                          message: Text("Sind Sie sicher, dass Sie sich abmelden möchten?"),
                          primaryButton: .destructive(Text("Abmelden")) {
                        // Abmelden Logik
                        savedUsername = ""
                        savedEmail = ""
                        city = ""
                        isLoggedOut = true
                    },
                          secondaryButton: .cancel())
                }
            }
            .navigationTitle("Einstellungen")
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .animation(.easeInOut, value: isDarkMode)
            .navigationDestination(isPresented: $isLoggedOut) {
               LogInandRegisterView()
            }
        }
    }
}
#Preview {
    SettingsView()
}
