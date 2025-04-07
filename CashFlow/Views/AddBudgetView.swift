//
//  AddBudgetView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//

import SwiftUI
struct AddBudgetView: View {
    @Binding var budgets: [Budget]
    @State private var name: String = ""
    @State private var plannedAmount: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Budgetdetails")) {
                    TextField("Name", text: $name)
                    TextField("Geplanter Betrag", text: $plannedAmount)
                        .keyboardType(.decimalPad)
                }
                Button("Budget hinzufügen") {
                    if let amountValue = Double(plannedAmount) {
                        let newBudget = Budget(name: name, plannedAmount: amountValue)
                        budgets.append(newBudget)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Neues Budget")
            .navigationBarItems(leading: Button("Abbrechen") {
                dismiss()
            })
        }
    }
}
struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView(budgets: .constant([]))
    }
}
