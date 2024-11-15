//
//  TransactionCardView.swift
//  ExpenseTracker
//
//  Created by Đoàn Văn Khoan on 11/11/24.
//

import SwiftUI

struct TransactionCardView: View {
    
    @Environment(\.modelContext) private var context
    
    var transaction: Transaction
    var showsCategory: Bool = false
    
    var body: some View {
        HStack(spacing: 12) {
            Text("\(String(transaction.title.prefix(1)))")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 45, height: 45)
                .background(transaction.color.gradient, in: .circle)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .foregroundStyle(Color.primary)
                
                Text(transaction.remarks)
                    .font(.caption)
                    .foregroundStyle(Color.primary.secondary)
                
                Text(format(date: transaction.dateAdded, format: "dd MM yyyy"))
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
                if showsCategory {
                    Text(transaction.category)
                        .font(.caption2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .foregroundStyle(.white)
                        .background(transaction.category == Category.income.rawValue ? Color.green.gradient : Color.red.gradient, in: .capsule)
                }
            }
            .lineLimit(1)
            .hSpacing(.leading)
            
            Text("$\(transaction.amount)")
                .fontWeight(.bold)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(.background, in: .rect(cornerRadius: 10))
    }
}

//#Preview(body: {
//    Transaction(title: "Helolo", remarks: "dwdw", amount: 1039, dateAdded: Date(), category: .expense, tintColor: TintColor(color: , value: <#T##Color#>))
//})
