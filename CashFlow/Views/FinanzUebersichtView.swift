//
//  FinanzübersichtView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import SwiftUI
struct FinanzUebersichtView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query var expenses: [Expense]
    @Query var entrys: [Entry]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Einahmen")) {
                    ForEach(expenses, id: \.id) { expens in
                        NavigationLink(destination: DetailView(selectedExpense: Transaktion(expense: expens))) {
                            HStack {
                                Text(expens.label)
                                Spacer()
                                Text(String(format: "%.2f €", expens.amount))
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
                
                Section(header: Text("Ausgaben")) {
                    ForEach(entrys, id: \.id) { entry in
                        NavigationLink(destination: DetailView(selectedExpense: Transaktion(entry: entry))) {
                            HStack {
                                Text(entry.label)
                                Spacer()
                                Text(String(format: "%.2f €", entry.amount))
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Finanzübersicht").font(.largeTitle)) 
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddTransactionView()) {
                        Text("Add")
                            .font(.headline)
                    }
                }
            }
        }
    }
}
    #Preview {FinanzUebersichtView()
            .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
        
    }

