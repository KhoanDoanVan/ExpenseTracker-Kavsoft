//
//  Search.swift
//  ExpenseTracker
//
//  Created by Đoàn Văn Khoan on 10/11/24.
//

import SwiftUI
import Combine

struct Search: View {
    
    @State private var searchText: String = ""
    @State private var filterText: String = ""
    let searchPublisher = PassthroughSubject<String,Never>()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    
                }
            }
            .onChange(of: searchText, { oldValue, newValue in
                if newValue.isEmpty {
                    searchPublisher.send(newValue)
                }
            })
            .onReceive(searchPublisher.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main), perform: { text in
                filterText = text
            })
            .searchable(text: $searchText)
            .overlay {
                ContentUnavailableView("Search Transaction", systemImage: "magnifyingglass")
                    .opacity(filterText.isEmpty ? 1 : 0)
            }
            .navigationTitle("Search")
            .background(.gray.opacity(0.15))
        }
    }
}

#Preview(body: {
    Search()
})
