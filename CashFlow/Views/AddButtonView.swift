//
//  AddButtonView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI
import SwiftData

struct AddTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query var expens: [Expense]
    @Query var entries: [Entry]
    
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var date: Date = Date()
    @State private var selectedCategory: Kategorie = .entry
    @State private var notes: String = ""
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Transaktion Details")) {
                    TextField("Beschreibung", text: $title)
                    TextField("Summe", text: $amount)
                    
                    DatePicker("Datum", selection: $date, displayedComponents: .date)
                    
                    Picker("Kategorie", selection: $selectedCategory) {
                        ForEach(Kategorie.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Notiz...", text: $notes) 
                }
                Button("Speichern") {
                    addTransaction()
                }
            }
            .navigationTitle("Neue Transaktion")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addTransaction() {
            guard let amountValue = Double(amount) else {
                return
            }
            if selectedCategory != .expense {
                let newExpense = Expense(amount: amountValue, label: title, notes: notes)
                modelContext.insert(newExpense)
            } else {
                let newEntry = Entry(id: UUID(), amount: amountValue, date: Date(), label: title, notes: notes)
                modelContext.insert(newEntry)
            }
            do {
                try modelContext.save()
            } catch {
                print("Fehler beim Speichern: \(error)")
                
            }
            
            dismiss()
        }
    }
#Preview{
    AddTransactionView()
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
