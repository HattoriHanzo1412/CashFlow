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
    
    var totalExpenses: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
    
    var totalEntrys: Double {
        entrys.reduce(0) { $0 + $1.amount }
    }
    
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
            HStack(spacing: 16) {
                VStack {
                    Text("Gesamte Einahmen")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .padding(.top, 12)
                    Text(String(format: "%.2f €", totalEntrys))
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color(UIColor.systemGreen.withAlphaComponent(0.1)))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                
                VStack {
                    Text("Gesamte Ausgaben")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .padding(.top, 12)
                    Text(String(format: "%.2f €", totalExpenses))
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                }
                .padding()
                .background(Color(UIColor.systemRed.withAlphaComponent(0.1)))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
            .padding(.top, 20)
            .padding(.horizontal)
        }
    }
}
#Preview {
    FinanzChartView(
        expenses: [Expense(id: UUID(), amount: 765, label: "Einnahmen", notes: "Kaufland")],
        entrys: [Entry(id: UUID(), amount: 234, date: Date(), label: "Ausgaben", notes: "gestern gekauft")])
    
    
    .modelContainer(for: [Expense.self, Entry.self], inMemory: true)
}
