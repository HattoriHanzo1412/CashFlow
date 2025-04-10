//
//  DetailView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI
struct DetailView: View {
    
    var selectedExpense: Transaktion
    
    @State private var entryNote: String = ""
    @State private var expenseNote: String = ""
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        ScrollView {
            if let entry = selectedExpense.entry {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Detail Buchung")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Text(dateFormatter.string(from: entry.date))
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                    Divider()
                        .overlay(.black)
                    Spacer()
                    
                    Text("Betrag: \(entry.amount, format: .currency(code: "EUR"))")
                        .font(.headline)
                        .padding(.horizontal)
                    Text("Kategorie: \(entry.label)")
                        .font(.subheadline)
                        .padding(.horizontal)
                    
                    
                    Text("Notiz: \(entry.notes)")
                        .font(.subheadline)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
            
            if let expense = selectedExpense.expense {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Detail Ausgabe")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Text(dateFormatter.string(from: expense.date))
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                    Divider()
                        .overlay(.black)
                    Spacer()
                    
                    Text("Betrag: \(expense.amount, format: .currency(code: "EUR"))")
                        .font(.headline)
                        .padding(.horizontal)
                    Text("Kategorie: \(expense.label)")
                        .font(.subheadline)
                        .padding(.horizontal)
                    
                    
                    Text("Notiz: \(String(describing: expense.notes))")
                        .font(.subheadline)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }
}
#Preview {DetailView(
    selectedExpense: Transaktion(entry: Entry(id: UUID(), amount: 12345, date: .now, label: "gehalt", notes: "zu wenig kooohle"))
    
)
.modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
