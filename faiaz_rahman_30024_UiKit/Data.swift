//
//  Data.swift
//  faiaz_rahman_30024_UiKit
//
//  Created by bjit on 14/12/22.
//

import Foundation

struct Expense {
        let expenseType: String
        let expenseAmount: String
        let expenseDesc: String
        let expenseDate: String
    }

extension Expense {
    
    
    static var expense = [Expense(expenseType: "Home Party", expenseAmount: "5000", expenseDesc: "Party was fun", expenseDate: "22, Dec 14, 10:31" ),
                         Expense(expenseType: "Buy Shoe", expenseAmount: "3000", expenseDesc: "Party was fun", expenseDate: "22, Dec 14, 10:31"),
                         Expense(expenseType: "Admission Fee", expenseAmount: "1000", expenseDesc: "Party was fun",expenseDate: "22, Dec 14, 10:31")]
                      
    }

