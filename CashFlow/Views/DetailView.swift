//
//  DetailView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI
struct DetailView: View {
    
    @State var selectedExpense: Expense
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    var body: some View {
        ScrollView{
                VStack(alignment:.leading, spacing:10){
                    Text("Detail Buchung")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Text(dateFormatter.string(from: selectedExpense.date))
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                    Divider()
                        .overlay(.black)
                    Spacer()
                        
                    Text("Betrag:\(selectedExpense.amount, format: .currency(code: "EUR"))")
                        .font(.headline)
                        .padding(.horizontal)
                    Text("Kategorie: \(selectedExpense.label)")
                        .font(.subheadline)
                        .padding(.horizontal)
                    Spacer()
                    if let notes = selectedExpense.notes, !notes.isEmpty {
                        Text("Notizen")
                            .font(.headline)
                            .padding(.horizontal)
                        Text(notes)
                            .font(.body)
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                
            }
            
        }
    }
}
#Preview {DetailView(
    selectedExpense: Expense(
        amount: 1500.00,
        label: "Gehalt",
        notes: "Gehalt von letztem Monat März"
    )
)
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
