//
//  FinanzübersichtView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import SwiftUI
struct FinanzUebersichtView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var expenses: [Expense]
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Ausgaben")) {
                    ForEach(expenses) { expense in
                        HStack {
                            Text(expense.label)
                            Spacer()
                            Text(String(format: "%.2f €", expense.amount))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Finanzübersicht")
        }
    }
}
#Preview {FinanzUebersichtView()
}
