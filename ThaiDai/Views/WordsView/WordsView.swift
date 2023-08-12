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
                SectionView(words: wordVM.words.filter { $0.lesson == 1 }, title: "Lesson 1", language: $language, action: wordVM.buttonHandler)
                SectionView(words: wordVM.words.filter { $0.lesson == 2 }, title: "Lesson 2", language: $language, action: wordVM.buttonHandler)
                SectionView(words: wordVM.words.filter { $0.lesson == 3 }, title: "Lesson 3", language: $language, action: wordVM.buttonHandler)
            }
        }
        .mainBackground()
        .onAppear {
//            wordVM.words = wordVM.resetWords()
//            wordVM.words.shuffle()
            
        }
    }
}



