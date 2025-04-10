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
    @State private var gradientColors: [Color] = [.gray, .white, .blue]
    
    var body: some View {
        ZStack {
            AnimatedView(colors: $gradientColors)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if let entry = selectedExpense.entry {
                        Text("Detail Buchung")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        Text(dateFormatter.string(from: entry.date))
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                        Divider()
                            .overlay(.black)
                        Spacer()
                        
                        Text("Betrag: \(entry.amount, format: .currency(code: "EUR"))")
                            .font(.headline)
                            .padding(.horizontal)
                        Text("Kategorie: \(entry.label)")
                            .font(.subheadline)
                            .padding(.horizontal)
                        
                        Text("Notiz: \(String(describing: entry.notes))")
                            .font(.subheadline)
                            .padding(.horizontal)
                        
                        Spacer().frame(height: 20)
                    }
                    
                    if let expense = selectedExpense.expense {
                        Text("Detail Ausgabe")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        Text(dateFormatter.string(from: expense.date))
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                            .padding(.bottom, 5)
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
                        
                        Spacer().frame(height: 20)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.top, 20)
        }
    }
}
#Preview {DetailView(
    selectedExpense: Transaktion(
        entry: Entry(id: UUID(), amount: 12345, date: .now, label: "gehalt", notes: "zu wenig kooohle")
    )
)
    
.modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
