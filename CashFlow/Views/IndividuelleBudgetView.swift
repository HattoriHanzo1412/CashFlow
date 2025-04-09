//
//  IndividuelleBudgetView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import SwiftUI
import CoreData
struct IndividuelleBudgetView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var indivuellesBudget: [Budget]
    var body: some View {
        List {
            ForEach(indivuellesBudget) { budget in
                HStack {
                    Text(budget.title)
                    Spacer()
                    Text(String(format: "%.2f €", budget.amount))
                }
            }
        }
        .navigationTitle("Individuelles Budget")
    }
}
#Preview {IndividuelleBudgetView()
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
