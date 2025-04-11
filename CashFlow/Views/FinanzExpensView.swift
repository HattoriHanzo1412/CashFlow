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
        NavigationStack{
            List(expenses) { expens in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expens.label)
                            .font(.headline)
                        Text(dateFormatter.string(from: expens.date))
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(String(format: "%.2f €", expens.amount * (-1)))
                        .font(.subheadline)
                    .foregroundColor(.red)        }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(8)
                .shadow(color: Color(UIColor.blue).opacity(0.3), radius: 4, x: 0, y: 2)
                .swipeActions {
                    Button("Löschen", systemImage: "trash", role: .destructive) {
                        
                    }
                }
            }
            .navigationTitle("Ausgabenübersicht")
        }
    }
}


#Preview {
    FinanzExpensView()
        .modelContainer(for: Expense.self,inMemory:true)
}
