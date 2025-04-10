//
//  Transaktion.swift
//  Projektwoche1
//
//  Created by Denny Sprenger on 10.04.25.
//
import Foundation


class Transaktion: Identifiable {
    var expense: Expense? = nil
    var entry: Entry? = nil
    
    init(expense: Expense? = nil, entry: Entry? = nil) {
        self.expense = expense
        self.entry = entry
    }
}
