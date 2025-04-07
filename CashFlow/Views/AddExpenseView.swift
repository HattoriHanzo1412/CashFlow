//
//  AddExpenseView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import SwiftUI
struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    var budget: Budget
    
    @State private var amount: String = ""
    @State private var label: String = ""
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ausgabendetails")) {
                    TextField("Betrag", text: $amount)
                        .keyboardType(.decimalPad)
                    TextField("Bezeichnung", text: $label)
                }
                Button("Ausgabe hinzufügen") {
                    if let amountValue = Double(amount) {
                        let newExpense = Expense(amount: amountValue, label: label)
                        budget.expenses.append(newExpense)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Neue Ausgabe")
            .navigationBarItems(leading: Button("Abbrechen") {
                dismiss()
            })
        }
    }
}
struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        let budget = Budget(name: "Monatsbudget", plannedAmount: 1000)
        AddExpenseView(budget: budget)
    }
}
