//
//  MainView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI
struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Cash Flow")
                    .font(.title).bold().underline()
                
                List {
                    NavigationLink("Haushaltsbuch", destination: HaushaltsbuchView())
                    NavigationLink("Individuelle Budgets", destination: IndividuelleBudgetView())
                    NavigationLink("Finanzübersicht", destination: FinanzUebersichtView())
                }
            }
        }
    }
}
#Preview {MainView()
}
