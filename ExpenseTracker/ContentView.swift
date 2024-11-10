//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Đoàn Văn Khoan on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    @State private var activeTab: Tab = .recents
    
    var body: some View {
        TabView(selection: $activeTab) {
            Text("Recents")
                .tag(Tab.recents)
                .tabItem {
                    Tab.recents.tabContent
                }
            
            Text("Search")
                .tag(Tab.search)
                .tabItem {
                    Tab.search.tabContent
                }
            
            Text("Chart")
                .tag(Tab.charts)
                .tabItem {
                    Tab.charts.tabContent
                }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem {
                    Tab.settings.tabContent
                }
        }
        .sheet(isPresented: $isFirstTime) {
            IntroScreen()
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    ContentView()
}
