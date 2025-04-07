//
//  BudgetOverviewView.swift
//  Projektwoche1
//
//  Created by Florian Grote on 07.04.25.
//
import SwiftUI
struct BudgetOverviewView: View {
    @State private var budgets: [Budget] = []
    @State private var showingAddBudget = false
    @State private var newBudgetName = ""
    @State private var newBudgetAmount = ""
    var totalBudget: Double {
        budgets.reduce(0) { $0 + $1.plannedAmount }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(budgets, id: \.id) { budget in
                    NavigationLink(destination: BudgetDetailView(budget: budget)) {
                        VStack(alignment: .leading) {
                            Text(budget.name)
                            HStack {
                                Text("Geplant: \(budget.plannedAmount, specifier: "%.2f") €")
                                Spacer()
                                Text("Verfügbar: \(budget.availableAmount, specifier: "%.2f") €").foregroundColor(budget.availableAmount < 0 ? .red : .green)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBudget)
            }
            .navigationTitle("Budgets")
            .navigationBarItems(trailing: Button(action: {
                showingAddBudget = true
            }) {
                Image(systemName: "plus")
            })
            .alert(isPresented: $showingAddBudget) {
                Alert(title: Text("Neues Budget hinzufügen"),
                      message: Text("Name und Betrag"),
                      primaryButton: .default(Text("Hinzufügen"), action: addBudget),
                      secondaryButton: .cancel())
            }
        }
        .onAppear(perform: loadBudgets)
    }
    func loadBudgets() {
        // Hier solltest du den Code einfügen, um die Budgets aus SwiftData zu laden.
    }
    func addBudget() {
        guard let amount = Double(newBudgetAmount) else { return }
        let newBudget = Budget(name: newBudgetName, plannedAmount: amount)
        budgets.append(newBudget)
        // Hier solltest du den Code zum Speichern des Budgets in SwiftData hinzufügen.
    }
    func deleteBudget(at offsets: IndexSet) {
        budgets.remove(atOffsets: offsets)
        // Hier solltest du den Code zum Löschen des Budgets aus SwiftData hinzufügen.
    }
}
