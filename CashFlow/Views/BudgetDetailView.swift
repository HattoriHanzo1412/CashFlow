//
//  BudgetDetailView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import SwiftUI
struct BudgetDetailView: View {
    @ObservedObject var budget: Budget // Verwendung von @ObservedObject
    @State private var showingAddExpense = false
    var body: some View {
        VStack {
            Text("Geplantes Budget: \(budget.plannedAmount, specifier: "%.2f") €")
            Text("Ausgaben: \(budget.totalSpent, specifier: "%.2f") €")
            Text("Verfügbar: \(budget.availableAmount, specifier: "%.2f") €")
            List {
                ForEach(budget.expenses) { expense in
                    HStack {
                        Text(expense.label)
                        Spacer()
                        Text("\(expense.amount, specifier: "%.2f") €")
                    }
                }
                .onDelete(perform: deleteExpense)
            }
            Button(action: {
                showingAddExpense = true
            }) {
                Text("Ausgabe hinzufügen")
            }
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView(budget: budget)
            }
        }
        .navigationTitle(budget.name)
    }
    func deleteExpense(at offsets: IndexSet) {
        budget.expenses.remove(atOffsets: offsets)
    }
}
struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let budget = Budget(name: "Monatsbudget", plannedAmount: 1000)
        return BudgetDetailView(budget: budget)
    }
}
