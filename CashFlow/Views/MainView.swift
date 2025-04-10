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
