//
//  Settings.swift
//  ExpenseTracker
//
//  Created by Đoàn Văn Khoan on 10/11/24.
//

import SwiftUI

struct Settings: View {
    
    /// User properties
    @AppStorage("username") private var username: String = ""
    /// App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoes: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("User name") {
                    TextField("iJustine", text: $username)
                }
                
                Section("App lock") {
                    Toggle(isOn: $isAppLockEnabled) {
                        Text("Enable App Lock")
                    }
                    
                    if isAppLockEnabled {
                        Toggle(isOn: $lockWhenAppGoes) {
                            Text("Lock When App Goes Background")
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
