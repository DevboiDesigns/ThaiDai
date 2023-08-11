//
//  WordsView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct WordsView: View {
    @ObservedObject private var wordVM = WordsViewModel()
    @State private var language: Language = .english
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Words")
            
            ScrollView(showsIndicators: false) {
                // Basics
                SectionView(words: wordVM.words, title: "Basics", language: $language)
                
                // Intermediate
                SectionView(words: wordVM.words, title: "Intermediate", language: $language)
                
                
                // Advanced
                SectionView(words: wordVM.words, title: "Advanced", language: $language)
            }
        }
        .background(Color.black)
    }
}



