//
//  SearchView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/7/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var searchVM = SearchViewModel()
    
    @State private var language: Language = .english
    @State private var queryText: String = ""
    
    private func searchForText(_ query: String) -> [Word] {
        let lowerQuery = query.lowercased()
        return searchVM.queredWords.filter { $0.english.lowercased().contains(lowerQuery) || $0.thai.lowercased().contains(lowerQuery) }
    }
    
    var body: some View {
        VStack {
            TextField(text: $queryText) {
                Text("Search...")
                    .appSectionFont()
            }
            .padding(.bottom)
            .padding(.horizontal)
            
            ScrollView(showsIndicators: false) {
                ForEach(searchForText(queryText)) { word in
                    CellCard(word: word, language: $language)
                }
            }
        }
        .background(Color.appBlack)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
