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
            Recents()
                .tag(Tab.recents)
                .tabItem {
                    Tab.recents.tabContent
                }
            
            Search()
                .tag(Tab.search)
                .tabItem {
                    Tab.search.tabContent
                }
            
            Graphs()
                .tag(Tab.charts)
                .tabItem {
                    Tab.charts.tabContent
                }
            
            Settings()
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
