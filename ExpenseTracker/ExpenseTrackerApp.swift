//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Đoàn Văn Khoan on 10/11/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Transaction.self])
    }
}
