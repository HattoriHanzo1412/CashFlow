//
//  MainView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import SwiftUI
import Charts

struct MainView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.modelContext) private var context
    @Query var expenses: [Expense] = []
    @Query var entrys: [Entry] = []
    
    var body: some View {
        TabView{
            FinanzUebersichtView()
                .tabItem{
                    Label("Finanzen", systemImage: "briefcase.fill")
                }
            FinanzChartView(expenses: expenses, entrys: entrys)
                .tabItem{
                    Label("Finanzübersicht", systemImage: "book.fill")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {MainView()
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
