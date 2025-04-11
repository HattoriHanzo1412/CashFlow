//
//  FinanzExpensView.swift
//  Projektwoche1
//
//  Created by Hattori Hanzo on 11.04.25.
//

import SwiftUI
import SwiftData

struct FinanzExpensView: View {
    
    @Environment(\.modelContext) private var modelContext

    @Query var expenses: [Expense]
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    var body: some View {
        Text("Ausgabenübersicht")
            .font(.title)
        List(expenses ) { expens in
            VStack {
                
                Text(expens.label)
                    .font(.headline)
                Text(String(format: "%.2f €", expens.amount * (-1)))
                    .font(.subheadline)
                Text(dateFormatter.string(from: expens.date))
                    .font(.subheadline)
            }
            .padding()
        }
        
    }
}

        
    


#Preview {
    FinanzExpensView()
        .modelContainer(for: Expense.self,inMemory:true)
}
