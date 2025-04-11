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
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        NavigationStack{
            List(entrys) { entry in
                HStack {
                    VStack(alignment: .leading) {
                        Text(entry.label)
                            .font(.headline)
                        Text(dateFormatter.string(from: entry.date))
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        
                    }
                    Spacer()
                    Text(String(format: "%.2f €", entry.amount))
                        .font(.subheadline)
                    .foregroundColor(.green)        }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(8)
                .shadow(color: Color(UIColor.blue).opacity(0.3), radius: 4, x: 0, y: 2)
                .swipeActions {
                    Button("Löschen", systemImage: "trash", role: .destructive) {
                        
                    }
                }
            }
            .navigationTitle("Einahmenübersicht")
        }
    }
}
#Preview {
    FinanzEntryView()
        .modelContainer(for: Entry.self, inMemory: true)
}

