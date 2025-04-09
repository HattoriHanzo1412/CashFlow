//
//  SectionView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI
struct SectionView: View {
    @State var budgets = [Budget(id: UUID(), title: "Küche", date: .now, amount: 1500.00)]
    var sectionName: String = "Haushaltsbuch"
    var body: some View {
        List {
            Section(header: Text(sectionName)) {
                ForEach(budgets) { budget in
                    NavigationLink("\(budget.title)", destination: MainView())
                }
            }
        }
    }
}
#Preview {SectionView()
}
