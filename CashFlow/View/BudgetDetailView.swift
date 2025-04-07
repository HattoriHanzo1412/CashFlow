//
//  BudgetDetailView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//
import SwiftUI
struct BudgetDetailView: View {
    @State var budget: Budget
    @State private var showingAddExpense = false
    @State private var newExpenseAmount = ""
    var body: some View {
        VStack {
            Section(header: Text("Ausgaben")) {
                List {
                    ForEach(budget.expenses, id: \.id) { expense in
                        HStack {
                            Text("\(expense.amount, specifier: "%.2f") €")
                            Spacer()
                            Text("\(expense.date, formatter: dateFormatter)")
                        }
                    }
                    .onDelete(perform: deleteExpense)
                }
            }
            Button("Ausgabe hinzufügen") {
                showingAddExpense = true
            }
            .alert(isPresented: $showingAddExpense) {
                Alert(title: Text("Neue Ausgabe hinzufügen"),
                      message: Text("Bitte Betrag eingeben"),
                      primaryButton: .default(Text("Hinzufügen"), action: addExpense),
                      secondaryButton: .cancel())
            }
        }
        .navigationTitle(budget.name)
    }
    func addExpense() {
        guard let amount = Double(newExpenseAmount) else { return }
        let newExpense = Expense(amount: amount)
        budget.expenses.append(newExpense)
        // Hier solltest du den Code zum Speichern der Ausgabe in SwiftData hinzufügen.
    }
    func deleteExpense(at offsets: IndexSet) {
        budget.expenses.remove(atOffsets: offsets)
        // Hier solltest du den Code zum Löschen der Ausgabe aus SwiftData hinzufügen.
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
