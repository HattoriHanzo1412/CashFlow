//
//  FinanzEntryView.swift
//  Projektwoche1
//
//  Created by Hattori Hanzo on 11.04.25.
//

import SwiftUI
import SwiftData

struct FinanzEntryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var entrys: [Entry]
    
    let einahmen: [Entry] = [Entry(id: UUID(), amount: 234, date: Date(), label: "Essen/Trinken", notes: "gestern gekauft")]
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    var body: some View {
        Text("Einahmenübersicht")
            .font(.title)
        List(einahmen ) { entry in
            VStack {
                
                Text(entry.label)
                    .font(.headline)
                Text(String(format: "%.2f €", entry.amount * (-1)))
                    .font(.subheadline)
                Text(dateFormatter.string(from: entry.date))
                    .font(.subheadline)
            }
            .padding()
        }
        
    }
}

#Preview {
    FinanzEntryView()
        .modelContainer(for: Entry.self, inMemory: true)
}
