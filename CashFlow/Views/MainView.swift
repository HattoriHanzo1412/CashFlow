//
//  MainView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI

struct MainView: View {
    
    @State var haushaltsbuch: [Budget] = [
        Budget(title: "", date: Date(), amount: 0.0)
    ]
    @State var indivuellesBudget: [Budget] = [
        Budget(title: "", date: Date(), amount: 0.0)
    ]
    
    @State var finanzübersicht: String = "Finanzübersicht"
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Cash Flow")
                    .font(.title).bold().underline()
           
            List{
                NavigationLink("Haushaltsbuch", destination: SectionView(budgets: $haushaltsbuch, sectionName: "Haushaltsbuch"))
                
                NavigationLink("Indivuelle Budgets", destination: SectionView(budgets: $indivuellesBudget, sectionName: "Individuelle Budgets"))
            }
            }
        }
    }
}

#Preview {
    MainView()
}
