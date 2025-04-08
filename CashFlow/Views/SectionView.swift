//
//  SectionView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI

struct SectionView: View {

    @State private var kategorieButton: Budget?
    @State var haushaltsbuch: [Budget] = [
        Budget(title: "", date: Date(), amount: 0.0)
    ]
    @State var indivuellesBudget: [Budget] = [
        Budget(title: "", date: Date(), amount: 0.0)
    ]
  

    @Binding var budgets: [Budget]
    var sectionName: String
    var body: some View {
        NavigationStack {
            Section(header: Text(sectionName)) {
                ForEach(budgets) { budget in
                    NavigationLink(
                        "\(budget.title)",
                        destination: MainView())
                }
            }
        }
    }
}

#Preview {
    SectionView(budgets: .constant([]), sectionName: "Test")
}
