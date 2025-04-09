//
//  MainView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import SwiftUI

struct MainView: View {
    
    @Environment(\.modelContext) private var context
    @Query var expenses: [Expense] = []
    
    
    var body: some View {
        TabView{
            LogInandRegisterView()
                .tabItem{
                    Label("LogIn", systemImage: "person.circle")
                }
            FinanzUebersichtView()
                .tabItem{
                    Label("Finanzen", systemImage: "briefcase.fill")
                }
            HaushaltsbuchView()
                .tabItem{
                    Label("Haushaltsbuch", systemImage: "book.fill")
                }
            AddTransactionView()
                .tabItem{
                    Label("Transaktion hinzufügen", systemImage: "plus")
                }
        }
        
        
    }
    
}

#Preview {MainView()
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
