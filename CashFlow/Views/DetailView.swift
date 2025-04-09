//
//  DetailView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI
struct DetailView: View {
    
    @State var selectedExpense: Expense
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    var body: some View {
        ScrollView{
            HStack{
                
                VStack(alignment:.leading, spacing:10){
                    Text(selectedExpense.label)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Text(dateFormatter.string(from: selectedExpense.date))
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    
                }
            }
            
        }
    }
}
#Preview {DetailView(selectedExpense: Expense(amount: 1500.00, label: "Gehalt"))
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
