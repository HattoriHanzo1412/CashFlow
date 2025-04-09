//
//  HaushaltsbuchView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//
import SwiftData
import SwiftUI
struct HaushaltsbuchView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var budgets: [Budget]
    var body: some View {
        List {
            ForEach(budgets) { budget in
                HStack {
                    Text(budget.title)
                    Spacer()
                    Text(String(format: "%.2f €", budget.amount))
                }
            }
        }
        .navigationTitle("Haushaltsbuch")
    }
}
#Preview {HaushaltsbuchView()
}
