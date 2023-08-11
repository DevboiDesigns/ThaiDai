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
                SectionView(words: wordVM.words.filter { $0.lesson == 1 }, title: "Lesson 001", language: $language)
                
                // Intermediate
                SectionView(words: wordVM.words.filter { $0.lesson == 2 }, title: "Lesson 002", language: $language)
                
                
                // Advanced
                SectionView(words: wordVM.words.filter { $0.lesson == 3 }, title: "Lesson 003", language: $language)
            }
        }
        .background(Color.black)
        .onAppear { wordVM.words.shuffle() }
    }
}



