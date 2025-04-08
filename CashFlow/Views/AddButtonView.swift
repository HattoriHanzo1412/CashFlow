//
//  AddButtonView.swift
//  Projektwoche1
//
//  Created by Kimberly Voigt on 08.04.25.
//

import SwiftUI
import SwiftData
struct AddTransactionView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext
  @State private var title: String = ""
  @State private var amount: String = ""
  @State private var date: Date = Date()
  var body: some View {
    NavigationStack {
      Form {
        Section(header: Text("Transaktion Details")) {
          TextField("Beschreibung", text: $title)
          TextField("Summe", text: $amount)
            .keyboardType(.decimalPad)
          DatePicker("Data", selection: $date, displayedComponents: .date)
        }
        Button("Speichern") {
//          addTransaction()
        }
      }
      .navigationTitle("Neue Transaktion")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Abbrechen") {
            dismiss()
          }
        }
      }
    }
  }
//  func addTransaction() {
//    guard let amountValue = Double(amount) else {
//      return
//    }
//    let newTransaction = Transaction(date: date, title: title, amount: amountValue)
//    modelContext.insert(newTransaction)
//    do {
//      try modelContext.save()
//    } catch {
//      print("Fehler beim Speichern: \(error)")
//    }
//    dismiss()
//  }
}
#Preview {
//  let container = try! ModelContainer(for: Transaction.self)
//  return AddTransactionView()
//    .environment(\.modelContext, container.mainContext)
    AddTransactionView()
}
