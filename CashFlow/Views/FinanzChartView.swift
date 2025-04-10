//
//  HaushaltsbuchView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//


import SwiftUI
import Charts
struct FinanzChartView: View {
    
    var expenses: [Expense]
    var entrys: [Entry]
    
    var body: some View {
        
        VStack {
            Text("Finanzübersicht")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            Chart {
                ForEach(expenses) { expense in
                    BarMark(
                        x: .value("Label", expense.label),
                        y: .value("Amount", expense.amount)
                    )
                    .foregroundStyle(.green)
                    .cornerRadius(8)
                }
                ForEach(entrys) { entry in
                    BarMark(
                        x: .value("Label", entry.label),
                        y: .value("Amount", entry.amount)
                    )
                    .foregroundStyle(.red)
                    .cornerRadius(8)
                }
            }
            .frame(height: 350)
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 10)
            
            .chartXAxis {
                AxisMarks(position: .bottom) {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
        }
        .padding()
    }
}
#Preview {
    FinanzChartView(
        expenses: [Expense(id: UUID(), amount: 765, label: "Einnahmen", notes: "Kaufland")],
        entrys: [Entry(id: UUID(), amount: 234, date: Date(), label: "Ausgaben", notes: "gestern gekauft")])
        
        
        .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
